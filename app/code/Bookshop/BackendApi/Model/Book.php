<?php

namespace Bookshop\BackendApi\Model;

class Book
{
    /**
     * The title of the book.
     *
     * @var string|null
     */
    protected $title;

    /**
     * The author of the book.
     *
     * @var string|null
     */
    protected $author;

    /**
     * The price of the book.
     *
     * @var float|null
     */
    protected $price;

    /**
     * The stock quantity of the book.
     *
     * @var int
     */
    protected $stock;
    
    /**
     * Retrive the title of book
     *
     * @return string|null
     */
    public function getTitle()
    {
        return $this->title;
    }
    /**
     * set the title of the book
     *
     * 
     * @return void
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }
    /**
     * Retrive the author of the book
     *
     * @return string|null
     */
    public function getAuthor()
    {
        return $this->author;
    }
    /**
     * set the author of the book
     *
     * @param string $author
     * @return void
     */
    public function setAuthor($author)
    {
        $this->author = $author;
    }
    /**
     * return the price of book
     *
     * @return float|null
     */
    public function getPrice()
    {
        return $this->price;
    }
    /**
     * set the price of product
     *
     * @param float $price
     * @return void
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }
    /**
     * Retrive the stock of book
     *
     * @return int
     */
    public function getStock()
    {
        return $this->stock;
    }
    /**
     * Set the stock of the product
     *
     * @param  int $stock
     * @return void
     */
    public function setStock($stock)
    {
        $this->stock = $stock;
    }
}
