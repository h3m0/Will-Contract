from brownie import Will, config, network, accounts
from scripts.helpful import get_account

def deploy():
	account = get_account()
	Will.deploy(accounts.add(), accounts.add(), {"from": account})	

def main():
	deploy()