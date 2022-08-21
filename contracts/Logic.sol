// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract Logic is Initializable{
    address payable public owner;

    function initialize(address _owner) public initializer{
        owner = payable(_owner);
    }

    function getEth() public{
        require(payable(msg.sender)==owner);
        owner.transfer(address(this).balance);
    }

    function kill() public {
        require(payable(msg.sender)==owner);
        selfdestruct(owner);
    }
}