// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Errors {
    address owner;

    error Unauthorized(address);

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: You are not a owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}

contract ErrorsOptimized {
    address owner;

    error Unauthorized(address);

    modifier onlyOwner() {
         if (msg.sender != owner) revert Unauthorized(msg.sender);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}
