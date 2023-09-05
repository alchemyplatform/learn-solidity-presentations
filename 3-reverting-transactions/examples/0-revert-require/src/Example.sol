// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

// REVERT
// no state changes should have occured
// no value should have been transferred
// gas will still be paid for
contract A {
    address b;
    uint256 public errorsCount = 0;

    constructor(address _b) {
        b = _b;
    }

    function callB() external payable {
        (bool success, bytes memory returnData) = b.call{value: 1 ether}("");
        if (!success) {
            console.logBytes(returnData);
            console.logBytes32(keccak256("DoNotPayMe(uint256)"));
            errorsCount++;
        }
    }
}

contract B {
    uint256 public x = 0;
    // @notice nobody should ever pay this contract

    // 4 byte
    error DoNotPayMe(uint256);

    receive() external payable {
        x = 15;
        revert DoNotPayMe(msg.value);
    }
}
