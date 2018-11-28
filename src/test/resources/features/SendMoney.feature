Feature: Send Money - Make a quick remittance - NTB customer journey      


@SendMoney16
Scenario Outline: AID_023_016 -  As a NTB customer I should be given a option to select various remitting options for NEW contact based on the corridor like Cash, Account transfer while initiating remittance transaction so that I can chose the remitting option
                     1.User should be provided with both the options to select the remitting option(Cash, Account transfer)
 
Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
And User should be able to select the remitting option
When User selects account transfer option
And User enters the Transfer amount
And User selects the Remittance Currency
And User should see the Exchangerate and amount to be transferred
And User clicks on Next button
And User enters credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
And User should see the available beneficiaries
And User should be able to select the remitting option
When User selects cash transfer option
When User selects the Remittance Currency
And User enters the Transfer amount
Then User should see the list of applicable remittance currency
When User clicks on Next button
And Customer should be able to logout of the application
Examples:
|DataBinding|
#|AID_023_016_001|
|TEST_001|

@SendMoney16
Scenario Outline: AID_023_016 -  As a NTB customer I should be given a option to select various remitting options for NEW contact based on the corridor like Cash, Account transfer while initiating remittance transaction so that I can chose the remitting option
  1.System should display the error message if the selected remitting option is not applicable for the Currency selected (as per XM currency / Country )
 
Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
And User should be able to select the remitting option
And User should see the list of applicable remittance currency
When User selects account transfer option
And User enters the Transfer amount
And User selects the Remittance Currency
#And User enters the Transfer amount
Then User should see an errormessage for currency
Examples:
|DataBinding|
|AID_023_016_002|
@SendMoney16
Scenario Outline: AID_023_016 -  As a NTB customer I should be given a option to select various remitting options for NEW contact based on the corridor like Cash, Account transfer while initiating remittance transaction so that I can chose the remitting option
1.System should display the error message if the selected remitting option is not applicable for the Currency selected (as per XM currency / Country )
 
Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
And User should be able to select the remitting option
And User should see the list of applicable remittance currency
When User selects cash transfer option
And User enters the Transfer amount
And User selects the Remittance Currency
#And User enters the Transfer amount
Then User should see an errormessage for currency
       Examples:
       |DataBinding|
              |AID_023_016_003|
             
@SendMoney17
Scenario Outline: AID_023_017 - As a NTB customer I should be given a option to select various remitting options for NEW contact based on the corridor like Cash, Account transfer while initiating remittance transaction so that I can chose the remitting option
 
1.User should be provided options to select the remitting option(Cash, Account transfer) based on the corridor for new Contact
2.System should display both the options (Cash, Account transfer) for all the countries (country list sheet attached in this workbook)
5. System should allow user to perform remittance either with cash pickup or Account transfer for the eligible countries(country list sheet attached in this workbook)
 
       Given <DataBinding> User should see the Sample transaction page
       And User should see the list of applicable remittance currency
       And User should be able to select the remitting option      
       When User selects account transfer option
       And User enters the Transfer amount
          When User selects the Remittance Currency 
           And User should see the Exchangerate and amount to be transferred 
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
      And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|
              |AID_023_017_001|  
              
@SendMoney17
Scenario Outline: AID_023_017 -  As a NTB customer I should be given a option to select various remitting options for NEW contact based on the corridor like Cash, Account transfer while initiating remittance transaction so that I can chose the remitting option
           5. System should allow user to perform remittance either with cash pickup or Account transfer for the eligible countries(country list sheet attached in this workbook)
    Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects cash transfer option  
          And User enters the Transfer amount
           And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
             And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
      And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|
              |AID_023_017_002|
@SendMoney17
Scenario Outline: AID_023_017 - As a NTB customer I should be given a option to select various remitting options for NEW contact based on the corridor like Cash, Account transfer while initiating remittance transaction so that I can chose the remitting option
         3.System should  display an <Error Message> if the selected country does not support cash payout for remittance(country list sheet attached in this workbook)
         Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects cash transfer option
              And User enters the Transfer amount
              And User selects the Remittance Currency <CurrencyCash>          
              Then User should see an errormessage for currency         
             
      Examples:
       |DataBinding|CurrencyCash|
              |AID_023_017_003|AUD|
@SendMoney17
Scenario Outline: AID_023_017 - As a NTB customer I should be given a option to select various remitting options for NEW contact based on the corridor like Cash, Account transfer while initiating remittance transaction so that I can chose the remitting option
         4.System should  display an <Error Message> if the selected country does not support Account transfer for remittance(country list sheet attached in this workbook)
             
              Given <DataBinding> User should see the Sample transaction page
              And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option           
              And User enters the Transfer amount
              And User selects the Remittance Currency <Currency>
              And User clicks on Next button
              Then User should see an errormessage
      Examples:
       |DataBinding|Currency|
              |AID_023_017_004|NPR|
@SendMoney18
Scenario Outline: AID_023_018 - As a customer I should be able to select the remitting options like Cash , Account for the contact selected so that I can continue with the remittance transaction
1.User should be able to select the contact , followed by remitting option selection like cash or account
2.System is configurable with corridor and Remitting option based on Bank's requirement
 
       Given <DataBinding> User should see the Sample transaction page
       And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects cash transfer option
          And User enters the Transfer amount
          And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries 
       When User clicks on Next button
       Then User should see Recipient page
     Examples:
       |DataBinding|
              |AID_023_018_001|
@SendMoney18
Scenario Outline: AID_023_018 -  As a customer I should be able to select the remitting options like Cash , Account for the contact selected so that I can continue with the remittance transaction
1. User should be able to select the contact , followed by remitting option selection like cash or account  - Selecting Cash Transfer
2. System is configurable with corridor and Remitting option based on Bank's requirement
 
     Given <DataBinding> User should see the Sample transaction page
     And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects cash transfer option
          And User enters the Transfer amount
           And User selects the Remittance Currency
           And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
Examples:
       |DataBinding|
              |AID_023_018_002|
@SendMoney19
Scenario Outline: AID_023_019 -  As a Bank I should be able to display the default the remitting Home currency based on the Contact country / corridor so that the customer does not required to choose manually (Ex. If India then default to INR, Australia then default to AUD)
         1. System should be able to default remitting currency for all the country as per Xpress money list
      
     Given <DataBinding> User should see the Sample transaction page
      And User should see the list of applicable remittance currency
      And User should be able to select the remitting option
              When User selects remittance option <option>
          And User enters the Transfer amount
           And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
Examples:
       |DataBinding|option|
              |AID_023_019_001|Cash Pickup|
              |AID_023_019_002|Bank Transfer|
 
@SendMoney20
Scenario Outline: AID_023_020 - As a Bank I should be able to give a list of applicable remittance currencies for the user to choose based on the Contact country / corridor eligibility (however home currency is defaulted) so that the customer can choose his currency choice   
1. System should give a list of applicable remittance currency to user (all the currency mentioned across corridors should be tested)
2. System should allow the user to select the applicable remittance currency as per his choice
3. User must be able to select the remittance currency from the list system displays
4. System should update the related fields (like exchange rate, Converted Amount) as per userï¿½s remitting currency selection
6. Exchange rate should be as per the latest rate advised for Xpress money transfer
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option      
          And User enters the Transfer amount
           And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       And User selects the Remittance Currency
          And User enters the Transfer amount
          And User should see the Exchangerate and amount to be transferred
              When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
       |DataBinding|
              |AID_023_020_001|
 
@SendMoney20
Scenario Outline: AID_023_020 - As a Bank I should be able to give a list of applicable remittance currencies for the user to choose based on the Contact country / corridor eligibility (however home currency is defaulted) so that the customer can choose his currency choice   
                  5. System should allow user at any moment to change the Contact and based on that other fields should be auto updated
       
         Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
          And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       And User selects the Remittance Currency
          And User enters the Transfer amount
          And User should see the Exchangerate and amount to be transferred
           When User selects the benificiary
        Then User should see the Benificiary details populated
        And User should see the Edit link to update beneficiary
        When User selects the Edit link
        And User selects other benificiary
        Then User should see the Benificiary details populated
        And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       And User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User verifies updated contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
     
Examples:
|DataBinding|
|AID_023_020_002|
@SendMoney20
Scenario Outline: AID_023_020 - As a Bank I should be able to give a list of applicable remittance currencies for the user to choose based on the Contact country / corridor eligibility (however home currency is defaulted) so that the customer can choose his currency choice   
                  5. System should allow user at any moment to change the Contact and based on that other fields should be auto updated
       
     Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects cash transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
          And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
       And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
        When User selects the benificiary
        Then User should see the Benificiary details populated
        And User should see the Edit link to update beneficiary
        When User selects the Edit link
        And User selects other benificiary
        Then User should see the Benificiary details populated
        And User selects the purpose of payment
       #And User selects the reason for payment
      And User clicks on Next button
       And User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User verifies updated contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
     
Examples:
|DataBinding|
|AID_023_020_005|
 
@SendMoney20
Scenario Outline: AID_023_020 - As a Bank I should be able to give a list of applicable remittance currencies for the user to choose based on the Contact country / corridor eligibility (however home currency is defaulted) so that the customer can choose his currency choice   
             6. Exchange rate should be as per the latest rate advised for Xpress money transfer
        Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects remittance option <option>
              And User should see the defaulted currency
          And User enters the Transfer amount
                     And User selects the Remittance Currency <Currency>
       And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
      And User selects the Remittance Currency
          And User enters the Transfer amount
          And User should see the Exchangerate and amount to be transferred
              And Customer should be able to logout of the application
          
Examples:
|DataBinding|option|Currency|
|AID_023_020_003|cash pickup|PKR|
|AID_023_020_004|bank transfer|AED|
 
@SendMoney21
Scenario Outline:AID_023_021  - As a customer I should be able to select / change the remitting currency from the list (if applicable) in the remittance transaction so that I can choose the remiting currency - Account Transfer
  1. System should allow the user to change the remitting currency from the list
  2. System should update other fields based on the remitting currency selected by the user
  3. User must be able to select from the list of remitting currency though it is defaulted
  Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
   And User should be able to select the remitting option
   And User should see the list of applicable remittance currency
   When User selects cash transfer option
   And User should see the defaulted currency
And User enters the Transfer amount <RMAmount>
  When User selects the Remittance Currency <RMCurrency>
And User should see the Exchangerate and amount to be transferred
When User selects account transfer option
And User selects the Remittance Currency <RMCurrency>
And User enters the Transfer amount <RMAmount>
And User should see the Exchangerate and amount to be transferred
#Then User should see the cost of the transaction in local currency AED
And User clicks on Next button
And User enters credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
And User should see the available beneficiaries
And User selects the Remittance Currency
And User enters the Transfer amount
And User should see the Exchangerate and amount to be transferred
          
And Customer should be able to logout of the application
Examples: 
|DataBinding|RMCurrency|RMAmount|
|AID_023_021_001|AED|1000|
|AID_023_021_002|PKR|2000|
@SendMoney21
Scenario Outline:AID_023_021  - As a customer I should be able to select / change the remitting currency from the list (if applicable) in the remittance transaction so that I can choose the remiting currency   - Cash Transfer
  1. System should allow the user to change the remitting currency from the list
  2. System should update other fields based on the remitting currency selected by the user
  3. User must be able to select from the list of remitting currency though it is defaulted
 
Given <DataBinding> User should see the Sample transaction page
 And User should see the list of applicable remittance currency
And User should be able to select the remitting option
When User selects cash transfer option
And User should see the defaulted currency
And User enters the Transfer amount <RMAmount>
When User selects the Remittance Currency <RMCurrency>
And User should see the Exchangerate and amount to be transferred
When User selects account transfer option
And User selects the Remittance Currency <RMCurrency>
And User enters the Transfer amount <RMAmount>
And User should see the Exchangerate and amount to be transferred
#Then User should see the cost of the transaction in local currency AED
And User clicks on Next button
And User enters credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
And User should be able to select the remitting option
When User selects cash transfer option
And User should see the defaulted currency
When User selects the Remittance Currency <RMCurrency>
And User enters the Transfer amount <RMAmount>
And User should see the Exchangerate and amount to be transferred
When User selects account transfer option
And User selects the Remittance Currency <RMCurrency>
And User enters the Transfer amount <RMAmount>
And User should see the Exchangerate and amount to be transferred
And User should see the available beneficiaries
 
Examples: 
|DataBinding|RMCurrency|RMAmount|
|AID_023_021_003|AED|1000|
|AID_023_021_004|PKR|2000|
@SendMoney22
Scenario Outline: AID_023_022 - As a customer I should be able to enter the remittance amount based on the remitting currency selected so that I can perform the remittance transaction  
1. User should be able to enter the remittance amount based on the remitting currency and able to proceed with the transaction
 
Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
And User should be able to select the remitting option
When User selects remittance option <option>
And User enters the Transfer amount <RMAmount>
When User selects the Remittance Currency <RMCurrency>
And User should see the Exchangerate and amount to be transferred
And User clicks on Next button
And User enters credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
And User should be able to select the remitting option
And User should see the available beneficiaries
When User selects the Remittance Currency <RMCurrency>
And User enters the Transfer amount <RMAmount>
And User should see the Exchangerate and amount to be transferred
And User should see the list of applicable remittance currency
And User clicks on Next button
And User should see Recipient page
 
Examples:
 |DataBinding|RMCurrency|RMAmount|option|
|AID_023_022_001|AED|1000|Cash Pickup|
|AID_023_022_002|PKR|2000|Account Transfer|
@SendMoney22
Scenario Outline: AID_023_022 - As a customer I should be able to enter the remittance amount based on the remitting currency selected so that I can perform the remittance transaction  
   2. User should be getting error message if he is trying to proceed further with the amount greater than allowed pre-kyc limit
Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
And User should be able to select the remitting option
When User selects remittance option <option>
And User enters the Transfer amount <RMAmount>
And User selects the Remittance Currency <RMCurrency>
And User should see the Exchangerate and amount to be transferred
And User clicks on Next button
And User enters credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
And User should be able to select the remitting option
And User should see the available beneficiaries
When User selects the Remittance Currency <RMCurrency>
And User enters the Transfer amount <RMAmount>
And User should see the Exchangerate and amount to be transferred
And User clicks on Next button
Then User should see an errormessage for KYC
Examples: 
|DataBinding|RMCurrency|RMAmount|option|
|AID_023_022_003|AED|10000000|Cash Pickup|
|AID_023_022_007|PKR|2000|Account Transfer|
@SendMoney62
Scenario Outline:AID_023_062 - As a customer I should be able to see the current balance of the wallet as well as account transactions so that I know the movement of money in my account
1. System should display the account balance for the RMT account on the account summary section
2. System should display the account balance in the send money section on selecting the RMT account
3. System should debit the account once the remitance transaction is submitted successfully
 
      Given <DataBinding> User should see the Sample transaction page
       And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
                 And User selects the Remittance Currency   
         And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      And User clicks on Next button
       Then User should see the instant payment screen
       # And System should display the account balance in RakWallet account
        When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
       When User click on confirm Button
      Then User should see transaction successful message        
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
         
     
Examples:
|DataBinding|
|AID_023_062_001|
@SendMoney60
Scenario Outline:AID_023_060 - As a bank I want to auto save all the beneficiaries for which customer has send money so that he does not need to add it again
               1. System should auto save all the beneficiary when performing remittance.
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User selects the Remittance Currency
          And User enters the Transfer amount
         And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
       When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
    
Examples:
|DataBinding|
|AID_023_060_001|
@SendMoney61
Scenario Outline: AID_023_061 - As a bank, I should be able to stop customer from making payment if he has insufficient balance
         2. System should display an 'error message' if the user tries to perform remittance more than the available balance in account
Given <DataBinding> User should see the Sample transaction page
And User should see the list of applicable remittance currency
And User should be able to select the remitting option
When User selects remittance option <option>
And User enters the Transfer amount <RMAmount>
And User selects the Remittance Currency <RMCurrency>
And User should see the Exchangerate and amount to be transferred
And User clicks on Next button
And User enters credentials to Login
And customer clicks on Signin Button
Then Customer should see his home page
And User should be able to select the remitting option
And User should see the available beneficiaries
And User should see the list of applicable remittance currency
When User selects the Remittance Currency <RMCurrency>
And User enters the Transfer amount <RMAmount>
And User should see the Exchangerate and amount to be transferred
And User clicks on Next button
Then User should see an errormessage for less balance
Examples:
|DataBinding|RMCurrency|RMAmount|option|
|AID_023_061_001|INR|15000|Cash Pickup|
|AID_023_061_002|INR|15000|Account Transfer|
 
@SendMoney34
Scenario Outline: AID_023_034 - As a bank I want to display the bank branch details on the remittance page based on the branch / bank selection done so that I can continue with my remittance  
     1. System should display the bank branch details on the remittance page based on the branch / bank selection done by the user
     2. User should be anytime allowed to click search again and make a new search , based on that the values should be re-populated
     3.User should be able to submit transaction for any POP / Reason as pr BAU
 
   Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
          And User selects the Remittance Currency
           And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
    When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
    When User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
     When User selects the purpose of payment
       And User clicks on Next button
       Then User should see the instant payment screen
              And User should see the available Wallet balance
      When User selects the payment option
              Then User should see the Bank details readonly screen
      ##Then User should see the OTP screen
      ##When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
        Examples:
       |DataBinding|
              |AID_023_034_001|
@SendMoney35
Scenario Outline:  AID_023_035   - As a customer I want to click on the proceed / continue option to land on the preview screen in the make a remittance screen so that I can review the transaction and submit   
    1. User should be able to click on proceed / Continue option to view the entered values in read only format before transaction submission
  
   Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
           And User selects the Remittance Currency
           And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
     When User selects the purpose of payment
       And User clicks on Next button
       Then User should see the instant payment screen
              And User should see the available Wallet balance
      When User selects the payment option
              Then User should see the Bank details readonly screen
      ##Then User should see the OTP screen
      ##When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_035_001|
@SendMoney35
Scenario Outline: AID_023_035 -As a customer I want to click on the proceed / continue option to land on the preview screen in the make a remittance screen so that I can review the transaction and submit  
           2. User should be able to go back and make changes (including change of corridor , bank details etc)
 
   Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
                 And User selects the Remittance Currency
           And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks back option
       And User selects account transfer option
       And User selects the Remittance Currency
       And User enters the Transfer amount
       And User clicks on Next button
       Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       #And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_035_002|
@SendMoney35
Scenario Outline: AID_023_035 -As a customer I want to click on the proceed / continue option to land on the preview screen in the make a remittance screen so that I can review the transaction and submit  
             3. User should not be allowed to proceed further if there is any mandatory fields not updated
 
  Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
         And User enters the Transfer amount
                 And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks back option
       And User selects account transfer option
       And User selects the Remittance Currency
       And User enters the Transfer amount
       And User clicks on Next button
       Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
   And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_035_003|
@SendMoney35
Scenario Outline: AID_023_035 -As a customer I want to click on the proceed / continue option to land on the preview screen in the make a remittance screen so that I can review the transaction and submit  
 
     4. User should not be allowed to proceed further if there is fields level discrepancy
 
  Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       And User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks back option
       And User selects account transfer option
       And User selects the Remittance Currency
       And User enters the Transfer amount
       And User clicks on Next button
       Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_035_004|
@SendMoney35
Scenario Outline: AID_023_035 -As a customer I want to click on the proceed / continue option to land on the preview screen in the make a remittance screen so that I can review the transaction and submit  
 
5. User should get appropriate error message if the mandatory fields are not filled
 
  Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
                 And User selects the Remittance Currency
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       And User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks back option
       And User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User clicks on Next button
       Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
    And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_035_005|
@SendMoney36
Scenario Outline: AID_023_036 - As a Bank I want the customer to review (read only) the remittance transaction on the preview screen before submission so that any wrong / incorrect transactions can be avoided
1. User should be able to click on proceed / Continue option to view the entered values in read only format before transaction submission
2. User should be able to go back and make changes (including change of corridor , bank details etc)
3. User should not be allowed to proceed further if there is fields level discrepancy
4. User should get appropriate error message if the mandatory fields are not filled
 
    Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
          And User enters the Transfer amount
           And User selects the Remittance Currency
           And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       And User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       And User clicks back option
       And User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User clicks on Next button
       Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
      And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
       Examples:
|DataBinding|
|AID_023_036_001|  
@SendMoney36
Scenario Outline: AID_023_036 -  As a Bank I want the customer to review (read only) the remittance transaction on the preview screen before submission so that any wrong / incorrect transactions can be avoided
 
3. User should not be allowed to proceed further if there is fields level discrepancy
4. User should get appropriate error message if the mandatory fields are not filled
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       And User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks back option
       And User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User clicks on Next button
       Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_036_002|
@SendMoney37
Scenario Outline: AID_023_037 - As a customer I want to click on the BACK / EDIT option edit the transaction details on the preview screen so that if any incorrect details can be corrected
1. User should be able to go back and make changes (including change of corridor , bank details etc)
2. User should not be allowed to proceed further if there is fields level discrepancy
3. User should get appropriate error message if the mandatory fields are not filled
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
      And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       And User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
      And User clicks back option
       And User selects account transfer option     
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User clicks on Next button
       Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
    And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_037_001|         
@SendMoney38
Scenario Outline: AID_023_038 -  As a customer I want to submit the remittance transaction after final review so that I can perform remittance to the beneficiary
1. User should be able to submit the transaction once the review is completed
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
       When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
   Examples:
|DataBinding|
|AID_023_038_001|   
#@SendMoney
#Scenario Outline:  AID_023_047 - As a Bank I want the remittance transaction to mandate with 2FA based on the transaction amount so that the additional level of authentication available for high value transactions
#1. System should allow the user to Authenticate with Face ID if he is NTB Customer and transaction submitted more than the OTP Limit
#2. System should allow the user to Authenticate with Face ID if he is RMT Only customer but without DB Credentials and trying to submit transaction more than the OTP Limit
#3. System should allow transaction submission based on the successful match of the face scanned during transaction with the facial captured during On-boarding (based on scoring parameter)
#4. System should allow not transaction submission based on the match result of the face scanned during transaction with the facial captured during On-boarding (based on scoring parameter)
#5. System should display <respective screen message> on successful face matching
#6. System should display <respective screen message> on failure face matching
#7. System should maintain backend option / Parameter in Admin or respective system to Manage Face ID (i.e Enable/Disable face ID for the user / Bank level)
#8. System should display hyperlink of HTML to help user understand the Face ID Authentication
#9. System should not allow the user to proceed with transaction submission with Face ID if user's transaction is blocked due to incorrect attempts in DB
#10. System should not allow the user to proceed with transaction submission with Face ID if user's transaction is blocked due to incorrect attempts in RMT
#11. System should not allow the user to proceed with transaction submission with Face ID if user's transaction from Admin
#12. System should provide retry attempts if the facial Capture is not successful (due to env issue etc)
#13. System should be able to match successfully if the same person is scanning but the below differences were observed
#a.Facial Captured during On-Boarding is taken <n> years back and Image captured during transaction submission for the user is having different face features (Eye brow /colour , scar , ornaments ,Skin Colour)
#b.Facial Captured during On-Boarding is not having beard and Image captured during transaction submission is having beard
#c.Facial Captured during On-Boarding is having beard and Image captured during transaction submission is not having beard
#d.Facial Captured during On-Boarding is not having Moustache and Image captured during transaction submission is having Moustache
#e.Facial Captured during On-Boarding is having Moustache and Image captured during transaction submission for the user is not having Moustache
#f.Facial Captured during On-Boarding and Image captured currently having different Hair style
#g.Facial Captured during On-Boarding and Image captured currently having different photo features (brightness ,contrast ,Light etc)
#h.Facial Captured during On-Boarding and Image captured currently having different attire / Garment etc
#i.Facial Captured during On-Boarding and Image captured currently having different face direction (may be facial capture is tilted at an angle)
#j.Facial Captured during On-Boarding and Image captured at very different timeline / age (On-boarding might have been done <n> valid years back).
#k.Facial Captured during On-Boarding and Image captured currently having different positions or cropped
#l.Facial Captured during On-Boarding and Image captured currently having combination of above differences (i.e garments , face features , Lighting , attire etc)""
#14. System should be authorise transaction if it is NOT same person (i.e Face used during transaction belong to person A and Face captured during on-boarding belong to Person B)
#15. System should be able to identify the below mismatch successfully if it is NOT same person (i.e Facial Captured during onboarding belong to person A and Face being captured for transaction belong to Person B)
#a.Facial Captured during On-Boarding is taken <n> years back and Image captured during transaction submission for the user is having different face features (Eye brow /colour , scar , ornaments, Skin Colour)
#b.Facial Captured during On-Boarding is not having beard and Image captured during transaction submission for the user is having beard
#c.Facial Captured during On-Boarding is having beard and Image captured during transaction submission for the user is not having beard
#d.Facial Captured during On-Boarding is not having Moustache and Image captured during transaction submission for the user is having Moustache
#e.Facial Captured during On-Boarding is having Moustache and Image captured during transaction submission for the user is not having Moustache
#f.Facial Captured during On-Boarding and Image captured currently having different Hair style
#g.Facial Captured during On-Boarding and Image captured currently having different photo features (brightness ,contrast ,Light etc)
#h.Facial Captured during On-Boarding and Image captured currently having different attire / Garment etc
#i.Facial Captured during On-Boarding and Image captured currently having different face direction (may be facial capture is tilted at an angle)
#j.Facial Captured during On-Boarding and Image captured at very different timeline / age
#k.Facial Captured during On-Boarding and Image captured currently having different positions or cropped
#l.Facial Captured during On-Boarding and Image captured currently having combination of above differences (i.e garments , face features , Lighting , attire etc)""
#16. System should not accept Facial as valid if user shows a photocopy of a user's face or from a screen
#17. System should display on screen message if system could not identify / Sense a face (blank capture is not allowed)
#18. System should have an option to enable refresh and re-capture Face ID anytime because for a scenario where User did On-boarding in 2018 , then we cannot use that Face ID forever to authenticate transaction.
#19. System should allow Face ID authorisation for all countries applicable as part of Xpress Money (if the limit is exceeded)
#20. System should allow Face ID authorisation for all currencies applicable as part of Xpress Money (if the limit is exceeded)
#21. System should allow Face ID authorisation for Cash Pickup and Accounts transfer transactions (if the limit is exceeded)
#22. System should allow Face ID authorisation for all mode of payments (from RAK Account , RMT Account , Card etc)
#23. System should allow the user to enter Offline Token if he is existing Customer registered for 2FA in DB2
#24. System should re-direct the user to DB  for 2FA Registration if he is existing RAK Customer with DB Credentials
#25. System Should request for 2FA authorisation based on cumulated limit (applicable or not to be discussed)
#26. System should lock 2FA if the user exceeded more than defined incorrect attempts
#27. System should utilize 2FA based on his Retail registration of 2FA in DB (not SME)
#28. User should receive 2FA Registration message as alert
#29. System should block transaction submission in RMT and DB if the 2FA is blocked from DB
#30. System should block transaction submission in RMT and DB if the 2FA is blocked from RMT
#31. System should be able identify if the 2FA was blocked from DB or RMT
#32. System should update the user to 2FA if the user was using Face ID in RMT and later acquired 2FA in DB
#33.User should be able to generate Raktoken from DB and use it in RMT in the same session (session should not get disconnected)
#34.System should send Locked SMS/Email if the user have locked his 2FA in RMT app
#35.System should allow the user to use the same generate token in both DB & RMT (Eg. If user generated 1234 and used it in DB , the same cannot be re-used in RMT)
#36.User should get appropriate message if user have already locked his token and trying to submit transactions in RMT
#37. User should get appropriate message on screen once token is locked
#38. User should be able to register for 2FA from DB and can continue his transaction in RMT (if the session time out window is not expired)
#39. System should display hyperlink of HTML as in Production to help user understand the 2FA token registration / Generation
#41. System should mask the number entered in RAK Token Field
#42.User should not be able authorise transaction with 2FA if the he has been de-registered by Batch De-registration process
#43.User should not be able authorise transaction with 2FA if the he has been de-registered from Admin
#44.User should not be able authorise transaction with 2FA if the he has been de-registered from DB
 
      #  Given <DataBinding> Customer launches Login screen
      #  When User selects account transfer option
       # And User selects the Remittance Currency
        #And User enters the Remittance amount
      #  And User enters the Transfer amount
       # And User clicks on Next button
       #And User enters credentials to Login
      #      And customer clicks on Signin Button
      #      Then Customer should see the initial transaction page
      #      When User clicks on Next button
      #      Then User should see Recipient page
     #       When User enters Firstname
     #       And User enters Lastname
      #      And User enters Middlename
     #       And User enters Nickname
       #And User enters BankName
     #       And User selects the purpose of payment
      #And User selects the reason for payment            
      #      And User clicks on Next button
      #      Then User should see the instant payment screen
      #  When User selects the payment option
      #  Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
      #  And User click on confirm Button
      #  Then User should see transaction successful message     
      #And Customer should be able to logout of the application
#Examples:
#|DataBinding|
#|AID_023_047_001|
@SendMoney31
Scenario Outline: AID_023_050 - As a Bank I want the remittance transactions are routed through the compliance and AML queue so that the Bank controls measures set at remittnace transaction are met     
1. System should route the transaction through compliance and AML queue as per the exiting process
2. System should display the transaction status as success in history list until the transaction is cleared from compliance and AML queue and processed successfully
 
     Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
       And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       # And System should route the transaction through compliance and AML queue as per the exiting process
         And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_050_001|
@SendMoney32
Scenario Outline:  AID_023_051   - As a Bank I want the customer to register for 2FA (first time) with valid XXXXX credentials so that the Bank set authentication level is not compromised
1. System should allow the user to register for 2FA if the user is transaction limit is exceeding the 2FA Limit
2. Users 2FA registration in RMT should also be applicable for DB (but where Token will be generated?  to be discussed)
3. System should display error message if there is already an existing seed available in the device belonging to other user
4. System should directly ask only for RAK Token if the user is already registered for 2FA in other device
 
        Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
       And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_051_001|
 
@SendMoney33
Scenario Outline: AID_023_055 -  As a customer I want to debit by credit/ debit card and send money instantly while performing a transaction
1. System should have an option to send money with 'Credit card' or 'Debit Card'
2. System should have an option to capture the credit card details through the hologram
3. System should navigate to the respective bank portal through payment gate way while performing send money through Credit card 
4. System should navigate to the respective bank portal through payment gate way while performing send money through debit card 
5. System should perform the transaction instantly while performing through Credit card
6. System should perform the transaction instantly while performing through debit card
7. System should display a 'success message' while the transaction is successful
8. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
9.System should display the card in masked format
 
        Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects creditcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button 
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_055_001|
@SendMoney34
Scenario Outline: AID_023_055 -  As a customer I want to debit by credit/ debit card and send money instantly while performing a transaction
1. System should have an option to send money with 'Credit card' or 'Debit Card'
2. System should have an option to capture the credit card details through the hologram
3. System should navigate to the respective bank portal through payment gate way while performing send money through Credit card 
4. System should navigate to the respective bank portal through payment gate way while performing send money through debit card 
5. System should perform the transaction instantly while performing through Credit card
6. System should perform the transaction instantly while performing through debit card
7. System should display a 'success message' while the transaction is successful
8. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
9.System should display the card in masked format
 
        Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects debitcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button 
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see an errormessage 
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_055_002|
@SendMoney35
Scenario Outline: AID_023_055 -  As a customer I want to debit by credit/ debit card and send money instantly while performing a transaction
1. System should have an option to send money with 'Credit card' or 'Debit Card'
2. System should have an option to capture the credit card details through the hologram
3. System should navigate to the respective bank portal through payment gate way while performing send money through Credit card 
5. System should perform the transaction instantly while performing through Credit card
7. System should display a 'success message' while the transaction is successful
9.System should display the card in masked format
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects creditcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button 
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_055_003|
@SendMoney36
Scenario Outline: AID_023_055 -  As a customer I want to debit by credit/ debit card and send money instantly while performing a transaction
1. System should have an option to send money with 'Credit card' or 'Debit Card'
4. System should navigate to the respective bank portal through payment gate way while performing send money through debit card 
6. System should perform the transaction instantly while performing through debit card
7. System should display a 'success message' while the transaction is successful
9.System should display the card in masked format
 
       Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects debitcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_055_004|
@SendMoney37
Scenario Outline: AID_023_056 - As a rakbank customer I should be able to debit my rakbank account/ card and send money instantly while performing a transaction  
1. System should have an option to send money with RAK bank 'Credit card' or 'Debit Card'
2. System should auto populate the available RAK Bank Credit card in the dropdown.
3. System should auto populate the available RAK Bank Account in the dropdown.
4. System should allow user to select the credit card from the drop down list.
5. System should allow user to select the account number from the drop down list.
6. System should display the available credit card balance on selecting the credit card from the drop down list.
7 System should display the available Account balance on selecting the Account number from the drop down list.
8. System should perform the transaction instantly while performing through RAK Bank Credit card
9. System should perform the transaction instantly while performing through RAK BANK Account
10. System should display a 'success message' while the transaction is successful
11. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
12.System should display the card in masked format
13.System should display only the active cards
14.System should display the available credit limit beneath the drop down post card selection
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects RAKBankcreditcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_056_001|
@SendMoney38
Scenario Outline: AID_023_056 - As a rakbank customer I should be able to debit my rakbank account/ card and send money instantly while performing a transaction  
1. System should have an option to send money with RAK bank 'Credit card' or 'Debit Card'
2. System should auto populate the available RAK Bank Credit card in the dropdown.
3. System should auto populate the available RAK Bank Account in the dropdown.
4. System should allow user to select the credit card from the drop down list.
5. System should allow user to select the account number from the drop down list.
6. System should display the available credit card balance on selecting the credit card from the drop down list.
7 System should display the available Account balance on selecting the Account number from the drop down list.
8. System should perform the transaction instantly while performing through RAK Bank Credit card
9. System should perform the transaction instantly while performing through RAK BANK Account
10. System should display a 'success message' while the transaction is successful
11. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
12.System should display the card in masked format
13.System should display only the active cards
14.System should display the available credit limit beneath the drop down post card selection
 
       Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects RAKBankdebitcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_056_002|
@SendMoney39
Scenario Outline: AID_023_056 - As a rakbank customer I should be able to debit my rakbank account/ card and send money instantly while performing a transaction  
1. System should have an option to send money with RAK bank 'Credit card' or 'Debit Card'
2. System should auto populate the available RAK Bank Credit card in the dropdown.
3. System should auto populate the available RAK Bank Account in the dropdown.
4. System should allow user to select the credit card from the drop down list.
5. System should allow user to select the account number from the drop down list.
6. System should display the available credit card balance on selecting the credit card from the drop down list.
7 System should display the available Account balance on selecting the Account number from the drop down list.
8. System should perform the transaction instantly while performing through RAK Bank Credit card
9. System should perform the transaction instantly while performing through RAK BANK Account
10. System should display a 'success message' while the transaction is successful
11. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
12.System should display the card in masked format
13.System should display only the active cards
14.System should display the available credit limit beneath the drop down post card selection
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects RAKBankcreditcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_056_003|
@SendMoney40
Scenario Outline: AID_023_056 - As a rakbank customer I should be able to debit my rakbank account/ card and send money instantly while performing a transaction  
 
11. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
12.System should display the card in masked format
13.System should display only the active cards
14.System should display the available credit limit beneath the drop down post card selection
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see the card in masked format
        When User selects RAKBankdebitcard
        Then User should see CVV field
        When User enters CVV
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see an errormessage 
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_056_004|
@SendMoney41
Scenario Outline: AID_023_058 - As a bank, I want to save the card used for sending money so that the customer need not type it again
               1. System should have an option to save the card details.
               2. System should retrieve the saved card details when user tries to send money through the saved card
        Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see Add new Credit Card option
        When User selects Add new Credit Card option
        Then User should see verifyCard details page
        When User enters cardNumber
        And User enters cardHoldername
        And User selects Expiry date
        And User enters CVV
        And User selects Save card details
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|AID_023_058_001|
@SendMoney42
Scenario Outline: AID_023_059 -  As a bank I want to allow customer to scan his card and if that fails to enter the details manually so that he can remit funds   
                                 1. System should have an option to manually enter the card details if the card scanning fails
                                 2. System should display below mentioned fields,
- card number
- Card holder Name
- Expiry Date
3. System should have an option to save the card details that are manually entered
       Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see Add new Credit Card option
        When User selects Add new Credit Card option
        Then User should see verifyCard details page
        When User enters cardNumber
        And User enters cardHoldername
        And User selects Expiry date
        And User enters CVV
        And User selects Save card details
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
 
Examples:
|DataBinding|
|AID_023_059_001|
 
@SendMoney43
Scenario Outline: AID_023_023 -As a Bank I want to display the cost of the transaction in the local currency AED based on the remittance amount entered by the customer so that the customer is informed how much his wallet is being debited
               1.System should display the cost of the transaction in local currency AED
               2.System should display the cost based on the remittance amount entered by the user
               3.User should be able to view the cost of transaction and can go back to edit the remittance amount
 
   Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount <amount>
       And User selects the Remittance Currency <currency>
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
      When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      And User should see the edit button to update remittance amount
      When User clicks remittance edit button
      Then User should be able to update the amount
      When User updates the Remittance amount <updatedamount> in review page
      Then User should see the Bank details readonly screen
              #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
      And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|updatedamount|
              |AID_023_023_001|AED|1000|500|
@SendMoney44
Scenario Outline: AID_023_024 - As a customer I should be able to view the current balance avaialble in my wallet account in the remittance flow so that I am informed on my balance and can chose funding if required
    1. System display the current balance(of wallet account) to the user during remittance
    2. User should be provided with option for re-funding the account
    3. User should be directed back to the transaction submission screen post account funding completion
    4 . System should allow the user to continue this flow later if in case balance not sufficient and user awaiting for transfer funds to credit
    5. System should display appropriate message with the option for funding if user trying to submit transaction with insufficient balance
    6. System should populate the balance as soon as the user initiate the transaction 
    7. System should display the balance in valid formatting , currency and currency separator
 
       Given <DataBinding> User should see the Sample transaction page
       And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount <amount>
       And User selects the Remittance Currency <currency>
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
      When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      And User should see the edit button to update remittance amount
       When User clicks remittance edit button
      Then User should be able to update the amount
      When User updates the Remittance amount <updatedamount> in review page
       Then User should see the Bank details readonly screen
              #When User enters the OTP
      When User click on confirm Button
      Then User should see an errormessage  
     
       Examples:
       |DataBinding|currency|amount|
              |AID_023_024_001|AED|1000|
             
@SendMoney45                     
Scenario Outline: AID_023_025 - As a Bank I should be able to display the charges being applicable for the remittance transaction based on the following factors Remittance amount, Corridor and currency so that the customer is informed of the charges applicable
      1.System should display the charges in local currency AED
      2.System should display the charges based on the Remittance amount, Corridor and currency entered by the user
      3.User should be able to view the charges and can go back to edit the fields in remittance submission screen
      4.System should update the values based on the changes made by the user in Remittance amount, Corridor and currency fields
  Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option
       And User enters the Transfer amount <amount>
       And User selects the Remittance Currency <currency>
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
      When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      And User should see the edit button to update remittance amount
       When User clicks remittance edit button
      Then User should be able to update the amount
      When User updates the Remittance amount <updatedamount> in review page
       Then User should see the Bank details readonly screen
              #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_025_001|AED|1000|
@SendMoney46
Scenario Outline: AID_023_026 - As a customer initiating remittance for new contact I should be given the option to enter the following details Beneficiary Name & Nick Name, Beneficiary Bank, Branch details and Bank Identification (IFSC / SWIFT/ Bank code) so that I can enter the beneficiary information
         1.User should be provided an option to enter the following fields for new contact creation (Xpress money beneficiary creation fields also should be taken into consideration)Account transfer ï¿½ Beneficiary First Name , Middle Name , Last Name ï¿½ Nick Name, ï¿½ Beneficiary Bank, ï¿½ Branch details ï¿½ Bank Identification (IFSC / SWIFT/ Bank code)ï¿½ Beneficiary Resident Countryï¿½ Account Number / IBANï¿½ Intermediary Bankï¿½ Countryï¿½ Bank Details option should be displayed along with "Search Bank details" buttonCash Payout:ï¿½ First Nameï¿½ Middle Nameï¿½ Last Nameï¿½ Nicknameï¿½ Country
         2.System should allow only the valid fields in the beneficiary creation (validation can be as per DB in production)
         3.System should mandate the fields as per the Xpress money beneficiary creation in DB
         4.User should not be allowed to proceed further until all the Mandatory fields are updated
         5.Bank Details should be asked only for the below countries : ï¿½ Bangladeshï¿½ Ghanaï¿½ Indiaï¿½ Pakistanï¿½ Thailandï¿½ MOROCCO                                                                                            ï¿½ Nigeria                                                                                        ï¿½ PHILIPPINES                                                                                         ï¿½ THAILAND                              
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       And User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
      And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|
              |AID_023_026_001|  
@SendMoney47       
Scenario Outline: AID_023_027 - As a Bank I want to render the screens / fields for entering beneficiary bank in information based on the country - corridor so that the customer can enter the Bank details
                1.System should update the fields based on the country/corridor selected by the information
                2.System should also displayed fields based on the type of Remitting options (cash or account transfer)
 
       Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_027_001|AED|1000|             
@SendMoney48       
Scenario Outline: AID_023_028 -As a customer I should be able to directly enter the beneficiary bank details on the respective field based on the country - corridor select so that I can enter beneficiary details
 
       1.System should allow the user to enter the contact details during remittance submission based on the country/corridor selected
       2.User should be able to enter/ view the beneficiary bank detail in the fields (provided above) based on the country/corridor selected
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
       And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_028_001|AED|1000|      
@SendMoney49       
Scenario Outline: AID_023_029 - As a  customer I should be able to search and select the beneficiary bank details through IFSC / SWIFT / Bank Code etc search option so that I can select the beneficiary bank details
 
               1. System should allow the user search and select the beneficiary details through IFSC / SWIFT / Bank Code
               2. System should update the values based on the selection from the search result
               3. User should still be allowed to manually enter the values (if he/she knew the IFSC and other details)
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
         And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
       And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_029_001|AED|1000|      
@SendMoney50       
Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
      1. System should allow the user search the bank details by entering 3 letters of the bank name
      2. System should display appropriate error message if user trying to search with less than 3 letters in bank search screen
      3. System should display appropriate error message if the search result does not provide any value
      4. User should be able to select the value from the search result
      5.System should display values only based on the corridor selected
 
   Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # bankName less than 3 characters      
       When User provides BankName <bankLess>
       And User clicks on Next button
       Then User should see an errormessage for bankfield
       # bankName with no resultset    
       When User provides BankName <bankNoResult>
       And User clicks on Next button
       Then User should see an errormessage for zero search results
       # Bank name valid search results
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|bankLess|bankNoResult|message|messageNoResult|
              |AID_023_030_001|AED|1000|AB|SDFGH|||
             
 
Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
      1. System should allow the user search the bank details by entering 3 letters of the bank name     
      4. User should be able to select the value from the search result
      5.System should display values only based on the corridor selected
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # Bank name valid search results
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
      And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|bankLess|bankNoResult|message|messageNoResult|
              |AID_023_030_002|AED|1000|AB|SDFGH|||
             
Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
    2. System should display appropriate error message if user trying to search with less than 3 letters in bank search screen
      3. System should display appropriate error message if the search result does not provide any value
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # Bank name valid search results
    When User enters 2 characters of bank Code
    Then User should see an errormessage for bankfield
      Examples:
       |DataBinding|currency|amount|bankLess|bankNoResult|
              |AID_023_030_003|AED|1000|AB|SDFGH|
 
Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
    2. System should display appropriate error message if user trying to search with less than 3 letters in bank search screen
      3. System should display appropriate error message if the search result does not provide any value
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # Bank name valid search results
    When User enters 2 characters of branch Code
    Then User should see an errormessage for branchfield
      Examples:
       |DataBinding|currency|amount|bankLess|bankNoResult|
              |AID_023_030_004|AED|1000|AB|SDFGH|
 
 
Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
    2. System should display appropriate error message if user trying to search with less than 3 letters in bank search screen
      3. System should display appropriate error message if the search result does not provide any value
 
   Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # Bank name valid search results
    When User enters 2 characters of IFSC Code
    Then User should see an errormessage for ifscfield
      Examples:
       |DataBinding|currency|amount|bankLess|bankNoResult|
              |AID_023_030_005|AED|1000|AB|SDFGH|
 
Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
    2. System should display appropriate error message if user trying to search with less than 3 letters in bank search screen
      3. System should display appropriate error message if the search result does not provide any value
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty      
       Then User should see an errormessage
       # Bank name valid search results
    When User enters more characters of IFSC Code for invalid results message
    And User clicks on Next button
    Then User should see an errormessage for zero search results
      Examples:
       |DataBinding|currency|amount|
              |AID_023_030_006|AED|1000|
             
              Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
    2. System should display appropriate error message if user trying to search with less than 3 letters in bank search screen
      3. System should display appropriate error message if the search result does not provide any value
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty      
       Then User should see an errormessage
       # Bank name valid search results
    When User enters more characters of bank Code for invalid results message
    And User clicks on Next button
    Then User should see an errormessage for zero search results
      Examples:
       |DataBinding|currency|amount|
              |AID_023_030_007|AED|1000|
             
              Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
 
    2. System should display appropriate error message if user trying to search with less than 3 letters in bank search screen
      3. System should display appropriate error message if the search result does not provide any value
 
  Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
    When User selects account transfer option
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty      
       Then User should see an errormessage
       # Bank name valid search results
    When User enters more characters of branch Code for invalid results message
    And User clicks on Next button
    Then User should see an errormessage for zero search results
      Examples:
       |DataBinding|currency|amount|
              |AID_023_030_008|AED|1000|
Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
   1. System should allow the user search the bank details by entering 3 letters of the bank name
    Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty      
       Then User should see an errormessage
       # Bank name valid search results
   When User enters 3 characters of branch Code for valid results message
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
      Examples:
       |DataBinding|currency|amount|
              |AID_023_030_009|AED|1000|
              Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
1. System should allow the user search the bank details by entering 3 letters of the bank name
Given <DataBinding> User should see the Sample transaction page
     And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty      
       Then User should see an errormessage
       # Bank name valid search results
    When User enters 3 characters of bank Code for valid results message
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
      Examples:
       |DataBinding|currency|amount|
              |AID_023_030_011|AED|1000|
              Scenario Outline: AID_023_030 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank name list is displayed to choose from
1. System should allow the user search the bank details by entering 3 letters of the bank name
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty      
       Then User should see an errormessage
       # Bank name valid search results
    When User enters 3 characters of IFSC Code for valid results message
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
      Examples:
       |DataBinding|currency|amount|
              |AID_023_030_010|AED|1000|
             
             
###############                        
             
             
@SendMoney51
Scenario Outline: AID_023_031 - As a  customer I should be able to search the beneficiary bank branch details as a type ahead so that the bank branch name list is displayed to choose from
 
1. System should allow the user search the bank details by entering 3 letters of the bank branch
2. System should display appropriate error message if user trying to search with less than 3 letters in bank branch search screen
3. System should display appropriate error message if the search result does not provide any value for bank branch
4. User should be able to select the value from the search result of bank branch
5.System should display values only based on the corridor selected
5.System should display values only based on the corridor selected
    Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # bankName less than 3 characters      
       When User enters 2 characters of branch Code
       And User clicks on Next button
       Then User should see an errormessage for branchfield
       # bankName with no resultset    
       When User enters more characters of bank Code for invalid results message
       And User clicks on Next button
       Then User should see an errormessage for zero search results
       # Bank name valid search results
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
     
       Examples:
       |DataBinding|currency|amount|branchLess|branchNoResult|message|messageNoResult|
              |AID_023_031_001|AED|1000|AB|SDFGH|||
@SendMoney52
Scenario Outline: AID_023_032 - As a customer I should be able to search the beneficiary bank branch details as a type ahead of the IFSC / SWIFT / Bank name so that Bank branch list is displayed to choose from
 
1. System should allow the user search the bank details by entering 3 letters of the IFSC / SWIFT / Bank name
2. System should display appropriate error message if user trying to search with less than 3 letters in IFSC / SWIFT / Bank name search screen
3. System should display appropriate error message if the search result does not provide any value for IFSC / SWIFT / Bank name
4. User should be able to select the value from the search result of IFSC / SWIFT / Bank name
5.System should display values only based on the corridor selected
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # bankName less than 3 characters      
       When User enters IFSC Code <ifscLess>
       And User clicks on Next button
       Then User should see an errormessage for ifscfield
       # bankName with no resultset    
       When User enters IFSC Code <ifscNoResult>
       And User clicks on Next button
       Then User should see an errormessage for zero search results
       # Bank name valid search results
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|ifscLess|ifscNoResult|message|messageNoResult|
              |AID_023_032_001|AED|1000|AB|SDFGH|||
@SendMoney53       
Scenario Outline: AID_023_033 - As a customer I should be able to select the bank branch details from the Bank Branch search page so that I could continue within my remittance
 
1. User should be able to select the bank branch details from the list of search result displayed
2. System should populate the value in contact creation screen based on the branch details displayed
3. System should allow the user to initiate search again 
 
  Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
    And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User leaves Firstname empty
    Then User should not be allowed to proceed further
    When User enters Firstname
    And User leaves Lastname empty
    Then User should not be allowed to proceed further
    When User enters Lastname
    And User leaves Middlename empty
    Then User should not be allowed to proceed further
    When User enters Middlename
    And User leaves Nickname empty
    Then User should not be allowed to proceed further
    When User enters Nickname
    And User leaves AccountNumber empty
    Then User should not be allowed to proceed further
    Then User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User leaves BankName empty
       And User leaves Branchname empty
       Then User should see an errormessage
       # Bank name valid search results
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    # Bank name valid search results with search again
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_033_001|AED|1000|
@SendMoney54
Scenario Outline: AID_023_039 - As a Bank I want to accept and acknowledge the customer transaction with success message and reference number so that the customer is informed about the transaction and help full in tracking
 
1. System should accept user's transaction submission with the success message and reference number if the transaction is successfully submitted and User should be able to receive SMS alert to his registered Mobile Number for Cash pickup with PIN reference on successful RAKMoney Cash pickup Transfer
2. System should not allow the user to go back from the success screen to editable screen
3. System should have a screen / Module to view the transaction with reference number generated
4. System should send alert to preference selected by the user
 
    Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
   And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_039_001|AED|1000|      
@SendMoney55       
Scenario Outline: AID_023_040 - As a Bank I want to inform the customer with failure message with valid exception if the transaction submission fails at my end so that the customer is informed on the transaction status
 
1.System should display a failure message , reference number & valid exception if the transaction is failed during submission
2. System should not allow the user to go back from the failure screen to editable screen
3. System should have a screen / Module to view the transaction with reference number generated
 
   Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see an errormessage     
    And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_040_001|AED|1000|      
@SendMoney56       
Scenario Outline: AID_023_041 - As  a Bank I want to debit the customer wallet account equivalent to the Remtitance transaciton + Charges so that the remittance transaction is processed sucessfully
 
1. System should debit the customer wallet account equivalent to the Remittance transaction + Charges once transaction is processed successfully
2. System should not debit the customer wallet for failure transactions
3. System should update the Wallet balance spontaneously post transaction submission , so that if user initiate transaction again he/she should get latest balance
4. User should be able to see the latest balance (update) if he navigates to transaction submission / Dashboard
 
     Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User clicks on Next button
    Then User should see Recipient page
    When User enters Firstname
    And User enters Lastname
    And User enters Middlename
    And User enters Nickname
    And User enters AccountNumber
    And User clicks Locate bank
    Then User should see Bank Branch page
       When User provides BankName
    And User enters Branchname
    And User clicks on Next button
    Then User should see the search results and seeAll button enabled
    When User Clicks see all option
    And User selects the respective bank
    Then User should be navigated to Recipient page with datapopulated in bankName field
       When User leaves the purpose of payment empty
       Then User should not be allowed to proceed further
       When User selects the purpose of payment
       And User clicks on Next button
     Then User should see the instant payment screen
       And User should see the available Wallet balance
    When User selects the payment option
       Then User should see the Bank details readonly screen
    ##Then User should see the OTP screen
    ##When User enters the OTP
    When User click on confirm Button
    Then User should see transaction successful message   
      And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_041_001|AED|1000|
@SendMoney57              
Scenario Outline: AID_023_042 - As a Bank I want the customer to choose the Reason / POP for the remittance transaction so that the POP is captured correctly  for the remittance transaction
 
1.User should be able to choose the Reason / POP for the remittance transaction
2.System should update the Reason / POP in the surround system based on userï¿½s selection
3.System should have the reason / POP fields configurable for later update from bank
 
       Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
       Examples:
       |DataBinding|currency|amount|
              |AID_023_042_001|AED|1000|
@SendMoney58
Scenario Outline: AID_023_043 - As a Bank I want the remittance transaction to be validated against the Pre-KYC limits so that the control is set for PreKYC customer not to cross the limits
 
              1. User should not be allowed to submit transaction more than Pre-KYC Limit
              2. System should displayed appropriate message if user is trying to submit transaction more than the Pre-KYC limit
              3. System should have the Pre-KYC limits configurable for any further change from bank
              4. System should validate the customerï¿½s remittance transaction against his available pre-kyc limit and appropriate message should be displayed
      
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button      
       Then User should see an errormessage for KYC
      And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_043_001|AED|1000|
@SendMoney59       
Scenario Outline: AID_023_044 - As a Bank I want the remittance transaction to be validated against  the Full KYC limits so that the control is set for Full KYC customer not to cross the limits
 
1. User should not be allowed to submit transaction more than Full-KYC Limit (if full KYC is completed)
2. System should displayed appropriate message if user is trying to submit transaction more than the Full-KYC Limit (if full KYC is completed)
3. System should have the Full-KYC limits configurable for any further change from bank
4. System should validate the customerï¿½s remittance transaction against his available Full-kyc limit and appropriate message should be displayed if user exceeding    Given <DataBinding> User should see the Sample transaction page
     
    Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button      
       Then User should see an errormessage
      And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_044_001|AED|1000|
@SendMoney60       
Scenario Outline: AID_023_045 - As a Bank I want the remittance transaction to be validated agains the Cash Payout limits at the corridor level so that the customer is restricted not to cross the cashpayout limit
 
1. User should not be allowed to submit transaction more than Cash Payout limits at the corridor level
2. System should displayed appropriate message if user is trying to submit transaction more than limit at corridor level
3. System should have the corridor level limits configurable for any further change from bank
4. System should validate the customerï¿½s remittance transaction against his available KYC limit , as well as  Cash Pay-out for transaction submission (based on that message should be displayed if in-sufficient or limit exceeding) And User should be able to select the remitting option
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button      
       Then User should see an errormessage for KYC
      And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_045_001|AED|1000|
@SendMoney61       
Scenario Outline: AID_023_046 - As a Bank I want the remittance transactions to be valdiated against the overall Remittance limit at the app / user level so that the customer does not exceed the transaction limit set
 
1. User should not be allowed to submit transaction more than overall Remittance limit at the app / user level
2. System should displayed appropriate message if user is trying to submit transaction more than overall Remittance limit at the app / user level
3. System should have the overall Remittance limit at the app / user level configurable for any further change from bank
4. System should validate the customerï¿½s remittance transaction against his overall Remittance limit at the app / user level (based on that message should be displayed if in-sufficient or limit exceeding)
    Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option        
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button       
       Then User should see an errormessage for KYC
      And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_046_001|AED|1000|
@SendMoney62       
Scenario Outline: AID_023_048 - As a customer I want an option to save the Contact whle performing remittance transaction so that the contact is saved for future reuse
 
       1.The user should by default save the contact details when the user does the transaction
       2. System should display the contact in the list if the user saved it during remittance submission
       3. System should auto populate the contact details if it is re-used from the list of contacts
      
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message      
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_048_001|AED|1000|
@SendMoney63       
Scenario Outline: AID_023_049 -As  a Bank I want the duplicate check Beneficiary Name / Nick name and Account number values availalble so that duplicate contact is not created
 
1. User should not be allowed to save the contact with the same contact Nick name and appropriate message should be displayed
2. User should not be allowed to save the contact with the same contact Account number and appropriate message should be displayed
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries           
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters available Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see an errormessage for available nickname
      When User enters Nickname
      And User enters existing AccountNumber
      And User clicks on Next button
      Then User should see an errormessage for available accountnumber
      When User enters Nickname
      And User enters AccountNumber
      And User selects the purpose of payment
      And User clicks on Next button
      Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_049_001|AED|1000|
@SendMoney64       
Scenario Outline: AID_023_052 - As a bank I want to allow customers to start the send money jouney from two places - by looking at the exchange rate or by selecting the most used 3 beneficiaries so that customer can choose which ever way he wants
 
1. System should have an option to send money through two different ways,
- By selecting the Send Button
- By selecting the ""Last 5 "" beneficiary
2. System should allow user to navigate to send money section by selecting the Send Money option
3. System should allow user to navigate to send money section by selecting any one of the most used exchange rate
4. System should display the default updated exchange rate for the selected country combinations
5. System should change the exchange rate accordingly if the user change the country combination
6. System should display the exchange rate of the top 5 country in the 'select country'  drop down value
7. System should not display the exchange rate for other countries which are not displayed in the top 5 country list
8. System should display the exchange rate for the remaining countries other than the top 5 country on selecting them from the country drop down
9. System should display 'Generate charge' option link in the remittance screen
10. System should display the charge for the country selected from the 'to country' drop down
11. System should display the exchange rate only if the user click on the 'generate rate' option
12. wherever the FX rate is mentioned, needs to add it is an indicative rate.
 
    Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option
        #Then User should see the list of applicable remittance currency         
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
        Then User should see the top 5 exchange rate on the RMT Landing page
        Then User selects the top 5 Remittance Currency
      When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_052_001|AED|1000|
@SendMoney65       
Scenario Outline: AID_023_052 - As a bank I want to allow customers to start the send money jouney from two places - by looking at the exchange rate or by selecting the most used 3 beneficiaries so that customer can choose which ever way he wants
 
1. System should have an option to send money through two different ways,
- By selecting the Send Button
- By selecting the ""Last 5 "" beneficiary
2. System should allow user to navigate to send money section by selecting the Send Money option
3. System should allow user to navigate to send money section by selecting any one of the most used exchange rate
4. System should display the default updated exchange rate for the selected country combinations
5. System should change the exchange rate accordingly if the user change the country combination
6. System should display the exchange rate of the top 5 country in the 'select country'  drop down value
7. System should not display the exchange rate for other countries which are not displayed in the top 5 country list
8. System should display the exchange rate for the remaining countries other than the top 5 country on selecting them from the country drop down
9. System should display 'Generate charge' option link in the remittance screen
10. System should display the charge for the country selected from the 'to country' drop down
11. System should display the exchange rate only if the user click on the 'generate rate' option
12. wherever the FX rate is mentioned, needs to add it is an indicative rate.
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
                  And User should be able to select the remitting option
       When User selects account transfer option
       Then User should see the list of applicable remittance currency
       And User enters the Transfer amount <amount>
       And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
      And User should see the top 5 exchange rate on the RMT Landing page
      When User clicks Remittance Currency
        Then User selects the top 5 Remittance Currency
      When User selects beneficiary from the list
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_052_002|AED|1000|
@SendMoney66       
Scenario Outline: AID_023_053 - As a customer if I chose the beneficairy option to send money, the same should happen by taking my existing beneficairy details and just entering information such as amount and purpose of payment so that money can be sent instantly
 
1. System should auto populate beneficiary details on selecting the existing beneficiary
2. System should allow user to enter the amount in the amount field in the send money section
3. System should allow user to select the purpose of payment  in the send money section
4 system should allow user to perform send money successfully by selecting the existing beneficiary
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User selects beneficiary from the list
       And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      And User should see the edit button to update remittance amount
       When User clicks remittance edit button
      Then User should be able to update the amount
      When User updates the Remittance amount <updatedamount> in review page
       Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|updatedamount|
              |AID_023_053_001|AED|1000|500|
@SendMoney67              
Scenario Outline: AID_023_054 - As a customer if I choose the rate option, then the calcuation should happen and the next page should allow me to choose between new beneficiary or existing beneficiary so that I can send money to whom I want
 
1. System should allow user to navigate to send money section by selecting the exchange rate option
2. System should have an option to select the existing beneficiary from the send money section when user chose the rate option
3. System should have an option to select the new beneficiary option from the send money section when user chose the rate option
4. System should allow user to create new beneficiary on selecting the new beneficiary option in send money section
5. System should allow user to send money successfully from the newly created beneficiary
6.System should auto populate beneficiary details on selecting the existing beneficiary
7. System should allow user to enter the amount in the amount field in the send money section
8. System should allow user to select the purpose of payment  in the send money section
9 system should allow user to perform send money successfully by selecting the existing beneficiary
10.User should be able to continue the transaction post beneficiary creation (user should not be requested to start transaction again)
11.Beneficiary creation alert to be sent (under discussion)
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User selects beneficiary from the list
       And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      And User should see the edit button to update remittance amount
       When User clicks remittance edit button
      Then User should be able to update the amount
      When User updates the Remittance amount <updatedamount> in review page
       Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|updatedamount|
              |AID_023_054_001|AED|1000|500|
@SendMoney68       
Scenario Outline: AID_023_054 - As a customer if I choose the rate option, then the calcuation should happen and the next page should allow me to choose between new beneficiary or existing beneficiary so that I can send money to whom I want
 
1. System should allow user to navigate to send money section by selecting the exchange rate option
2. System should have an option to select the existing beneficiary from the send money section when user chose the rate option
3. System should have an option to select the new beneficiary option from the send money section when user chose the rate option
4. System should allow user to create new beneficiary on selecting the new beneficiary option in send money section
5. System should allow user to send money successfully from the newly created beneficiary
6.System should auto populate beneficiary details on selecting the existing beneficiary
7. System should allow user to enter the amount in the amount field in the send money section
8. System should allow user to select the purpose of payment  in the send money section
9 system should allow user to perform send money successfully by selecting the existing beneficiary
10.User should be able to continue the transaction post beneficiary creation (user should not be requested to start transaction again)
11.Beneficiary creation alert to be sent (under discussion)
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      And User should see the edit button to update remittance amount
       When User clicks remittance edit button
      Then User should be able to update the amount
      When User updates the Remittance amount <updatedamount> in review page
       Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
       And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|updatedamount|
              |AID_023_054_002|AED|1000|500|
@SendMoney69
Scenario Outline: AID_023_057 - As a customer I should be able to debit the balance in my RMT account to send money
 
1. System should allow user to send money through the RMT account
2. System should allow user to select the RMT Account to perform the remittance transaction
3. System should not allow user to perform the Remittance transaction more than the account balance
4. System should display a 'success message' if the remittance is successful through the RMT account
5. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|
              |AID_023_057_001|AED|1000|
@SendMoney70
Scenario Outline: AID_023_057 - As a customer I should be able to debit the balance in my RMT account to send money
 
1. System should allow user to send money through the RMT account
2. System should allow user to select the RMT Account to perform the remittance transaction
3. System should not allow user to perform the Remittance transaction more than the account balance
4. System should display a 'success message' if the remittance is successful through the RMT account
5. System should display a 'failure message' while the transaction is unsuccessful due to technical reason
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
       And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see an errormessage
     
       Examples:
       |DataBinding|currency|amount|
              |AID_023_057_002|AED|1000|
@SendMoney71
Scenario Outline: AID_023_020 - As a Bank I should be able to give a list of applicable remittance currencies for the user to choose based on the Contact country / corridor eligibility (however home currency is defaulted) so that the customer can choose his currency choice   
1. System should give a list of applicable remittance currency to user (all the currency mentioned across corridors should be tested)
2. System should allow the user to select the applicable remittance currency as per his choice
3. User must be able to select the remittance currency from the list system displays
4. System should update the related fields (like exchange rate, Converted Amount) as per userï¿½s remitting currency selection
6. Exchange rate should be as per the latest rate advised for Xpress money transfer
 
Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects cash transfer option
              And User enters the Transfer amount
              When User selects the Remittance Currency
              And User should see the Exchangerate and amount to be transferred
              #Then User should see the cost of the transaction in local currency AED
              And User clicks on Next button
              And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      #And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
       |DataBinding|
              |AID_023_020_005|
@SendMoney72
Scenario Outline: AID_023_020 - As a Bank I should be able to give a list of applicable remittance currencies for the user to choose based on the Contact country / corridor eligibility (however home currency is defaulted) so that the customer can choose his currency choice   
                  5. System should allow user at any moment to change the Contact and based on that other fields should be auto updated
       Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
              #And User should see the cost of the transaction in local currency AED
              And User enters amount after load
              And User selects the Remittance Currency
              And User should see the Exchangerate and amount to be transferred  
        And User clicks on Next button
        And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
        And User should see the list of applicable remittance currency
        When User selects the Remittance Currency
              And User enters amount after load
        And User should be able to select the remitting option
        And User should see the Exchangerate and amount to be transferred
        When User selects the benificiary
        Then User should see the Benificiary details populated
        And User should see the Edit link to update beneficiary
        When User selects the purpose of payment
        And User selects the Edit link
        And User selects other benificiary
        Then User should see the Benificiary details populated
        And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       And User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
 
Examples:
|DataBinding|beneficiary|beneficiaryUpdated|
|AID_023_020_006|SEHAR FATIMA|DEVU|
############################################### TEST CODE #################################################################
 
 
 
@SendMoney1112
Scenario Outline: AID_023_020 - As a Bank I should be able to give a list of applicable remittance currencies for the user to choose based on the Contact country / corridor eligibility (however home currency is defaulted) so that the customer can choose his currency choice   
                  5. System should allow user at any moment to change the Contact and based on that other fields should be auto updated
       Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
              And User should be able to select the remitting option
              When User selects account transfer option
              And User should see the defaulted currency
              #And User should see the cost of the transaction in local currency AED
              When User enters the Transfer amount
              And User selects the Remittance Currency            
              And User should see the Exchangerate and amount to be transferred
        And User clicks on Next button
        And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       And User should be able to select the remitting option
        And User should see the Exchangerate and amount to be transferred
        When User selects the benificiary
        Then User should see the Benificiary details populated
        And User should see the Edit link to update beneficiary
        When User selects the purpose of payment
        And User selects the Edit link
        And User selects other benificiary
        Then User should see the Benificiary details populated
        # When User selects the purpose of payment after updating beneficiary
      #And User selects the reason for payment
       When User selects the purpose of payment after update
      And User clicks on Next button after updating beneficiary
      And User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
      When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|TEST_001|
 
@SendMoney123
Scenario Outline: AID_023_054 - As a customer if I choose the rate option, then the calcuation should happen and the next page should allow me to choose between new beneficiary or existing beneficiary so that I can send money to whom I want
 
1. System should allow user to navigate to send money section by selecting the exchange rate option
2. System should have an option to select the existing beneficiary from the send money section when user chose the rate option
3. System should have an option to select the new beneficiary option from the send money section when user chose the rate option
4. System should allow user to create new beneficiary on selecting the new beneficiary option in send money section
5. System should allow user to send money successfully from the newly created beneficiary
6.System should auto populate beneficiary details on selecting the existing beneficiary
7. System should allow user to enter the amount in the amount field in the send money section
8. System should allow user to select the purpose of payment  in the send money section
9 system should allow user to perform send money successfully by selecting the existing beneficiary
10.User should be able to continue the transaction post beneficiary creation (user should not be requested to start transaction again)
11.Beneficiary creation alert to be sent (under discussion)
 
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
       And User should be able to select the remitting option
       When User selects account transfer option       
          And User enters the Transfer amount <amount>
          And User selects the Remittance Currency <currency>
          And User should see the Exchangerate and amount to be transferred
          And User clicks on Next button
           And User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
      And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
      And User enters AccountNumber
      And User enters BankName
      And User selects the purpose of payment
      #And User selects the reason for payment
      And User clicks on Next button
       Then User should see the instant payment screen
      When User selects the payment option
      Then User should see the Bank details readonly screen
      And User should see the edit button to update remittance amount
       When User clicks remittance edit button
      Then User should be able to update the amount
      When User updates the Remittance amount <updatedamount> in review page
       Then User should see the Bank details readonly screen
      #When User enters the OTP
       When User click on confirm Button
      Then User should see transaction successful message
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
      Examples:
       |DataBinding|currency|amount|updatedamount|
              |TEST_001|PKR|1000|500|
@SendMoney11
Scenario Outline: AID_023_058 - As a bank, I want to save the card used for sending money so that the customer need not type it again
               1. System should have an option to save the card details.
               2. System should retrieve the saved card details when user tries to send money through the saved card
      Given <DataBinding> User should see the Sample transaction page
           And User should see the list of applicable remittance currency
        And User should be able to select the remitting option
       When User selects account transfer option    
       And User enters the Transfer amount
       And User selects the Remittance Currency
       And User should see the Exchangerate and amount to be transferred
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
       When User clicks on Next button
       Then User should see Recipient page
      When User enters Firstname
      And User enters Lastname
      And User enters Middlename
      And User enters Nickname
           And User enters BankName
        And User selects the purpose of payment
      #And User selects the reason for payment            
       And User clicks on Next button
       Then User should see the instant payment screen
        When User selects the payment option
        Then User should see Add new Credit Card option
        When User selects Add new Credit Card option
        Then User should see verifyCard details page
        When User enters cardNumber
        And User enters cardHoldername
        And User selects Expiry date
        And User enters CVV
        And User selects Save card details
        And User clicks on Next button       
        Then User should see the Bank details readonly screen
      #Then User should see the OTP screen
      #When User enters the OTP
        And User click on confirm Button
        Then User should see transaction successful message      
        And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
Examples:
|DataBinding|
|TEST_001|
 
 
###########################################################################################
 
@SendMoney
Scenario Outline: AID_023_058 - As a bank, I want to save the card used for sending money so that the customer need not type it again
               1. System should have an option to save the card details.
               2. System should retrieve the saved card details when user tries to send money through the saved card
    Given <DataBinding> User should see the Sample transaction page
           # And User should see the list of applicable remittance currency
                #And User should see the list of applicable remittance currency
    And User should be able to select the remitting option
       When User selects account transfer option 
       And User enters the Transfer amount
        And User selects the Remittance Currency    
    And User should see the Exchangerate and amount to be transferred 
       And User clicks on Next button
       And User enters credentials to Login
    And customer clicks on Signin Button
    Then Customer should see his home page
    And User should see the available beneficiaries
    When User selects beneficiary from the list
    #Then User should see Recipient page
   # When User enters Firstname
   # And User enters Lastname
   # And User enters Middlename
   # And User enters Nickname
   # And User enters AccountNumber
    #  And User enters BankName
    And User selects the purpose of payment
    #And User selects the reason for payment       
    And User clicks on Next button
    Then User should see the instant payment screen
    When User selects the payment option
    Then User should see Add new Credit Card option
    When User selects Add new Credit Card option
    Then User should see verifyCard details page
    When User enters cardNumber
    And User enters cardHoldername
     And User enters CVV
     And User selects Expiry date
    And User selects Save card details
    And User clicks on Next button       
    Then User should see the Bank details readonly screen
    #Then User should see the OTP screen
    #When User enters the OTP
    And User click on confirm Button
    Then User should see transaction successful message   
     And Customer should be able to logout of the application
       When User enters credentials to Login
      And customer clicks on Signin Button
      Then Customer should see his home page
       And User verifies contact in the list of benificiaries
         When User clicks on profile Icon
        And User selects Account Balance & Info
        Then User should see the Available balance
        And System should display the updated account balance in the Rakwallet account
         And Customer should be able to logout of the application
   
Examples:
|DataBinding|
|TEST_001|
