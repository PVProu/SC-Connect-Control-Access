# Smart Contract Interaction: Additioner & Result with Admin-Controlled Fee

## 🧩 Introduction

This project demonstrates a simple and modular Solidity-based interaction between smart contracts. A main contract (`Additioner`) performs a basic addition operation and communicates the result to another contract (`Result`). The architecture includes an access control system based on an admin address set during deployment, which allows only the admin to update the operational fee.

## 📚 Table of Contents

- [Introduction](#-introduction)
- [Usage](#-usage)
- [Features](#-features)
- [Contracts Overview](#-contracts-overview)
- [Dependencies](#-dependencies)
- [Configuration](#-configuration)
- [Examples](#-examples)
- [Troubleshooting](#-troubleshooting)
- [Contributors](#-contributors)
- [License](#-license)

## 🚀 Usage

1. Deploy the `Result` contract.
2. Deploy the `Additioner` contract, passing the `Result` contract address and the desired admin address to the constructor.
3. Call the `addition(uint256, uint256)` function to compute a sum and store it in the `Result` contract.
4. The `setFee(uint256)` function can only be called by the admin to change the fee.

## ✨ Features

- 🤝 Contract-to-contract communication using interfaces
- 🔐 Admin-based access control via constructor
- ➕ Simple addition functionality
- 💸 Configurable fee with restricted access

## 📝 Contracts Overview

### `IResult.sol`

Defines an interface with a single external method for setting the result:

```solidity
interface IResult {
    function setResult(uint256 num_) external;
}
```

### `Result.sol`

Stores the computation result and allows external contracts to set it:

```solidity
contract Result {
    uint256 public result;

    function setResult(uint256 num_) external {
        result = num_;
    }
}
```

### `Additioner.sol`

Main contract responsible for:
- Performing addition
- Sending the result to the `Result` contract
- Managing a configurable fee
- Restricting fee updates to the admin only

```solidity
contract Additioner {
    address public result;
    address public admin;
    uint256 public fee;

    constructor(address result_, address admin_) {
        result = result_;
        admin = admin_;
        fee = 5;
    }

    function addition(uint256 num1_, uint256 num2_) external {
        uint256 result_ = num1_ + num2_;
        IResult(result).setResult(result_);
    }

    function setFee(uint256 newFee_) external {
        if (msg.sender != admin) revert();
        fee = newFee_;
    }
}
```

## 📦 Dependencies

- Solidity ^0.8.24

## ⚙️ Configuration

You must:
- Deploy the `Result` contract first
- Pass its address to the `Additioner` constructor
- Provide the admin address that will control access to `setFee`

## 💡 Examples

```solidity
Result result = new Result();
Additioner add = new Additioner(address(result), msg.sender);

add.addition(3, 7);
// result.result() returns 10

add.setFee(15); // Only admin can call
```

## 🛠 Troubleshooting

- **Unauthorized access to `setFee`**: Ensure only the admin address (set in the constructor) is making the call.
- **No result stored**: Confirm that the `Result` contract is correctly passed to the `Additioner`.

## 👥 Contributors

- Pol

## 📄 License

This project is licensed under the [LGPL-3.0-only](https://spdx.org/licenses/LGPL-3.0-only.html).

