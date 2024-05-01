// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ModifierUseCases {
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    modifier onlyOwner() {
        require(msg.sender == owner, "You are no the owner");
        _; // <- give control back of the executing to the method
    }

    // 1 - Use case: allow a method to be called within window time of one day
    uint256 windowTimeEnd = block.timestamp + 10 days;
    modifier validateTime() {
        require(block.timestamp < windowTimeEnd, "Time has run out");
        _;
    }

    // 2 - Use case: allow a method to be called only 10 times and no more
    uint256 counter; // = 0;
    modifier validateCounter() {
        require(counter < 11, "More than 10 call already");
        _;
    }

    // 3 - Use case: a method could be paused from executing and then unpased later
    bool paused; // = false;
    modifier whenNotPaused() {
        require(!paused, "Method is paused");
        _;
    }

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    // 4 - Use case: a method could be called by people from a white list
    mapping(address wallet => bool allowed) whitelist;

    function saveInWhiteList(address _wallet) public onlyOwner {
        whitelist[_wallet] = true;
    }

    function deleteFromWhiteList(address _wallet) public onlyOwner {
        whitelist[_wallet] = false;
    }

    modifier onlyWhiteList() {
        require(whitelist[msg.sender], "You are not in whitelist");
        _;
    }

    function protectedMethod1()
        public
        validateTime
        onlyWhiteList
        whenNotPaused
    {}

    function protectedMethod2()
        public
        validateCounter
        onlyWhiteList
        whenNotPaused
    {
        counter++;
    }

    function protectedMethod3() public whenNotPaused {}
}
