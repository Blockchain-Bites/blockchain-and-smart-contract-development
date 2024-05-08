// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Structs {
    struct ID {
        uint256 number;
        string name;
        string lastName;
    }

    struct Person {
        ID id;
        uint256 height;
        uint256 weight;
        mapping(string => uint256) assetsAmount;
    }

    mapping(address => Person) public peopleList;

    function savePerson(address _wallet) public {
        ID memory _id = ID({number: 123213, name: "Mike", lastName: "J."});
        // Person memory _person = Person({id: _id, height: 123, weight: 34, assetsAmount: no defiition is allowed here})
        Person storage _person = peopleList[_wallet];
        _person.id = _id;
        _person.height = 1213;
        _person.weight = 3243;
        _person.assetsAmount["Car"] = 23;
        _person.assetsAmount["House"] = 100;
    }
}
