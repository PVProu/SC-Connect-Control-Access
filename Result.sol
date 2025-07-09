// SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity 0.8.24;

//Contract

contract Result{
    uint256 public result;


    function setResult(uint256 num_) external {
        result = num_;

    }
}