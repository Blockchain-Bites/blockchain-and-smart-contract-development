// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Interface
 * - When put in the line of inheritance, it forces the smart contract to implement
 *      all the methods within the interface
 * - When put in the line of inheritance, it works as a standar, useful for compliance
 * - When creating an interface, take into account the following:
 *      * only define method signatures
 *      * all methods should have the external keyword
 *      * you could add the 'view' or 'payable' keyword if that is appropriate
 *      * return values are also important
 */

interface IVoting {
    function vote() external returns (bool);

    function getCount() external view;
}

contract Voting is IVoting {
    function vote() public returns (bool) {
        // ... other operations
    }

    function getCount() public view {
        // ... other operations
    }

    function otherMethods() public {}

    function otherMethods2() public {}

    function otherMethods3() public {}
}

contract Voting2 is IVoting {
    function vote() public returns (bool) {
        // ... other operations
    }

    function getCount() public view {
        // ... other operations
    }
}
