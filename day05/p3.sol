// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2<0.9.0;

contract Lottery {
    
    // Arrays to store ticket numbers and their corresponding players (addresses)
    uint[] public lotteryNumbers;
    address[] public players;
    
    // Prize winners
    address public firstPrizeWinner;
    address public secondPrizeWinner;
    address public thirdPrizeWinner;

    // Prize numbers
    uint public firstPrizeNumber;
    uint public secondPrizeNumber;
    uint public thirdPrizeNumber;

    // Event to log the lottery results
    event LotteryResult(address firstWinner, uint firstPrizeNumber, address secondWinner, uint secondPrizeNumber, address thirdWinner, uint thirdPrizeNumber);
    event LotteryNumberGenerated(uint[] lotteryNumbers);

    // Function to generate multiple lottery numbers and determine prize winners
    function generateLotteryNumbers(uint _numTickets) public {
        require(_numTickets > 0, "The number of tickets must be greater than zero.");
        
        // Reset previous data before generating new numbers
        delete lotteryNumbers;
        delete players;

        // Generate lottery numbers and store them
        for (uint i = 0; i < _numTickets; i++) {
            uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, i))) % 1000; // Random number between 0 and 999
            lotteryNumbers.push(randomNumber);
            players.push(msg.sender); // Assume the sender is the player (you could modify to allow multiple players)
        }

        emit LotteryNumberGenerated(lotteryNumbers);
        determineWinners();
    }

    // Function to check numbers and determine prize winners
    function determineWinners() internal {
        for (uint i = 0; i < lotteryNumbers.length; i++) {
            uint number = lotteryNumbers[i];
            address player = players[i];

            // First prize: Divisible by both 3 and 5
            if (number % 3 == 0 && number % 5 == 0 && firstPrizeWinner == address(0)) {
                firstPrizeWinner = player;
                firstPrizeNumber = number;
            }

            // Second prize: Divisible by 7 or 11
            if ((number % 7 == 0 || number % 11 == 0) && secondPrizeWinner == address(0)) {
                secondPrizeWinner = player;
                secondPrizeNumber = number;
            }

            // Third prize: Divisible by 5 but not by 10
            if (number % 5 == 0 && number % 10 != 0 && thirdPrizeWinner == address(0)) {
                thirdPrizeWinner = player;
                thirdPrizeNumber = number;
            }

            // Stop if all prizes have been assigned
            if (firstPrizeWinner != address(0) && secondPrizeWinner != address(0) && thirdPrizeWinner != address(0)) {
                break;
            }
        }

        // Emit the result after determining the winners
        emit LotteryResult(firstPrizeWinner, firstPrizeNumber, secondPrizeWinner, secondPrizeNumber, thirdPrizeWinner, thirdPrizeNumber);
    }

    // Function to view the prize winners and their corresponding numbers
    function getPrizeWinners() public view returns (address, uint, address, uint, address, uint) {
        return (firstPrizeWinner, firstPrizeNumber, secondPrizeWinner, secondPrizeNumber, thirdPrizeWinner, thirdPrizeNumber);
    }
}
