// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// Order of inheritance
contract A {

}

contract B is A {}

// A is the most base smart contract: this should go all the way to the left
// B is the most derived smart contract: this should go all the way to the right
contract C is A, B {

}

// contract C is B, A {}

contract D {

}

contract E {}

// contract F is D, E {}
contract F is E, D {

}
