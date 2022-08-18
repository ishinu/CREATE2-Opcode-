//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "./Logic.sol";

contract FactoryAssembly{
    address payable public deploymentAddress;
    event Deployed(address addr, uint salt);

    function getByteCode() public pure returns(bytes memory){
        bytes memory bytecode = type(Logic).creationCode;
        return abi.encodePacked(bytecode);
    }

    function getAddress(bytes memory bytecode, uint _salt) public{
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff),address(this),_salt,keccak256(bytecode)));
        deploymentAddress =  payable(address(uint160(uint(hash))));
    }

    function preSendEth() public payable{
        (bool success,) = deploymentAddress.call{value:msg.value}("");
        require(success,"Failed to send Ether.");
    }

    function deployContract(bytes memory bytecode, uint _salt) public payable{
        address addr;
        assembly {
            addr := create2(
                callvalue(),
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
}
