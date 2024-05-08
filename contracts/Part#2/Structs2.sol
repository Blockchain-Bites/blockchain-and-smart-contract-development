// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Structs {
    struct Professor {
        string name;
        string course;
        uint256 age;
        string location;
    }

    mapping(address => Professor) public professorByAddress;
    Professor[] public listProfessors;

    function saveInformationMappingDirect(address _wallet) public {
        professorByAddress[_wallet] = Professor({
            name: "Mike",
            course: "Algo",
            age: 35,
            location: "LA"
        });
        professorByAddress[_wallet].age = 343;
        professorByAddress[_wallet].course = "Math"; // This upadate happens in STORAGE

        listProfessors.push(
            Professor({name: "Mike", course: "Algo", age: 35, location: "LA"})
        );
    }

    function saveInformationMappingMemory(address _wallet) public {
        Professor memory _professor = Professor({
            name: "Mike",
            course: "Algo",
            age: 35,
            location: "LA"
        });
        _professor.age = 343;
        _professor.course = "Math"; // This update happens in Memory

        professorByAddress[_wallet] = _professor;

        listProfessors.push(_professor);
    }
}
