const { ethers } = require("hardhat");

async function main(){
  console.log("Deploying Factory Contract...");
  const Factory = await ethers.getContractFactory("FactoryAssembly");
  const factory = await Factory.deploy();
  await factory.deployed();
  console.log("Deployed FactoryAssembly Contract at : ",factory.address);
}

main();