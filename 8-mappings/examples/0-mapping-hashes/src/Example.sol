// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 x; // 0x0
    mapping(address => bool) isMember; // base slot 0x1

    function join() external {
        // SSTORE(keccak256(msg.sender + 0x0), true)
        // bytes32 slot = keccak256(abi.encode(msg.sender, 0));
        // assembly {
        //     sstore(slot, true)
        // }
        isMember[msg.sender] = true;
    }

    function belongs() external view returns (bool) {
        bytes32 slot = keccak256(abi.encode(msg.sender, 1));
        bool value;
        assembly {
            value := sload(slot)
        }
        // SLOAD(keccak256(msg.sender + 0x0))
        // return isMember[msg.sender];

        return value;
    }
}
