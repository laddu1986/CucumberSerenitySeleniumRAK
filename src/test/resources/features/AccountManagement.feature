Feature: Account and User Management

@AccountManagement123
Scenario Outline: AID_030_001 - As a Bank I should display the RMT Account's Available balance to the Customer so that he know how much fund exisitng in the Account

System should display the account balance under 'Account Balance & Info' section.
System should display currency along with the amount under the 'Available balance' section.
System should display the 'Available balance' value along with the 2 decimal values.

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary 
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Then User should see the currency along with the amount under the 'Available balance' section
And User should see the 'Available balance' value along with the 2 decimal values
Examples: 
|Databinding|
|AID_030_001_001|



@AccountManagement123
Scenario Outline: AID_030_001 - As a Bank I should display the RMT Account's Available balance to the Customer so that he know how much fund exisitng in the Account
                   The 'Available balance' value displayed in the RMT  app should match the value available in Core system(NA)
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
Then User should see Beneficiaries page
Examples: 
|Databinding|
|AID_030_001_002|



@AccountManagement123
Scenario Outline: AID_027_0014 - As a Customer I should allow only certain type/conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)
System should display the onscreen <message> to user asking them to Forgor UserID through digital Banking application if the users credentials are disabled by admin
System should display an error Message <content> to user when trying to enable RMT app if the User credentials are disabled by admin

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see the valid error <message> to User
Examples: 
|Databinding|
|AID_027_0014_001|


@AccountManagement123
Scenario Outline: AID_027_010 - As a Customer I should allow only certain type/conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)

System should display the onscreen <message> to user asking them to Forgot UserID through digital Banking application if the users credentials are disabled by admin
System should display an error Message <content> to user when trying to enable RMT app if the User credentials are disabled by admin

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see the valid error <message> to User
Examples:
|Databinding|
|AID_027_010_001|


@AccountManagement123
Scenario Outline: AID_027_005 - As a Customer I should allow only certain type/conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)

System should display the onscreen <message> to user asking them to Enable User ID through digital Banking application if the users credentials are disabled by admin
System should display an error Message <content> to user when trying to enable RMT app if the User credentials are disabled by admin

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see the valid error <message> to User

Examples:
|Databinding|
|AID_027_005_001|


@AccountManagement123
Scenario Outline: AID_030_006 - As a Customer I should be able to view the transaction details so that I will be informed on the Transaction details
   
  1. System should navigate to Transaction section on clicking 'Transaction' tab under 'Acount info' section.
  2. System should display below mentioned section under transaction tab,- Show All- Show Credit- Show Debit- Date Filter (UI will be provided later)
  3. System should display the Description of the credit transaction under 'Show all' tab
  4. System should display the Description of the Debit transaction under 'Show all' tab
  5. System should display below mentioned fields under Show all section,- Description of the credit transaction- Description of the Debit transaction- Narration Line 1- Narration Line 2- Amount- Currency- Transaction Date- Transaction type (Debit/Credit)
  6. System should display below mentioned fields under Show Debit section,- Description of the Debit transaction- Narration Line 
                1- Narration Line 
2- Amount- Currency- Transaction Date- Transaction type (Debit/Credit)
  7. System should display below mentioned fields under Show Credit section,- Description of the credit transaction- Narration Line 1- Narration Line 2- Amount- Currency- Transaction Date- Transaction type (Debit/Credit)
  10. System should only display the 'Credit transaction' under 'Show Credit' tab11. System should only display the 'Debit transaction' under 'Show Debit' tab
  12.Transaction sorting should follow as is DB Behavior
  13.All the transaction including the RMT tranaction which are initiated through DB RAKMoney should be available

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount
Then user should see the exchange rate for the selected currency
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Then User should see the currency along with the amount under the 'Available balance' section
And The 'Available balance' value displayed in the RMT app should match the value available in Core system
And User should see the 'Available balance' value along with the 2 decimal values
When User clicks on Latest transactions
And User clicks on see Full History
Then User should see tabs Show All,Show Dedits and Show Credits
And User should see the date filter Icon on the right corner
And User should see Description of the credit transaction under 'Show all' tab
And User should see Description of the Debit transaction under 'Show all' tab
#And User should see the fields Description of the credit transaction,Description of the Debit transaction,Narration Line 1,Narration Line 2,Amount,Currency, Transaction Date,Transaction type (Debit/Credit) under Show all section
#And User should see fields under Show Debit section,Description of the Debit transaction,Narration Line-1,Narration Line 2,Amount,Currency,Transaction Date,Transaction type (Debit/Credit)
#And User should see fields under Show Credit section,Description of the Debit transaction,Narration Line-1,Narration Line 2,Amount,Currency,Transaction Date,Transaction type (Debit/Credit)
Examples:
|Databinding|
|AID_030_006_001|



@AccountManagement123
Scenario Outline:  AID_027_001 - As a Customer I should be able to reset /enable my locked RMT Userso that I ccan continue with RMTtransactions

System should display the "Problem Logging in " option in login screen
System should navigate to "Recover Credentials" section on clicking " Problem logging in " option in login screen
System should display below radio buttons in "Select what you would like to recover" section
System should allow the User to select "Unlock My UserID" radio button
System should display the "Continue " button in recover Credentials section
System should navigate to "Unlock My User ID " screen on clicking " Continue " button in "Recover Crendentials"

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
And User clicks on Next button
Then User should see the Login screen to enter Credentials
And User should see Problem Logging in link
When User clicks on Problem Logging in link
Then User should be navigated to 'Recover Credentials' section
And User should see the radio buttons 'I have Forgot my password','I have Forgot my User ID','Mu User ID is blocked' in 'Select what you would like to recover' section
When User selects 'My User ID is blocked' radio button
Then User should be able to click Proceed button
When User clicks Proceed button
Then User should navigate to 'Enable User ID' screen
Examples: 
|Databinding|
|AID_027_001_001|


@AccountManagement123
Scenario Outline:  AID_027_0011 - As a Customer I should be able to reset /enable my locked RMT Userso that I ccan continue with RMTtransactions

System should display the "Problem Logging in " option in login screen
System should navigate to "Recover Credentials" section on clicking " Problem logging in " option in login screen
System should display below radio buttons in "Select what you would like to recover" section
System should allow the User to select "I have Forgot my User ID" radio button
System should display the "Continue " button in recover Credentials section
System should navigate to "Unlock My User ID " screen on clicking " Continue " button in "Recover Crendentials"

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
And User clicks on Next button
Then User should see the Login screen to enter Credentials
And User should see Problem Logging in link
When User clicks on Problem Logging in link
Then User should be navigated to 'Recover Credentials' section
And User should see the radio buttons 'I have Forgot my password','I have Forgot my User ID','Mu User ID is blocked' in 'Select what you would like to recover' section
When User selects 'Forgot User ID' radio button
Then User should be able to click Proceed button
When User clicks Proceed button
Then User should navigate to 'Forgot User ID' screen
Examples:
|Databinding|
|AID_027_0011_001|


@AccountManagement123
Scenario Outline:  AID_030_006 - As a Customer I should be able to view the transaction details so that I will be informed on the Transaction details
				   
				   12.Transaction sorting should follow as is DB Behavior
				  
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Then User should see the currency along with the amount under the 'Available balance' section
And The 'Available balance' value displayed in the RMT  app should match the value available in Core system
And User should see the 'Available balance' value along with the 2 decimal values
When User clicks on Latest transactions
And User clicks on see Full History
Then User should see tabs Show All,Show Dedits and Show Credits  
And User should see the date filter Icon on the right corner
And User should see Description of the credit transaction under 'Show all' tab
And User should see Description of the Debit transaction under 'Show all' tab
#And User should see the fields Description of the credit transaction,Description of the Debit transaction,Narration Line 1,Narration Line 2,Amount,Currency, Transaction Date,Transaction type (Debit/Credit) under Show all section
#And User should see fields under Show Debit section,Description of the Debit transaction,Narration Line-1,Narration Line 2,Amount,Currency,Transaction Date,Transaction type (Debit/Credit)
#And User should see fields under Show Credit section,Description of the Debit transaction,Narration Line-1,Narration Line 2,Amount,Currency,Transaction Date,Transaction type (Debit/Credit)
#And User should Transaction sorting should follow as is DB Behavior
Examples: 
|Databinding|
|AID_030_006_002|


@AccountManagement123
Scenario Outline:  AID_030_006 - As a Customer I should be able to view the transaction details so that I will be informed on the Transaction details
				      13.All the transaction including the RMT tranaction which are initiated through DB RAKMoney should be available
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Then User should see the currency along with the amount under the 'Available balance' section
And The 'Available balance' value displayed in the RMT  app should match the value available in Core system
And User should see the 'Available balance' value along with the 2 decimal values
When User clicks on Latest transactions
And User clicks on see Full History
Then User should see tabs Show All,Show Dedits and Show Credits  
And User should see the date filter Icon on the right corner
And User should see Description of the credit transaction under 'Show all' tab
And User should see Description of the Debit transaction under 'Show all' tab
#And User should see the fields Description of the credit transaction,Description of the Debit transaction,Narration Line 1,Narration Line 2,Amount,Currency, Transaction Date,Transaction type (Debit/Credit) under Show all section
#And User should see fields under Show Debit section,Description of the Debit transaction,Narration Line-1,Narration Line 2,Amount,Currency,Transaction Date,Transaction type (Debit/Credit)
#And User should see fields under Show Credit section,Description of the Debit transaction,Narration Line-1,Narration Line 2,Amount,Currency,Transaction Date,Transaction type (Debit/Credit)
#And User should see All the transactions including the RMT tranaction which are initiated through DB RAKMoney should be available
Examples: 
|Databinding|
|AID_030_006_003|



@AccountManagement123
Scenario Outline: AID_030_010 -     As a Customer I want to view count and list of beneficiaries on the Manage Beneficiaries screen so that I can manage the list  of  beneficiaries
                                1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
                                2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
                                3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
                                4. System should display below mentioned tab under Beneficiaries section,- bank- cash
                                5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
                                6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
                                7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
                                8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
                                9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
                                11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
                                12. Alerts if applicable should be generated on each action like delete etc

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on delete icon
Then User should be able to delete the beneficiary successfully on clicking delete icon
And User should see the decrease in the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab
Examples:
|Databinding|
|AID_030_010_001|



@AccountManagement123
Scenario Outline: AID_030_010 -     As a Customer I want to view count and list of beneficiaries on the Manage Beneficiaries screen so that I can manage the list  of  beneficiaries
                                10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
                      
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
#When User clicks on delete icon under 'Bank' tab
#Then User should see an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
When User selects the beneficiary to perform remittance transaction
Then User performs remittance transaction to the beneficiary
Examples: 
|Databinding|
|AID_030_010_002|



@AccountManagement123
Scenario Outline: AID_030_010 -     As a Customer I want to view count and list of beneficiaries on the Manage Beneficiaries screen so that I can manage the list  of  beneficiaries
                                
                                12. Alerts if applicable should be generated on each action like delete etc

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
#When User clicks on delete icon under 'Bank' tab
#Then User should see an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
#And an alert is generated to registered mobile number and email id
When User selects the beneficiary to perform remittance transaction
Then User performs remittance transaction to the beneficiary
#And an alert is generated to registered mobile number and email id

Examples: 
|Databinding|
|AID_030_010_003|



@AccountManagement123
Scenario Outline: AID_030_012 -     As a customer I should be able to delete the beneficiary from the list of beneficiaries page so that I can manage my beneficiary list                                
                               1. Verify whether the user should have an option to Delete the beneficiary  
							   2. Verify if the user received alert on Delete beneficiary

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on delete icon
Then User should be able to delete the beneficiary successfully on clicking delete icon
#And an alert is generated to registered mobile number and email id
Examples: 
|Databinding|
|AID_030_012_001|


@AccountManagement123
Scenario Outline: AID_030_013 -     As a customer I should be able to delete the beneficiary from the list of beneficiaries page so that I can manage my beneficiary list                                
                               1. Verify whether the user should have an option to Delete the beneficiary  
							   2. Verify if the user received alert on Delete beneficiary

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on delete icon
Then User should be able to delete the beneficiary successfully on clicking delete icon
#And an alert is generated to registered mobile number and email id
Examples: 
|Databinding|
|AID_030_013_001|



@AccountManagement123
Scenario Outline: AID_030_008-     As a customer I should be able to view the transaction details by clicking on the Ref in the transfer history so that I can   review the transaction details
             
                              1. The transfer history should be listed with the following fields / Column - Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status
  2. The complete details of the Transaction should be listed
 
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount
Then user should see the exchange rate for the selected currency
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User clicks on Transfer history
Then User should see the Transfer history
And User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page
Examples:
|Databinding|
|AID_030_008_001|
 
@AccountManagement123
Scenario Outline: AID_030_009 -     As a Existing DB customer access the RMT app , the transfer history should display the RMT tranaction which are initiated through DB in RMT app and vice versa
 
                              1. The user should be able to view the Transfer history which should contain RMT transaction from both DB and RMT app
                              2. Similarly in the DB account transfer history, the transaction performed in the RMT app should also be listed"
 
 
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount
Then user should see the exchange rate for the selected currency
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User clicks on Transfer history
Then User should see the Transfer history
And User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page
Examples:
|Databinding|
|AID_030_009_001|



@AccountManagement123
Scenario Outline: AID_030_011 -     As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed on the Manage beneficiaries page so that I can reuse the beneficiary information

                             All the below validations should be done for the beneficiaries available in the DB
							 1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
							 2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 4. System should display below mentioned tab under Beneficiaries section,- bank- cash
							 5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
							 7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
							 8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
							 9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
							 10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
							 11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
							 12. Alerts if applicable should be generated on each action like delete etc
							 13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated once the same is selected
							 14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
							 18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab
							 19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
							 20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
							 21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
							 22. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.


Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on delete icon
Then User should be able to delete the beneficiary successfully on clicking delete icon
#And an alert is generated to registered mobile number and email id
#When User selects the beneficiary under 'Bank' tab to perform remittance transaction
#Then User performs remittance transaction to the beneficiary
#And an alert is generated to registered mobile number and email id
Examples: 
|Databinding|
|AID_030_011_001|


@AccountManagement123
Scenario Outline: AID_030_011 -     As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed on the Manage beneficiaries page so that I can reuse the beneficiary information

                             All the below validations should be done for the beneficiaries available in the DB
							 1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
							 2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 4. System should display below mentioned tab under Beneficiaries section,- bank- cash
							 5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
							 7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
							 8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
							 9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
							 10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
							 11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
							 12. Alerts if applicable should be generated on each action like delete etc
							 13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated once the same is selected
							 14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
							 18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab
							 19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
							 20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
							 21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
							 22. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.


Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
#When User clicks on delete icon under 'Bank' tab
#Then User should be able to delete the beneficiary successfully on clicking delete icon under 'Bank' tab
#And an alert is generated to registered mobile number and email id
When User selects the beneficiary to perform remittance transaction
Then User performs remittance transaction to the beneficiary
#And an alert is generated to registered mobile number and email id
Examples: 
|Databinding|
|AID_030_011_002|



@AccountManagement123
Scenario Outline: AID_030_011 -     As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed on the Manage beneficiaries page so that I can reuse the beneficiary information

                             All the below validations should be done for the beneficiaries available in the DB
							 1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
							 2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 4. System should display below mentioned tab under Beneficiaries section,- bank- cash
							 5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
							 7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
							 8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
							 9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
							 10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
							 11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
							 12. Alerts if applicable should be generated on each action like delete etc
							 13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated once the same is selected
							 14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
							 18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab
							 19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
							 20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
							 21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
							 22. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.


Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Cash tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on delete icon
Then User should be able to delete the beneficiary successfully on clicking delete icon
#And an alert is generated to registered mobile number and email id
#When User selects the beneficiary under 'Bank' tab to perform remittance transaction
#Then User performs remittance transaction to the beneficiary
#And an alert is generated to registered mobile number and email id
Examples: 
|Databinding|
|AID_030_011_003|



@AccountManagement123
Scenario Outline: AID_030_011 -     As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed on the Manage beneficiaries page so that I can reuse the beneficiary information
                             All the below validations should be done for the beneficiaries available in the DB
							 1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
							 2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 4. System should display below mentioned tab under Beneficiaries section,- bank- cash
							 5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
							 7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
							 8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
							 9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
							 10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
							 11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
							 12. Alerts if applicable should be generated on each action like delete etc
							 13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated once the same is selected
							 14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
							 15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
							 16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
							 17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
							 18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab
							 19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
							 20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
							 21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
							 22. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.


Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Cash tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
#When User clicks on delete icon under 'Bank' tab
#Then User should be able to delete the beneficiary successfully on clicking delete icon under 'Bank' tab
#And an alert is generated to registered mobile number and email id
When User selects the beneficiary to perform remittance transaction
Then User performs remittance transaction to the beneficiary
#And an alert is generated to registered mobile number and email id
Examples: 
|Databinding|
|AID_030_011_004|



@AccountManagement123
Scenario Outline: AID_027_007 -  As a Bank I should be able to authenticate the customer through EID Scan, Facial & OTP in the Forgot Password flow so that customer authentication is complete 

1. System should allow user to enter the registered mobile number in 'Please enter your registered mobile number' field in Forgot password Screen.
2. System should allow user to enter the Emirates ID number in ""784-XXXX-XXXXXXX-3"" format
3. System should display an error message <Content> if the Emirates ID entered is not matching with the Details provided earlier.

Given <Databinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
And User clicks on Problem Logging in link
Then User should be navigated to 'Recover Credentials' section
When User selects 'Forgot User ID' radio button
And User clicks Proceed button
Then User should navigate to 'Forgot User ID' screen 
And User should see 'Enter Emirates ID number' and 'Enter your registered mobile number' fields
When User enters the registered mobile number in 'Enter your registered mobile number' field in Forgot password Screen
And User enters Emirates ID <emiratesID>
And User clicks Proceed button in Recover Credentials Screen
Then User should see an error message <errorMessage>
Examples:
|Databinding|emiratesID|
|AID_027_007_001|784199015243651|



@AccountManagement123
Scenario Outline: AID_027_007 -  As a Bank I should be able to authenticate the customer through EID Scan, Facial & OTP in the Forgot Password flow so that customer authentication is complete 

4. System should display an error message <Content> if the Emirates ID entered is expired.

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When User clicks on Problem Logging in link
Then User should be navigated to 'Recover Credentials' section
When User selects 'Forgot User ID' radio button
And User clicks Proceed button
Then User should navigate to 'Forgot User ID' screen 
And User should see 'Enter Emirates ID number' and 'Enter your registered mobile number' fields
When User enters the registered mobile number in 'Enter your registered mobile number' field in Forgot password Screen
And User enters Emirates ID <emiratesID>
And User clicks Proceed button in Recover Credentials Screen
Then User should see an error message <error_message>
Examples: 
|Databinding|emiratesID|
|AID_027_007_002|784199015243651|



@AccountManagement123
Scenario Outline: AID_027_007 -  As a Bank I should be able to authenticate the customer through EID Scan, Facial & OTP in the Forgot Password flow so that customer authentication is complete 

5.System should display an error message <Content> if the Emirates ID entered is not in a appropriate format

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When User clicks on Problem Logging in link
Then User should be navigated to 'Recover Credentials' section
When User selects 'Forgot User ID' radio button
And User clicks Proceed button
Then User should navigate to 'Forgot User ID' screen 
And User should see 'Enter Emirates ID number' and 'Enter your registered mobile number' fields
When User enters the registered mobile number in 'Enter your registered mobile number' field in Forgot password Screen
And User enters Emirates ID <emiratesID> 
Then User recieves an error message below Emirates ID field
Examples:
|Databinding|emiratesID|
|AID_027_007_003|78419901524365|



@AccountManagement123
Scenario Outline: AID_030_016 - As a customer I should be able to initiate a RAKmoney transaction from the manage beneficiaries page so that I can reduce the transaction steps	
     1.User should be able to initate transaction from the Manage Beneficiary screen and the next step screen should pre-populate the related fields

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Manage beneficiaries
Then User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
And User should see Beneficiaries page
And User should see the list of beneficiaries
When User clicks on Cash tab
And User should see the list of beneficiaries
When User selects the beneficiary to perform remittance transaction
Then User should see the data pre-populated in the related fields
Examples:
|Databinding|
|AID_030_016_001|



@AccountManagement123
Scenario Outline: AID_030_002 - As a Customer I should be able to view my Account IBAN , Recent credit / Debit details so that I will know about my Account detail & activity	
1. System should display 'IBAN' field under 'Account info' section.
2. The value in the 'IBAN' field should be as per  BAU format.

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Then User should see the 'IBAN' field under 'Account info' section
#When User enters 'IBAN' number
#Then User should see a Green tick for IBAN validation
Examples: 
|Databinding|
|AID_030_002_001|



@AccountManagement123
Scenario Outline: AID_030_003 - As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	

1. System should display the 'Refill Account' button under Account info section
2. System should navigate to Refill Account section on clicking on 'Refill Account' Button.
3. System should capture the card details,- Account Number- IBAN- bank Name
4. System should display an <error message> if the another bank account detail is not valid
5. System should decline the transaction if the other bank account is not having a sufficient balance
6. System should not allow user to transfer amount more than the Pre-KYC limit
7. System should allow user to transfer amount upto the <Pre-Defined> limit after post-KYC
8. System should inform the user that transaction will not be completed until the account funding is received and user have to re-initate again
9. All Payment function\User stories mentioned in AID_011_001 to AID_011_009 should be applicable 	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button
#When User clicks 'Refill Account' button
#Then User should be navigated to Refill Account section
Examples: 
|Databinding|
|AID_030_003_001|



@AccountManagement123
Scenario Outline: AID_030_003 - As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	

3. System should capture the card details,- Account Number- IBAN- bank Name
4. System should display an <error message> if the another bank account detail is not valid
5. System should decline the transaction if the other bank account is not having a sufficient balance
6. System should not allow user to transfer amount more than the Pre-KYC limit
7. System should allow user to transfer amount upto the <Pre-Defined> limit after post-KYC
8. System should inform the user that transaction will not be completed until the account funding is received and user have to re-initate again
9. All Payment function\User stories mentioned in AID_011_001 to AID_011_009 should be applicable 	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button
#When User clicks 'Refill Account' button
#Then User should be navigated to Refill Account section	

Examples: 
|Databinding|
|AID_030_003_002|



@AccountManagement123
Scenario Outline: AID_030_019 - As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	

     1. Delete of cards shouldbe instant and the record should be removed from the list and the count should be updated immediately
     2. The deleted cards should not be listed / available while making remittances

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see 'Manage Payment Cards' button
When User clicks 'Manage Payment Cards' button
#Then User should see the list of cards
#When User Clicks Delete icon for the selected Card
#Then User should delete the Card
#And User should see the card deleted and the count is decreased immediately
Examples: 
|Databinding|
|AID_030_019_001|


@AccountManagement123
Scenario Outline: AID_030_019 - As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	

    2. The deleted cards should not be listed / available while making remittances

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Then User should see 'Manage Payment Cards' button
When User clicks 'Manage Payment Cards' button
#Then User should see the list of cards
#And User should not see the card "11224455" which is already deleted 
Examples: 
|Databinding|
|AID_030_019_002|


@AccountManagement123
Scenario Outline: AID_030_019 - As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	

    2. The deleted cards should not be listed while making remittances

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on Next button
Then User should see Recipient page
When User enters Firstname 
And User enters Lastname 
And User enters Middlename 
And User enters Nickname
And User selects the purpose of payment
#And User selects the reason for payment
And User clicks on Next button in transaction
Then User should see the instant payment screen
#When User selects "Credit/Debit Card" button
#Then the deleted card "41556223" should not be listed while making remittances
Examples: 
|Databinding|
|AID_030_019_003|



@AccountManagement123
Scenario Outline: AID_030_024  As a Customer (existing DB)  I should be able to change password through RMT app and use same password for accessing DB app and vice versa so that I have the same credentials in both app	
     1. the session should get time out / logged out when the existing DB tries to login into RMT app and viceversa	
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
#Then session should get time out / logged out when the existing RMT User tries to login into DB 
Examples: 
|Databinding|
|AID_030_024_001|



@AccountManagement123
Scenario Outline: AID_030_024 As a Customer (existing DB)  I should be able to change password through RMT app and use same password for accessing DB app and vice versa so that I have the same credentials in both app	
     1. the session should get time out / logged out when the existing DB tries to login into RMT app and viceversa	
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects cash transfer option
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
#Then session should get time out / logged out when the existing RMT User tries to login into DB 
Examples: 
|Databinding|
|AID_030_024_002|


@AccountManagement123
Scenario Outline: AID_030_018 As a customer I should be able to maintain my Card details under the Manage Payment Cards page so that I can manage my payment card information	
  1. Only ligible cards to be allowed - RAK card, UAE cards, GCC card and if international cards.
  2. Non Eligible cards should not be allowed (specific to product , Status , Blocks etc)	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Then User should see 'Manage Payment Cards' button
When User clicks 'Manage Payment Cards' button
#Then User should see the list of cards
#But Non Eligible cards should not be viewed in the list
Examples: 
|Databinding|
|AID_030_018_001|


@AccountManagement123
Scenario Outline: AID_030_018 As a customer I should be able to maintain my Card details under the Manage Payment Cards page so that I can manage my payment card information	
 
  2. Non Eligible cards should not be allowed (specific to product , Status , Blocks etc)	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
#Then User should see 'Manage Payment Cards' button
#When User clicks 'Manage Payment Cards' button
#Then User should see the list of cards
#But Non Eligible cards should not be viewed in the list
Examples: 
|Databinding|
|AID_030_018_002|



@AccountManagement123
Scenario Outline: AID_030_015  As a Customer accessing both RMT and DB app I want the beneficiary management should be effective in both app and vice versa so that beneficiary maintainenace is common	
  1.User edit and deletion of the Beneficiaries in DB and RMT should be reflected immediately 

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the list of beneficiaries
When User selects the beneficiary to perform remittance transaction
Then User should see the data pre-populated in the related fields
When User clicks edit button
Then User should see the list of beneficiaries
When User clicks on delete button for the beneficiary <Beneficiary>
#Then User should see the Error message displayed for deletion if there was transaction scheduled for that User in DB 	
Examples:
|Databinding|Beneficiary|
|AID_030_015_001|Ajoana ASonu|




@AccountManagement123
Scenario Outline: AID_030_015  As a Customer accessing both RMT and DB app I want the beneficiary management should be effective in both app and vice versa so that beneficiary maintainenace is common   
  2.Error message should displayed for deletion and edit if there was transaction scheduled for that User in DB 

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the list of beneficiaries
When User selects the beneficiary to perform remittance transaction
Then User should see the data pre-populated in the related fields
When User clicks edit button
Then User should see the list of beneficiaries
When User clicks on delete button for the beneficiary <Beneficiary>
#Then User should see the Error message displayed for deletion if there was transaction scheduled for that User in DB 
Examples: 
|Databinding|Beneficiary|
|AID_030_015_002|TESTBEF|



@AccountManagement123
Scenario Outline: AID_030_015  As a Customer accessing both RMT and DB app I want the beneficiary management should be effective in both app and vice versa so that beneficiary maintainenace is common   
  2.Error message should displayed for deletion and edit if there was transaction scheduled for that User in DB 

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the list of beneficiaries
When User selects the beneficiary to perform remittance transaction
Then User should see the data pre-populated in the related fields	
When User clicks edit button
Then User should see the list of beneficiaries
#Then User should see the Error message displayed for edit if there was transaction scheduled for that User in DB 
Examples: 
|Databinding|
|AID_030_015_003|



@AccountManagement123
Scenario Outline: AID_030_009 - As a Existing DB customer access the RMT app , the transfer history should display the RMT tranaction which are initiated                             through DB in RMT app and vice versa	
1. The user should be able to view the Transfer history which should contain RMT transaction from both DB and RMT app

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see the Transfer history 
When User clicks on Transfer history
Then User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page
#And User should see Transfer history which should contain RMT transaction from both DB and RMT app

Examples: 
|Databinding|
|AID_030_009_001|




@AccountManagement123
Scenario Outline: AID_030_008 -As a customer I should be able to view the transaction details by clicking on the Ref in the transfer history so that I can review the transaction details	
1. The transfer history should be listed with the following fields / Column - Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status
2. The complete details of the Transaction should be listed
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see the Transfer history 
When User clicks on Transfer history
Then User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page
#And User should see Transfer history which should contain RMT transaction from both DB and RMT app
Examples: 
|Databinding|
|AID_030_008_001|



@AccountManagement123
Scenario Outline: AID_030_005 - As a existing customer with DB access I should not be able to view the Account balance  / Info option	

  1.User with DB Access and exisiting AED Account with RAKBANK , should not be able view the Account balance  / Info option tab
 
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User not be able view the Account balance / Info option tab
Examples:
|Databinding|
|AID_030_005_001|



@AccountManagement123
Scenario Outline: AID_030_005 - As a existing customer with DB access I should not be able to view the Account balance  / Info option 
  2.User with DB Access and exisiting AED Account with RAKBANK , however should be able view the Account balance during transaction submission

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User selects Account Balance & Info

Examples: 
|Databinding|
|AID_030_005_002|



@AccountManagement123
Scenario Outline: AID_030_004 -As a card only customer with DB access I  should have an option to create a RMT Account in the Account balance / Info page so that I can create a RMT account	

1. This option should be listed only for the Card only customers without operative account

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
Examples: 
|Databinding|
|AID_030_004_001|



@AccountManagement123
Scenario Outline: AID_030_004 -As a card only customer with DB access I  should have an option to create a RMT Account in the Account balance / Info page so that I can create a RMT account	
2. This RMT account newly created should not allowed to accessed in DB and also not to be listed in DB overview and other pages

#Given User should launch the DB app
#When User clicks on login button by enetering Username and Password
#Then RMT account new user should not be able to Login 
Given <Databinding> User should see the Sample transaction page
Examples: 
|Databinding|
|AID_030_004_002|



@AccountManagement123
Scenario Outline: AID_027_013 - As a DB customer I should be able to perform Forgot User ID  with Card * PIN validation so that I can continue with RMT                               transactions	
1. System should display a on screen <message> to user asking them to perform Forgot User ID through digital banking application 

#Given User should see a on screen <message> to user asking them to perform Forgot User ID through digital banking application
#And User should be able to enable the Credentials     
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_013_001|




@AccountManagement123
Scenario Outline: AID_027_013 - As a DB customer I should be able to perform Forgot User ID  with Card * PIN validation so that I can continue with RMT                               transactions	
2. System should allow user to login to the RMT app after user successfully Forgot user ID in digital banking

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_013_002|




@AccountManagement123
Scenario Outline: AID_027_009 - As a Existing BD customer when resetting the password in RMT app should be able to utilize the same in Digital banking so that I need not redo the reset password	
	1. System should allow user to enable the user id in DB  so the customer is able to login with the credentials in both RMT and DB
#Given User should see a on screen <message> to user asking them to perform Forgot User ID through digital banking application
#And User should be able to enable the Credentials     
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_009_001|



@AccountManagement123
Scenario Outline: AID_027_009 - As a Existing BD customer when resetting the password in RMT app should be able to utilize the same in Digital banking so that I need not redo the reset password	
	1. System should allow user to enable the user id in DB  so the customer is able to login with the credentials in both RMT and DB
     
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_009_002|



@AccountManagement123
Scenario Outline: AID_027_008 - As a DB customer I should be able to perform Forgot Password  with Card * PIN validation so that I can continue with RMT transactions	
	1. System should display a on screen <message> to user asking them to Forgot password through digital banking application 
        2. System should allow user to login to the RMT app after user successfully set new password in digital banking

#Given User should see a on screen <message> to user asking them to perform Forgot User ID through digital banking application
#And User should be able to enable the Credentials     
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_008_001|



@AccountManagement123
Scenario Outline: AID_027_008 - As a DB customer I should be able to perform Forgot Password  with Card * PIN validation so that I can continue with RMT transactions	
        2. System should allow user to login to the RMT app after user successfully set new password in digital banking
   
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_008_002|



@AccountManagement123
Scenario Outline: AID_027_004 - As a customer when enabling DB user in RMT app should be able to utilize the same in Digital banking so that I need not redo the enable action	
        1. System should allow user to enable the user id in DB  so the customer is able to login with the credentials in both RMT and DB	

#Given User should see a on screen <message> to user asking them to perform Forgot User ID through digital banking application
#And User should be able to enable the Credentials
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_004_001|



@AccountManagement123		
Scenario Outline: AID_027_003  As a DB customer I should be able to reset / enable my locked user with Card * PIN validation so that I can continue with RMT transactions	
1. System should display a on screen <message> to user asking them to Enable User ID through digital banking application 
2. System should allow user to login to the RMT app after user successfully enable the user ID in digital banking	

#Given User should see a on screen <message> to user asking them to perform Forgot User ID through digital banking application
#And User should be able to enable the Credentials     
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|
|AID_027_003_001|



@AccountManagement123
Scenario Outline: AID_030_014 -  As a customer (existing DB) I should be able to view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app so that I can reuse the beneficiary details	
  1.Verify that the beneficiary that are Created in Digital Banking  INB are also migrated to RMT App

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
#And User should view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app
Examples: 
|Databinding|
|AID_030_014_001|



@AccountManagement123
Scenario Outline: AID_030_014 -  As a customer (existing DB) I should be able to view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app so that I can reuse the beneficiary details	
  2.Verify that the beneficiary that are Created in Digital Banking  MOB are also migrated to RMT App 

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
#And User should view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app
Examples: 
|Databinding|
|AID_030_014_002|



@AccountManagement123
Scenario Outline: AID_030_014 -  As a customer (existing DB) I should be able to view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app so that I can reuse the beneficiary details	
  3.Check if the Mandatory fields for Beneficiary Creation in Digital Banking is also mandatory fields in RMT App
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
 When User clicks on Next button in login screen
Then User should see Recipient page
And User should see the mandatory fields Beneficiary First Name,Beneficiary Middle Name,Beneficiary Last Name,Nick Name
When User enters Firstname
And User enters Lastname
And User enters Middlename
And User enters Nickname
Examples: 
|Databinding|
|AID_030_014_003|



@AccountManagement123	
Scenario Outline: AID_030_014 -  As a customer (existing DB) I should be able to view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app so that I can reuse the beneficiary details  
  4.Check if the Beneficiary created as RAKMoney beneficiary only should be available as beneficiarys in RMT App

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
#And User should view Beneficiary created as RAKMoney beneficiary only should be available as beneficiarys in RMT App
Examples: 
|Databinding|
|AID_030_014_004|



@AccountManagement123
Scenario Outline: AID_030_014 -  As a customer (existing DB) I should be able to view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app so that I can reuse the beneficiary details  
  5.Check if the Card payees created  in digital banking is not available as beneficiarys in RMT App
  6.Check if the Billers created  in digital banking is not available as beneficiarys in RMT App

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
#And User should not view Card payees created  in digital banking is not available as beneficiarys in RMT App
Examples: 
|Databinding|
|AID_030_014_005|
		
		
		
@AccountManagement123
Scenario Outline: AID_030_014 -  As a customer (existing DB) I should be able to view the beneficiaries created through RMT app to be listed under the beneficiary list under DB app so that I can reuse the beneficiary details   
  6.Check if the Billers created  in digital banking is not available as beneficiarys in RMT App

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should not view Billers created  in digital banking is not available as beneficiary in RMT App
Examples: 
|Databinding|
|AID_030_014_006|



@AccountManagement123
Scenario Outline: AID_030_011 - As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed in the Manage beneficiaries page so that I can reuse the beneficiary information.All the below validations should be done for the beneficiaries available in the DB
    1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
    2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    4. System should display below mentioned tab under Beneficiaries section,- bank- cash
    5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
    6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
    7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
    8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
    9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
    10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
    11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
    12. Alerts if applicable should be generated on each action like delete etc
    13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated         once the same is selected
    14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
    17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
    18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab 
    19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
    20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
    21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
    21. System should decrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on delete button for the beneficiary <BeneficiaryDelete>
Then User should be able to delete the beneficiary successfully on clicking delete icon
When User selects the beneficiary under 'Bank' tab to perform remittance transaction <Beneficiary>
Then User performs remittance transaction to the beneficiary
Examples: 
|Databinding|Beneficiary|BeneficiaryDelete|
|AID_030_011_001|AUniversal Abrothers|Fatima begum|



@AccountManagement123
Scenario Outline: AID_030_011 - As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed in the Manage beneficiaries page so that I can reuse the beneficiary information.All the below validations should be done for the beneficiaries available in the DB
    1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
    2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    4. System should display below mentioned tab under Beneficiaries section,- bank- cash
    5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
    6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
    7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
    8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
    9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
    10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
    11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
    12. Alerts if applicable should be generated on each action like delete etc
    13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated         once the same is selected
    14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
    17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
    18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab 
    19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
    20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
    21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
    21. System should decrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
#And User should see be able to delete the beneficiary <BeneficiaryDelete> on clicking the delete icon under 'Bank' tab
When User selects the beneficiary to perform remittance transaction <Beneficiary>
Then User performs remittance transaction to the beneficiary
Examples: 
|Databinding|Beneficiary|
|AID_030_011_002|AUniversal Abrothers|



@AccountManagement123
Scenario Outline: AID_030_011 - As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed in the Manage beneficiaries page so that I can reuse the beneficiary information.All the below validations should be done for the beneficiaries available in the DB
    1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
    2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    4. System should display below mentioned tab under Beneficiaries section,- bank- cash
    5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
    6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
    7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
    8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
    9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
    10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
    11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
    12. Alerts if applicable should be generated on each action like delete etc
    13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated         once the same is selected
    14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
    17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
    18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab 
    19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
    20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
    21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
    21. System should decrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
And User should see the tabs bank,cash under Beneficiaries section
When User clicks on Bank tab
Then User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section
#And User should see an option to upload a image for the beneficiaries under 'Bank' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Bank' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on Cash tab
#Then User should see an option to upload a image for the beneficiaries under 'Cash' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Cash' tab
And User should see an option to delete the beneficiary on clicking the delete icon
And User should see the list of beneficiaries
When User selects the beneficiary under 'Cash' tab to perform remittance transaction <Beneficiary>
Then User performs remittance transaction to the beneficiary
 Examples: 
|Databinding|Beneficiary|
|AID_030_011_003|AFatima  Abegum|



@AccountManagement123
Scenario Outline: AID_030_011 - As a existing DB customer accessing the RMT app I should be able to view the list of beneficiaries ( RAKmoney eligible) available from DB app to be listed in the Manage beneficiaries page so that I can reuse the beneficiary information.All the below validations should be done for the beneficiaries available in the DB
    1. System should navigate to the Beneficiaries section on selecting the 'manage beneficiaries' option
    2. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    3. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    4. System should display below mentioned tab under Beneficiaries section,- bank- cash
    5. System should display the below mentioned fields under 'Bank' tab in Beneficiaries section,- Name- Bank Name- State, Country
    6. System should have an option to upload a image for the beneficiaries under 'Bank' Tab
    7. System should display the beneficiary images for the available beneficiaries under 'Bank' tab
    8. System should have an option to delete the beneficiary on clicking the delete icon under 'Bank' tab
    9. System should delete the beneficiary successfully on clicking delete icon under 'Bank' tab
    10. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Bank' tab.
    11. System should descrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab.
    12. Alerts if applicable should be generated on each action like delete etc
    13.User should be able to proceed submitting transaction for the RMT Eligibile Account /Cash Beneficiary in DB , also the details should be populated         once the same is selected
    14. System should display the 'Total Beneficiaries' field under 'Beneficiaries' section
    15. System should display the value of number of beneficiaries added in 'Total Beneficiaries'  field.
    16. System should display the below mentioned fields under 'cash' tab in Beneficiaries section,- Name- Bank Name- State, Country
    17. System should have an option to upload a image for the beneficiaries under 'cash' Tab
    18. System should display the beneficiary images for the available beneficiaries under 'Cash' tab 
    19. System should have an option to delete the beneficiary on clicking the delete icon under 'Cash' tab
    20. System should delete the beneficiary successfully on clicking delete icon under 'Cash' tab
    21. System should allow user to perform remittance transaction on selecting the particular beneficiary under 'Cash' tab.
    21. System should decrease the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Cash' tab.	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Manage beneficiaries
When User selects Manage beneficiaries
Then User should see Beneficiaries page
And User should see the 'Total Beneficiaries' field under 'Beneficiaries' section
And User should see the value of number of beneficiaries added in 'Total Beneficiaries' field
When User clicks on Cash tab
#Then User should see an option to upload a image for the beneficiaries under 'Cash' Tab
#And User should see the beneficiary images for the available beneficiaries under 'Cash' tab
And User should see an option to delete the beneficiary on clicking the delete icon
When User clicks on delete button for the beneficiary <Beneficiary>
Then User should be able to delete the beneficiary successfully on clicking delete icon
And User should not be able to see the deleted beneficiary <Beneficiary>
And User should see the decrease in the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab
Examples:
|Databinding|Beneficiary|
|AID_030_011_004|AWAKAR ALATIF|



@AccountManagement123
Scenario Outline: AID_030_003 -  As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	
 1. System should display the 'Refill Account' button under Account info section
 2. System should navigate to Refill Account section on clicking on 'Refill Account' Button.
 3. System should capture the card details,- Account Number- IBAN- bank Name
 4. System should display an <error message> if the another bank account detail is not valid
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button under Account info section
#When User clicks on Refill Account
#Then User should navigate to Refill Account section
#And User should see the card details,- Account Number- IBAN- bank Name
#When User enters invalid other bank account and Clicks Proceed
#Then User should see an <error message> if the another bank account detail is not valid
Examples: 
|Databinding|
|AID_030_003_001|



@AccountManagement123
Scenario Outline: AID_030_003 -  As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	
            5. System should decline the transaction if the other bank account is not having a sufficient balance
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button under Account info section
#When User clicks on Refill Account
#Then User should navigate to Refill Account section
#And User should see the card details,- Account Number- IBAN- bank Name
#When User enters other bank account which doesnot have sufficient balance and Clicks Proceed
#Then User should see a declined message 
Examples: 
|Databinding|
|AID_030_003_002|



@AccountManagement123
Scenario Outline: AID_030_003 -  As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	
   6. System should not allow user to transfer amount more than the Pre-KYC limit
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button under Account info section
#When User clicks on Refill Account
#Then User should navigate to Refill Account section
#And User should see the card details,- Account Number- IBAN- bank Name
#When User enters transfer amount more than the Pre-KYC limit
Then User should see an error message <message>
Examples: 
|Databinding|error_message|
|AID_030_003_003|test message|


@AccountManagement123
Scenario Outline: AID_030_003 -  As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	
                      7. System should allow user to transfer amount upto the <Pre-Defined> limit after post-KYC
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button under Account info section
#When User clicks on Refill Account
#Then User should navigate to Refill Account section
#And User should see the card details,- Account Number- IBAN- bank Name
#When User enters transfer amount more than the Pre-KYC limit
Then User should see an error message <message> 
Examples: 
|Databinding|
|AID_030_003_004|



@AccountManagement123
Scenario Outline: AID_030_003 -  As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	
  7. System should allow user to transfer amount upto the <Pre-Defined> limit after post-KYC
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button under Account info section
#When User clicks on Refill Account
#Then User should navigate to Refill Account section
#And User should see the card details,- Account Number- IBAN- bank Name
#When User enters amount upto the <Pre-Defined> limit after post-KYC
#Then User should not see any error message
Examples: 
|Databinding|
|AID_030_003_005|



@AccountManagement123
Scenario Outline: AID_030_003 -  As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	
 
 8.System should inform the user that transaction will not be completed until the account funding is received and user have to re-initate again
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button under Account info section
#When User clicks on Refill Account
#Then User should navigate to Refill Account section
#And User should see the card details,- Account Number- IBAN- bank Name
#When User enters amount more than the available wallet account balance
#Then User should not see an error message
#And User should see re-initiate button
Examples: 
|Databinding|
|AID_030_003_006|



@AccountManagement123
Scenario Outline: AID_030_003 -  As a bank I should provide a link to Fund the Account from the Account info screen so that user can have quick access to payment options	
 
 9.All Payment function\User stories mentioned in AID_011_001 to AID_011_009 should be applicable 	
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
And User selects Account Balance & Info
#Then User should see 'Refill Account' button under Account info section
#When User clicks on Refill Account
#Then User should navigate to Refill Account section
#And User should see the card details,- Account Number- IBAN- bank Name
#When User enters amount more than the available wallet account balance
#Then User should not see an error message
#And User should see re-initiate button
Examples: 
|Databinding|
|AID_030_003_007|


@AccountManagement123
Scenario Outline: AID_027_005 -  As a Bank I should allow only certain type / conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)
 
1. System should display a on screen <message> to user asking them to Enable User ID through digital banking application if the users credentials are disabled by Admin

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin
#And User should see a on screen <message> to user asking them to Enable User ID through digital banking application if the users credentials are disabled by Admin
Examples: 
|Databinding|
|AID_027_005_001|


@AccountManagement123
Scenario Outline: AID_027_005 -  As a Bank I should allow only certain type / conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)
2. System should display an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin
Examples: 
|Databinding|
|AID_027_005_002|



@AccountManagement123
Scenario Outline: AID_027_006 -  As a customer I should be able to Forgot Password so that I can continue with RMT transactions

1. System should display 'Forgot password or Email' option in login screen
2. System should navigate to 'Recover Credentials' section on clicking 'Forgot password' option in login screen
3. System should display the below mentioned Radio options in 'Select what you would like to recover' section,
- I have Forgot my password
- I have Forgot my User ID
- My User ID is blocked
4. System shoiuld allow user to select the 'I have forgot my password' radio button
5. System should display the 'Continue' button in 'Recover Credentials' section
6. System should navigate to  'Forgot Password' screen on clicking 'Continue' button in 'Recover Credentials' section"	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
And User should see Problem Logging in link
When User clicks on Problem Logging in link
Then User should be navigated to 'Recover Credentials' section
And User should see the radio buttons 'I have Forgot my password','I have Forgot my User ID','Mu User ID is blocked' in 'Select what you would like to recover' section
When User selects 'I have forgot my Password' option
Then User should be navigated to 'Recover Credentials' section
When User clicks Proceed button
Then User should navigate to 'Forgot Password' screen
Examples:
|Databinding|
|AID_027_006_001|


@AccountManagement123
Scenario Outline: AID_027_010 - As a Bank I should allow only certain type / conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)
     1. System should display a on screen <message> to user asking them to Forgot password through digital banking application if the users credentials are disabled by Admin

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see an error message <Content>
#And User should see a on screen <message> to user asking them to Enable User ID through digital banking application if the users credentials are disabled by Admin
Examples: 
|Databinding|
|AID_027_010_001|
		
		
@AccountManagement123
Scenario Outline: AID_027_010 -  As a Bank I should allow only certain type / conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)
      2. System should display an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin
Examples: 
|Databinding|
|AID_027_010_002|



@AccountManagement123
Scenario Outline: AID_027_011 - As a customer I should be able to Forgot User ID so that I can continue with RMT transactions
1. System should display 'Forgot password' option in login screen
2. System should navigate to 'Recover Credentials' section on clicking 'Forgot password' option in login screen
3. System should display the below mentioned Radio options in 'Select what you would like to recover' section,
- I have Forgot my password
- I have Forgot my User ID
- My User ID is blocked
4. System should allow user to select the 'I have Forgot my User ID' radio button
5. System should display the 'Continue' button in 'Recover Credentials' section
6. System should navigate to  'Forgot User ID' screen on clicking 'Continue' button in 'Recover Credentials' section	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
And User should see Problem Logging in link
When User clicks on Problem Logging in link
Then User should be navigated to 'Recover Credentials' section
And User should see the radio buttons 'I have Forgot my password','I have Forgot my User ID','Mu User ID is blocked' in 'Select what you would like to recover' section
When User selects 'I have forgot my Password' option
Then User should navigate to 'Forgot Password' screen
#And User should see the 'Continue' button
#When User clicks 'Continue' in 'Recover Credentials' section
#Then User should navigate to 'Forgot Password' screen
Examples: 
|Databinding|
|AID_027_011_001|



@AccountManagement123
Scenario Outline: AID_027_014 -  As a Bank I should allow only certain type / conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)
1. System should display a on screen <message> to user asking them to Forgot User ID through digital banking application if the users credentials are disabled by Admin
2. System should display an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin"	AID_027_014

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin
#And User should see a on screen <message> to user asking them to Enable User ID through digital banking application if the users credentials are disabled by Admin
Examples: 
|Databinding|
|AID_027_014_001|



@AccountManagement123
Scenario Outline: AID_027_014 -  As a Bank I should allow only certain type / conditions of lock to be enabled through self authentication mode so that I can filter out fraud (bank disabled user)
1. System should display a on screen <message> to user asking them to Forgot User ID through digital banking application if the users credentials are disabled by Admin
2. System should display an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin"	AID_027_014

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then User should see an error message <Content> to the user when trying to enable RMT app if the user credentials are disabled by admin
Examples: 
|Databinding|
|AID_027_014_002|

#Completed

@AccountManagement123
Scenario Outline: AID_030_007 - As a customer I should be able to view the RMT transfer history from this page so that I can review my Remittance transactions

1. By default Last 10 Transactions should be listed . The Last N value should be a parameter value
2. The user should be able to filter by Type of transaction like Account transfer / Cash / All
3. The user should be able to filter transaction by Date range, the default date range should be last one month
4. The user should be able to filter the transaction by the transaction status
5. The transfer history should be listed with the following fields / Column - Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see the Transfer history
When User clicks on Transfer history
Then User should see Last 10 Transactions
#And User should be able to filter by Type of Transaction like Account Transfer/ Cash/ All
And User views filter transaction by Date range
When User clicks filter transaction by Date range
#Then User should see default date range should is one month
When User clicks Done in transaction page
Then User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page 2
Examples: 
|Databinding|
|AID_030_007_001|



@AccountManagement123
Scenario Outline: AID_030_007 -  As a customer I should be able to view the RMT transfer history from this page so that I can review my Remittance transactions

6.Transaction sorting should follow as is DB Behavior	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see the Transfer history
When User clicks on Transfer history 
Then User should see Last 10 Transactions
#And User should be able to filter by Type of Transaction like Account Transfer/ Cash/ All
And User views filter transaction by Date range
When User clicks filter transaction by Date range
#Then User should see default date range should is one month
When User clicks Done in transaction page
Then User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page 2
#And Transaction sorting should follow as is DB Behavior
Examples: 
|Databinding|
|AID_030_007_002|



@AccountManagement123
Scenario Outline: AID_030_017 -  As a Customer I want to view count and list of Payment cards which are saved., utilized for transactions under the Manage Payment Cards page so that I can manage the list of Payment cards

1. System shold display 'Manage Payment Cards' section on clicking 'manage payment Cards' option from the left menu.
2. System should display the value of the total number of card available to the user in 'Total Cards' field 
3. System should display the front image of the card that is added as beneficiaries ( the Card number should be displayed (masked) as per the PCIDSS convention.

4. system should have an option to delete the card from the 'manage Payment cards' section.
5. System should display the below mentioned field in the card image,- Card Number- Card Name
6. System should not display the card that are deleted from the 'Manage Payment Cards' section
7. System should display the updated value of the total number of card available to the user in 'Total Cards' field on deleting the card beneficiaries.
8. System should update the card details that are being edited in 'Manage Payment Cards' beneficiaries section

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see 'Manage Payment Cards' button
When User clicks 'Manage Payment Cards' button
#Then User should see 'Manage Payment Cards' section
#And User should see the value of the total number of card available to the user in 'Total Cards' field
#And User should see the front image of the card that is added as beneficiaries ( the Card number should be displayed (masked) as per the PCIDSS convention
#And User should see an option to delete the card from the 'Manage Payment Cards' section
#And User should see card image,- Card Number- Card Name
#When user clicks on edit icon
#Then User should see the fields to edit
#When user updates the details of  card and clicks save
#Then User should see the updated card details in 'Manage Payment Cards' beneficiaries section
Examples: 
|Databinding|
|AID_030_017_001|



@AccountManagement123
Scenario Outline: AID_030_017 -  As a Customer I want to view count and list of Payment cards which are saved., utilized for transactions under the Manage Payment Cards page so that I can manage the list of Payment cards

6. System should not display the card that are deleted from the 'Manage Payment Cards' section
7. System should display the updated value of the total number of card available to the user in 'Total Cards' field on deleting the card beneficiaries.

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see 'Manage Payment Cards' button
When User clicks 'Manage Payment Cards' button
#Then User should see 'Manage Payment Cards' section
#And User should see the value of the total number of card available to the user in 'Total Cards' field
#And User should see the front image of the card that is added as beneficiaries ( the Card number should be displayed (masked) as per the PCIDSS convention
#And User should see an option to delete the card from the 'Manage Payment Cards' section
#And User should see card image,- Card Number- Card Name
#When user clicks on delete icon
#Then User should see Card deleted succesfully
#And User should not see the card that are deleted from the 'Manage Payment Cards' section
#And User should see the updated value of the total number of card available to the user in 'Total Cards' field on deleting the card beneficiaries
Examples: 
|Databinding|
|AID_030_017_002|



@AccountManagement123
Scenario Outline: AID_030_020 -  As a customer I should be able to view, edit and manage my personal details from Update personal info option so that I can manage my personal information

1. System should navigate to Personal Info section on clicking 'Update Personal Info' option from the left menu.
2. System should display the image of the user in 'personal Info' section. ( only greyed out image to be displayed, not the actual image)
3. System should have an option to edit the image on clicking 'edit' icon on the image (no edit option, this is applicable for phase 2)
4. System should allow user to upload a new image on clicking the 'edit' icon on the image under 'personal info' section.
5. System should display the full name of the user under the image in 'Personal info' section
6. System should display the last updated field witht value ""Date / Time"" below the user name in 'personal Info' section.
7. System should update the last updated field value with the latest update time and date.
8. System should display the below mentioned fields in 'Personal Info' section,- First name- Last name- Gender- nationality- Address- Passport Number- Emirates ID
9. System should have an option to Edit the personal details under 'Personal Info' section
12. System should allow user to view the passport image on clicking the image icon in 'passport Number' field
13. System should allow user to view the Emirates ID image on clicking the image icon in 'Emirates ID' field	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Update Personal Info option
When User selects Update Personal Info
Then User should should navigate to Personal Info section
And User should see the fields First name,Last name,Gender,nationality,Address,Passport Number,Emirates ID in 'personal Info' section
And User should see the image of the user in 'personal Info' section
When User clicks edit icon on the image
#And User should see an option to edit the image
#When User clicks edit icon on the image
#And User should see an option to upload a new image
Then User should see full name of the user under the image in 'Personal info' section
#And User should see the last updated field witht value ""Date / Time"" below the user name in 'personal Info' section
#And User should see the last updated field witht value ""Date / Time"" below the user name in 'personal Info' section
#And User should view the passport image on clicking the image icon in 'passport Number' field
When User clicks back
#Then User should view the Emirates ID image on clicking the image icon in 'Emirates ID' field
Examples: 
|Databinding|
|AID_030_020_001|



@AccountManagement123
Scenario Outline: AID_030_020 -  As a customer I should be able to view, edit and manage my personal details from Update personal info option so that I can manage my personal information

10. System should allow user to edit the below mentioned details on clicking 'Edit' option under 'Personal Info' section.  - Address- Name
11. System should display the updated details under 'personal info' section when user edit the personal details.

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Update Personal Info option
When User selects Update Personal Info
Then User should should navigate to Personal Info section
And User should see the fields First name,Last name,Gender,nationality,Address,Passport Number,Emirates ID in 'personal Info' section
And User should see the image of the user in 'personal Info' section
When User clicks edit icon on the image
#And User should see an option to edit the image
#When User clicks edit icon on the image
#And User should see an option to upload a new image 
Then User should see full name of the user under the image in 'Personal info' section
When User clicks back 
#And User should see the last updated field witht value ""Date / Time"" below the user name in 'personal Info' section
#And User should see the last updated field witht value ""Date / Time"" below the user name in 'personal Info' section
And User should see the fields First name,Last name,Gender,nationality,Address,Passport Number,Emirates ID in 'personal Info' section
When User edits the details in 'Personal Info' section
And User clicks Save
#Then User should be authenticated with 2 level of authentication like OTP, facial
Then User should view the updated details under 'personal info' section when user edit the personal details
Examples:
|Databinding|
|AID_030_020_002|


@AccountManagement123
Scenario Outline: AID_030_021 - As a Bank I want to allow the customer to edit personal information through RMT app for the fields only which are eligible through DB app
1. System should not allow the user to edit all the details. Only those infomration which are eligible for edit through personal details update should be allowed here
2. the update details should be immediately saved and the user should be able to view in RMT app and DB & vice versa
3. The update of personal details should be authenticated with 2 level of authentication like OTP, facial etc
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Update Personal Info option
When User selects Update Personal Info
Then User should should navigate to Personal Info section
And User should see the fields First name,Last name,Gender,nationality,Address,Passport Number,Emirates ID in 'personal Info' section
And User should see the image of the user in 'personal Info' section
When User clicks edit icon on the image
#And User should see an option to edit the image
#When User clicks edit icon on the image
#And User should see an option to upload a new image 
Then User should see full name of the user under the image in 'Personal info' section
And User should see the image of the user in 'personal Info' section
When User clicks edit icon on the image
#And User should see an option to edit the image
When User clicks edit icon on the image
#And User should see an option to upload a new image 
Then User should see full name of the user under the image in 'Personal info' section 
#When User clicks back 
#And User should see the last updated field witht value ""Date / Time"" below the user name in 'personal Info' section
#And User should see the last updated field witht value ""Date / Time"" below the user name in 'personal Info' section
When User clicks Save
#Then User should be authenticated with 2 level of authentication like OTP, facial 
Then User should view the updated details under 'personal info' section when user edit the personal details
Examples: 
|Databinding|
|AID_030_021_001|
		
		
		
@AccountManagement123
Scenario Outline: AID_030_021 - As a Bank I want to allow the customer to edit personal information through RMT app for the fields only which are eligible through DB app
1. System should not allow the user to edit all the details. Only those infomration which are eligible for edit through personal details update should be allowed here
2. the update details should be immediately saved and the user should be able to view in RMT app and DB & vice versa
3. The update of personal details should be authenticated with 2 level of authentication like OTP, facial etc

#Given User should launch the DB app
#When User login with credentials
#Then User should update the Personal details in DB
#And User should see the updated details in DB
Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see Update Personal Info option
When User selects Update Personal Info
Then User should should navigate to Personal Info section
#And User should view the details updated in DB under 'personal info' section 
Examples: 
|Databinding|
|AID_030_021_002|




@AccountManagement
Scenario Outline: AID_030_022 - As a customer I should be able to change my RMT app password through Change Password option so that I can reset my credentials

1. System should navigate to change password section on clicking 'Change Password' option from the left menu.
2. System should display the last changed on field with the value "Date" in 'Change password' section.
3. System should display the date field in the "nn mmm yyyy" format
4. System should display the below mentioned field in Change password section,- Current Password- New Password- Confirm Password
5. System should allow user to enter alphanumaric value in 'Current password' field.
6. System should allow user to enter alphanumaric value in 'New password' field.
7. System should allow user to enter alphanumaric value in 'Confirm password' field.
8. System should not allow user to enter minimum of 8 characters in 'Current password' field.
9. System should not allow user to enter minimum of 8 characters in 'New password' field.
10. System should not allow user to enter minimum of 8 characters in 'Confirm password' field
11. System should allow user to enter special characters in 'Current password' field.
12. System should allow user to enter special characters in 'New password' field.
13. System should allow user to enter special characters in 'Confirm password' field.
14. System should allow user to enter upper case characters in 'Current password' field.
15. System should allow user to enter upper case characters in 'New password' field.
16. System should allow user to enter upper case characters in 'Confirm password' field.
17. System should display the mentioned check box checked by default below 'Password should be :' field,- Alphanumeric- Min. 8  Characters
18. System should display 'Change Passowrd' button in Change password section
19. System should allow user to navigate to confirmation page on clicking 'Change password' section
20. System should not allow user to set last 3 password.
21. System should display an 'error message' if the last 3 password is similar
21. System should display an error text if the user enters the incorrect password in 'current password' section.
22. system should display an error text if the password entered is not met the password policy
23. System should display an error text if the password enterd in 'New Password' field does not match with the password entered in 'Confirm password' field.
24. System should allow user to login successfully in the RMT app with the newly set password.	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then User should see 'Change Password' option
When User selects Change Password option
Then User should navigate to change password section
#And User should see the last changed on field with the value "Date" in 'Change password' section
#And User should see the date field in the "nn mmm yyyy" format
And User should see the fields Current Password,New Password,Confirm Password
When User enters Current password <passwordless>
And User enters New password <newpasswordless>
And User enters Confirm password <newpasswordless>
#Then User should see the error message below 'Current password' field
#And User should see the error message below 'New password' field
#And User should see the error message below 'Confirm password' field
When User enters Current password <passwordspecial>
And User enters New password <newpasswordspecial>
And User enters Confirm password field <newpasswordspecial>
#Then User should not see the error message below 'Current password' field
#And User should not see the error message below 'New password' field
#And User should not see the error message below 'Confirm password' field
When User enters Current password <passwordUpper>
And User enters New password <newpasswordUpper>
And User enters Confirm password <newpasswordUpper>
#Then User should not see the error message below 'Current password' field
#And User should not see the error message below 'New password' field
#And User should not see the error message below 'Confirm password' field
When User enters Current password <originalpassword>
And User enters New password <newpasswordAlphaNumeric>
And User enters Confirm password <newpasswordAlphaNumeric>
And User clicks 'Change Passowrd' button in Change password section
Then User should navigate to confirmation page
Given <Databinding> User should see the Sample transaction page
When User selects the Remittance Currency
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
And User should be able to select the remitting option
When User selects account transfer option
Then User should be on the same page
And User clicks on Next button
And Customer uses credentials to Login <newpasswordAlphaNumeric>
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|passwordless|newpasswordless|passwordspecial|newpasswordspecial|passwordUpper|newpasswordspecialUpper|passwordAlphaNumeric|newpasswordAlphaNumeric|originalpassword|
|AID_030_022_001|Welco|Welno|Welcome@|Welcome$|Welcome1|Welcome12|Welcome@123|Welcome@431|rakbank@123|


@AccountManagement
Scenario Outline: AID_030_022 - As a customer I should be able to change my RMT app password through Change Password option so that I can reset my credentials

20. System should not allow user to set last 3 password.
21. System should display an 'error message' if the last 3 password is similar
21. System should display an error text if the user enters the incorrect password in 'current password' section.
22. system should display an error text if the password entered is not met the password policy
23. System should display an error text if the password enterd in 'New Password' field does not match with the password entered in 'Confirm password' field.
24. System should allow user to login successfully in the RMT app with the newly set password.	

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then  User should see 'Change Password' option
When User selects Change Password option
Then User should navigate to change password section
#And User should see the last changed on field with the value "Date" in 'Change password' section
#And User should see the date field in the "nn mmm yyyy" format
And User should see the fields Current Password,New Password,Confirm Password
When User enters Current password <passwordOld>
And User enters New password <newpasswordOld>
And User enters Confirm password <newpasswordOld>
#Then User should not see the error message below 'Current password' field
#And User should not see the error message below 'New password' field
#And User should not see the error message below 'Confirm password' field
When User enters Current password <passwordAlphaNumeric>
And User enters New password <newpasswordAlphaNumeric>
And User enters Confirm password <newpasswordAlphaNumeric>
And User clicks 'Change Passowrd' button in Change password section
Then User should navigate to confirmation page
Given <Databinding> User should see the Sample transaction page
When User selects the Remittance Currency
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
And User should be able to select the remitting option
When User selects account transfer option
Then User should be on the same page
And User clicks on Next button
And User should see the Login screen to enter Credentials
When Customer uses credentials to Login <newpasswordAlphaNumeric>
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|Databinding|passwordOld|newpasswordOld|passwordAlphaNumeric|newpasswordAlphaNumeric|
|AID_030_022_002|Welco|Welno|Welcome@123|Welcome@431|



@AccountManagement123		
Scenario Outline: AID_030_023 - As a customer I should be able to login into the RMT app with the new password which got changed through Change Password option so that I can use my new password to login
   1.User should be able to change the password as per the password policy 
   2.User should be able to login with the newly updated password
   3.User should be able to change password in RMT 
Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
And Customer uses credentials to Login <passwordAlphaNumeric>
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
Then  User should see 'Change Password' option
When User selects Change Password option
Then User should navigate to change password section
#And User should see the last changed on field with the value "Date" in 'Change password' section
#And User should see the date field in the "nn mmm yyyy" format
And User should see the fields Current Password,New Password,Confirm Password
When User enters Current password <passwordAlphaNumeric>
And User enters New password <newpasswordAlphaNumeric>
And User enters Confirm password <newpasswordAlphaNumeric>
And User clicks 'Change Passowrd' button in Change password section
Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
And Customer uses credentials to Login <passwordAlphaNumeric>
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|DataBinding|passwordOld|newpasswordOld|passwordAlphaNumeric|newpasswordAlphaNumeric|
|AID_030_023_001|Welco|Welno|Welcome@123|Welcome@431|
		
		
		
@AccountManagement123
Scenario Outline: AID_030_025 - As a customer I should be able to enable / disable the touch ID / facial ID through Enable / Disable Touch ID option so that I can manage my login options 
1. System should navigate to 'Enable/Disable Touch ID' section on clicking 'Enable/Disable Touch ID' option from left menu
2. System should display 'switch' button
3. System should allow user to switch on\off the 'switch' option.
4. System should disable the touch ID if the touch ID is turned OFF.
5. System should enable the touch ID if the touch ID is turned ON.

Given <Databinding> User should see the Sample transaction page
#And User did not have any beneficiary
When User selects Remitting Currency applicable for Account transfer only
And User enters Remitting Amount 
Then user should see the exchange rate for the selected currency 
When User selects the remitting option as Account transfer
#And User did not select any Beneficiary
And User clicks on Next button
Then User should see the Login screen to enter Credentials
When Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
#Then User should see 'Enable/Disable Touch ID' option
#When User clicks 'Enable/Disable Touch ID' option
#Then User should see 'switch' button
#When User turns OFF touch ID
#Then User should see the touch ID disabled
#When User turns ON touch ID
#Then User should see the touch ID enabled
Examples: 
|Databinding|
|AID_030_025_001|




@AccountManagement123
Scenario Outline: AID_030_026  As a Bank I should be able authorize the users login ./ transaction based on the touch ID / Facial Enabled or disabled status so that I can render correct authentication option for the user

1.User should be able to login with the Touch ID	
3.System should maintain option to manage touch ID and Facial ID as it behaves exactly like User Login in DB

Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
And Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
Examples: 
|DataBinding|
|AID_030_026_001|
		
		
		
@AccountManagement123
Scenario Outline: AID_030_026  As a Bank I should be able authorize the users login ./ transaction based on the touch ID / Facial Enabled or disabled status so that I can render correct authentication option for the user

2.User should be able to Facial based on the device / OS capability
3.System should maintain option to manage touch ID and Facial ID as it behaves exactly like User Login in DB

Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
#And User uses Facial ID  for Login
#Then System should allow User to login successfully 
Examples: 
|DataBinding|
|AID_030_026_002|
		
		
		
		
		
@AccountManagement123    
Scenario Outline: AID_030_026  As a Bank I should be able authorize the users login ./ transaction based on the touch ID / Facial Enabled or disabled status so that I can render correct authentication option for the user

1.User should be able to login with the Touch ID
2.User should be able to Facial based on the device / OS capability
3.System should maintain option to manage touch ID and Facial ID as it behaves exactly like User Login in DB
4. If there is any change in the password then the Touch ID / Facial ID should be also reconfigured (similar to DB)
4.If Any Login disabled for User at admin or backend or Incorrect Attempts , then for that particular user all type of 	

Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
#And User uses Facial ID  for Login
#Then System should prompt User to reconfigure the Facial ID
#When User uses Touch ID for Login
#Then System should prompt User to reconfigure the Touch ID
Examples: 
|DataBinding|
|AID_030_026_003|



@AccountManagement123
Scenario Outline: AID_030_027 As a customer I should be able to access / gain assistance by visiting the Help & Knowledge base link so that I can try to resolve my queries and clarifications

 1.User should be able to access the Assistance questions and received clarifications (UI Flow will be shared)	

Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
And Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
#Then User should see Help & Knowledgebase option
#When User clicks Help & Knowledgebase option
#Then User should see Help section
#And User should be able to access the Assistance questions and received clarifications
Examples: 
|DataBinding|
|AID_030_027_001|
		
		

@AccountManagement123
 Scenario Outline: AID_030_028 As a Bank I should be able to action on the request / clarification / query raised by the user on the Help  & Knowledge base so that I can extend user assistance
   1.User should be able to access the Assistance questions and received clarifications (UI Flow will be shared)
Given <DataBinding> Customer launches Login screen
When User selects account transfer option
And User selects the Remittance Currency
And User enters the Remittance amount
#And User enters the Transfer amount
And User clicks on Next button
And Customer uses credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
When User clicks on profile Icon
#Then User should see Help & Knowledgebase option
#When User clicks Help & Knowledgebase option
#Then System should navigate user to Help section
#And System should allow User to access the Assistance questions and received clarifications
Examples: 
|DataBinding|
|AID_030_028_001|
