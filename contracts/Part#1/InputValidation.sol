// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract InputValidation {
    /**
     * Input Validation: require & revert
     * - Validate that _wallet is not zero address
     * - Validate that _name is not empty
     * - ...
     *
     * - Atomic: every tx in Solidity either works or fail in all senses
     */

    mapping(address => string) public tableWalletName;

    // An invariant
    uint256 constant MAX_AMOUNT = 30;
    uint256 amountOfPeople;

    function saveInTableWithRequire(
        address _wallet,
        string memory _name
    ) public {
        // require(boolean logic/validation , error message);
        require(_wallet != address(0), "Address zero is being used");
        require(bytes(_name).length > 0, "Name is empty");

        tableWalletName[_wallet] = _name;
        amountOfPeople++;

        assert(amountOfPeople <= MAX_AMOUNT);
    }

    /**
     * Revert:
     * - You need tro create custom errors
     * - It chepear than require in terms of gas
     */

    error AddressZero();
    error EmptyString();

    function saveInTableWithRevert(
        address _wallet,
        string memory _name
    ) public {
        // require(_wallet != address(0), "Address zero is being used");
        if (_wallet == address(0)) revert AddressZero();
        // require(bytes(_name).length > 0, "Name is empty");
        if (bytes(_name).length == 0) revert EmptyString();

        tableWalletName[_wallet] = _name;
    }

    function readFromTable(
        address _wallet
    ) public view returns (string memory) {
        return tableWalletName[_wallet];
    }

    function deleteInTable(address _wallet) public {
        delete tableWalletName[_wallet];
    }
}
