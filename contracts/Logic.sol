// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract Logic is Initializable{
    address payable public owner;

    function initialize(address payable _owner) initializer public payable{
        owner = _owner;
    }

    function getEth() public{
        require(payable(msg.sender)==owner);
        owner.transfer(address(this).balance);
    }

}