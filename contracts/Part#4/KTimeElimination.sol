// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract LinearTimeElimination {
    uint256[] arrayList;

    constructor() {
        // [6, 7, 9, 8, 10, 5, 2, 3, 1 ,4]
        arrayList.push(6);
        arrayList.push(7);
        arrayList.push(9);
        arrayList.push(8);
        arrayList.push(10);
        arrayList.push(5);
        arrayList.push(2);
        arrayList.push(3);
        arrayList.push(1);
        arrayList.push(4);
    }

    function eliminateAtLinearTime(uint256 _el) public {
        uint256 ix;
        for (ix; ix < arrayList.length - 1; ix++) {
            if (arrayList[ix] == _el) break;
        }

        for (uint256 k = ix + 1; k < arrayList.length - 1; k++) {
            arrayList[ix] = arrayList[k];
            ix++;
        }
        arrayList.pop();
    }

    function eliminateAtLinearTime2(uint256 _el) public {
        uint256 ix;
        for (ix; ix < arrayList.length - 1; ix++) {
            if (arrayList[ix] == _el) break;
        }

        arrayList[ix] = arrayList[arrayList.length - 1];

        arrayList.pop();
    }
}

contract KTimeElimination {
    uint256[] arrayList;
    mapping(uint256 el => uint256 ix) indexes;
    uint256 counter;

    constructor() {
        // [6, 7, 9, 8, 10, 5, 2, 3, 1 ,4]
        _saveInArray(6);
        _saveInArray(7);
        _saveInArray(9);
        _saveInArray(8);
        _saveInArray(10);
        _saveInArray(5);
        _saveInArray(2);
        _saveInArray(3);
        _saveInArray(1);
        _saveInArray(4);
    }

    function _saveInArray(uint256 _el) internal {
        arrayList.push(_el);
        indexes[_el] = counter;
        counter++;
    }

    function eliminateInKTime(uint256 _el) public {
        // grab the index of the element to eliminate
        uint256 ix = indexes[_el];

        // grab the last element of the array
        uint256 lastEl = arrayList[arrayList.length - 1];

        // put the last element on the index we want to eliminate
        arrayList[ix] = lastEl;

        // eliminate the duplicate element (last element)
        arrayList.pop();

        // update the index in the mapping for the last element
        indexes[lastEl] = ix;

        // update counter to reflect the lenght of the array
        counter--;

        // remove the index of the element removed
        delete indexes[_el];
    }
}
