// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Interface Id
 * - Help us to identify one particular standar by proving a unique identifier
 * - By using that identifier we can consult whether a smart contract implements a particular interface
 * - To calculate the interface id of an interface all its methods are XORed with each other.
 */

interface IVoting {
    // 632a9a52 => binary
    function vote() external returns (bool);

    // a87d942c => binary
    function getCount() external view;

    /**
     * XOR
     * 0 xor 0 = 0
     * 0 xor 1 = 1
     * 1 xor 0 = 1
     * 1 xor 1 = 0
     *
     *
     * cb570e7e
     */
}

contract InterfaceId is IVoting {
    function vote() external returns (bool) {}

    function getCount() external view {}

    function getInterfaceId() public pure returns (bytes4) {
        return type(IVoting).interfaceId;
    }

    function hasImplementedIVoting(bytes4 _id) public pure returns (bool) {
        return _id == type(IVoting).interfaceId;
    }
}
