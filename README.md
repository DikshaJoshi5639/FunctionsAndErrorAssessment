# ErrorHandlingContract
This is a sample smart contract that shows how errors are handled in solidity using require(), assert(), and revert() statements.

## Description
This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain.The contract provides three functions, each demonstrating a different error handling method
1. Voting: Checks if the candidate is valid or invalid according to the candidateId using require() method.And increment the votes after checking.
2. VotingClosed: Checks if the Voting is been closed or not, if not than it makes the voting closed by assert() function.
3. TotalVotes: Checks if the voting is already been closed and than count the totalVotes, if not closed and someone tries to count votes than revert() function will print error mesaage "Voting is still open".

## Getting Started

### Installing
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

### Executing program
1. Now after opening the link you will click on the "File Explorer" option on the extreme left of the screen,then click on "create new file".
2. Save the file with .sol extension (For Eg. ErrorHandling.sol).
3. Copy paste the following code on your remix platform.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionsAndError {
    mapping(uint => uint) public votes;
    bool public votingClosed;

    function Voting(uint candidateId) external {
        require(candidateId > 0 && candidateId<10 , "Invalid candidate");

        votes[candidateId]++;
    }
    function VotingClosed() external {
        assert(!votingClosed);
        
        votingClosed = true;
    }
    function TotalVotes() internal view returns (uint) {
        uint totalVotes;
        for (uint i = 1; i <= 10; i++) {
            totalVotes += votes[i];
        }
        return totalVotes;
    }
}
```
4. To compile the code click on the "Solidity Compiler" option on the left hand side. Before compiling check the compiler option is ^0.8.0,then click on the "compile" button.
5. Once the code is compiled click on the "Deploy and run Transaction" button on the left side of the screen. And click on "Deploy" button.

## Usage
### require()
Parameters():- candidateId > 0 && candidateId<10 , "Invalid candidate" (2 Paramters with condition and a string)
Returns:- "Invalid candidate"-> If the candidate is not under(0-9) 
           votes[candidateId]++; -> Will be Added to Total Votes.

### assert()
Parameters():- !votingClosed (1 Parmeter which checks if the voting has been closed)
Returns:- votingClosed = true -> If the Voting was not closed earlier else no change

### revert()
Parameters():- "Voting is still open" (1 Parameter with a string if voting is not closed)
Returns:- "Voting is still open" -> If someone tries to count the votes before the voting is closed else totalCount of the Votes.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
