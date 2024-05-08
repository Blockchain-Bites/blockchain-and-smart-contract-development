// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SendEther {
    constructor() payable {}

    function sendEtherToAddress(address _detination) public {
        // address(this): the addres of the current smart contract
        // address(this).balance

        // Send all the smart contract balance to _destination
        uint256 balanceSC = address(this).balance;

        // X: _detination is going to transfer the amount of balanceSC Ether
        // O: _detination is going receive a transfer of balanceSC Ether from the smart contract
        payable(_detination).transfer(balanceSC);
    }

    function getBalance(address _scAddress) public view returns (uint256) {
        return _scAddress.balance;
    }

    receive() external payable {
        // Whenever you send ONLY Ether
    }

    fallback() external payable {
        // Whenever you send unknown calldata and Ether
    }
}
