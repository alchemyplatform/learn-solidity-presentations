// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    Example public example;

    function setUp() public {
        example = new Example(4, 4);
    }

    function testExample() public {
        assertEq(example.sum(), 8);
        assertEq(example.product(), 16);
    }
}
