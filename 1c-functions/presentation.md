---
marp: true
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
