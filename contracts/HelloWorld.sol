// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title HelloWorld
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract HelloWorld {

    string public message;
    address owner;

    // Events
    event NewMessage(string message);

    // Modifiers
    modifier isOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    
        modifier motOwner() {
        require(msg.sender != owner, "Everyone can call this function expect the owner");
        _;
    }
    constructor() {
        // set the owner as the user who created the contract
        owner = msg.sender;
    }

    function updateMessage(string calldata _msg) public isOwner {
        message = _msg;
        emit NewMessage(message);
    }


}