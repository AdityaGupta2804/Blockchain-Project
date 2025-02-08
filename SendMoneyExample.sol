// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SendMoneyExample{

    uint public balanceRecived;
    address public owner;

    // 🔹 Constructor runs only once when the contract is deployed
    constructor() {
        owner = msg.sender; // Set contract deployer as the owner
    }

    // 🔹 Modifier to restrict access to only the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function deposit() public payable {
        balanceRecived += msg.value;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawAll() public{
        address payable to = payable (msg.sender);
        to.transfer(getContractBalance());
    }

    function withdrawToAddress(address payable to) public{
        to.transfer(getContractBalance());
    }
}
