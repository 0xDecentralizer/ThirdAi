// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThirdAI {
    // Define the owner of the contract
    address public owner;

    // Define a struct to hold user information
    struct User {
        uint id;
        string name;
        address wallet;
    }

    // Mapping to store users by their ID
    mapping(uint => User) public users;
    uint public userCount;

    // Event to notify when a new user is added
    event UserAdded(uint id, string name, address wallet);

    constructor() {
        owner = msg.sender;
        userCount = 0;
    }

    // Modifier to restrict access to owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to add a new user
    function addUser(string memory _name, address _wallet) public onlyOwner {
        userCount++;
        users[userCount] = User(userCount, _name, _wallet);
        emit UserAdded(userCount, _name, _wallet);
    }

    // Function to get user details by ID
    function getUser(uint _id) public view returns (User memory) {
        return users[_id];
    }

    // Function to update the owner of the contract
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner address cannot be zero");
        owner = newOwner;
    }
}