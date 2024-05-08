// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Human {
    modifier maleModifier() {
        _;
    }

    event Saluting(string salute);

    uint256 public year = 3000;

    function saluteHuman() public returns (string memory) {
        emit Saluting("Hello! I am a Human");
        return "Hello! I am a Human";
    }

    function saluteHuman2() private {}
}

contract Male is Human {
    function saluteMale() public maleModifier returns (string memory) {
        year++;
        emit Saluting("Hello! I am a Male");
        return "Hello! I am a Male";
    }
}
