<?php

namespace Bookshop\BackendApi\Api;

interface OrderInterface
{
     /**
     * Place order by customer ID and shipping information
     *
     * @param int $customerId
     * @param mixed $products
     * @param int $storeId
     * @return int
     * @throws \Magento\Framework\Exception\LocalizedException
     */
    public function placeOrder($customerId,$products,$storeId);
}
