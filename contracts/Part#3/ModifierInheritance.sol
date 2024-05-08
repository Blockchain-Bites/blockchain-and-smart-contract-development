// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {OnlyOwner} from "./OnlyOwner.sol";

contract Pause {
    bool private paused;
    modifier whenNotPaused() {
        require(!paused, "Method is paused");
        _;
    }

    function _pause() internal {
        paused = true;
    }

    function _unpause() internal {
        paused = false;
    }
}

contract ModifierInheritance is OnlyOwner, Pause {
    function protectedByOwner() public onlyOwner {}

    function protectedByPaused() public whenNotPaused {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
}
