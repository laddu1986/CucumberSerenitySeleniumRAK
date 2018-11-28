Feature: Send Money - AccountTransfer

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
|Cash_Payout_007|
|Cash_Payout_008|
|Cash_Payout_009|
|Cash_Payout_010|
|Cash_Payout_011|
|Cash_Payout_012|
|Cash_Payout_019|
|Cash_Payout_020|
|Cash_Payout_021|
|Cash_Payout_022|
|Cash_Payout_023|
|Cash_Payout_024|
|Cash_Payout_025|
|Cash_Payout_026|
|Cash_Payout_027|
|Cash_Payout_028|
|Cash_Payout_029|
|Cash_Payout_030|
|Cash_Payout_037|
|Cash_Payout_038|
|Cash_Payout_039|
|Cash_Payout_040|
|Cash_Payout_041|
|Cash_Payout_042|
|Cash_Payout_049|
|Cash_Payout_050|
|Cash_Payout_051|
|Cash_Payout_052|
|Cash_Payout_053|
|Cash_Payout_054|
|Cash_Payout_067|
|Cash_Payout_068|
|Cash_Payout_069|
|Cash_Payout_070|
|Cash_Payout_071|
|Cash_Payout_072|
|Cash_Payout_073|
|Cash_Payout_074|
|Cash_Payout_075|
|Cash_Payout_076|
|Cash_Payout_077|
|Cash_Payout_078|
|Cash_Payout_097|
|Cash_Payout_098|
|Cash_Payout_099|
|Cash_Payout_100|
|Cash_Payout_101|
|Cash_Payout_102|
|Cash_Payout_103|
|Cash_Payout_104|
|Cash_Payout_105|
|Cash_Payout_106|
|Cash_Payout_107|
|Cash_Payout_108|
		
		
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
|Account_Transfer_005|
|Account_Transfer_006|
|Account_Transfer_007|
|Account_Transfer_008|
|Account_Transfer_013|
|Account_Transfer_014|
|Account_Transfer_015|
|Account_Transfer_016|
|Account_Transfer_017|
|Account_Transfer_018|
|Account_Transfer_019|
|Account_Transfer_020|
|Account_Transfer_025|
|Account_Transfer_026|
|Account_Transfer_027|
|Account_Transfer_028|
|Account_Transfer_033|
|Account_Transfer_034|
|Account_Transfer_035|
|Account_Transfer_036|
|Account_Transfer_045|
|Account_Transfer_046|
|Account_Transfer_047|
|Account_Transfer_048|
|Account_Transfer_049|
|Account_Transfer_050|
|Account_Transfer_051|
|Account_Transfer_052|
|Account_Transfer_065|
|Account_Transfer_066|
|Account_Transfer_067|
|Account_Transfer_068|
|Account_Transfer_069|
|Account_Transfer_070|
|Account_Transfer_071|
|Account_Transfer_072|


