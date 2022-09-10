from brownie import Will, accounts, config, network
from web3 import Web3



def get_account(id=None):
	if id == "real":
		return accounts.load("rinkebyacct")
	if id == "dev":
		return accounts[0]
	else:
		return config["wallets"]["from_key"]

