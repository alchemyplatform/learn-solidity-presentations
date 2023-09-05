---
marp: true
---

# Solidity Value Types

Let's look at a few important types

```js
contract Example {
  uint8 a = 255; // 0 -> 255
  uint256 b = 22; // alias: uint

  int8 c = 127; // -128 -> 127
  int d = -55; // alias: int256

  bool myCondition = true;

  enum Choice { Up, Down, Left, Right }
  Choice choice = Choice.Up;
}
```

---

## Storage Variables

Variables declared in contract scope are storage variables

Solidity stores these in contiguous storage slots

```js
contract Example {
  uint256 a; // storage slot - 0x0
  uint256 b; // storage slot - 0x1
  bool public c; // storage slot - 0x2

  function store() external {
    // read storage slot 0x1
    // store it in storage slot 0x0
    a = b;

    // read storage slot 0x1
    // store it in memory (not persistent!)
    uint x = b;
  }
}
```

---

## Things to know about storage slots

- 🔭 variables stored in contract scope allocate a storage slot (except for `constant`)
- 📏 slots are 32 bytes (`0x1` means `0x000....001`)
- 🔢 solidity stores variables contiguously (`0x0`, `0x1`, etc...)
- 💸 reading/writing to storage is relatively super expensive to other opcodes
- 🎒 variables can be packed together, automatically or manually

---

## FUNctions 🕺

You can't spell functions without **fun**! 😆 And you must know the keywords 🔑

```js
contract Example {
  function example1() private pure {
    // private: call me within this contract
    // pure: I cannot read/write to storage
  }
  function example2() internal view {
    // internal: call me within this contract (+ inheritance!)
    // view: I can read from storage, not write
  }
  function example3() public payable {
    // public: call me inside and outside this contract
    // payable: send me some ether!
  }
  function example4() external {
    // external: call me from outside this contract
  }
}
```

---

## Returning values

```js
contract Example {
  uint public sum;

  constructor(uint x, uint y) {
    sum = add(x, y);
  }

  function add(uint x, uint y) private pure returns(uint) {
    return x + y;
  }
}
```
