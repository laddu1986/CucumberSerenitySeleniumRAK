Feature: Login Functionality

 @Login
   Scenario: Failure Login for invalid user name
   		Given Customer launches Login screen
        |DataBinding|RMTLogin_Scn_002|
      	When Customer uses credentials to Login
      	And customer clicks on Signin Button
      	Then Customer should see a valid error message
 @Login
   Scenario: Successful LogIn with Valid Credentials

		Given Customer launches Login screen
		|DataBinding|RMTLogin_Scn_001|
		When Customer uses credentials to Login
      	And customer clicks on Signin Button
      	Then Customer should see his home page

