// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    uint256 public sum;
    address b;

    constructor(address _b) {
        b = _b;

        sum = iB(b).add(15, 10, 25);
    }
}

interface iB {
    function add(uint256, uint256, uint256) external pure returns (uint256);
}

contract B {
    fallback() external {
        console.logBytes(msg.data);
    }

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        return x + y;
    }
}
