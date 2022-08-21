# CREATE2 Opcode | Contract deployment method.

CREATE2 Opcode is an ability which allows us to pre calculate the address of a contract which is yet to be deployed.

## Terminal Commands for executing this project

`git clone https://github.com/ishinu/CREATE2-Opcode-`
`npm install`
`npx hardhat compile`
`env $(cat .env) npx hardhat run --network ropsten scripts/1_deploy_logic.js`

Here in this project, `1_deploy_logic.js` is a script which takes into account `FactoryAssembly.sol` and `Logic.sol`. First we pre calculate an address by giving an imaginary salt and afterwards send some amount to it.


Then we deploy our `Logic.sol` with the help of `deployContract()`. Initialize the Logic contract with an owner and call `getEth()` to take all Eth back.
Afterwards we call `kill()` to selfdestruct. If you want to again do the same process, feel free.

If you have read about Proxy patterns, this may seem very familiar to the same concept.

```
In our case, FactoryAssembly contract deployed at : 0xD99fCEFA585ae9Be23492Bace3F6Ac0C4AC8B63c
Ropsten public testnet. 
```