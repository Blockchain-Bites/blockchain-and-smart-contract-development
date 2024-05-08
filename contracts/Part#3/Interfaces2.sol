// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IGeneralVoting {
    function enrollCandidate(address _candidate) external;
}

interface IVoting is IGeneralVoting {
    function vote() external returns (bool);

    function getCount() external view;
}

contract Voting is IVoting {
    function enrollCandidate(address _candidate) external {}

    function vote() external returns (bool) {}

    function getCount() external view {}
}
