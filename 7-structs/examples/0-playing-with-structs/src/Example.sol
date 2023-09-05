// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    enum OrderStatus {
        Created,
        Paid
    }

    struct Order {
        address buyer;
        address seller;
        uint256 amount;
        OrderStatus status;
    }

    Order[] public orders;

    function getOrder(uint256 key) external view returns (Order memory) {
        return orders[key];
    }

    event OrderCreated(uint256 indexed key, uint256 amount);

    function createOrder(address buyer, address seller, uint256 amount) external {
        Order memory order = Order(buyer, seller, amount, OrderStatus.Created);
        orders.push(order);
        emit OrderCreated(orders.length - 1, amount);
    }

    function payment(uint256 key) external payable {
        Order storage order = orders[key];
        require(order.buyer == msg.sender);
        require(order.amount == msg.value);
        // created -> paid -> ?
        require(order.status == OrderStatus.Created);

        order.status = OrderStatus.Paid;
    }
}
