// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Inheritance {
    /**
     * - Allows separation of concerns creating contracts with specific goals
     * - Increase readability since each imported contract has one concept
     * - Solidiy supports multiple contract inheritance
     * - In order to avoid the so called diamong problem, used C3 linearization for inheritance
     * - All elements that are not marked as private are inheritable
     * - What elements are inherited?
     *      variables
     *      modifiers
     *      events
     *      errors
     *      methods
     * - Inhering in Solidity:
     *      contract A {}              <- Most based
     *      contract B is A {}
     *      contract C is B, A {}      <- Most derived
     * -
     */
}
