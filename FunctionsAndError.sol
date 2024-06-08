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
        if (!votingClosed) {
            revert("Voting is still open");
        }else{
        uint totalVotes;
        for (uint i = 1; i <= 10; i++) {
            totalVotes += votes[i];
        }
        return totalVotes;
    }
    }
}
