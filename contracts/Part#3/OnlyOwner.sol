// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract OnlyOwner {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    function renounceOwnership() public onlyOwner {
        owner = address(0);
    }
}
