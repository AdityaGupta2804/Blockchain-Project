//An Contract where only sender can sent message and every other can read it.

// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.15;
contract TheBlockchainMessenger{
    uint public changeCounter; // Stores count of message change.
    address public owner;

    constructor(){  
        owner = msg.sender;
    }
    string public Message;

    function setMessage(string memory _newMessage) public{
        if(msg.sender ==  owner){
            Message = _newMessage;
            changeCounter++;
        }
    }
}