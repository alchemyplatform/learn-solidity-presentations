// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    Example public example;

    function setUp() public {
        example = new Example();
    }

    function testExample() public {
        example.createOrder(address(0), address(1), 1 ether);

        // we are acting as address(0)
        hoax(address(0));

        example.payment{value: 1 ether}(0);

        Example.Order memory order = example.getOrder(0);

        assertEq(address(example).balance, 1 ether);
        assertEq(uint8(order.status), uint8(Example.OrderStatus.Paid));
    }
}
