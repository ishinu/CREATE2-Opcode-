//SPDX-License-Identifier:MIT

pragma solidity ^0.8.9;

import "./Logic.sol";

contract CreateLogic{
    address public logic;

    function deployLogic() external returns(bool){
        logic = address(new Logic());
        return true;
    }
}