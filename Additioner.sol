// SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity 0.8.24;

import "./Interfaces/IResult.sol"; //import interface
    

//contract
contract Additioner{
    
    //Object: Interface + address (sc to initialize as object) First deploy result sc and then additioner sc
    address public result;
    address public admin;
    uint256 public fee;

    constructor (address result_, address admin_ ){
        result = result_;
        admin = admin_;
        fee = 5;
    }


    function addition(uint256 num1_, uint256 num2_) external {
        uint256 result_ = num1_ + num2_;
        IResult(result).setResult(result_);
    }

    function setFee(uint256 newFee_) external{ //set new fee from the beggining fee using control acces.
        if (msg.sender != admin) revert();
        fee = newFee_;

    }

}