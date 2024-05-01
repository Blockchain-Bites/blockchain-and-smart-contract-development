// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MsgSender {
    // msg.sender
    // - is a global variable (there is not need to define it)
    // - inmediate caller of the method
    // - could be either an EOA or SCA

    address public caller;

    function setCaller() public {
        caller = msg.sender;
    }
}
