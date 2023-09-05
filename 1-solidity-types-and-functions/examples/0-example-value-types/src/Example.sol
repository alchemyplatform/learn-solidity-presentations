// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint8 a = 255; // 0 -> 255
    uint256 b = type(uint256).max; // alias: uint

    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias: int256

    bool myCondition = true;

    enum Choice {
        Up,
        Down,
        Left,
        Right
    }

    constructor(Choice x) {
        if (x == Choice.Up) {
            console.log("up");
        }
        if (x == Choice.Down) {
            console.log("down");
        }
    }
}
