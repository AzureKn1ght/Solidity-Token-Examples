const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });

async function main() {
  /*
    A ContractFactory is an abstraction used to deploy new smart contracts
  */
  const tkn = await ethers.getContractFactory("Token");

  // deploy the contract
  const deployedContract = await tkn.deploy();

  // print the address of the deployed contract
  console.log("Deployed Contract Address:", deployedContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
