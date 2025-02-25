// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract MatrixOperations {
    
    function addMatrices(
        int256[][] memory A,
        int256[][] memory B
    ) public pure returns (int256[][] memory) {
        uint256 rows = A.length;
        uint256 cols = A[0].length;
        require(rows == B.length && cols == B[0].length, "Matrix dimensions must match");
        
        int256[][] memory result = new int256[][](rows);
        for (uint256 i = 0; i < rows; i++) {
            result[i] = new int256[](cols);
            for (uint256 j = 0; j < cols; j++) {
                result[i][j] = A[i][j] + B[i][j];
            }
        }
        return result;
    }

    function subtractMatrices(
        int256[][] memory A,
        int256[][] memory B
    ) public pure returns (int256[][] memory) {
        uint256 rows = A.length;
        uint256 cols = A[0].length;
        require(rows == B.length && cols == B[0].length, "Matrix dimensions must match");
        
        int256[][] memory result = new int256[][](rows);
        for (uint256 i = 0; i < rows; i++) {
            result[i] = new int256[](cols);
            for (uint256 j = 0; j < cols; j++) {
                result[i][j] = A[i][j] - B[i][j];
            }
        }
        return result;
    }

    function multiplyMatrices(
        int256[][] memory A,
        int256[][] memory B
    ) public pure returns (int256[][] memory) {
        uint256 rowsA = A.length;
        uint256 colsA = A[0].length;
        uint256 rowsB = B.length;
        uint256 colsB = B[0].length;
        require(colsA == rowsB, "Invalid matrix dimensions for multiplication");
        
        int256[][] memory result = new int256[][](rowsA);
        for (uint256 i = 0; i < rowsA; i++) {
            result[i] = new int256[](colsB);
            for (uint256 j = 0; j < colsB; j++) {
                int256 sum = 0;
                for (uint256 k = 0; k < colsA; k++) {
                    sum += A[i][k] * B[k][j];
                }
                result[i][j] = sum;
            }
        }
        return result;
    }
}
