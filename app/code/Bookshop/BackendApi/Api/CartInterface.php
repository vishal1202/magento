<?php

namespace Bookshop\BackendApi\Api;

interface CartInterface
{
    /**
     * @param string $sku
     * @param int $quantity
     * @param string $customerId
     * @return bool
     */
    public function addItem($sku, $quantity,$customerId);

    /**
     * @param string $sku
     * @param int $quantity
     * @param string $customerId
     * @return bool
     */
    public function removeItem($sku,$quantity,$customerId);
}
