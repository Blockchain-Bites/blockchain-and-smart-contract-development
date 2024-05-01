// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Events {
    /**
     * Events:
     * - Propagate information from the smart contract
     * - Used for registering relevant events within a smart contract
     * - Other smart contract cannot listen to events
     * - Cheaper way (than variables) of storing information in the Blockchain
     * - Front-end and back-end can subscribe to events coming from smart contracts
     * - Events can carry contextual information
     * - All events stored in the Blockchain could be consulted by using queries later
     * - The contextual information could be indexed for easier queries
     */

    event NewEntryInTable(address indexed wallet, string indexed name);
    event NewEntryInTable2(
        address indexed wallet,
        string indexed name,
        uint256 indexed time,
        address indexed caller
    ) anonymous;
    event NewEntryInTable(
        address indexed wallet,
        string indexed name,
        uint256 indexed time,
        address caller
    );
    event DeletionFromTable(address wallet);
    event DeletionFromTable();

    error AddressZero();
    error EmptyString();

    // An invariant
    uint256 constant MAX_AMOUNT = 30;
    uint256 amountOfPeople;

    mapping(address => string) public tableWalletName;

    function saveInTableWithRevert(
        address _wallet,
        string memory _name
    ) public {
        if (_wallet == address(0)) revert AddressZero();
        if (bytes(_name).length == 0) revert EmptyString();

        tableWalletName[_wallet] = _name;

        emit NewEntryInTable(_wallet, _name);
        emit NewEntryInTable(_wallet, _name, block.timestamp, msg.sender); // anonymous
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
