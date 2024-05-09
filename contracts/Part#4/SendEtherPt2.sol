// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract EtherReceiver {
    mapping(uint256 => bool) booleans;

    event Received(uint256 etherAmount);
    event Fallback(uint256 etherAmount);
    event MethodIncrease(uint256 etherAmount);

    function consumeGas() public payable {
        emit MethodIncrease(msg.value);

        for (uint256 i; i < 15; i++) {
            booleans[i] = true;
        }
    }

    constructor() payable {}

    receive() external payable {
        // It is going to triggered whenever ONLY ether is sent
        // The ether could be sent either a SCA o EOA
        // Calldata should be empty
        consumeGas();
        emit Received(msg.value);
    }

    fallback() external payable {
        // It is going to be triggerred whenever the calldata has an unknown selector
        // It is going to be triggerred whenever the calldata has an unknown selector and ether is sent
        // (in the case where the recieve method is not defined) it is triggered when ONLY ether is sent
        emit Fallback(msg.value);
    }
}

contract EtherSender {
    constructor() payable {}

    /**
     * .transfer
     * - we are using a gas budget of 2300 gas that is going to be executed by the 'receive' method
     * - (in case of failure) the reverts happens automatically
     * - when could the transfer fail?
     *      * when there is not 'recieve' or 'fallback' method in the receiver smart c.
     *      * the 'receive' or 'fallback' method spend more than 2300 gas
     * - it is no possible to perform the reentrancy attack
     * - you could update a variable, increse a number or fire an event to spend 2300 gas
     */
    function transfer(address _receiverAddress, uint256 _amount) public {
        // The sender smart contract wants to send ether to the Receiver Smart contract

        // X: the receiverAddress is going to transfer _amount of ether
        // O: the EtherSender is going to transfer the amount of _amount to the _receiverAddressss
        payable(_receiverAddress).transfer(_amount);
    }

    /**
     * .send
     * - we are using a gas budget of 2300 gas that is going to be executed by the 'receive' method
     * - you can handle the error and add logic whether the operation succedd or not
     * - it is no possible to perform the reentrancy attack
     * -
     */
    function send(address _receiverAddress, uint256 _amount) public {
        bool success = payable(_receiverAddress).send(_amount);
        require(success, "Transfer has failed");
        // other operations
    }

    function call(address _receiverAddress, uint256 _amount) public {
        // "": empty call data
        // success: indicates whether the call operation failed or succedded
        // info:
        // - if everything went fine, info brings back the result of executing the calldata
        // - if everything went wrong, info brings the error encoded
        // how to decode?
        // uint256 response = abi.decode(info, (uint256));
        (bool success, ) = payable(_receiverAddress).call{
            gas: 50000,
            value: _amount
        }("");
        require(success, "Transfer has failed");
        // other ops
    }

    function callToFallback(address _receiverAddress, uint256 _amount) public {
        (bool success, ) = payable(_receiverAddress).call{
            gas: 50000,
            value: _amount
        }(abi.encodeWithSignature("nonExistantMethod()"));
        require(success, "Transfer has failed callToFallback");
        // other ops
    }

    function callToMethod(address _receiverAddress, uint256 _amount) public {
        (bool success, ) = payable(_receiverAddress).call{
            gas: 500000,
            value: _amount
        }(abi.encodeWithSignature("consumeGas()"));
        require(success, "Transfer has failed callToMethod");
        // other ops
    }
}
