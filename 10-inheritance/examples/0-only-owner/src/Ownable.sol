// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Ownable {
    address owner = msg.sender;

    function transferOwner(address newOwner) public virtual onlyOwner {
        owner = newOwner;
    }

    error NotTheOwner();

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert NotTheOwner();
        }
        _;
    }
}
