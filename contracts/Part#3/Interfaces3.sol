// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Interfaces for calling another contracts:
 * - To call methods of the Smart Contract A from Smart Contract B
 *
 * Process for calling another smart contract:
 * - Publish smart contract A and get the address
 * - Derive the interface Of Smart Contract A
 * - Create a reference of Smart Contract A in B by using interface of A
 * - Execute the methods of the reference within B
 */

// 2 - Derive the interface of Voting
interface IVoting {
    function vote(address _candidate) external returns (bool);

    function votes(address _candidate) external view returns (uint256);

    function voters(address _voter) external view returns (bool);

    function totalVotes() external view returns (uint256);
}

// 1 - Public Voting: 0x0000Voting
contract Voting {
    mapping(address candidate => uint256 numberVotes) public votes;
    mapping(address voter => bool alreadyVoted) public voters;
    uint256 public totalVotes;

    function vote(address _candidate) public returns (bool) {
        require(!voters[msg.sender], "You already voted");
        voters[msg.sender] = true;
        votes[_candidate]++;
        totalVotes++;

        return true;
    }
}

contract MedellinVoting {
    // 3 - Create a reference of SC A
    address votingAddress; // 0x0000Voting
    IVoting voting = IVoting(votingAddress);

    function voteFromMedellin(address _candidate) public returns (bool) {
        // 4 - Call a method from the smart contract
        return voting.vote(_candidate);
    }
}
