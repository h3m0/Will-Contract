from brownie import Will, network, config, accounts
from scripts.helpful import get_account


def activate():
	account = get_account("dev")
	will = Will[-1]
	print("Funding children...")
	will.declareDead({"from": account})
	print("Done!")

def main():
	activate()