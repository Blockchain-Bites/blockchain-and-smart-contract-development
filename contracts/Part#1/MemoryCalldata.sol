// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract MemoryCalldata {
    /*
     * Memory vs calldata:
     * In solidity, whenever you are working with dynamic data types, you MUST specify
     * how to treat those variables with either memory or calldata.
     *
     * Example of dynamic data types: array, struct, string, bytes, etc.
     *
     * Memory
     * - allows you to modify the variable passed as input
     * - It is more expensive due to the OPCODES involved for that
     *
     * Calldata
     * - cannot modify the variable passed as input (like CONST)
     * - It is cheaper due to less OPCODES being used
     *
     */

    mapping(address => string) mappingAddressString;

    function saveData(address _wallet, string memory _name) public {
        _name = string.concat(_name, "-4000");
        mappingAddressString[_wallet] = _name;
    }

    function saveData2(address _wallet, string calldata _name) public {
        // _name = string.concat(_name, "-4000");
        mappingAddressString[_wallet] = _name;
    }
}
