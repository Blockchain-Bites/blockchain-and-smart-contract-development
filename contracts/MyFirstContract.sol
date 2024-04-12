// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MyFirstContract {
    string greeting;
    string nameAndLastName = "Lee Marreros";

    function set(string memory _newGreeting) public {
        greeting = _newGreeting;
    }

    function get() public view returns (string memory) {
        return greeting;
    }
}
