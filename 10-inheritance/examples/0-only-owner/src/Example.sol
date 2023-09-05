// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";
import "./Ownable.sol";

contract Example is Ownable {
    event TransferOwnership(address oldOwner, address newOwner);

    function transferOwner(address newOwner) public override {
        address oldOwner = owner;
        super.transferOwner(newOwner);
        emit TransferOwnership(oldOwner, newOwner);
    }
}
