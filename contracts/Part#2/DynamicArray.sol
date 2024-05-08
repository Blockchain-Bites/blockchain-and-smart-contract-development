// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract DynamicArray {
    /**
     * Dynamic Array:
     * - Does not have a predefined amount of elements for te array
     * - Methods such as .pop or .push work
     * - To update information of a particular index do array[0] = newValue; and so on
     * - Dyanmic arrays are only created in Storage
     * - Sintax:
     *      T[] variableName;
     *
     *      T: data type of elements of the array
     *
     */
    // Create a dynamic array of address data type
    address[] public arrayOfAddress;
    // Create a dynamic array of uint256 data type
    uint256[] arrayOfUint256;
    // Create a dynamic array of dynamic array of bool data type
    bool[][] public dynamicOfDynamicOfBool;
    // Create a dynamic array of fixed array of 10 elements of string data type
    string[10][] public dynamicOfFixedOf10ofString;

    // STORAGE

    function increaseSizeOfArray() public {
        arrayOfUint256.push(12); // [12]
        arrayOfUint256.push(34); // [12, 34]
        arrayOfUint256.push(56); // [12, 34, 56]

        // []
        dynamicOfDynamicOfBool.push(); // [[]]
        dynamicOfDynamicOfBool.push(); // [[], []]
        dynamicOfDynamicOfBool.push(); // [[], [], []]

        dynamicOfDynamicOfBool[0].push(true); // [[true], [], []]
        dynamicOfDynamicOfBool[0].push(false); // [[true, false], [], []]
        dynamicOfDynamicOfBool[2].push(true); // [[true, false], [], [true]]
        dynamicOfDynamicOfBool[2].push(true); // [[true, false], [], [true, true]]

        dynamicOfDynamicOfBool[1].push(true); // [[true, false], [true], [true, true]]
    }

    function decreaseSizeOfArray() public {
        // [12, 34, 56]
        arrayOfUint256.pop(); // [12, 34]
        arrayOfUint256.pop(); // [12]
        arrayOfUint256.pop(); // []
    }

    function deleteInfoFromArray() public {
        // [12, 34, 56]
        delete arrayOfUint256[1];
        // [12, 0, 56]
    }

    function createArrayWithinMethod() public view {}
}
