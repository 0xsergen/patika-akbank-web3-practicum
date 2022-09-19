// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector { 
    address public owner; // owner of the contract
    uint256 public balance; // balance of the contract

    constructor() {
        owner = msg.sender;
    }

    function withdraw(uint256 amount, address payable _to) public {
        require(msg.sender == owner, "Not owner");
        require(amount <= balance, "Insufficient balance");
        balance -= amount; // balance is reduced by amount of withdraw
        _to.transfer(amount); // ETH is sent to the address.
    }

    receive() payable external {
        balance += msg.value;
    }
    fallback() payable external {
        balance += msg.value; // if sending eth tx has some data, fallback is triggered.
    }
}
