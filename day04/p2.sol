// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract MatrixTranspose {
    
    function transposeMatrix(int256[][] memory A) public pure returns (int256[][] memory) {
        uint256 rows = A.length;
        uint256 cols = A[0].length;
        
        int256[][] memory result = new int256[][](cols);
        for (uint256 i = 0; i < cols; i++) {
            result[i] = new int256[](rows);
            for (uint256 j = 0; j < rows; j++) {
                result[i][j] = A[j][i];
            }
        }
        return result;
    }
}
