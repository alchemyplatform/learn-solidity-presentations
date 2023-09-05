// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    // fixed size array
    uint256[3] favoriteNumbers;

    constructor() {
        // passing it to modifyArray
        modifyArray(favoriteNumbers);

        console.log(favoriteNumbers[0]); // 22
        console.log(favoriteNumbers[1]); // 23
    }

    function modifyArray(uint256[3] storage nums) private {
        nums[0] = 22;
        nums[1] = 23;
    }
}
