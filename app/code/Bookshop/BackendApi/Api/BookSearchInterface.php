<?php

namespace Bookshop\BackendApi\Api;

interface BookSearchInterface
{
    /**
     * Search for products based on user input.
     *
     * @param string $searchTerm
     * @return \Magento\Catalog\Api\Data\ProductSearchResultsInterface
     */
    public function searchBooks($searchTerm);
}
