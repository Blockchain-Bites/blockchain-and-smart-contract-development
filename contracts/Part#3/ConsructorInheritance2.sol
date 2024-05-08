// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Human {
    string saluteHuman;
    uint256 ageHuman;

    constructor(string memory _salute, uint256 _age) {
        saluteHuman = _salute;
        ageHuman = _age;
    }
}

contract Male {
    uint256 height;

    constructor(uint256 _height) {
        height = _height;
    }
}

// contract Programmer is Human, Male {
contract Programmer is Male, Human {
    constructor(
        string memory _salute,
        uint256 _age,
        uint256 _height
    ) Male(_height) Human(_salute, _age) {}
}
