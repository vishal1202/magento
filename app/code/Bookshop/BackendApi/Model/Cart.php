<?php

namespace Bookshop\BackendApi\Model;

use Bookshop\BackendApi\Api\CartInterface;
use Magento\Quote\Model\QuoteFactory;
use Magento\Catalog\Api\ProductRepositoryInterface;

class Cart implements CartInterface
{
    /**
     * @var \Magento\Quote\Model\QuoteFactory
     */
    protected $quoteFactory;

    /**
     * @var \Magento\Catalog\Api\ProductRepositoryInterface
     */
    protected $productRepository;

    /**
     * Cart constructor.
     * @param \Magento\Quote\Model\QuoteFactory $quoteFactory
     * @param \Magento\Catalog\Api\ProductRepositoryInterface $productRepository
     */
    public function __construct(
        QuoteFactory $quoteFactory,
        ProductRepositoryInterface $productRepository,
    ) 
    {
        $this->quoteFactory = $quoteFactory;
        $this->productRepository = $productRepository;
    }
    /**
     * Add an item to the cart.
     *
     * @param string $sku
     * @param int $quantity
     * @param int $customerId
     * @return array
     */
    public function addItem($sku,$quantity,$customerId)
    {   
        $quote = $this->quoteFactory->create();
        $quote->loadByCustomer($customerId);
        try {
            $product = $this->productRepository->get($sku);
        } catch (\Magento\Framework\Exception\NoSuchEntityException $e) {
            $this->messageManager->addErrorMessage('Product not found.');
            return  [
                'success' => false,
                'message' => 'Item Not Found.',
            ];
        }
        try {
            $quote->addProduct($product, $quantity);
            $quote->collectTotals();
            $quote->save();
            return  [
                'success' => true,
                'message' => 'Item added to cart successfully.',
            ];
        } catch (\Exception $e) {
            return  [
                'success' => false,
                'message' => $e,
            ];
        }
    }
    /**
     * Remove an item from the cart.
     *
     * @param string $sku
     * @param int $quantity
     * @param int $customerId
     * @return array 
     */
    public function removeItem($sku,$quantity,$customerId)
    {
        $quote = $this->quoteFactory->create();
        $quote->loadByCustomer($customerId);

        $cartItems = $quote->getAllVisibleItems();

        foreach ($cartItems as $item) {
            if ($item->getProduct()->getSku() == $sku) {
                try {
                    if ($item->getQty() == $quantity) {
                        $quote->removeItem($item->getId());
                    }
                    elseif($item->getQty() < $quantity){
                        return  [
                            'success' => false,
                            'message' => 'The Requested Quantity is not available in the cart',
                        ];
                    }
                    else
                    {
                        $item->setQty($item->getQty() - $quantity);
                        $item->setRowTotal($item->getQty() * $item->getPrice());
                    }
                    $quote->collectTotals();
                    $quote->save();
                    return [
                        'success' => true,
                        'message' => 'Requested quantity of the Item is removed from cart successfully.',
                    ];
                } catch (\Exception $e) {
                    return [
                        'success' => false,
                        'message' => $e,
                    ];
                }
            }
        }

        return [
            'success' => false,
            'message' => 'Item Not Found',
        ];
    }
}
