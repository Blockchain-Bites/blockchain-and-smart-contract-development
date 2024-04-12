var { ethers } = require("hardhat");

async function main() {
  const myFirstContract = await ethers.deployContract("MyFirstContract");
  await myFirstContract.waitForDeployment();

  console.log("\n");
  console.log("====== Publishing your first contract (1 min)... ======");
  const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
  await delay(60000); // 1 min

  const addressContract = await myFirstContract.getAddress();
  console.log("====== Congrats! You did publish your first contract ======");
  console.log("Contract Address:", addressContract);

  console.log("\n");
  console.log("====== Contract verification has started ======");
  await hre.run("verify:verify", {
    address: addressContract,
    constructorArguments: [],
  });
  console.log("\n");
  console.log(
    "====== Congrats! You successfully verified your 1st contract ======"
  );
  console.log("\n");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
