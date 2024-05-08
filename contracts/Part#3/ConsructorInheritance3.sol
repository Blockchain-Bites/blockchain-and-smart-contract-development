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

contract Male is Human {
    uint256 height;

    constructor(
        uint256 _height,
        string memory _salute,
        uint256 _age
    ) Human(_salute, _age) {
        height = _height;
    }
}

contract Programmer is Male {
    constructor(
        string memory _salute,
        uint256 _age,
        uint256 _height
    ) Male(_height, _salute, _age) {}
}
