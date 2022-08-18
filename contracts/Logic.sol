// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Logic{
    address payable public owner;

    constructor(address _owner){
        owner = payable(_owner);
    }

    function getEth() public{
        require(payable(msg.sender)==owner);
        owner.transfer(address(this).balance);
    }

}