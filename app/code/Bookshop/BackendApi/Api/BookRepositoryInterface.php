<?php

namespace Bookshop\BackendApi\Api;

interface BookRepositoryInterface
{
    /**
     * Retrieve the list of books.
     *
     * @return \Bookshop\BackendApi\Model\Book[]
     */
    public function getBookList();
}
