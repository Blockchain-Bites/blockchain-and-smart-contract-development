// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// 1: view, pure (They not always appear)
// 2: external, public, internal, private (One of them MUST appear always)

contract MethodVisibility {
    // public
    // 1. Could be called from outside of the smart contract (EOA or SC)
    // 2. It is inheritable
    // 3. Will be shown in the ABI (output of compiling the smart contract)
    // 4. Could be overriden
    // 5. Could be used within the smart contract by another method
    function publicFunction() public {}

    // external
    // 1. Could be called from outside of the smart contract (EOA or SC)
    // 2. It is inheritable
    // 3. Will be shown in the ABI (output of compiling the smart contract)
    // 4. Could be overriden
    function externalFunction() external {}

    // internal
    // 1. It is inheritable
    // 2. Could be overriden
    // 3. Could be used within the smart contract by another method
    function internalFunction() internal {}

    // private
    // 1. Could be used within the smart contract by another method
    function privateFunction() private {}
}
