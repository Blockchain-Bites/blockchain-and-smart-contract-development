// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract FixedArray {
    /**
     * Fixed Array:
     * - It has a predefined amount of elements. This cannot be increased
     * - Methods such as .pop or .push do not work in fixed arrays
     * - To save information use the indexes array[0], array[1], and so on
     * - Fixed arrays created within a method are only saved in memory, not storage
     * - Sintax:
     *      T[N] variableName;
     *
     *      T: data type of elements of the array
     *      N: amount of elements within the array
     *
     * - To define an array within a method, it could start as dinamic
     *
     *
     */
    // STORAGE
    // Define an array that includes 5 uint256
    uint256[5] public fiveIntegerArray;
    // Define an array that includes 10 bool
    bool[10] tenBoolArray;
    // Define an array that includes 10 arrays of 5 strings each
    string[5][10] tenArrayOf5elemntArraysString;

    function saveInfoInArray() public {
        fiveIntegerArray[0] = 123;
        //...
        fiveIntegerArray[4] = 3242342323;

        tenBoolArray[0] = true;
        // ...
        tenBoolArray[9] = true;
    }

    function deleteInfoFromArray() public {
        // [123,,,,3242342323]
        delete fiveIntegerArray[0];
        // [0,,,,3242342323]

        // [true,....]
        delete tenBoolArray[0];
        // [false,....]
    }

    function createArrayWithinMethod() public view {
        // Two ways
        // 1 - fixed from the beginning
        address[2] memory addressList;
        addressList[0] = address(this);
        addressList[1] = msg.sender;

        // 2 - starts as dynamic then it gets fixed
        address[] memory addressList2 = new address[](2);
        addressList2[0] = address(this);
        addressList2[1] = msg.sender;
    }
}
