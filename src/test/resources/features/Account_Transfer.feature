Feature: Send Money - Account Transfer

@CashPayout
Scenario Outline: Send Money through Cash Payout Option
	
Given <DataBinding> Customer launches Login screen
When User selects cash transfer option
And User selects the Remittance Currency
#And User enters the Remittance amount
And User enters the Transfer amount
And User clicks on Next button
And Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on Next button in login screen
Then User should see Recipient page
When User enters Firstname
And User enters Lastname
And User enters Middlename
And User enters Nickname
And User selects the purpose of payment
#And User selects the reason for payment
And User clicks on Next button in transaction
Then User should see the instant payment screen
When User selects the payment option
Then User should see the OTP screen
#When User enters the OTP 
When User click on confirm Button
Then User should see transaction successful message	
#And Customer should be able to logout of the application
Examples: 
|DataBinding|
|Cash_Payout_001|
|Cash_Payout_002|
|Cash_Payout_003|
|Cash_Payout_004|
|Cash_Payout_005|
|Cash_Payout_006|
|Cash_Payout_013|
|Cash_Payout_014|
|Cash_Payout_015|
|Cash_Payout_016|
|Cash_Payout_017|
|Cash_Payout_018|
|Cash_Payout_031|
|Cash_Payout_032|
|Cash_Payout_033|
|Cash_Payout_034|
|Cash_Payout_035|
|Cash_Payout_036|
|Cash_Payout_043|
|Cash_Payout_044|
|Cash_Payout_045|
|Cash_Payout_046|
|Cash_Payout_047|
|Cash_Payout_048|
|Cash_Payout_055|
|Cash_Payout_056|
|Cash_Payout_057|
|Cash_Payout_058|
|Cash_Payout_059|
|Cash_Payout_060|
|Cash_Payout_061|
|Cash_Payout_062|
|Cash_Payout_063|
|Cash_Payout_064|
|Cash_Payout_065|
|Cash_Payout_066|
|Cash_Payout_079|
|Cash_Payout_080|
|Cash_Payout_081|
|Cash_Payout_082|
|Cash_Payout_083|
|Cash_Payout_084|
|Cash_Payout_085|
|Cash_Payout_086|
|Cash_Payout_087|
|Cash_Payout_088|
|Cash_Payout_089|
|Cash_Payout_090|
|Cash_Payout_091|
|Cash_Payout_092|
|Cash_Payout_093|
|Cash_Payout_094|
|Cash_Payout_095|
|Cash_Payout_096|



@AccountTransfer
Scenario Outline: Send Money through Account Transfer Option
   		
Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
#And User enters the Remittance amount
And User enters the Transfer amount
And User clicks on Next button
And Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
#When User clicks on profile Icon
#Then User should see the Transfer history 
#When User clicks on Transfer history
#Then User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page
When User clicks on Next button in login screen
Then User should see Recipient page
When User enters Firstname
And User enters Lastname
And User enters Middlename
And User enters Nickname
And User enters BankName
And User enters AccountNumber
And User selects the purpose of payment
#And User selects the reason for payment
And User clicks on Next button in transaction
Then User should see the instant payment screen
When User selects the payment option
Then User should see the OTP screen
#When User enters the OTP
When User click on confirm Button
Then User should see transaction successful message	
#And Customer should be able to logout of the application
Examples: 
|DataBinding|
|Account_Transfer_001|
|Account_Transfer_002|
|Account_Transfer_003|
|Account_Transfer_004|
|Account_Transfer_009|
|Account_Transfer_010|
|Account_Transfer_011|
|Account_Transfer_012|
|Account_Transfer_021|
|Account_Transfer_022|
|Account_Transfer_023|
|Account_Transfer_024|
|Account_Transfer_029|
|Account_Transfer_030|
|Account_Transfer_031|
|Account_Transfer_032|
|Account_Transfer_037|
|Account_Transfer_038|
|Account_Transfer_039|
|Account_Transfer_040|
|Account_Transfer_041|
|Account_Transfer_042|
|Account_Transfer_043|
|Account_Transfer_044|
|Account_Transfer_053|
|Account_Transfer_054|
|Account_Transfer_055|
|Account_Transfer_056|
|Account_Transfer_057|
|Account_Transfer_058|
|Account_Transfer_059|
|Account_Transfer_060|
|Account_Transfer_061|
|Account_Transfer_062|
|Account_Transfer_063|
|Account_Transfer_064|


