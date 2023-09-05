---
marp: true
---

# Voting: A Real World Contract

- 🗳️ any member can make a proposal
- 👍 members can vote on whether they like it
- ✅ after a yes threshold is met, the proposal is executed
- 📬 the proposal contains calldata to be sent to a contract

Since the proposal can execute a message call, it could be anything from moving some funds to buying an NFT!

The contract becomes like an EOA that requires voter approval for each of its actions.

---

## Example Data

| Proposal ID | Calldata      | Target Contract | Yes Count | No Count |
| ----------- | ------------- | --------------- | --------- | -------- |
| 0           | 0xa1b2...c3d4 | 0x123a4b...efc1 | 100       | 20       |
| 1           | 0xb2c3...d4e5 | 0x987c4d...efc2 | 56        | 10       |
| 2           | 0xc3d4...e5f6 | 0x561a3b...efc3 | 78        | 5        |
| 3           | 0xd4e5...f6g7 | 0x892s3r...efc4 | 212       | 35       |
| 4           | 0xe5f6...g7h8 | 0x2d3x4y...efc5 | 132       | 18       |

---

## Proposal Steps:

1. Create a new `Proposal` struct in storage
2. Allow members to vote on the proposal by its `id`
3. Once a `VOTE_THRESHOLD` has been hit, send the calldata to the target contract

---

## Real World Notes 🌎

- For Protocols/DAOs on the blockchain, tokens are used to vote weighted by their count
- The Governor standard has emerged to work with voting-enabled tokens
- Proposals can have multiple resulting message calls, each with their own calldata, value and target contract
- Typically votes need to achieve a level of participation and approval during a specific timeframe
  - If successful, the proposal is executed after some period of time
  - Otherwise, the proposal is defeated
