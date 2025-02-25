// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract ArrayReversal {
    function reverseArray(int256[] memory arr) public pure returns (int256[] memory) {
        uint256 length = arr.length;
        int256[] memory reversed = new int256[](length);
        for (uint256 i = 0; i < length; i++) {
            reversed[i] = arr[length - 1 - i];
        }
        return reversed;
    }
}