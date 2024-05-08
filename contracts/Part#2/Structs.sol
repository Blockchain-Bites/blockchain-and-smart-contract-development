// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Structs {
    /**
     * Struct:
     * - A complex data type defined by the user
     * - It comprises a set of different variables of different data types
     * - It is a type declaration. Then you can use this struct to create another variable
     * - It could contain another struct, arrays and mappings
     */

    // type declaration: no particular slot is used
    struct BalanceInformation {
        uint256 amount;
        uint256 limit;
        uint256 interest;
        string name;
    }

    // Variable balance is locatd at slot 0;
    // Part of the STORAGE AREA
    BalanceInformation balance;

    function populateBalanceExplicit() public {
        balance = BalanceInformation({
            interest: 12312,
            limit: 12312,
            amount: 12321,
            name: "Savings account"
        });
    }

    function populateBalanceBrief() public {
        // Order is very important
        balance = BalanceInformation(12312, 12312, 12321, "Saving account");
    }
}
