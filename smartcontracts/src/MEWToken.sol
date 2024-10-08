//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MEWToken {
  mapping (address => uint256) private balances;
  mapping (address => mapping(address => uint256)) private allowances;

  string public name = "MEW Token";
  string public symbol = "MEW";
  uint8 public decimals = 18;
  uint256 private _totalSupply;

  event Transfer(address indexed from, address indexed to, uint256 value);

  event Approval(address indexed owner, address indexed spender, uint256 value);

  constructor(uint256 initialSupply) {
    _totalSupply = initialSupply * (10 ** uint256(decimals));
    balances[msg.sender] = _totalSupply;
    emit Transfer(address(0), msg.sender, _totalSupply);
  }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address account) public view returns (uint256) {
    return balances[account];
  }

  function transfer(address recipient, uint256 amount) public returns (bool) {
    require(balances[msg.sender] >= amount, "Not enough amount");
    _transfer(msg.sender, recipient, amount);
    return true;
  }

  function approve(address spender, uint256 amount) public returns (bool) {
    allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
  }

  function allowance(address owner, address spender) public view returns (uint256) {
    return allowances[owner][spender];
  }

  function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
    require(balances[sender] >= amount, "Not enough amount");
    require(allowances[sender][msg.sender] >= amount, "Not has enough permission");
    
    _transfer(sender, recipient, amount);
    allowances[sender][msg.sender] -= amount;
    return true;
  }

  function _transfer(address sender, address recipient, uint256 amount) internal {
    require(sender != address(0), "Sender address invalid");
    require(recipient != address(0), "Recipient address invalid");

    balances[sender] -= amount;
    balances[recipient] += amount;
    emit Transfer(sender, recipient, amount);
  }
}