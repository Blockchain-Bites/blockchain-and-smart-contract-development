// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Receive method
 * - triggered when ONLY ether is sent to the smart contract
 * - no calldata could be sent
 * - if calldata (with unknown selector) is sent, then fallback is fired
 */

contract Receive {
    event ReceiveCalled(uint256 value);
    event FallbackCalled(uint256 value);

    function methodThatExist() public payable {}

    receive() external payable {
        // Triggered with ONLY ether (an not calldata) is sent
        // msg.value: global variable that points the amount of Ether being sent
        emit ReceiveCalled(msg.value);
    }

    fallback() external payable {
        // Triggered when calldata with unknown selector is sent
        // Triggered when calldata with unknown selector and Ether is sent
        emit FallbackCalled(msg.value);
    }
}

interface IFallback {
    function nonExistantMethod() external payable;
}

contract CallingContract {
    constructor() payable {}

    address fallbackAddress = 0xd7Ca4e99F7C171B9ea2De80d3363c47009afaC5F;
    IFallback _fallback = IFallback(fallbackAddress);

    function callingANonExistantMethod() public {
        _fallback.nonExistantMethod{value: 1 ether}();
    }
}
