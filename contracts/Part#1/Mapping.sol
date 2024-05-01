// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Mapping {
    /**
            Crearing a TABLE in Solidity

                 (key)        (Value)
            |    Wallet    |    Name    |
            -----------------------------
            |    0x0001    |    Rick    |
            |    0x0002    |    Math    |
            |    0x0003    |    Jane    |
                ...             ...
            |    0x0100    |    Ruth    |
            |    0x0101    |     ""     |
            -----------------------------
                   |              |
                   v              v
Data type:      Address         String

        "For each KEY there is an associated VALUE"

        How to create a mapping(table) in Solidity? Like this:
        
        CREATE DIFFERENT COMBINATIONS OF COLUMNS (keys and values)
        mapping(address => string) tableWalletName;
        mapping(bool => uint256) tableWalletName1;
        mapping(string => bool) tableWalletName2;
        mapping(uint256 => address) tableWalletName3;

        ALL THE MAPPING IS ALREADY INITIALIZED


    */
    mapping(address => string) public tableWalletName;

    // setter
    function saveInTable(address _wallet, string memory _name) public {
        // tableWalletName[_wallet]: arriving at the locationg to store the value
        tableWalletName[_wallet] = _name;
    }

    // getter
    function readFromTable(
        address _wallet
    ) public view returns (string memory) {
        return tableWalletName[_wallet];
    }

    // eraser
    function deleteInTable(address _wallet) public {
        delete tableWalletName[_wallet];
    }

    /**
     * Mapping properties:
     * - All values (associated with keys) are already initialized at their default value
     * - We cannot iterate over a mapping. Because we do not know what keys have been used.
     * - We cannot know the length of mapping.
     * - Mappings could only be defined in the STORAGE (anything that is outside the methods within the contract) section
     * - By adding 'public' we create a getter of the mapping
     * - Keys in mapping are like unique identifiers due the hashing method.
     * - Given the value we cannot retrieve the Key
     */
}

contract MappingDataTypes {
    /**
     *
     *  -----------------------------------------------------
     *  | Types                      | Key Type | Value Type |
     *  | -------------------------  | -------- | ---------- |
     *  | boolean (bool)             |    ✅    |     ✅     |
     *  | unsigned integer (uint256) |    ✅    |     ✅     |
     *  | signed integer (int256)    |    ✅    |     ✅     |
     *  | address                    |    ✅    |     ✅     |
     *  | string                     |    ✅    |     ✅     |
     *  | enum                       |    ✅    |     ✅     |
     *  | bytes                      |    ✅    |     ✅     |
     *  | Contract                   |    ✅    |     ✅     |
     *  | mapping                    |    ❌    |     ✅     |
     *  | struct                     |    ❌    |     ✅     |
     *  | array types                |    ❌    |     ✅     |
     *  -----------------------------------------------------
     *
     *  mapping(Key Type => Value Type) tableWalletName;
     */
}
