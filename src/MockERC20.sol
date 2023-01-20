pragma solidity ^0.8.0;

contract MockERC20 {
	string public constant name = 'ERC20Mock';
	string public constant symbol = 'ERC20Mock';
	uint8 public constant decimals = 18;

	event Transfer(address indexed from, address indexed to, uint amount);

	mapping (address => uint256) balances;

	uint256 internal _totalSupply;

	constructor(uint256 _initSupply) public {
		_totalSupply = _initSupply;
		balances[msg.sender] = _initSupply; 
	} 

	function totalSupply() public view returns (uint256) {
		return _totalSupply;
	}

	function balanceOf(address owner) public view returns (uint256) {
		return balances[owner];
	}

	function transfer(address to, uint256 amount) public returns (bool) {
		balances[msg.sender] = balances[msg.sender] - amount;
		balances[to] = balances[to] + amount;
		return true;
	}

}