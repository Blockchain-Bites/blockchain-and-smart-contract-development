# Welcome to BLOCKCHAIN AND SMART CONTRACT DEVELOPMENT

## Description

In this course, we will study the Solidity programming language to be able to create digital assets in the Internet of Value. This requires a fluent knowledge of Solidity in its entire spectrum: syntax, testing, design principles, contract updates, publishing and verification scripts, intercommunication, most common vulnerabilities, etc.

However, Solidity's mastery is not enough to harness the full potential of Blockchain. We also require an understanding of the different existing digital standards and the ecosystem of tools that extend the power of smart contracts.

In this course we will study a series of digital standards and their variants. We will learn at the code level how to create fungible money, using the ERC20, as well as create unique digital assets, using the ERC721. The union of the previous two was called ERC1155 and is widely used in blockchain games. We will study other variations that help solve other use cases: ERC20Permit, ERC721x, ERC721Enumerable, ERC777, ERC223, etc. We will see how to use the Uniswap V2 AMM to create a liquidity pool from an ERC20 digital asset pair.

There is a set of complementary tools to the Blockchain that allow us to extend the power of smart contracts. In this course we will learn tools created by leading companies in the industry. Among these we have Chainlink (semi-decentralized oracles, Open Zeppelin Defender (lambda function on demand triggered by contracts), The Graph (the largest indexer of Blockchain information), Hardhat (continuous deployment), Foundry (testing, continuous deployment), among others.

What you are going to learn the following topics:

- The constituent parts of the Blockchain and how it works internally
- The Solidity programming language in depth
- The most common digital standards (programmable money) and their variants
- Smart contract testing with 100% coverage
- Automation of contract publication and verification
- Cross-chain operations: you pay on one chain and mint the asset on another
- Most common attacks and vulnerabilities to smart contracts
- Decentralized finance to create liquidity pools on Uniswap V2
- Schedule contracts to auction, sell and buy digital assets
- Token Economy
- Using oracles to inject information into smart contracts

## Setting up the repository

Complete the following steps. You should obtain an `address` after completing step `8`. With these steps you will able to publish and verify your first smart contract.

1. Repository and System

   - Node minimum version: 18.x. Use nvm to install other versions of `nodeJS`

   - Fork the [class repository](https://github.com/Blockchain-Bites/blockchain-and-smart-contract-development)

   - Go to the terminal and run the following commands:

     ```
     $ git clone https://github.com/Blockchain-Bites/blockchain-and-smart-contract-development.git
     $ cd blockchain-and-smart-contract-development
     $ npm install
     ```

2. Install Metamask

   - [Download here](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn) the extension
   - Create an account and enable a wallet in Metamask

   <br />

   ![alt text](https://github.com/Blockchain-Bites/solidity-book/assets/3300958/92e38c89-4a19-4596-94ef-da06eb7e1b7b)

   <br />

3. Add `Amoy` to Metamask

   - Go to [Chainlist](https://chainlist.org/?testnets=true&search=amoy)

   <br />

   ![alt text](https://github.com/Blockchain-Bites/solidity-book/assets/3300958/77249873-ce9d-43b5-a86a-7cba06d657e3)

   <br />

   - Click on `Add to Metamask` and follow the instructions

   - Open Metamask wallet and verify that there is an `A` at the top left corner.

4. Get testing tokens

   1. Send `Matic` to the wallet created using the wallet's `address`.
   2. To request `Matic`, go to [Polygon Faucet](https://faucet.polygon.technology/) or [Alchemy Faucet](https://www.alchemy.com/faucets/polygon-amoy). You will receive a balance in `Matic` that you will need to make transactions

5. Create the file `.env` file by duplicating the `.env-copy` file

   - Do in the terminal: `$ cp .env-copy .env`

6. Fill the keys in the `.env` file:

   - `API_KEY_OKLINK`: Go to [OkLink](https://www.oklink.com/account/login?forward=%2Faccount%2Fmy-api). Click on `Sign Up` and finish creating the an account. After creating the account, hover your icon at the top right corner. Search for `API MANAGEMENT`. Add 2FA. Then click on `Create API key`. Copy the `API Key Token` into the `.env` file.

   <br />

   ![alt text](https://github.com/Blockchain-Bites/solidity-book/assets/3300958/4f1eea23-0d0c-428b-9574-7022c13ce5f5)

   <br />

   - `PRIVATE_KEY`: Obtain the `private key` of the wallet that was created in point `2` by following [these steps](https://support.metamask.io/hc/en-us/articles/360015289632-How-to-export-an-account-s-private-key) and copy it to this variable in the `.env` file.

   - `AMOY_TESTNET_URL`: Create an account in [Alchemy](https://dashboard.alchemyapi.io/). Enter the dashboard and create an app `+ CREATE APP`. Choose any `NAME` and `DESCRIPTION`. Choose `ENVIRONMENT` = `Development`, `CHAIN` = `Polygon` and `NETWORK` = `Amoy`. Click on `VIEW KEY` and copy the value inside `HTTPS` into the `.env` document for this environment variable. Skip the service payment step.

   - This is what the `.env` file should look like:

     ![alt text](https://github.com/Blockchain-Bites/solidity-book/assets/3300958/66f33832-27be-46b9-8b9e-5712b6a39a94)

7. Go to the file `contracts/MyFirstContract.sol`:

   - Find the variable `nameAndLastName` on line 6
   - Replace the value of that variable with your first and last name

8. Publishing and verifying your first smart contract:

   - `$ npx hardhat --network amoy run scripts/deploy.js`
   - Wait 1 minute while the deployment is done
   - If everything was executed correctly, you will see the following result:

   ```bash
    ====== Publishing your first contract (1 min)... ======
    ====== Congrats! You did publish your first contract ======
    Contract Address: 0x9F24e522017580028fd388554f119DEAbb3A6442

    ====== Contract verification has started ======
    Successfully submitted source code for contract
    contracts/MyFirstContract.sol:MyFirstContract at 0x9F24e522017580028fd388554f119DEAbb3A6442
    for verification on the block explorer. Waiting for verification result...

    Successfully verified contract MyFirstContract on the block explorer.
    https://www.oklink.com/polygonAmoy/address/0x9F24e522017580028fd388554f119DEAbb3A6442#code

    ====== Congrats! You successfully verified your 1st contract ======
   ```

9. Reasons why the above command might fail

- The `.env` file does not have the correct keys
- The Metamask wallet private key does not have enough funds
- `NodeJS` is an old version
