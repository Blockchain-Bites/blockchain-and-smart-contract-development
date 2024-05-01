// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Modifiers {
    /**
     * Modifiers:
     * - isolates code in a meaningful concept that can be reutilized later
     * - tipically used for validating inputs (uses require and revert special methods)
     * - extends a method functionality
     * - it is executed prior the method
     * - it could receive inputs that the method is also getting
     * - modifiers can be concatenated
     * - controls when to go back to execute the body of the method
     *
     * Exercise: create a modifier that protects a method to be called by ONE particular address
     */

    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    event NewEntryInTable(address indexed wallet, string indexed name);
    event DeletionFromTable(address wallet);

    error AddressZero();
    error EmptyString();

    uint256 constant MAX_AMOUNT = 30;
    uint256 amountOfPeople;

    mapping(address => string) public tableWalletName;

    modifier onlyOwner() {
        require(msg.sender == owner, "You are no the owner");
        _; // <- give control back of the executing to the method
    }

    function saveInTableWithRevert(
        address _wallet,
        string memory _name
    ) public onlyOwner {
        if (_wallet == address(0)) revert AddressZero();
        if (bytes(_name).length == 0) revert EmptyString();

        tableWalletName[_wallet] = _name;

        emit NewEntryInTable(_wallet, _name);
    }

    function readFromTable(
        address _wallet
    ) public view returns (string memory) {
        return tableWalletName[_wallet];
    }

    function deleteInTable(address _wallet) public {
        delete tableWalletName[_wallet];
        emit DeletionFromTable(_wallet);
    }
}
