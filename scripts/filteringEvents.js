const { ethers } = require("hardhat");

async function filterEvents() {
  var eventAddress = "0x82692Bd247fCb2587118cBAC959612289e39C09a";
  var abi = [
    "event Purchase(address indexed wallet, uint256 indexed age, uint256 indexed ticketPrice)",
  ];
  var provider = ethers.provider;
  var contract = new ethers.BaseContract(eventAddress, abi, provider);
  var fromBlock = 6840780;
  var toBlock = 6840869;

  // Making queries
  // 1 - List all events between fromBlock to toBlock
  //   var eventFilter = contract.filters.Purchase();
  //   var events = await contract.queryFilter(eventFilter, fromBlock, toBlock);

  //   var filteredEvents = events.filter(
  //     (el) => el.args[0] == "0x189FBC4b2DE51D11C897E4858BE53Ec1E06c4FFC"
  //   );
  // 21

  //   var filteredEvents = events.filter(
  //     (el) =>
  //       el.args[0] == "0x189FBC4b2DE51D11C897E4858BE53Ec1E06c4FFC" &&
  //       el.args[1] > 5n
  //   );
  // 7
  //   console.log(filteredEvents.length);

  // 2 - Filtering all events with wallet = 0x189FBC4b2DE51D11C897E4858BE53Ec1E06c4FFC
  var eventFilter = contract.filters.Purchase(
    "0x189FBC4b2DE51D11C897E4858BE53Ec1E06c4FFC",
    [5n, 6n, 7n, 8n],
    null
  );
  var events = await contract.queryFilter(eventFilter, fromBlock, toBlock);
  console.log(events.length);
  console.log(events[0]);

  // 3 - Filtering all events with wallet = 0x189FBC4b2DE51D11C897E4858BE53Ec1E06c4FFC and age < 10
  var eventFilter = contract.filters.Purchase(
    "0x189FBC4b2DE51D11C897E4858BE53Ec1E06c4FFC",
    [1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n],
    null
  );
}

filterEvents();
