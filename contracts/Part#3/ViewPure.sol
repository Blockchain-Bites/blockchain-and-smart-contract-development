// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// 1: view, pure (They not always appear)
// 2: external, public, internal, private (One of them MUST appear always)

// pure:
// - no state from the smart contract is read
// - no variable is read
// - does not have any side effects (does not alter any state)
contract Pure {
    bool flag;

    function funcPure() public pure returns (uint256) {
        return 3;
    }

    function funcPure2(uint256 a) public pure returns (uint256) {
        return a * 3;
    }

    function funcPure3(uint256 a) public pure returns (uint256) {
        return a * 3 * funcPure2(a);
    }
}

// view:
// - could read state (variables) from the smart contract
// - does not have any side effects (does not alter any state)
// - it is read-only
contract View {
    uint256 value = 1234567;
    event Number(uint256 a);

    function funcView() public view returns (uint256) {
        // emit Number(value);
        return value;
    }

    function funcView2() public view returns (uint256) {
        // emit Number(value);
        return value * funcView();
    }

    function funcView3() public view returns (uint256) {
        // emit Number(value);
        return value * funcPure3(value);
    }

    function funcPure3(uint256 a) public pure returns (uint256) {
        return a * 3;
    }
}
