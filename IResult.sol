// SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity 0.8.24;

//En la interfaz solo podemos poner la definicion, no la implementacion completa, y solo funciones external.
interface IResult{

    function setResult(uint256 num_) external;

}