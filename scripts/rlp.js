var { ethers } = require("hardhat");
var { keccak256, encodeRlp } = ethers;

async function calculateAddress() {
  // hash(rpl(sender, nonce)) => smart contract address
  var [owner] = await ethers.getSigners();
  var sender = owner.address;

  // nonce = amount of tx made by this account
  var nonce = await ethers.provider.getTransactionCount(sender);
  var nonceHex = nonce.toString(16);
  // 1  => 1    => 0x1 => 0x01 (even amount of digits)
  // 11 => b    => 0xb => 0x0b (even amount of digits)
  // 20 => 14   => 0x14 (even amount of digits)

  if (nonceHex == "0") {
    nonceHex = "0x";
  } else if (nonceHex.length % 2 != 0) {
    nonceHex = "0x0" + nonceHex;
  } else {
    nonceHex = "0x" + nonceHex;
  }

  var contractAddress =
    "0x" + keccak256(encodeRlp([sender, nonceHex])).slice(-40);

  console.log("Contract Address", contractAddress);
}

// Contract Address 0x49bc21008e866ad38dec4f2c667faa311b8f5674

calculateAddress();
