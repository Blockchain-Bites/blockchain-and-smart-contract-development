var { ethers } = require("hardhat");
require("dotenv").config();
var { FeeMarketEIP1559Transaction } = require("@ethereumjs/tx");

async function sendTransaction() {
  var contractAddress = "0xE257787e15eC16323E55573Be3Ee3eD70Dcd060c";
  var wallet = new ethers.Wallet(process.env.PRIVATE_KEY, ethers.provider);

  var tx = {};
  tx.to = contractAddress;
  tx.data =
    "0xa9059cbb000000000000000000000000ca420cc41ccf5499c05ab3c0b771ce780198555e000000000000000000000000000000000000000000000006acad34256e6ff3b3"; // instructions that the smart contract will receive
  tx.gasLimit = 50000n;

  var receipt = await wallet.sendTransaction(tx);
  console.log(receipt);
  //hash: 0x36c4fcb3cb7073a4825afc5402ea82da80063c4d9fc1d2205f7a52dfde42da39
}

// sendTransaction();

async function rawTransaction() {
  var contractAddress = "0xE257787e15eC16323E55573Be3Ee3eD70Dcd060c";
  var fromAddress = "0xCA420CC41ccF5499c05AB3C0B771CE780198555e";

  var txData = {};
  txData.nonce = await ethers.provider.getTransactionCount(fromAddress);
  txData.to = contractAddress;
  txData.data =
    "0xa9059cbb000000000000000000000000ca420cc41ccf5499c05ab3c0b771ce780198555e000000000000000000000000000000000000000000000006acad34256e6ff3b3";
  txData.gasLimit = 70000;
  txData.chainId = 1287;
  txData.type = 2;
  txData.value = 0; // ether/dev/matic to be sent
  txData.maxPriorityFeePerGas = 2000000000;
  txData.maxFeePerGas = 120000000000;

  var tx = FeeMarketEIP1559Transaction.fromTxData(txData);
  var signedTx = tx.sign(Buffer.from(process.env.PRIVATE_KEY, "hex"));

  var serializedTx = "0x" + signedTx.serialize().toString("hex");
  console.log(serializedTx);

  // eth_sendRawTransaction
  var receipt = await ethers.provider.send("eth_sendRawTransaction", [
    serializedTx,
  ]);
  console.log("Receipt", receipt);
}

rawTransaction();
