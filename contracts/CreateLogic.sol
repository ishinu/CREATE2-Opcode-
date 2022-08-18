//SPDX-License-Identifier:MIT

pragma solidity ^0.8.9;

import "./Logic.sol";

contract CreateLogic{
    address public logic;

    function deployLogic(address _owner) external returns(bool){
        logic = address(new Logic(_owner));
        return true;
    }
}