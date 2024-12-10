//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract TodoRoles {
    mapping(address => bool) public admins;
    mapping(address => bool) public users;

    //if you have code that you will use over and over again youll need to use a modifire. helps with RBAC
    //msg.sender is a variable (key word) that stores the address interacting with the smart contract
    modifier onlyAdmin() {
        require(admins[msg.sender], "Not an admin");
        _;
    }

    modifier onlyUser() {
        require(users[msg.sender] || admins[msg.sender], "Not a user");
        _;
    }

    // constructors set important information when you want to deploy your contract
    constructor() {
        admins[msg.sender] = true;
    }

    function addAdmin(address _admin) public onlyAdmin() {
        admins[_admin] = true;
    }

    function addUser(address _user) public onlyAdmin() {
        users[_user] = true;
    }

    function removeUser(address _user) public onlyAdmin() {
        users[_user] = false;
    }

}
