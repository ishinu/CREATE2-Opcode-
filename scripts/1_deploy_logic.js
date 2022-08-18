const { ethers } = require("hardhat");

async function main(){
  console.log("Deploying FactoryAssembly...");
  const FactoryAssembly = await ethers.getContractFactory("FactoryAssembly");
  const factoryassembly = await FactoryAssembly.deploy();
  await factoryassembly.deployed();
  console.log("Deployed FactoryAssembly Contract at : ",factoryassembly.address);
}

main();