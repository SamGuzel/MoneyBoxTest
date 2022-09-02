//
//  File.swift
//  
//
//  Created by Sam Guzel on 01/09/2022.
//

import Foundation

public class StubDataWorkAround {
	
	let data = JSONEncoder().encode([
		
		"User": {
			"UserId": "23723e1b-6c6d-4c14-8d06-da3e770e4097",
			"HasVerifiedEmail": true,
			"IsPinSet": true,
			"AmlStatus": "Clear",
			"AmlAttempts": 1,
			"RoundUpMode": "Off",
			"JisaRoundUpMode": "Off",
			"InvestorProduct": "",
			"RegistrationStatus": "IsComplete",
			"JisaRegistrationStatus": "None",
			"DirectDebitMandateStatus": "Active",
			"DateCreated": "2022-05-30T10:24:41.443",
			"Animal": "",
			"ReferralCode": "6FA2TW",
			"IntercomHmac": "c3b106692e2e99deda3bfc78955456ec6a12e6e94db9b3de06229cce86a2cd81",
			"IntercomHmaciOS": "c3b106692e2e99deda3bfc78955456ec6a12e6e94db9b3de06229cce86a2cd81",
			"IntercomHmacAndroid": "ee0ef3b549c315dd1aa7707f229790b5dc82cec528af4533b8753a5901417c79",
			"HasCompletedTutorial": false,
			"LastPayment": 0.0,
			"PreviousMoneyboxAmount": 0.00,
			"MoneyboxRegistrationStatus": "IsComplete",
			"Email": "test+ios2@moneyboxapp.com",
			"FirstName": "Peter",
			"LastName": "King",
			"MobileNumber": "07378452349",
			"RoundUpWholePounds": true,
			"DoubleRoundUps": false,
			"MoneyboxAmount": 0.00,
			"InvestmentTotal": 0.0,
			"CanReinstateMandate": false,
			"DirectDebitHasBeenSubmitted": true,
			"MonthlyBoostEnabled": true,
			"MonthlyBoostAmount": 150.00,
			"MonthlyBoostDay": 1,
			"MonthlyBoostInvestorProductId": 63429,
			"RestrictedDevice": true,
			"EmailTwoFactorEnabled": false,
			"Cohort": 90
		},
		"Session": {
			"BearerToken": "t67lvYdDEB6+Qu4wXEq6nGbQGgm6fkNxFF1nao3EKPA=",
			"ExternalSessionId": "9106794e-3471-4e5e-afac-e62a730c52fe",
			"SessionExternalId": "9106794e-3471-4e5e-afac-e62a730c52fe",
			"ExpiryInSeconds": 0
		},
		"ActionMessage": {
			"Type": "Deposit",
			"Message": "Little and often is the best way to save. \r\nAdd a little extra to your Moneybox.",
			"Actions": [
				{
					"Label": "Add £2",
					"Amount": 2.0,
					"Type": "Deposit",
					"Animation": "None"
				},
				{
					"Label": "Add £5",
					"Amount": 5.0,
					"Type": "Deposit",
					"Animation": "None"
				},
				{
					"Label": "Add £10",
					"Amount": 10.0,
					"Type": "Deposit",
					"Animation": "None"
				}
			]
		},
		"InformationMessage": "6 days until collection"
	])
	
	init() {
		
	}
}
