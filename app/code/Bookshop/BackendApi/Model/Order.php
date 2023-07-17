<?php
namespace Bookshop\BackendApi\Model;

use Magento\Quote\Model\QuoteFactory;
use Magento\Customer\Api\CustomerRepositoryInterface;
use Magento\Sales\Model\Service\OrderService;
use Magento\Framework\Exception\CouldNotSaveException;
use Bookshop\BackendApi\Api\OrderInterface;
use Magento\Customer\Api\AddressRepositoryInterface;
use Magento\Customer\Api\Data\AddressInterface;
use Psr\Log\LoggerInterface;
use Magento\Quote\Model\QuoteManagement;
use Magento\Catalog\Api\ProductRepositoryInterface;
use Magento\Sales\Api\OrderRepositoryInterface;




class Order implements OrderInterface
{
    /**
     * @var \Magento\Quote\Model\QuoteFactory
     */
    protected $quoteFactory;

    /**
     * @var \Magento\Customer\Api\CustomerRepositoryInterface
     */
    protected $customerRepository;

    /**
     * @var \Psr\Log\LoggerInterface
     */
    protected $logger;

    /**
     * @var \Magento\Sales\Model\Service\OrderService
     */
    protected $orderService;

    /**
     * @var \Magento\Customer\Api\AddressRepositoryInterface
     */
    protected $addressRepository;

    /**
     * @var \Magento\Catalog\Api\ProductRepositoryInterface
     */
    protected $productRepository;

    /**
     * @var \Magento\Quote\Model\QuoteManagement
     */
    protected $quoteManagement;

    /**
     * @var \Magento\Sales\Api\OrderRepositoryInterface
     */
    protected $orderRepository;

    /**
     * Order constructor.
     *
     * @param \Magento\Quote\Model\QuoteFactory $quoteFactory
     * @param \Magento\Customer\Api\CustomerRepositoryInterface $customerRepository
     * @param \Magento\Quote\Model\QuoteManagement $quoteManagement
     * @param \Magento\Sales\Model\Service\OrderService $orderService
     * @param \Psr\Log\LoggerInterface $logger
     * @param \Magento\Sales\Api\OrderRepositoryInterface $orderRepository
     * @param \Magento\Customer\Api\AddressRepositoryInterface $addressRepository
     * @param \Magento\Catalog\Api\ProductRepositoryInterface $productRepository
     */
    public function __construct(
        QuoteFactory $quoteFactory,
        CustomerRepositoryInterface $customerRepository,
        QuoteManagement $quoteManagement,
        OrderService $orderService,
        LoggerInterface $logger,
        OrderRepositoryInterface $orderRepository,
        AddressRepositoryInterface $addressRepository,
        ProductRepositoryInterface $productRepository,
    ) 
    {
        $this->quoteFactory = $quoteFactory;
        $this->customerRepository = $customerRepository;
        $this->orderService = $orderService;
        $this->productRepository = $productRepository;
        $this->addressRepository = $addressRepository;
        $this->orderRepository = $orderRepository;
        $this->quoteManagement = $quoteManagement;
    }
    /**
     * Place an order.
     *
     * @param int $customerId
     * @param array $products
     * @param int $storeId 
     * @return array
     */
    public function placeOrder($customerId,$products,$storeId)
    {
        try {
            $customer = $this->customerRepository->getById($customerId);
            $quote = $this->quoteFactory->create();
            $quote->setCustomer($customer);
            $quote->setStoreId($storeId); 
            foreach ($products as $productData) {
                $productSku = $productData['sku'];
                $qty = $productData['qty'];
                
                $product = $this->productRepository->get($productSku);
                $quote->addProduct($product, $qty);
            }
            $shippingAddress = $this->addressRepository->getById($customer->getDefaultShipping());
            $billingAddress = $this->addressRepository->getById($customer->getDefaultBilling());
            
            $quote->getShippingAddress()->addData($shippingAddress->__toArray());
            $quote->getBillingAddress()->addData($billingAddress->__toArray());
            $shippingMethod = 'freeshipping_freeshipping';
            $paymentMethod = 'checkmo';

            $quote->getShippingAddress()->setShippingMethod($shippingMethod)->setCollectShippingRates(true);;
            $quote->getPayment()->setMethod($paymentMethod);
            $quote->collectTotals();
            $quote->save();
            $orderId = $this->quoteManagement->placeOrder($quote->getId());
            $order = $this->orderRepository->get($orderId);
            $order->setState("new");
            $order->setStatus("pending");
            $this->orderService->place($order);
            $order->save();
            return[
                'success' => true,
                'message' => 'order placed',
                'orderId' => $orderId

            ];
        } catch (\Exception $e ) {
            return[
                'success' => false,
                'message' => $e->getMessage(),
            ];
        }
        




    }
}
?>