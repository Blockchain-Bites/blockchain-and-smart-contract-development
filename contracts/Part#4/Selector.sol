// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Selector
 * - It is the first four bytes of the keccak256 of the method signature
 * - It is used for constructing the calldata (instructions that the smart contract receive to execute the opcodes)
 */

interface IVoting {
    // 632a9a52
    function vote() external returns (bool);

    // a87d942c
    function getCount() external view;
}

contract Selector {
    IVoting voting;

    function getSelector() public view returns (bytes4) {
        return voting.vote.selector;
    }

    function getSelectorManual() public pure returns (bytes4) {
        return bytes4(keccak256("vote()"));
    }
}
