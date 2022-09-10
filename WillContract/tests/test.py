from brownie import Will, accounts, network, config
from scripts.helpful import get_account
from scripts.deploy import deploy
from scripts.interact import activate


def test_paid():
	# arrange
	deploy()	
	# act
	activate()
	# assert
	expected_balance = 0
	assert Will[-1].revealbalance1({"from": account}) > 0
	assert Will[-1].revealbalance2({"from": account}) > 0


def main():
	test_paid()
