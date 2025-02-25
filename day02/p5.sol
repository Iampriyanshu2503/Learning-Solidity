// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract SimpleCalculator {

    function add(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 + num2;
    }

    function subtract(uint256 num1, uint256 num2) public pure returns (uint256) {
        require(num1 >= num2, "First number should be greater than or equal to second number");
        return num1 - num2;
    }

    function multiply(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 * num2;
    }

    function divide(uint256 num1, uint256 num2) public pure returns (uint256) {
        require(num2 != 0, "Cannot divide by zero");
        return num1 / num2;
    }
}
