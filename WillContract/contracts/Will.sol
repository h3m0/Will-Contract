// SPDX-License-Identifier
pragma solidity ^0.8.7;

contract Will{

	address payable public owner;
	address payable public Child1;
	uint public count;
	address payable public Child2;
	bool public isPaid;
	uint256 public c1b;
	uint256 public c2b;
	uint256 public amountToSendToEachChild = (address(this).balance) / 2;
	State public parentState;
	address payable[2] public children = [Child1, Child2];

	modifier onlyOwner{
		require(msg.sender  == owner, "You are not the owner!!");
		_;
	}

	enum State{
		Alive,
		Dead
	}

	constructor(address payable _c1, address payable _c2){
		owner = payable(msg.sender);
		parentState = State.Alive;
		Child1 = payable(_c1);
		Child2 = payable(_c2);
	}

	function declareDead() public {
		require(count < 2);
		require(parentState == State.Alive);
		parentState = State.Dead;
		transferEth();
		count++;
	}

	function transferEth() payable public onlyOwner {
		require(parentState == State.Dead && isPaid != true, "Error");
		children[0].transfer(amountToSendToEachChild);
		children[1].transfer(amountToSendToEachChild);
		uint256 currentBalance = address(this).balance;
		if(currentBalance > 0){
			children[0].transfer(currentBalance);
		}else{
			isPaid == true;
		}
	}
	function revealBalance1() public returns(uint){
	 c1b = children[0].balance;
	 return c1b;
	 // uint public c2b = children[1].balance;
	}

	function revealBalance2() public returns(uint){
	 // uint public c1b = children[0].balance;
	 c2b = children[1].balance;
	 return c2b;
	}
}
