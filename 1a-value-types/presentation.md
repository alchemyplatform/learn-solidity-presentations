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

## Constructor

**Constructor**: A function that runs once on the deployment

```js
import "forge-std/console.sol";

contract Example {
  constructor(bool myCondition) {
    if(myCondition) {
      console.log("yay!");
    }
  }
}
```

---

## Constructor

```js
import "forge-std/console.sol";

contract Example {
  enum Choice { Up, Down, Left, Right }

  constructor(Choice choice) {
    if(choice.up) {
      console.log("yay!");
    }
  }
}
```
