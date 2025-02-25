// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MinMax {
    
    // Function to find the maximum of three numbers
    function findMax(uint256 num1, uint256 num2, uint256 num3) public pure returns (uint256) {
        uint256 maxNum = num1;
        if (num2 > maxNum) {
            maxNum = num2;
        }
        if (num3 > maxNum) {
            maxNum = num3;
        }
        return maxNum;
    }
    
    // Function to find the minimum of three numbers
    function findMin(uint256 num1, uint256 num2, uint256 num3) public pure returns (uint256) {
        uint256 minNum = num1;
        if (num2 < minNum) {
            minNum = num2;
        }
        if (num3 < minNum) {
            minNum = num3;
        }
        return minNum;
    }
}
