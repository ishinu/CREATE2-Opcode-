//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "./Logic.sol";

contract FactoryAssembly{
    address payable public deploymentAddress;
    event Deploy(address _addr);
    event Deployed(address _addr, uint salt);

    function getByteCode() public pure returns(bytes memory){
        bytes memory bytecode = type(Logic).creationCode;   
        return abi.encodePacked(bytecode);
    }

    function getAddress(bytes memory bytecode, uint _salt) public{
        bytes32 deploymentAddressHash = keccak256(abi.encodePacked(bytes1(0xff),address(this),_salt,keccak256(bytecode)));
        deploymentAddress =  payable(address(uint160(uint(deploymentAddressHash))));
    }

    function preSendEth() public payable{
        (bool success,) = deploymentAddress.call{value:msg.value}("");
        require(success,"Failed to send Ether.");
    }

    function deployContract(bytes memory bytecode, uint _salt) public{
        address addr;
        assembly {
            addr := create2(
                0,
                add(bytecode,0x20),
                mload(bytecode),
                _salt
            )
            if iszero(extcodesize(addr)){
                revert(0,0)
            }
        }
        emit Deployed(addr,_salt);
    }

    function deploy(uint _salt) external {
        Logic _contract = new Logic{ salt : bytes32(_salt) }();
        emit Deploy(address(_contract));
    }
}