<?php

namespace Bookshop\BackendApi\Model;

use Bookshop\BackendApi\Api\BookRepositoryInterface;
use Magento\Catalog\Model\ResourceModel\Product\CollectionFactory as ProductCollectionFactory;
use Magento\CatalogInventory\Api\StockRegistryInterface;

class BookRepository implements BookRepositoryInterface
{
     /**
     * @var ProductCollectionFactory
     */
    protected $productCollectionFactory;

    /**
     * @var StockRegistryInterface
     */
    protected $stockRegistry;

    /**
     * BookRepository constructor.
     * 
     * @param ProductCollectionFactory $productCollectionFactory
     * @param StockRegistryInterface $stockRegistry
     */
    public function __construct(
        ProductCollectionFactory $productCollectionFactory,
        StockRegistryInterface $stockRegistry
    )
    {
        $this->productCollectionFactory = $productCollectionFactory;
        $this->stockRegistry = $stockRegistry;
    }
    /**
     * Retrieve the list of books.
     *
     * @return Book[]
     */
    public function getBookList()
    {
        $collection = $this->productCollectionFactory->create();
        $collection->addAttributeToSelect(['Name', 'author', 'price']);
       
        $books = [];
        foreach ($collection->getItems() as $product) {
            $book = new Book();
            $book->setTitle($product['Name']);
            $book->setAuthor($product->getAuthor());
            $book->setPrice($product->getFinalPrice());
            $stockItem = $this->stockRegistry->getStockItem($product->getId());
            $book->setStock($stockItem->getQty());
            $books[] = $book;
        }

        return $books;
    }
}
