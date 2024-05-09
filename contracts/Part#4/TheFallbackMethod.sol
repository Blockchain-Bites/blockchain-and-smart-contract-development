// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Fallback method
 * - triggered when the selector in the calldata being sent is unknown
 * - fail gracefully
 * - it could also receive ether after the contract is deployed (when receive method is not defined)
 */

contract Fallback {
    event FallbackCalled();

    fallback() external payable {
        emit FallbackCalled();
    }
}

interface IFallback {
    function nonExistantMethod() external;
}

contract CallingContract {
    address fallbackAddress;
    IFallback _fallback = IFallback(fallbackAddress);

    function callingANonExistantMethod() public {
        _fallback.nonExistantMethod();
    }
}
