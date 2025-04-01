//write a program in solidity to check the co prime number in given list of roll numbers
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract CoPrimeChecker {
    
    // Event that logs whether the roll numbers are co-prime
    event CoPrimeStatus(bool isCoPrime);
    
    // Helper function to compute the greatest common divisor (GCD) of two numbers
    function gcd(uint a, uint b) public pure returns (uint) {
        while (b != 0) {
            uint temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
    
    // Function to check if the roll numbers are co-prime
    function areCoPrime(uint[] memory rollNumbers) public {
        uint length = rollNumbers.length;
        
        for (uint i = 0; i < length; i++) {
            for (uint j = i + 1; j < length; j++) {
                // Calculate the GCD of each pair of numbers
                uint g = gcd(rollNumbers[i], rollNumbers[j]);
                
                // If GCD is not 1, they are not co-prime
                if (g != 1) {
                    emit CoPrimeStatus(false); // Emit event that they are not co-prime
                    return;
                }
            }
        }
        // If we get here, all pairs are co-prime
        emit CoPrimeStatus(true); // Emit event that all numbers are co-prime
    }
    
    // Function to test whether a single pair of roll numbers are co-prime
    function checkPairCoPrime(uint a, uint b) public pure returns (bool) {
        return gcd(a, b) == 1;
    }
}