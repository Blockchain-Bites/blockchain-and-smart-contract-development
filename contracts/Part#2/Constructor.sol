// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Constructor {
    /**
     * - It is a special method that does not require the 'function' keyword
     * - The constructor fires itself only once during the entire contract life cycle
     * - It is used to initialized values
     * - The constructor could receive inputs from outside
     * - All bytecode from the constructor pertains to the init-code which is not stored in the Blockchain
     * - Possible to call methods from the constructor: internally there are JUMPs to methods
     * - In Solidity versions prior 0.4.22 the constructor used the same name as the contract
     * - In a Proxy patterns, constructors are avoided
     * - The more operations in the constructor, the higher the cost of contract deployment
     */
    event WhitelistAdded(address participant);

    address owner;
    uint256 deploymentTime;
    mapping(address => bool) whitelist;

    constructor(address _owner) {
        owner = _owner;
        whitelist[msg.sender] = true;

        _setDeploymentTime();

        emit WhitelistAdded(msg.sender);
    }

    function _setDeploymentTime() internal {
        deploymentTime = block.timestamp;
    }
}
