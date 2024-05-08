// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Human {
    // virtual: mark the method for override in a child smart contract
    function salute() public pure virtual returns (string memory) {
        return "Hello. I am Human!";
    }
}

contract Male is Human {
    function salute() public pure virtual override returns (string memory) {
        return "Hello. I am Male!";
    }

    function saluteHuman() public pure returns (string memory) {
        return super.salute();
    }

    function saluteHuman2() public pure returns (string memory) {
        return Human.salute();
    }
}

contract Micke is Human, Male {
    function salute()
        public
        pure
        override(Human, Male)
        returns (string memory)
    {
        return "Hello. I am Micke!";
    }
}
