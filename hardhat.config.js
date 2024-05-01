require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.24",
  networks: {
    moonbase: {
      url: process.env.MOONBASE_TESTNET_URL,
      accounts: [process.env.PRIVATE_KEY],
      timeout: 0,
      gas: "auto",
      gasPrice: "auto",
    },
  },
  etherscan: {
    apiKey: {
      moonbaseAlpha: process.env.API_KEY_MOONBASE_ALPHA,
    },
  },
};
