// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract ArrayInsertion {
    uint[] public arr;
    function insertAtPosition(uint index, uint element) public {
        require(index <= arr.length, "Index out of bounds");
        arr.push(0);
        for (uint i = arr.length - 1; i > index; i--) {
            arr[i] = arr[i - 1];
        }
        arr[index] = element;
    }
    function addElement(uint element) public {
        arr.push(element);
    }
    function getArray() public view returns (uint[] memory) {
        return arr;
    }
}
