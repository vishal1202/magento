<?php

namespace Bookshop\BackendApi\Model;

use Magento\Catalog\Api\Data\ProductSearchResultsInterfaceFactory;
use Magento\Catalog\Api\ProductRepositoryInterface;
use Magento\Framework\Api\SearchCriteriaBuilder;
use Bookshop\BackendApi\Api\BookSearchInterface;
use Magento\Framework\Api\FilterBuilder;


class BookSearch implements BookSearchInterface
{
    /**
     * @var \Magento\Catalog\Api\ProductRepositoryInterface
     */
    protected $productRepository;

    /**
     * @var \Magento\Catalog\Api\Data\ProductSearchResultsInterfaceFactory
     */
    protected $productSearchResultsFactory;

    /**
     * @var \Magento\Framework\Api\SearchCriteriaBuilder
     */
    protected $searchCriteriaBuilder;

    /**
     * @var \Magento\Framework\Api\FilterBuilder
     */
    protected $filterBuilder;

    /**
     * BookSearch constructor.
     *
     * @param \Magento\Catalog\Api\ProductRepositoryInterface $productRepository
     * @param \Magento\Catalog\Api\Data\ProductSearchResultsInterfaceFactory $productSearchResultsFactory
     * @param \Magento\Framework\Api\SearchCriteriaBuilder $searchCriteriaBuilder
     * @param \Magento\Framework\Api\FilterBuilder $filterBuilder
     */
    public function __construct(
        ProductRepositoryInterface $productRepository,
        ProductSearchResultsInterfaceFactory $productSearchResultsFactory,
        SearchCriteriaBuilder $searchCriteriaBuilder,
        FilterBuilder $filterBuilder
    ) {
        $this->productRepository = $productRepository;
        $this->productSearchResultsFactory = $productSearchResultsFactory;
        $this->searchCriteriaBuilder = $searchCriteriaBuilder;
        $this->filterBuilder = $filterBuilder;
    }
    /**
     * Search for books based on the given search term.
     *
     * @param string $searchTerm The term to search for.
     * @return \Magento\Catalog\Api\Data\ProductSearchResultsInterface The search results.
     */
    public function searchBooks($searchTerm)
    {
        $searchResults = $this->productSearchResultsFactory->create();
        $nameFilter = $this->filterBuilder
            ->setField('name')
            ->setConditionType('like')
            ->setValue('%' . $searchTerm . '%')
            ->create();

        $authorFilter = $this->filterBuilder
            ->setField('author')
            ->setConditionType('like')
            ->setValue('%' . $searchTerm . '%')
            ->create();

        $searchCriteria = $this->searchCriteriaBuilder
            ->addFilters([$nameFilter, $authorFilter])
            ->create();

        $products = $this->productRepository->getList($searchCriteria);
        $searchResults->setItems($products->getItems());
        $searchResults->setTotalCount($products->getTotalCount());

        return $searchResults;
    }
}
