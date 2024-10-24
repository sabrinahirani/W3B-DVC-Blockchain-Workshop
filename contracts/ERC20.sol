// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A simple implementation of the ERC20 token standard.
// This implementation is for demonstration/educational purposes only.

contract ERC20 {

    // --- global variables ---

    string public name = "ExampleToken";
    string public symbol = "EXT";
    uint8 public decimals = 18;

    uint256 public totalSupply;
    
    mapping(address => uint256) public balanceOf; // balanceOf[0x043453405...] = 67 
    mapping(address => mapping(address => uint256)) public allowance; // allowance[0x043453405...][0x034453..] = 2

    // --- events ---
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // --- functions ---
    
    // constructor
    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient Balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool success) {

        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(balanceOf[from] >= value, "Insufficient Balance");
        require(allowance[from][msg.sender] >= value, "Allowance Exceeded");

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        
        return true;
    }
}
