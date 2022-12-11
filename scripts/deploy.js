const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });

async function main() {
  const baseURI = "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
  /*
    A ContractFactory is an abstraction used to deploy new smart contracts
  */
  const nft = await ethers.getContractFactory("NFT");

  // deploy the contract
  const deployedContract = await nft.deploy(baseURI);

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

//VERIFY SOURCE CODE ON ETHERSCAN
//npx hardhat verify --network goerli 0x469D7cC7ae9404447022E351b2CC384C55A4F2A6 "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/"
