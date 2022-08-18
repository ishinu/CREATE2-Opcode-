//SPDX-License-Identifier:MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Create2.sol";
import "./Logic.sol";

contract Create2Logic{
    address public logic;

    function deployLogic(bytes32 _salt, address _owner) external returns(bool){
        logic = Create2.deploy(
            0,
            _salt,
            abi.encodePacked(type(Logic).creationCode,abi.encode(_owner))
        );
        return true;
    }

    function logicAddress(bytes32 _salt, address _owner) public view returns(address){
        return Create2.computeAddress(
            _salt,
            keccak256(
                abi.encodePacked(
                    type(Logic).creationCode,
                    abi.encode(_owner)
                )
            )
        );
    }
}