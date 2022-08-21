const { ethers } = require("hardhat");

async function main(){
  console.log("Deploying CreateLogic...");
  const CreateLogic = await ethers.getContractFactory("CreateLogic");
  const createlogic = await CreateLogic.deploy();
  await createlogic.deployed();
  console.log("Deployed CreateLogic Contract at : ",createlogic.address);

  console.log("Deploying Create2Logic...");
  const Create2Logic = await ethers.getContractFactory("Create2Logic");
  const create2logic = await Create2Logic.deploy();
  await create2logic.deployed();
  console.log("Deployed Create2Logic Contract at : ",create2logic.address);
}

main();