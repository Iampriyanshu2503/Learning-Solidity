// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract Checktriangle{
     function checktriangle(uint256 num1, uint256 num2, uint256 num3) public pure returns (uint256) {
        if(num1+num2<num3){
            return 0;
        }else if(num1+num3<num2){
            return 0;
        }else if(num2+num3<num1){
            return 0;
        }else{
            return 1;
        }
    }
    function triangletype(uint256 num1, uint256 num2, uint256 num3) public pure returns (string memory){
        if(num1==num2 && num2==num3){
            return "Equilateral Triangle";
        }else if(num1==num2||num2==num3||num3==num1){
            return "Isosceles Triangle";
        }else{
            return "Scalene Triangle";
        }
    }
    function calculateArea(uint256 num1, uint256 num2, uint256 num3) public pure returns (int256) {
        
        uint256 isValid = checktriangle(num1, num2, num3);
        if (isValid == 0) {
            return -1; 
        }
        uint256 s = (num1 + num2 + num3) / 2;
        uint256 areaSquared = s * (s - num1) * (s - num2) * (s - num3);
        return int256(areaSquared);
    }
}
