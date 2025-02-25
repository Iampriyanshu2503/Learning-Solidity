// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract ArrayManipulation {
    function deleteElement(int256[] memory arr, uint256 index) public pure returns (int256[] memory) {
        require(index < arr.length, "Index out of bounds");
        int256[] memory newArray = new int256[](arr.length - 1);
        uint256 newIndex = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            if (i != index) {
                newArray[newIndex] = arr[i];
                newIndex++;
            }
        }
        return newArray;
    }
}
