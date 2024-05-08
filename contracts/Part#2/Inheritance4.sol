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
}

contract Male is Human {
    function saluteMale() public maleModifier returns (string memory) {
        year++;
        emit Saluting("Hello! I am a Male");
        return "Hello! I am a Male";
    }
}

contract Programmer is Human, Male {
    /**
     * super keyword
     * - searches from right to left in the inheritance line
     * - starts at the most derived smart contract until
     * - stops at the first coincidence
     */
    function saluteFromHuman() public returns (string memory) {
        return super.saluteHuman();
    }

    /**
     * Only doable with methods that are not private
     */
    function saluteFromMale() public returns (string memory) {
        return Male.saluteMale();
    }
}
