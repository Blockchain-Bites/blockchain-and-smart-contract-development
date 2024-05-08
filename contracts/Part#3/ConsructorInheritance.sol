// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Constructor Inheritance
 *  - Whenever a parent smart contract has a constructor,
 *      is the job of the child to initialize the parent constructor
 *  - If the child contract does not initialize the parent construcot, then child contract could be abstract
 */

contract Human {
    string saluteHuman;
    uint256 ageHuman;

    constructor(string memory _salute, uint256 _age) {
        saluteHuman = _salute;
        ageHuman = _age;
    }
}

// CASE 1
// The cnostructor is initialize in the inherting list
// Whenever you know in advance what are the value of the parent smart contract
// You need to hard code the value for the constructor
contract Male is Human("Hello I am Human", 2000) {

}

// CASE 2
// As a modifier of the child constructor
// It could be more dynamic
contract Male2 is Human {
    constructor(string memory _salute, uint256 _age) Human(_salute, _age) {}

    function getSaluteHuman() public view returns (string memory) {
        return saluteHuman;
    }
}
