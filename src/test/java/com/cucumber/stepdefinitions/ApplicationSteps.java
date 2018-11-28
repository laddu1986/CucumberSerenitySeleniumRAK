package com.cucumber.stepdefinitions;

import static helpers.Util.setResult;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.cucumber.pageFactory.LoginPage;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.codoid.products.exception.FilloException;
import com.app.functions.CommonFunctions;

import cucumber.api.DataTable;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import helpers.DriverManager;
import helpers.ReportHelper;
import helpers.Utils;

@SuppressWarnings("ALL")
public class ApplicationSteps {

	static Logger log = Logger.getLogger(ApplicationSteps.class.getName());
	private ArrayList<HashMap<String, String>> listDataRows = new ArrayList<HashMap<String, String>>();
	private ArrayList<String> beneficiaries = new ArrayList<String>();
	private ArrayList<String> currencyExchangeRate = new ArrayList<String>();
	private ArrayList<String> currencyExchangeRateTopFive = new ArrayList<String>();
	//private List<WebElement> beneficiaryList=new ArrayList<WebElement>();
	public HashMap<String, String> DataMapRowData = new HashMap<>();
	int beneficiariesnumber=0;
	private String emiratesID=" ";
	private String nationality=" ";
	private String passport=" ";
	private String gender=" ";
	private String updatedBeneficiary="";
	private String selectedBeneficiary="";
	public static String URL = "http://automationpractice.com";
	private WebDriver driver = null;
	private WebDriverWait wait;
	private String nickNameBeneficiary="";
	private String updatednickNameBeneficiary="";
	private ArrayList<String> listScenario_DB = null;
	private String scrnPath = null;
	private ReportHelper hooks;
	private String desc = "";
	public String scenarioTag = "";
	private String deviceID = "";
	private String driverTypeData;
	private String transactionReference="";
	private String exchangeRateLanding = "";
	private String transferAmount = "";
	private String remittanceAmount = "";
	private String exchangeRateConfirmationScreen = "";
	private String totalAmountConfirmationScreen = "";
	private String chargesConfirmationScreen = "";
	private String exceptionMessage="";
	private String firstBeneficiary="";
	private WebElement firstBeneficiaryElement=null;
	private int accountInfoAvailableBalance=0;
	int walletBalance=0;
	@Before
	public void beforeScenario(Scenario scenario) throws Exception {
		ArrayList<String> listScenario_DB = null;
		try {
			listScenario_DB = Utils.getScenariosExecute();
		} catch (FilloException e) {
			e.printStackTrace();
		}
		try {
			listDataRows = Utils.getExcelData(listScenario_DB);
		} catch (FilloException e) {
			e.printStackTrace();
		}
		listDataRows = Utils.addScenarioRunListHashMaps(listDataRows, listScenario_DB);
		scenario.getId();
		desc = scenario.getName();
		long threadId = Thread.currentThread().getId();
		String str = scenario.getSourceTagNames().toString();
		scenarioTag = str.substring(2, str.length() - 1).toString();
		DataMapRowData = Utils.getDataMap(listDataRows, scenarioTag);
		if (DataMapRowData.isEmpty()
				|| DataMapRowData.equals(null)) {
			System.exit(1);
		}
	}    
	@Given("^(.+) User should see the Sample transaction page$")
	public void customer_launches_Login_screen_LANDING(String str) throws Throwable {
		DataMapRowData = Utils.getDataMapBinding(listDataRows, str);
		driver = CommonFunctions.launchBrowser(DataMapRowData);
		CommonFunctions.initPage(driver);
		CommonFunctions.waitWebView(driver);
		Thread.sleep(3000);
		if(DataMapRowData.get("Devicetype").equalsIgnoreCase("IOS_SAUCE")) {
			CommonFunctions.waitElement(driver, LoginPage.rmtPage);
			System.out.println("Reset or relaunch");
			CommonFunctions.resetApp(driver);
		}
		CommonFunctions.waitWebView(driver);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.rmtPage);
		CommonFunctions.captureScreenshot(driver);
		driver.manage().logs().toString();
	}
	@Given("^Customer launches Login screen$")
	public void customer_launches_Login_screen(DataTable dataTable) throws Throwable {
		exceptionMessage=log.toString();
		System.out.println("Exception Message from logger : "+exceptionMessage);

		List<List<String>> data = dataTable.raw();
		DataMapRowData = Utils.getDataMapBinding(listDataRows, data.get(0).get(1));
		driver = CommonFunctions.launchBrowser(DataMapRowData);
		CommonFunctions.initPage(driver);
		CommonFunctions.waitWebView(driver);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.currencyDivider);
		CommonFunctions.captureScreenshot(driver);
		driver.manage().logs().toString();
	}
	@Given("^(.+) Customer launches Login screen$")
	public void customer_launches_Login_screen(String str) throws Throwable {

		DataMapRowData = Utils.getDataMapBinding(listDataRows, str);
		driver = CommonFunctions.launchBrowser(DataMapRowData);
		CommonFunctions.initPage(driver);
		CommonFunctions.waitWebView(driver);
		Thread.sleep(3000);
		if(DataMapRowData.get("Devicetype").equalsIgnoreCase("IOS_SAUCE")) {
			System.out.println("Reset or relaunch");
			CommonFunctions.resetApp(driver);
		}
		CommonFunctions.waitWebView(driver);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.rmtPage);
		CommonFunctions.captureScreenshot(driver);
		driver.manage().logs().toString();
	}
	@Then("^user should see the exchange rate for the selected currency$")
	public void User_should_see_the_exchange_rate_for_the_selected_currency() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		exchangeRateLanding = CommonFunctions.getText(driver, LoginPage.exchangeRateLandingScreen);
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User should be able to select the remitting option$")
	public void User_should_elected_currency_options() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement accountTransfer=CommonFunctions.getXpathWebElement(driver,"//*[contains(text(),'Bank Transfer')]");
		WebElement cashTransfer=CommonFunctions.getXpathWebElement(driver,"//*[contains(text(),'Cash Pickup')]");
		WebElement currencyList=CommonFunctions.getXpathWebElement(driver, "//div[@class='rak-currency__input-footer']//span[@class='symbol']");
		if(accountTransfer.isDisplayed()&&
				cashTransfer.isDisplayed()&&
				currencyList.isDisplayed())
		{
			Assert.assertTrue(accountTransfer.isDisplayed()

					, "Account Transfer is not displayed in the page");
			Assert.assertTrue(cashTransfer.isDisplayed()

					,"Cash Pickup is not displayed in the page");
		}
		WebElement element=CommonFunctions.getXpathWebElement(driver, "//div[@class='rak-currency__input-footer']//span[@class='symbol']");
		exchangeRateLanding = CommonFunctions.getText(driver,element);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects the remitting option as Account transfer$")
	public void User_selects_accoutransfer_option() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		//CommonFunctions.waitElement(driver,LoginPage.currencyDivider);
		CommonFunctions.clickButton(driver, LoginPage.accountTransferOptionPostCurrency);
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User enters Remitting Amount$")
	public void User_enter_the_Remittance_amount() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		exchangeRateLanding = CommonFunctions.getText(driver, LoginPage.exchangeRateLandingScreen);
		CommonFunctions.waitElement(driver, LoginPage.toAmount);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.sendKeysToElement(driver, LoginPage.toAmount, DataMapRowData.get("remittanceamount"));
		transferAmount = CommonFunctions.getAttribute(driver, LoginPage.fromAmountFetch,"ng-reflect-model");
		CommonFunctions.captureScreenshot(driver);
	}
	@When("^User selects Remitting Currency applicable for Account transfer only$")
	public void User_selects_Remitting_Currency_applicable_for_Account_transfer_only() throws Throwable {
		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyButtonPreSelection);
		CommonFunctions.clickButton(driver, LoginPage.remittanceCurrencyButtonPreSelection);
		CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyOption);
		CommonFunctions.currencySelect(driver, LoginPage.remittanceCurrencyOption,DataMapRowData.get("remittancecurrency"));
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.captureScreenshot(driver);
	}
	@When("^Customer uses credentials to Login$")
	public void Customer_uses_credentials_to_Login() throws Throwable {

		CommonFunctions.waitElement(driver, LoginPage.userID);
		CommonFunctions.sendKeysToElement(driver, LoginPage.userID,DataMapRowData.get("UserName"));
		CommonFunctions.sendKeysToElement(driver, LoginPage.password,DataMapRowData.get("Password"));
		CommonFunctions.clickButton(driver, LoginPage.viewPasswordButton);
		CommonFunctions.captureScreenshot(driver);

	}   
	@Then("^User should see the beneficiary added when performing remittance$")
	public void saveBeneficiary() throws Throwable {
		/*CommonFunctions.waitForElementToBeVisible(driver,LoginPage.availableBalanceAccInfo);
Assert.assertTrue((accountInfoAvailableBalance<walletBalance)
&& (accountInfoAvailableBalance!=0 && walletBalance!=0) , "Available balance  is not updated");*/
		System.out.println("verifying beneficiary ");
		WebElement delIcon = null;
		boolean flag=false;
		List<WebElement> beneficiaries=driver.findElements(By.xpath("//*[@class='item-wrap']"));
		for(WebElement ele: beneficiaries) {
			WebElement name=ele.findElement(By.xpath("//*[@class='name wrapName']"));
			WebElement nick=ele.findElement(By.xpath("//*[@class='add-info']//*[@class='details']"));
			String nameText=name.getText();
			String nName=nick.getText();
			delIcon=ele.findElement(By.xpath("//*[@class='delete icon icon-md ion-md-trash item-icon']"));
			System.out.println("Beneficiary name : "+nName+" dlete icon is : "+delIcon);
			Assert.assertTrue(nick.isDisplayed(), "Beneficiary's name is displayed");
			Assert.assertTrue(delIcon.isDisplayed(), "Delete Icon on the right hand side of Beneficiary's name is displayed");
			if(nName.toString().toUpperCase().trim().equals(nickNameBeneficiary.toString().toUpperCase().trim())) {
				flag=true;
			}
		}
		Assert.assertTrue(flag , "Beneficiary is not saved/ updated");

	}
	@When("^customer clicks on Signin Button$")
	public void customer_clicks_on_Signin_Button() throws Throwable {       
		CommonFunctions.clickButton(driver, LoginPage.signin);
		CommonFunctions.waitForRMTLoadIcon(driver);
	}
	@And("^User should see the available beneficiaries$")
	public void available_beneficiaries() throws Throwable {

		List<WebElement>beneficiaryList=CommonFunctions.getXpathWebElements(driver,"//*[@class='item item-block item-md']//*[@class='label label-md']");
		for(int i=1;i<=beneficiaryList.size();i++) {
			WebElement element=CommonFunctions.getXpathWebElement(driver, "(//*[@class='item item-block item-md']//*[@class='label label-md'])["+i+"]");
			if(element.isDisplayed()) {
				Assert.assertNotNull(element.getText().toString().toUpperCase().trim(), "Beneficiary is not available : "+beneficiaryList.size());
				beneficiaries.add(element.getText().toString().toUpperCase().trim());
			}
		}     
		//First Beneficiary
		firstBeneficiary=beneficiaries.get(1);
		firstBeneficiaryElement=beneficiaryList.get(1);
	}
	@Then("^Customer should see his home page$")
	public void Customer_should_see_his_home_page() throws Throwable{
		Thread.sleep(1500);
		String str="//*[@class='user-profile']//ion-icon[@aria-label='menu' and @ng-reflect-md='md-menu']";
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement userProfile=CommonFunctions.getXpathWebElement(driver, str);
		Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,userProfile), "Profile button in Home page is not displayed");
		CommonFunctions.captureScreenshot(driver);

	}
	@When("^User clicks on profile Icon$")
	public void userClicksOnProfileIcon() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.userProfileButton);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.clickButton(driver, LoginPage.userProfileButton);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.logOutButton);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects Manage beneficiaries$")
	public void UserselectsManagebeneficiarie() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.manageBeneficiaries);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.beneficiariesScreen);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should see Manage beneficiaries$")
	public void UserselectsManagebeneficiariess() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.manageBeneficiaries);
		CommonFunctions.captureScreenshot(driver);
		Assert.assertTrue(LoginPage.manageBeneficiaries.isDisplayed()&& LoginPage.manageBeneficiaries.isEnabled(),
				"Manage Beneficiaries is not displayed in the page");
	}

	@Then("^User should see 'Manage Payment Cards' button$")
	public void userSelectsAccountBalanfoThen() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.managePaymentOption);
		CommonFunctions.captureScreenshot(driver);
		Assert.assertTrue(LoginPage.managePaymentOption.isDisplayed()&& LoginPage.managePaymentOption.isEnabled(),
				"Manage Payment Cards option is not displayed");

	}

	@Then("^User should see 'Change Password' option$")
	public void userSelectsChangePasswordWhen() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.changePassword);
		Assert.assertTrue(LoginPage.changePassword.isDisplayed(), "Emirates ID field is displayed");
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects Change Password option$")
	public void userSelectsChangePasswordInfoWhen() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.changePassword);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.changePassword);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should navigate to change password section$")
	public void userSelectsChangeWhen() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.currentPassword);
		CommonFunctions.captureScreenshot(driver);
		Assert.assertTrue(LoginPage.currentPassword.isDisplayed(), "Change Password page is displayed");
	}

	@Then("^User should see the fields Current Password,New Password,Confirm Password$")
	public void userSelectsChangePassword() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.currentPassword);
		Assert.assertTrue(LoginPage.currentPassword.isDisplayed(), "CurrentPassword field is displayed");
		CommonFunctions.sendKeysToElement(driver, LoginPage.currentPassword, "Rakbank123");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.newPassword);
		Assert.assertTrue(LoginPage.newPassword.isDisplayed(), "NewPassword field is displayed");
		CommonFunctions.sendKeysToElement(driver, LoginPage.newPassword, "Rakbank321");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.confirmPassword);
		Assert.assertTrue(LoginPage.confirmPassword.isDisplayed(), "NewPassword field is displayed");
		CommonFunctions.sendKeysToElement(driver, LoginPage.confirmPassword, "Rakbank321");
		CommonFunctions.captureScreenshot(driver);
		driver.findElement(By.xpath("//*[@label='CHANGEPWD.PASSWORD']//*[@ng-reflect-color='dark']")).click();
		driver.findElement(By.xpath("//*[@label='CHANGEPWD.NEWPASSWORD']//*[@ng-reflect-color='dark']")).click();
		driver.findElement(By.xpath("//*[@label='CHANGEPWD.CONFIRMPASSWORD']//*[@ng-reflect-color='dark']")).click();
	}

	@When("^User enters Current password (.+)$")
	public void user_enters_current_password(String password) throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.currentPassword);
		LoginPage.currentPassword.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.currentPassword, DataMapRowData.get("Password"));
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User should navigate to confirmation page$")
	public void user_enters_current_password() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.okButtonPwd);
		Assert.assertTrue(LoginPage.okButtonPwd.isDisplayed(), "Confirmation Page is displayed");
		CommonFunctions.clickButton(driver, LoginPage.okButtonPwd);
		//CommonFunctions.captureScreenshot(driver);
	}
	@And("^User enters New password (.+)$")
	public void user_enters_new_password(String newpassword) throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.newPassword);
		LoginPage.newPassword.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.newPassword, newpassword);
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User enters Confirm password (.+)$")
	public void user_enters_confirm_password(String newpassword) throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.confirmPassword);
		LoginPage.confirmPassword.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.confirmPassword, newpassword);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User clicks 'Change Passowrd' button in Change password section$")
	public void userSelectsAccountBalanchen() throws Throwable {

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.changePasswordButton);
		Assert.assertTrue(LoginPage.changePasswordButton.isDisplayed(), "changePasswordButton is displayed");
		CommonFunctions.clickButton(driver, LoginPage.changePasswordButton);
	}

	@When("^User clicks 'Manage Payment Cards' button$")
	public void userSelectsManagePayThen() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.managePaymentOption);
		Assert.assertTrue(LoginPage.managePaymentOption.isDisplayed()&& LoginPage.managePaymentOption.isEnabled(),
				"Manage Payment Cards option is not displayed");

		CommonFunctions.clickButton(driver, LoginPage.managePaymentOption);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.managePaymentHeading);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should see the 'Total Beneficiaries' field under 'Beneficiaries' section$")
	public void UsershoulseetheTotalBeneficiariesfieldunderBeneficiariessection() throws Throwable {
		String totalBeneficiaries = CommonFunctions.getText(driver, LoginPage.totalBeneficiaries);
		CommonFunctions.captureScreenshot(driver);
		if(totalBeneficiaries.isEmpty()) {
			Assert.fail();
		}
	}

	@Then("^User not be able view the Account balance / Info option tab$")
	public void userClicksOnProfile() throws Throwable {
		boolean flag=false;
		try {
			CommonFunctions.waitForElementToBeVisible(driver, LoginPage.accountBalanceInformation);
			CommonFunctions.clickButton(driver, LoginPage.accountBalanceInformation);

			flag=false;
		}catch(Exception e) {
			flag=true;

		}
		Assert.assertTrue(flag, "Account info is not visible / displayed");
	}

	@Then("^User should see Update Personal Info option$")
	public void userClicksOnUpdateProfile() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.updatePersonalInfo);
		Assert.assertTrue(LoginPage.updatePersonalInfo.isDisplayed()&& LoginPage.updatePersonalInfo.isEnabled(),
				"Update Personal Info option is not clickable");
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects Update Personal Info$")
	public void userSelectsAccountBaltest() throws Throwable {
		Assert.assertTrue(LoginPage.updatePersonalInfo.isDisplayed()&& LoginPage.updatePersonalInfo.isEnabled(),
				"Update Personal Info option is not clickable");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.updatePersonalInfo);
		CommonFunctions.clickButton(driver, LoginPage.updatePersonalInfo);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.editPersonalInfo);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should should navigate to Personal Info section$")
	public void userSelectsAccountBalte() throws Throwable {
		Assert.assertTrue(LoginPage.editPersonalInfo.isDisplayed()&& LoginPage.editPersonalInfo.isEnabled(),
				"Edit option in Personal Info option is not clickable");
		CommonFunctions.clickButton(driver, LoginPage.editPersonalInfo);
	}

	@And("^User should see the fields First name,Last name,Gender,nationality,Address,Passport Number,Emirates ID in 'personal Info' section$")
	public void userSelectsAccountBalanceInfoAThen() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.gender);
		Assert.assertTrue(LoginPage.gender.isDisplayed(), "Gender field is displayed");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.nationality);
		Assert.assertTrue(LoginPage.nationality.isDisplayed(), "Nationality field is displayed");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.residence);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.office);
		Assert.assertTrue(LoginPage.residence.isDisplayed(), "Residence Address tab is displayed");
		Assert.assertTrue(LoginPage.office.isDisplayed(), "Office Address Tab is displayed");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.passport);
		Assert.assertTrue(LoginPage.passport.isDisplayed(), "Passport number field is displayed");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.emiratesid);
		Assert.assertTrue(LoginPage.emiratesid.isDisplayed(), "Emirates ID field is displayed");
	}

	@And("^User should see the image of the user in 'personal Info' section$")
	public void userSelectsAccountBaltes() throws Throwable {
		Assert.assertTrue(LoginPage.editImageIcon.isDisplayed()&& LoginPage.editImageIcon.isEnabled(),
				"editImageIcon is not clickable");
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.imagePhoto);
		Assert.assertNotNull( LoginPage.imagePhoto.getAttribute("src").contains(".jpg"),
				"Photo or image is not clickable or viewable");

	}

	@When("^User clicks edit icon on the image$")
	public void userSelectsAccountBalancetext() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.editImageIcon);
		Assert.assertTrue(LoginPage.editImageIcon.isDisplayed()&& LoginPage.editImageIcon.isEnabled(),
				"Update Personal Info option is not clickable");
		CommonFunctions.clickButton(driver, LoginPage.editImageIcon);
		//CommonFunctions.waitForElementToBeVisible(driver,LoginPage.updatePersonalInfo);
	}

	@And("^User should see full name of the user under the image in 'Personal info' section$")
	public void userSelectsAccountBalan() throws Throwable {

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.fullname);
		Assert.assertTrue(LoginPage.fullname.isDisplayed(),
				"Full name Personal Info option is not displayed");
		Assert.assertNotNull(LoginPage.fullname.getText(),
				"Full name Personal Info option is not displayed");
	}

	@When("^User edits the details in 'Personal Info' section$")
	public void userSelectsAccountThen() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.employmentStatus);
		CommonFunctions.clickButton(driver, LoginPage.employmentStatus);
		CommonFunctions.waitElement(driver, LoginPage.employmentOption);
		CommonFunctions.dropDownSelect(driver, LoginPage.employmentOption,"Employed");
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.maritalStatus);
		CommonFunctions.clickButton(driver, LoginPage.maritalStatus);
		CommonFunctions.waitElement(driver, LoginPage.employmentOption);
		CommonFunctions.dropDownSelect(driver, LoginPage.employmentOption,"Single");
	}
	@When("^User clicks Save$")
	public void userSelectsAccountSave() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.savePersonalInfo);
		Assert.assertTrue(LoginPage.savePersonalInfo.isDisplayed()&& LoginPage.savePersonalInfo.isEnabled(),
				"Save button Update Personal Info option is not clickable");
		CommonFunctions.clickButton(driver, LoginPage.savePersonalInfo);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPageGender);//ng-reflect-value
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPageNationality);//ng-reflect-value
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPagePassport);//ng-reflect-value
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPageEmiratesID);//ng-reflect-value
		CommonFunctions.captureScreenshot(driver);
		Assert.assertTrue(LoginPage.saveInfoPageGender.isDisplayed(),"Gender is not Updated");
		Assert.assertTrue(LoginPage.saveInfoPageNationality.isDisplayed(),  "Nationality is not Updated");
		Assert.assertTrue(LoginPage.saveInfoPagePassport.isDisplayed(),"Passport is not Updated");
		Assert.assertTrue(LoginPage.saveInfoPageEmiratesID.isDisplayed(),"Emirates ID  is not Updated");
	}

	@Then("^User should view the updated details under 'personal info' section when user edit the personal details$")
	public void userSelectsAccountSaveOpen() throws Throwable {

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPageGender);//ng-reflect-value
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPageNationality);//ng-reflect-value
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPagePassport);//ng-reflect-value
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveInfoPageEmiratesID);//ng-reflect-value
		CommonFunctions.captureScreenshot(driver);

		Assert.assertTrue(LoginPage.saveInfoPageGender.getAttribute("ng-reflect-value").toString().toUpperCase().trim().equals(gender.toString().toUpperCase()),
				"Gender is not Updated");
		Assert.assertTrue(LoginPage.saveInfoPageNationality.getAttribute("ng-reflect-value").toString().toUpperCase().trim().equals(nationality.toString().toUpperCase()),
				"Nationality is not Updated");
		Assert.assertTrue(LoginPage.saveInfoPagePassport.getAttribute("ng-reflect-value").toString().toUpperCase().trim().equals(passport.toString().toUpperCase()),
				"Passport is not Updated");
		Assert.assertTrue(LoginPage.saveInfoPageEmiratesID.getAttribute("ng-reflect-value").toString().toUpperCase().trim().equals(emiratesID.toString().toUpperCase()),
				"Emirates ID  is not Updated");
		System.out.println("values from UI - edit personal Info saveInfoPageGender : "+ LoginPage.saveInfoPageGender.getAttribute("ng-reflect-value"));
		System.out.println("values from UI - edit personal Info saveInfoPageNationality : "+ LoginPage.saveInfoPageNationality.getAttribute("ng-reflect-value"));
		System.out.println("values from UI - edit personal Info saveInfoPagePassport : "+ LoginPage.saveInfoPagePassport.getAttribute("ng-reflect-value"));
		System.out.println("values from UI - edit personal Info saveInfoPageEmiratesID : "+ LoginPage.saveInfoPageEmiratesID.getAttribute("ng-reflect-value"));
	}

	@When("^User clicks back$")
	public void userSelectsAccountBack() throws Throwable {

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.backbutton);
		Assert.assertTrue(LoginPage.backbutton.isDisplayed()&& LoginPage.backbutton.isEnabled(),
				"Back button option is not displayed");
		CommonFunctions.clickButton(driver, LoginPage.backbutton);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.editPersonalInfo);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User should see the value of number of beneficiaries added in 'Total Beneficiaries' field$")
	public void UsershouldseethevalueofnumberofbeneficiariesaddedinTotalBeneficiariesfield() throws Throwable {
		String totalBeneficiaries = CommonFunctions.getText(driver, LoginPage.totalBeneficiaries);
		CommonFunctions.captureScreenshot(driver);
		beneficiariesnumber = Integer.parseInt(totalBeneficiaries.split(":")[1].trim());
		System.out.println("beneficiariesnumber:"+beneficiariesnumber);
		if(beneficiariesnumber ==0) {
			Assert.fail();
		}
	}

	@And("^User should see the tabs bank,cash under Beneficiaries section$")
	public void UsershouldseethetabsbankcashunderBeneficiariessection() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.bankBeneficiariesTab);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cashBeneficiariesTab);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User clicks on Bank tab$")
	public void UserclicksonbanktabWhen() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.bankTab);
	}

	@When("^User clicks on Cash tab$")
	public void UserclicksoncashtabWhen() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.cashTab);
	}

	@Then("^User should see the fields Name, Bank Name, State, Country under 'Bank' tab in Beneficiaries section$")
	public void UsershouldseethefieldsNameBankNameStateCountryunderBanktabinBeneficiariessection() throws Throwable {
		/*if(CommonFunctions.getText(driver, LoginPage.beneficiaryDetails).isEmpty()) {
Assert.fail();
}*/
		CommonFunctions.captureScreenshot(driver);
		Boolean transactionDescription = CommonFunctions.loopBeneficiaryDetails(driver, LoginPage.appMain);
		if(!transactionDescription) {
			Assert.fail();
		}
	}

	@Then("^User should see an option to delete the beneficiary on clicking the delete icon$")
	public void UsershouldseeanoptiontodeletethebeneficiaryonclickingthedeleteiconunderBanktab() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.deleteBeneficiaryIcon);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects the beneficiary to perform remittance transaction$")
	public void UserselectsthebeneficiaryunderBanktabtoperformremittancetransaction() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.beneficiary);
		CommonFunctions.clickButton(driver, LoginPage.beneficiary);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.selectedBeneficiaryPage);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects the beneficiary to perform remittance transaction (.+)$")
	public void Userselectsthebeneficiarytoperformremittancetransaction(String beneficiary) throws Throwable {
		WebElement beneficiarySelect =driver.findElement(By.xpath("(//page-beneficiaries//*[contains(text(),'"+beneficiary+"')])[1]"));
		CommonFunctions.waitForElementToBeVisible(driver,beneficiarySelect);
		CommonFunctions.clickButton(driver, beneficiarySelect);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.selectedBeneficiaryPage);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects the beneficiary under 'Bank' tab to perform remittance transaction (.+)$")
	public void UserselectsthebeneficiaryunderBanktabtoperformremittancetransaction(String beneficiary) throws Throwable {
		WebElement beneficiarySelect =driver.findElement(By.xpath("(//page-beneficiaries[2]//*[contains(text(),'"+beneficiary+"')])[1]"));
		CommonFunctions.waitForElementToBeVisible(driver,beneficiarySelect);
		CommonFunctions.clickButton(driver, beneficiarySelect);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.selectedBeneficiaryPage);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects the beneficiary under 'Cash' tab to perform remittance transaction (.+)$")
	public void UserselectsthebeneficiaryunderCashtabtoperformremittancetransaction(String beneficiary) throws Throwable {
		WebElement beneficiarySelect =driver.findElement(By.xpath("(//page-beneficiaries//*[contains(text(),'"+beneficiary+"')])[1]"));
		CommonFunctions.waitForElementToBeVisible(driver,beneficiarySelect);
		CommonFunctions.clickButton(driver, beneficiarySelect);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.selectedBeneficiaryPage);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should see the data pre-populated in the related fields$")
	public void addBeneficiary() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.benificiaryAdded);
		String messageTest = CommonFunctions.getText(driver, LoginPage.benificiaryAdded);
		System.out.println(messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
	}

	@When("^User clicks edit button$")
	public void User_selects_cash_option() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.editButtonBeneficiary);
		CommonFunctions.clickButton(driver, LoginPage.editButtonBeneficiary);
	}

	@Then("^User performs remittance transaction to the beneficiary$")
	public void Userperformsremittancetransactiontothebeneficiary() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.purpose);
		CommonFunctions.waitElement(driver, LoginPage.purposeOption);
		CommonFunctions.dropDownSelect(driver, LoginPage.purposeOption,DataMapRowData.get("purpose"));
		CommonFunctions.waitElement(driver, LoginPage.nextButtonBeneficiaryTransaction);
		CommonFunctions.clickButton(driver, LoginPage.nextButtonBeneficiaryTransaction);
		CommonFunctions.waitElement(driver, LoginPage.instantPaymentOption);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.menuSelect(driver, LoginPage.instantPaymentOption,DataMapRowData.get("paymentoption"));
		CommonFunctions.waitForRMTLoadIcon(driver);

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.confirmButton);
		CommonFunctions.captureScreenshot(driver);
		exchangeRateConfirmationScreen = CommonFunctions.getText(driver, LoginPage.exchangeRateConfirmScreen);
		totalAmountConfirmationScreen = CommonFunctions.getText(driver, LoginPage.totalAmountConfirmScreen);
		chargesConfirmationScreen = CommonFunctions.getText(driver, LoginPage.chargesConfirmScreen);
		CommonFunctions.clickButton(driver, LoginPage.confirmButton);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.successMessage);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.clickButton(driver, LoginPage.okButton);
		String transactionMessage = CommonFunctions.getText(driver, LoginPage.transactionMessage);
		String value = transactionMessage.split("ID")[1];
		transactionReference= value.split(" ")[1];
		System.out.println(transactionReference);
		if(transactionReference.contains(")")) {
			transactionReference = transactionReference.substring(0, transactionReference.length()-1);
		}
	}

	@When("^User clicks on delete icon$")
	public void UserclicksondeleteiconunderBanktab() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.deleteBeneficiaryIcon);
	}

	@When("^User clicks on delete button for the beneficiary (.+)$")
	public void UsereMobileBenefi_when(String nameText) throws Throwable {
		//CommonFunctions.waitForElementToBeVisible(driver, LoginPage.infoBeneficiary);
		List<WebElement> listBeneficiaries=driver.findElements(By.xpath("//*[@class='item-wrap']"));
		System.out.println(listBeneficiaries.size());
		for(int i = 1 ; i <=listBeneficiaries.size(); i++) {
			WebElement ele = listBeneficiaries.get(i);
			WebElement name=ele.findElement(By.xpath("(//*[@class='add-info']/h3)["+i+"]"));
			System.out.println(name.getText().toUpperCase());
			if(name.getText().toUpperCase().equals(nameText.toString().toUpperCase())) {
				WebElement deleteicon=ele.findElement(By.xpath("(//*[contains(@class,'delete icon icon')])["+i+"]"));
				Assert.assertTrue(deleteicon.isDisplayed(),
						"Delete Icon is not displayed");

				Assert.assertNotNull(name.getText(),
						"Full Name of Beneficiary text value is not displayed");
				deleteicon.click();
				CommonFunctions.captureScreenshot(driver);
				CommonFunctions.waitForRMTLoadIcon(driver);

				CommonFunctions.captureScreenshot(driver);
				break;
			}
		}
	}

	@Then("^User should be able to delete the beneficiary successfully on clicking delete icon$")
	public void UsershouldbeabletodeletethebeneficiarysuccessfullyonclickingdeleteiconunderBanktab() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.deleteBeneficiaryConfirmButton);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.clickButton(driver, LoginPage.deleteBeneficiaryConfirmButton);
		Thread.sleep(3000);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.totalBeneficiariesPostDeletion);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User should see the decrease in the value of number of beneficiaries in 'Total Beneficiaries' field if the benefeciary is deleted under 'Bank' tab$")
	public void UsershouldseethedecreaseinthevalueofnumberofbeneficiariesinTotalBeneficiariesfieldifthebenefeciaryisdeletedunderBanktab() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.totalBeneficiariesPostDeletion);
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.totalBeneficiariesPostDeletion);
		CommonFunctions.captureScreenshot(driver);
		int beneficiariesReduced = Integer.parseInt(CommonFunctions.getText(driver, LoginPage.totalBeneficiariesPostDeletion).split(":")[1].trim());
		System.out.println("beneficiariesnumberpost deletion:"+beneficiariesReduced);
		System.out.println(beneficiariesnumber-1);
		if(!(beneficiariesReduced == beneficiariesnumber-1)) {
			Assert.fail();
		}
	}

	@When("^User should not be able to see the deleted beneficiary (.+)$")
	public void UsereMobilefi_when(String nameText) throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.totalBeneficiariesPostDeletion);
		List<WebElement> listBeneficiaries=driver.findElements(By.xpath("//*[@class='item-wrap']"));
		for(int i = 1 ; i <= listBeneficiaries.size(); i++) {
			WebElement ele = driver.findElement(By.xpath("(//*[@class='item-wrap'])["+i+"]"));
			WebElement name=ele.findElement(By.xpath("(//*[@class='add-info']/h3)["+i+"]"));
			System.out.println(name.getText().toUpperCase());
			if(name.getText().toUpperCase().equals(nameText.toString().toUpperCase())) {
				Assert.assertFalse(false, "Beneficiary is not Deleted");
				Assert.fail();
				break;
			}
		}
	}

	@Then("^User should see Beneficiaries page$")
	public void UsershoulseetheTotalunderBeneficiariessection() throws Throwable {
		Assert.assertTrue(LoginPage.totalBeneficiaries.isDisplayed()
				,"Beneficiaries page is not displayed ");
		CommonFunctions.captureScreenshot(driver);
	}

	/*
@Then("^User should see the list of beneficiaries$")
public void UsereMobile_and() throws Throwable {
CommonFunctions.waitForElementToBeVisible(driver, LoginPage.infoBeneficiary);
List<WebElement> listBeneficiaries=driver.findElements(By.xpath("//*[@class='add-info']"));
for(WebElement ele: listBeneficiaries) {
WebElement name=ele.findElement(By.tagName("h3"));
WebElement detai=ele.findElement(By.xpath("//*[@class='details']"));
Assert.assertTrue(name.isDisplayed(),
"Full Name of Beneficiary is not displayed");

Assert.assertNotNull(name.getText(),
"Full Name of Beneficiary text value is not displayed");
Assert.assertTrue(detai.isDisplayed(),
"Full Name of Beneficiary is not displayed");

Assert.assertNotNull(detai.getText(),
"Full Name of Beneficiary text value is not displayed");
}

}*/

	@Then("^User should see the list of beneficiaries$")
	public void Usershouldseethelistofbeneficiaries() throws Throwable {
		/*if(CommonFunctions.getText(driver, LoginPage.beneficiaryDetails).isEmpty()) {
Assert.fail();
}*/
		Boolean transactionDescription = CommonFunctions.loopBeneficiaryDetails(driver, LoginPage.appMain);
		if(!transactionDescription) {
			Assert.fail();
		}
	}

	@And("^The 'Available balance' value displayed in the RMT app should match the value available in Core system$")
	public void TheAvailablebalancevaluedisplayedintheRMTappshouldmatchthevalueavailableinCoresystem() throws Throwable {
		String availableBalance = CommonFunctions.getText(driver, LoginPage.availableBalance);
		if(!(availableBalance.split(" ")[1].equalsIgnoreCase(DataMapRowData.get("corebalance")))) {
			Assert.fail("test fail");
		}
	}
	@When("^User clicks on Next button$")
	public void user_clicks_on_next_button() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement element = null;
		Thread.sleep(6000);

		/*try {
CommonFunctions.clickButtonText(driver, "Next");
//CommonFunctions.waitForElementToBeClickable(driver, element);
}catch(Exception e) {*/
		try {
			element=CommonFunctions.getXpathWebElement(driver, "//*//*[contains(text(),'Next')]//parent::span//parent::button");
			if(element.isEnabled()) {
				CommonFunctions.clickButton(driver, element);
				CommonFunctions.waitForRMTLoadIcon(driver);
			}
		}catch(Exception ex) {
			element=CommonFunctions.elementClickable(driver, "//*[@label='REMITTANCEPAGE.NEXT_BUTTON' and contains(text(),'Next')]");
			Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,element),"Next button is not visbile and clickable");
			Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,element), "Next Button is not visible");
			if(element.isEnabled()) {
				CommonFunctions.clickButton(driver, element);
				CommonFunctions.waitForRMTLoadIcon(driver);
			}
		}
		//}
		CommonFunctions.captureScreenshot(driver);

	}

	@Then("^User should see the Bank details readonly screen$")
	public void User_should_see_the_bankDetails_screen() throws Throwable {
		/*try {
System.out.println("inside readonly try block ---  ");
String str="//*[@class='bank-info-list']//*[@class='item-value']";
String info="//*[@class='bank-info-list']//*[@class='item-info']";
List<WebElement> lstRead=driver.findElements(By.xpath(str));
for(int i=0;i<lstRead.size();i++) {
if(CommonFunctions.isElementdisplayed(driver, str)) {
Assert.assertNotNull(driver.findElement(By.xpath("("+str+")["+i+"]")).getText(), "Element value is readable ");
}
}
List<WebElement> infoRead=driver.findElements(By.xpath(info));
for(int i=0;i<infoRead.size();i++) {
if(CommonFunctions.isElementdisplayed(driver, str)) {
Assert.assertNotNull(driver.findElement(By.xpath("("+info+")["+i+"]")).getText(), "Element value is readable ");
}
}

}catch(Exception e) {
System.out.println("inside readonly try block ---  ");
String str="//*[@class='bank-info-list']//*[@class='item-value']";
String info="//*[@class='bank-info-list']//*[@class='item-info']";
List<WebElement> lstRead=driver.findElements(By.xpath(str));
for(int i=0;i<lstRead.size();i++) {
if(CommonFunctions.isElementdisplayed(driver, str)) {
Assert.assertNotNull(driver.findElement(By.xpath("("+str+")["+i+"]")).getText(), "Element value is readable ");
}
}
List<WebElement> infoRead=driver.findElements(By.xpath(info));
for(int i=0;i<infoRead.size();i++) {
if(CommonFunctions.isElementdisplayed(driver, info)) {
Assert.assertNotNull(driver.findElement(By.xpath("("+info+")["+i+"]")).getText(), "Element value is readable ");
}
}

}*/
		WebElement confirm=
				CommonFunctions.getXpathWebElement(driver, "//*[contains(text(),'Edit')]");
		Assert.assertTrue(confirm.isDisplayed(), "ReadOnly page is not displayed");
		Assert.assertTrue(CommonFunctions.getXpathWebElement(driver, "//*[@class='bank-info-list']").isDisplayed(), "ReadOnly page is not displayed");
		System.out.println("Text Message in Read only page : %%%%% "+CommonFunctions.getXpathWebElement(driver, "//*[@class='bank-info-list']").isDisplayed());
		for(WebElement ele:CommonFunctions.getXpathWebElements(driver, "//*[@class='bank-info-list']")) {
			System.out.println("Text Message in Read only page : %%%%% "+ele.getText());
		}
		CommonFunctions.captureScreenshot(driver);

	}
	@Then("^User should see the Login screen to enter Credentials$")
	public void UsershouldseetheLoginscreentoenterCredentials() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.userID);
	}  

	@When("^Customer uses credentials to Login (.+)$")
	public void customer_uses_credentials_to_log(String password) throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.userID);
		CommonFunctions.sendKeysToElement(driver, LoginPage.userID,DataMapRowData.get("UserName"));
		CommonFunctions.sendKeysToElement(driver, LoginPage.password,password);
		CommonFunctions.clickButton(driver, LoginPage.viewPasswordButton);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects Account Balance & Info$")
	public void userSelectsAccountBalanceInfoWhen() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.accountBalanceInformation);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.availableBalanceIcon);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should see the 'IBAN' field under 'Account info' section$")
	public void userSelectsAccountBackIBan() throws Throwable {

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.iBanNumber);
		Assert.assertTrue(LoginPage.iBanNumber.isDisplayed(),
				"iBanNumber is not displayed");
		String iban = CommonFunctions.getText(driver, LoginPage.iBanNumber);
		System.out.println(iban);
	}

	@Then("^User should see the currency along with the amount under the 'Available balance' section$")
	public void userShouldSeeTheCurrencyAlongWithTheAmountUnderTheAvailableBalanceSection() throws Throwable {
		String availableBalance = CommonFunctions.getText(driver, LoginPage.availableBalance);
		if(!(availableBalance.contains("AED"))) {
			Assert.fail("test fail");
		}
	}

	@And("^User should see the 'Available balance' value along with the 2 decimal values$")
	public void UsershouldseetheAvailablebalanceValuealongwiththe2decimalvalues() throws Throwable {
		String availableBalance = CommonFunctions.getText(driver, LoginPage.availableBalance);
		System.out.println(availableBalance);
		System.out.println(availableBalance.split("\\.")[1].length());
		if(!(availableBalance.split("\\.")[1].length()==2)) {
			Assert.fail("test fail");
		}
	}

	@Then("^User should see the valid error <message> to User$")
	public void userShouldSeeTheValidErrorMessageToUser() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println(messageTest);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}

	@Then("^User should see the Transfer history$")
	public void userSelectsAccountBa() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transferHistory);
		CommonFunctions.captureScreenshot(driver);
		Assert.assertTrue(LoginPage.transferHistory.isDisplayed(), "Transfer History link is displayed");
	}

	@When("^User clicks on Transfer history$")
	public void userSelectsAccountBalanceI() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transferHistory);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.clickButton(driver, LoginPage.transferHistory);
	}

	@Then("^User should see Last 10 Transactions$")
	public void userSelectsAccount() throws Throwable {

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transferHistory);
		CommonFunctions.captureScreenshot(driver);
		Assert.assertTrue(LoginPage.transferHistory.isDisplayed(), "Transfer History link is displayed");
		List<WebElement> listBeneficiaries=driver.findElements(By.xpath("//*[@class='list-item ']"));
		//WebElement ele = driver.findElement(By.xpath("//*[@class='list-item ']"));
		for(int i = 1 ; i<= listBeneficiaries.size() ; i++ ) {
			WebElement name=driver.findElement(By.xpath("(//*[@class='info-wrap']//*[@class='title'])["+i+"]"));
			WebElement ref=driver.findElement(By.xpath("(//*[@class='info-wrap']//*[@class='ref'])["+i+"]"));
			WebElement status=driver.findElement(By.xpath("(//*[@class='info-wrap']//*[@class='status']/span)["+i+"]"));
			WebElement currency=driver.findElement(By.xpath("(//*[@class='amount-wrap']//*[@class='flag-wrap']//*[@class='type-single'])["+i+"]"));
			WebElement amount=driver.findElement(By.xpath("(//*[@class='amount-wrap']//*[@class='amount-holder'])["+i+"]"));
			WebElement transferType=driver.findElement(By.xpath("(//*[@class='ico-block']//*[@class='ico-label']/custom-label)["+i+"]"));
			//WebElement detai=ele.findElement(By.xpath("//*[@class='details']"));
			Assert.assertTrue(name.isDisplayed(),
					"Name of beneficiary or Title is not displayed");

			Assert.assertNotNull(name.getText(),
					"Full Name of Beneficiary text value is not displayed");
			Assert.assertTrue(ref.isDisplayed(),
					"Reference Number of Beneficiary is not displayed");

			Assert.assertNotNull(ref.getText(),
					"Reference Number of Beneficiary text value is not displayed");
			Assert.assertTrue(status.isDisplayed(),
					"Status of Beneficiary is not displayed");

			Assert.assertNotNull(status.getText(),
					"Status of Beneficiary text value is not displayed");
			Assert.assertTrue(currency.isDisplayed(),
					"Currency of Beneficiary is not displayed");

			Assert.assertNotNull(currency.getText(),
					"Currency of Beneficiary text value is not displayed");
			Assert.assertTrue(amount.isDisplayed(),
					"Amount Beneficiary is not displayed");

			Assert.assertNotNull(amount.getText(),
					"Amount Beneficiary text value is not displayed");
			Assert.assertTrue(transferType.isDisplayed(),
					"transferType Beneficiary is not displayed");

			Assert.assertNotNull(transferType.getText(),
					"transferType Beneficiary text value is not displayed");
		}

	}


	@Then("^User views filter transaction by Date range$")
	public void userSelectsAccountBalInfo() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.dateFilterButton);
		Assert.assertTrue(LoginPage.dateFilterButton.isDisplayed()&& LoginPage.dateFilterButton.isEnabled(),
				"Date filter button is not displayed");

		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User clicks filter transaction by Date range$")
	public void userSelectsAccountInfo() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.dateFilterButton);
		Assert.assertTrue(LoginPage.dateFilterButton.isDisplayed()&& LoginPage.dateFilterButton.isEnabled(),
				"Date filter button is not displayed");

		CommonFunctions.clickButton(driver, LoginPage.dateFilterButton);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.dateRangeHeading);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User clicks Done in transaction page$")
	public void userSelectsAccBala() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.doneTransaction);
		Assert.assertTrue(LoginPage.doneTransaction.isDisplayed()&& LoginPage.doneTransaction.isEnabled(),
				"Date filter button is not displayed");

		CommonFunctions.clickButton(driver, LoginPage.doneTransaction);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.dateRangeHeading);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User clicks on see Full History$")
	public void UserclicksonseeFullHistory() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.seeFullHistory);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transactionHistory);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should see tabs Show All,Show Dedits and Show Credits$")
	public void UsershouldseetabsShowAllShowDeditsandShowCredits() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.showAllTransactions);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.debitTransactions);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.creditTransactions);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User should see the date filter Icon on the right corner$")
	public void UsershouldseethedatefilterIconontherightcorner() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.dateFilter);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User should see Description of the credit transaction under 'Show all' tab$")
	public void UsershouldseeDescriptionofthecredittransactionunderShowalltab() throws Throwable {
		Boolean transactionDescription = CommonFunctions.loopTransactionDetails(driver, LoginPage.appMain);
		if(!transactionDescription) {
			Assert.fail();
		}
	}

	@And("^User should see Description of the Debit transaction under 'Show all' tab$")
	public void UsershouldseeDescriptionoftheDebittransactionunderShowalltab() throws Throwable {
		Boolean transactionDescription = CommonFunctions.loopTransactionDetails(driver, LoginPage.appMain);
		if(!transactionDescription) {
			Assert.fail();
		}
	}

	@And("^User should see Problem Logging in link$")
	public void UsershouldseeProblemLogginginlink() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.problemSigninin);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User clicks on Problem Logging in link$")
	public void UserclicksonProblemLogginginlinkWhen() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.problemSigninin);
		CommonFunctions.clickButton(driver, LoginPage.problemSigninin);
	}

	@Then("^User should be navigated to 'Recover Credentials' section$")
	public void UsershouldbenavigatedtoRecoverCredentialssection() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.recoverCredentialsPage);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User should see the radio buttons 'I have Forgot my password','I have Forgot my User ID','Mu User ID is blocked' in 'Select what you would like to recover' section$")
	public void UsershouldseetheradiobuttonsIhaveForgotmypasswordIhaveForgotmyUserIDMuUserIDisblockedinSelectwhatyouwouldliketorecoversection() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.forgotPassword);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.forgotUserId);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.userIdBlocked);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects 'My User ID is blocked' radio button$")
	public void UserselectsMyUserIDisblockedradiobutton() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.userIdBlocked);
		CommonFunctions.clickButton(driver, LoginPage.userIdBlocked);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects 'Forgot User ID' radio button$")
	public void UserselectsForgotUsrIDradiobutton() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.forgotUserId);
		CommonFunctions.clickButton(driver, LoginPage.forgotUserId);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User selects 'I have forgot my Password' option$")
	public void UserselectsMyUserIDickedradio() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.forgotPassword);
		CommonFunctions.clickButton(driver, LoginPage.forgotPassword);
	}

	@Then("^User should be able to click Proceed button$")
	public void UsershouldbeabletoclickProceedbutton() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.proceedButtonRecoverCredentials);
	}


	@When("^User clicks Proceed button$")
	public void UserclicksProceedbutton() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.proceedButtonRecoverCredentials);
	}

	@When("^User clicks Proceed button in Recover Credentials Screen$")
	public void UserclicksProceedbuttoninRecoverCredentialsScreen() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.proceedButtonRecoverCredentialsScreen);
	}

	@And("^User should navigate to 'Enable User ID' screen$")
	public void UsershouldnavigatetoEnableUserIDscreen() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.enableUserIdScreen);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should navigate to 'Forgot User ID' screen$")
	public void UsershouldnavigatetoForgotUserIDscreen() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.forgotUserIdScreen);
		CommonFunctions.captureScreenshot(driver);
	}

	@Then("^User should navigate to 'Forgot Password' screen$")
	public void UsershouldnavigatetoForgotPasswordscreen() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.forgotPasswordScreen);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User should see 'Enter Emirates ID number' and 'Enter your registered mobile number' fields$")
	public void UserEmiratesMobile() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.emiratesID);

		Assert.assertTrue(LoginPage.emiratesID.isDisplayed()&& LoginPage.emiratesID.isEnabled(),
				"Emirates ID number field is not displayed");

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.regMobileNumber);
		Assert.assertTrue(LoginPage.regMobileNumber.isDisplayed()&& LoginPage.regMobileNumber.isEnabled(),
				"Registered Mobile number field is not displayed");

	}

	@When("^User enters the registered mobile number in 'Enter your registered mobile number' field in Forgot password Screen$")
	public void UserEmiratesMobile_When() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.regMobileNumber);
		Assert.assertTrue(LoginPage.regMobileNumber.isDisplayed()&& LoginPage.regMobileNumber.isEnabled(),
				"Registered Mobile number field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.regMobileNumber, DataMapRowData.get("mobilenumber"));
	}

	@When("^User enters Emirates ID (.+)$")
	public void user_enters_emirates_id(String data) throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.emiratesID);
		Assert.assertTrue(LoginPage.emiratesID.isDisplayed()&& LoginPage.emiratesID.isEnabled(),
				"Registered Mobile number field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.emiratesID, data);
	}

	@Then("^User should see an error message (.+)$")
	public void UserrecievesanerrormessageContentiftheEmiratesIDenteredisexpired(String str) throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println(messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}

	@Then("^User recieves an error message below Emirates ID field$")
	public void UsererrormessageEmirates() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessageEmiratesID);
		CommonFunctions.captureScreenshot(driver);
		Assert.assertTrue(LoginPage.errorMessageEmiratesID.isDisplayed(),
				"Error message popup is not displayed");

		Assert.assertNotNull(LoginPage.errorMessageEmiratesID.getText(),
				"Error Text message below Emirates ID field is not displayed");

	}

	@When("^User clicks on Latest transactions$")
	public void UserclicksonLatesttransactions() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.latestTransaction);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.seeFullHistory);
		CommonFunctions.captureScreenshot(driver);
	}

	@When("^User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page$")
	public void UsereMeBenefi_and() throws Throwable {
		try {
			CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transferDetails);
		}catch(Exception e) {
			System.out.println(e);
			CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transferHistoryPage);
		}

		//int i=1;
		//while(CommonFunctions.waitForElementToBeVisi(driver,"//*[@class='transaction-body']//div["+i+"]")) {
		String object="//*[@class='transaction-body']//div";
		WebElement ele=driver.findElement(By.xpath(object));
		WebElement element = driver.findElement(By.xpath("//*//div[@class='list-item ']"));
		List<WebElement> listBeneficiaries=ele.findElements(By.xpath("//*//div[@class='list-item ']"));
		System.out.println("dateElement row : "+ele.toString()+" and rows are : "+listBeneficiaries.size());
		for(int i = 1 ; i<=listBeneficiaries.size() ; i++) {
			System.out.println("Transaction row : "+ele.toString()+" and rows are : "+listBeneficiaries.size());
			WebElement name=element.findElement(By.xpath("(//div[@class='info-wrap']//div[@class='title'])["+i+"]"));
			WebElement ref=element.findElement(By.xpath("(//div[@class='info-wrap']//div[@class='ref'])["+i+"]"));
			WebElement status=element.findElement(By.xpath("(//div[@class='info-wrap']//div[@class='status']/span)["+i+"]"));
			WebElement currency=element.findElement(By.xpath("(//div[@class='amount-wrap']//div[@class='flag-wrap']//div[@class='type single'])["+i+"]"));
			WebElement amount=element.findElement(By.xpath("(//div[@class='amount-wrap']//div[@class='amount-holder'])["+i+"]"));
			WebElement transferType=element.findElement(By.xpath("(//div[@class='ico-block']//div[@class='ico-label']/custom-label)["+i+"]"));
			// WebElement detai=ele.findElement(By.xpath("//*[@class='details']"));
			Assert.assertTrue(name.isDisplayed(),
					"Name of beneficiary or Title is not displayed");

			System.out.println("Name in Transfer history : "+name.getText());
			Assert.assertNotNull(name.getText(),
					"Full Name of Beneficiary text value is not displayed");
			Assert.assertTrue(ref.isDisplayed(),
					"Reference Number of Beneficiary is not displayed");

			System.out.println("Reference in Transfer history : "+ref.getText());
			Assert.assertNotNull(ref.getText(),
					"Reference Number of Beneficiary text value is not displayed");
			Assert.assertTrue(status.isDisplayed(),
					"Status of Beneficiary is not displayed");

			System.out.println("Status in Transfer history : "+status.getText());
			Assert.assertNotNull(status.getText(),
					"Status of Beneficiary text value is not displayed");
			Assert.assertTrue(currency.isDisplayed(),
					"Currency of Beneficiary is not displayed");

			System.out.println("Currency in Transfer history : "+currency.getText());
			Assert.assertNotNull(currency.getText(),
					"Currency of Beneficiary text value is not displayed");
			Assert.assertTrue(amount.isDisplayed(),
					"Amount Beneficiary is not displayed");
			System.out.println("Amount in Transfer history : "+amount.getText());
			Assert.assertNotNull(amount.getText(),
					"Amount Beneficiary text value is not displayed");
			Assert.assertTrue(transferType.isDisplayed(),
					"transferType Beneficiary is not displayed");

			System.out.println("Transfer Type in Transfer history : "+transferType.getText());
			Assert.assertNotNull(transferType.getText(),
					"transferType Beneficiary text value is not displayed");
		}

	}

	@When("^User should see Transaction ID, Date, Beneficiary, Transaction type, Transaction amount and Status fields in Transaction history page 2$")
	public void UsereMeBenefi_and2() throws Throwable {
		try {
			CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transferDetails);
		}catch(Exception e) {
			System.out.println(e);
			CommonFunctions.waitForElementToBeVisible(driver, LoginPage.transferHistoryPage);
		}

		//int i=1;
		//while(CommonFunctions.waitForElementToBeVisi(driver,"//*[@class='transaction-body']//div["+i+"]")) {
		String object="//*[@class='transaction-body']//div";
		WebElement ele=driver.findElement(By.xpath(object));
		WebElement element = driver.findElement(By.xpath("//*//div[@class='list-item ']"));
		List<WebElement> listBeneficiaries=ele.findElements(By.xpath("//*//div[@class='list-item ']"));
		System.out.println("dateElement row : "+ele.toString()+" and rows are : "+listBeneficiaries.size());
		for(int i = 1 ; i<=listBeneficiaries.size()/2 ; i++) {
			System.out.println("Transaction row : "+ele.toString()+" and rows are : "+listBeneficiaries.size());
			WebElement name=element.findElement(By.xpath("(//div[@class='info-wrap']//div[@class='title'])["+(i+listBeneficiaries.size()/2)+"]"));
			WebElement ref=element.findElement(By.xpath("(//div[@class='info-wrap']//div[@class='ref'])["+(i+listBeneficiaries.size()/2)+"]"));
			WebElement status=element.findElement(By.xpath("(//div[@class='info-wrap']//div[@class='status']/span)["+(i+listBeneficiaries.size()/2)+"]"));
			WebElement currency=element.findElement(By.xpath("(//div[@class='amount-wrap']//div[@class='flag-wrap']//div[@class='type single'])["+(i+listBeneficiaries.size()/2)+"]"));
			WebElement amount=element.findElement(By.xpath("(//div[@class='amount-wrap']//div[@class='amount-holder'])["+(i+listBeneficiaries.size()/2)+"]"));
			WebElement transferType=element.findElement(By.xpath("(//div[@class='ico-block']//div[@class='ico-label']/custom-label)["+(i+listBeneficiaries.size()/2)+"]"));
			// WebElement detai=ele.findElement(By.xpath("//*[@class='details']"));
			Assert.assertTrue(name.isDisplayed(),
					"Name of beneficiary or Title is not displayed");

			System.out.println("Name in Transfer history : "+name.getText());
			Assert.assertNotNull(name.getText(),
					"Full Name of Beneficiary text value is not displayed");
			Assert.assertTrue(ref.isDisplayed(),
					"Reference Number of Beneficiary is not displayed");

			System.out.println("Reference in Transfer history : "+ref.getText());
			Assert.assertNotNull(ref.getText(),
					"Reference Number of Beneficiary text value is not displayed");
			Assert.assertTrue(status.isDisplayed(),
					"Status of Beneficiary is not displayed");

			System.out.println("Status in Transfer history : "+status.getText());
			Assert.assertNotNull(status.getText(),
					"Status of Beneficiary text value is not displayed");
			Assert.assertTrue(currency.isDisplayed(),
					"Currency of Beneficiary is not displayed");

			System.out.println("Currency in Transfer history : "+currency.getText());
			Assert.assertNotNull(currency.getText(),
					"Currency of Beneficiary text value is not displayed");
			Assert.assertTrue(amount.isDisplayed(),
					"Amount Beneficiary is not displayed");
			System.out.println("Amount in Transfer history : "+amount.getText());
			Assert.assertNotNull(amount.getText(),
					"Amount Beneficiary text value is not displayed");
			Assert.assertTrue(transferType.isDisplayed(),
					"transferType Beneficiary is not displayed");

			System.out.println("Transfer Type in Transfer history : "+transferType.getText());
			Assert.assertNotNull(transferType.getText(),
					"transferType Beneficiary text value is not displayed");
		}

	}
	@When("^User selects cash transfer option$")
	public void User_selects_cash_transfer_option() throws Throwable {

		CommonFunctions.waitForRMTLoadIcon(driver);
		//CommonFunctions.waitElement(driver,LoginPage.currencyDivider);
		WebElement cashpickup=CommonFunctions.getXpathWebElement(driver,"//*[contains(text(),'Cash Pickup')]");
		CommonFunctions.clickButton(driver,cashpickup);
		CommonFunctions.waitForRMTLoadIcon(driver);

	}
	@When("^User selects account transfer option$")
	public void User_selects_account_transfer_option() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement accEle=CommonFunctions.getXpathWebElement(driver, "//*[contains(text(),'Bank Transfer')]");
		Assert.assertTrue(CommonFunctions.isElementdisplayed(driver, accEle), "Bank Transfer is not displayed");
		Assert.assertTrue(accEle.isEnabled()
				,"Bank Transfer is not enabled in the page");
		CommonFunctions.clickButton(driver,accEle);
		CommonFunctions.waitForRMTLoadIcon(driver);
	}

	@When("^User enters credentials to Login$")
	public void user_enters_credentials_to_Login() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.userID);
		Assert.assertTrue(CommonFunctions.isElementdisplayed(driver, LoginPage.userID)
				&&CommonFunctions.isElementdisplayed(driver, LoginPage.password), "Username and password are not visible");
		CommonFunctions.sendKeysToElement(driver, LoginPage.userID,DataMapRowData.get("UserName"));
		CommonFunctions.sendKeysToElement(driver, LoginPage.password,DataMapRowData.get("Password"));
		CommonFunctions.clickButton(driver, LoginPage.viewPasswordButton);
		CommonFunctions.captureScreenshot(driver);
	}   
	@Then("^User should see an errormessage for available nickname$")
	public void user_should_see_an_error_message_nickName() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("NicknameMessage").toString().toUpperCase().trim()), DataMapRowData.get("Message")+" - Error message is not same : - "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@Then("^User should see an errormessage for available accountnumber$")
	public void user_should_see_an_error_message_accountNumber() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("accountMessage").toString().toUpperCase().trim()), DataMapRowData.get("Message")+" - Error message is not same : - "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@And("^User enters existing AccountNumber$")
	public void user_accountnumber_existing() throws Throwable {
		//existingAccountNumber
		if(DataMapRowData.get("remittancecurrency").equalsIgnoreCase("PKR")) {
			LoginPage.ibanNumber.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.ibanNumber,DataMapRowData.get("existingAccountNumber"));
		} else {
			LoginPage.accountNumber.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.accountNumber,DataMapRowData.get("existingAccountNumber"));
		}
	}
	@And("^User selects the top 5 Remittance Currency$")
	public void user_selects_the_remittance_currency_top5(String currency) throws Throwable {
		String topfive=currencyExchangeRateTopFive.get(0).split("=")[0];
		if(DataMapRowData.get("transferoption").equalsIgnoreCase("Cash Pickup")) {
			Thread.sleep(1500);
			CommonFunctions.waitForRMTLoadIcon(driver);
			CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyButton);
			CommonFunctions.clickButton(driver, LoginPage.remittanceCurrencyButton);
			CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyOption);

			CommonFunctions.currencySelect(driver, LoginPage.remittanceCurrencyOption,topfive);
			CommonFunctions.waitForRMTLoadIcon(driver);
			CommonFunctions.captureScreenshot(driver);
		} else if(DataMapRowData.get("transferoption").equalsIgnoreCase("Bank Transfer")) {
			Thread.sleep(1500);
			CommonFunctions.waitForRMTLoadIcon(driver);
			CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyButtonAccountTransfer);
			CommonFunctions.clickButton(driver, LoginPage.remittanceCurrencyButtonAccountTransfer);
			CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyOption);
			CommonFunctions.currencySelect(driver, LoginPage.remittanceCurrencyOption,topfive);
			CommonFunctions.waitForRMTLoadIcon(driver);
			CommonFunctions.captureScreenshot(driver);
		}
	}
	@And("^User clicks Remittance Currency$")
	public void clickCurency() throws Throwable {
		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyButton);
		Assert.assertTrue(LoginPage.remittanceCurrencyButton.isDisplayed()
				&& LoginPage.remittanceCurrencyButton.isEnabled(), "Currency Button option is not available");
		CommonFunctions.clickButton(driver, LoginPage.remittanceCurrencyButton);
		CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyOption);
	}
	@And("^User selects beneficiary from the list$")
	public void selectBeneficiary() throws Throwable {
		CommonFunctions.getObjectBeneficiaryClick(driver,DataMapRowData.get("beneficiary"));
		CommonFunctions.waitForRMTLoadIcon(driver);

		if(CommonFunctions.getXpathWebElement(driver,"//*[@class='selected-beneficiary']//*[@class='item-value']").isDisplayed()) {
			selectedBeneficiary = DataMapRowData.get("beneficiary").toString().toUpperCase().trim();
		}
		System.out.println("Beneficiary selected is  : "+selectedBeneficiary);
	}
	@And("^User clicks on Next button after updating beneficiary$")
	public void user_clicks_on_next_button_update() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.getXpathWebElementClickable(driver, "Next");
		CommonFunctions.captureScreenshot(driver);

	}
	@And("^User selects the purpose of payment after update$")
	public void User_selects_the_purpose_of_payment_update() throws Throwable {
		WebElement purpose=CommonFunctions.getXpathWebElement(driver, "//ion-select[@ng-reflect-name='remittanceModel.selectedPurpos']");
		if(CommonFunctions.isElementdisplayed(driver,purpose)) {
			Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,purpose),
					"Purpose of payment is not visible or displayed ");
			CommonFunctions.clickButton(driver,purpose);
			CommonFunctions.waitForRMTLoadIcon(driver);
			WebElement purposeOption=CommonFunctions.getXpathWebElement(driver, "//button[@ion-button='action-sheet-button']");
			CommonFunctions.dropDownSelect(driver, purposeOption,DataMapRowData.get("purpose"));
		}
	}
	@When("^User verifies other contact in the list of benificiaries$")
	public void benifiaciry_other_verify() throws Throwable {
		boolean flag=CommonFunctions.getObjectBeneficiary(driver,DataMapRowData.get("nickname"));
		Assert.assertTrue(flag, "Beneficiary is not available in the list");
		if(flag) {
			selectedBeneficiary = DataMapRowData.get("Newbeneficiary").toString().toUpperCase().trim();
		}
		System.out.println("Beneficiary selected is  : "+selectedBeneficiary);
	}
	@Then("^User should see an errormessage$")
	public void user_should_see_an_error_message() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("Message").toString().toUpperCase().trim()), DataMapRowData.get("Message")+" - Error message is not same : - "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	} //lessBalanceMessage
	@Then("^User should see an errormessage for less balance$")
	public void user_should_see_an_error_message_lessbal() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("lessBalanceMessage").toString().toUpperCase().trim()), DataMapRowData.get("Message")+" - Error message is not same : - "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	} //lessBalanceMessage
	@Then("^User should see an errormessage for KYC$")
	public void user_should_see_an_error_message_kyc() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("ExceedAmountMessage").toString().toUpperCase().trim()), DataMapRowData.get("Message")+" - Error message is not same : - "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@Then("^User should see an errormessage for currency$")
	public void user_should_see_an_error_message_currency() throws Throwable {
		//CommonFunctions.waitForElementToBeVisible(driver,LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("currencyMessage").toString().toUpperCase().trim()), DataMapRowData.get("Message")+" - Error message is not same : - "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@Then("^User should see an errormessage for bankfield$")
	public void user_should_see_an_error_message_bank() throws Throwable {
		//CommonFunctions.waitForElementToBeVisible(driver,LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("bankMessage").toString().toUpperCase().trim()), "Error message is not same : "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@Then("^User should see an errormessage for branchfield$")
	public void user_should_see_an_error_message_branch() throws Throwable {
		//CommonFunctions.waitForElementToBeVisible(driver,LoginPage.errorMessage);
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().
				equals(DataMapRowData.get("branchMessage").toString().toUpperCase().trim()), 
				"Error message is not same : "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@Then("^User should see an errormessage for zero search results$")
	public void user_should_see_an_error_message_zeroserach() throws Throwable {
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("NoresultMessage").toString().toUpperCase().trim()), "Error message is not same : "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@Then("^User should see an errormessage for ifscfield$")
	public void user_should_see_an_error_message_ifsc() throws Throwable {
		String messageTest = CommonFunctions.getText(driver, LoginPage.errorMessage);
		System.out.println("Error message is : "+messageTest);
		CommonFunctions.captureScreenshot(driver);
		if(messageTest.isEmpty()) {
			Assert.fail("Test Fail");
		}
		Assert.assertTrue(messageTest.toString().toUpperCase().trim().equals(DataMapRowData.get("ifscMessage").toString().toUpperCase().trim()), "Error message is not same : "+messageTest);
		CommonFunctions.clickButton(driver, LoginPage.errorOkButtton);
	}
	@And("^User selects the Remittance Currency$")
	public void User_selects_the_Remittance_Currency() throws Throwable {
		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement remittanceCurrency=CommonFunctions.getXpathWebElement(driver, "//*//span[@id='selectedFlag']");
		CommonFunctions.clickButton(driver, remittanceCurrency);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement remittanceCurrencyOption=CommonFunctions.getXpathWebElement(driver, "//*[@class='searchbar-search-icon']");
		CommonFunctions.currencySelect(driver, remittanceCurrencyOption,DataMapRowData.get("remittancecurrency"));
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User enters the Transfer amount$")
	public void User_enters_the_Transfer_amount() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement ratelanding=CommonFunctions.getXpathWebElement(driver,"//div[@class='rak-currency__input-footer']//span[@class='symbol']");
		WebElement element=null;
		String landing="//*//input[@name='onBoardingModel.amount']";////parent::ion-input";
		String login="//*//input[@name='remittanceModel.amount']";////parent::ion-input";
		if(CommonFunctions.isElementdisplayed(driver,landing) ) {//"//input[@name='onBoardingModel.amount']") {//) {
			CommonFunctions.waitForRMTLoadIcon(driver);
			System.out.println("Inside landing page object : "+DataMapRowData.get("transferamount"));
			element=CommonFunctions.getXpathWebElement(driver,landing);//"//input[@name='onBoardingModel.amount']");
			exchangeRateLanding = CommonFunctions.getText(driver,ratelanding);

		}else if(CommonFunctions.isElementdisplayed(driver,login)){// "//input[@name='remittanceModel.amount']")) {
			CommonFunctions.waitForRMTLoadIcon(driver);
			System.out.println("Inside login page object : "+DataMapRowData.get("transferamount"));
			exchangeRateLanding = CommonFunctions.getText(driver,ratelanding);

			element=CommonFunctions.getXpathWebElement(driver,login);//"//input[@name='remittanceModel.amount']");

			System.out.println("Inside  page object : ");

		}
		CommonFunctions.waitForRMTLoadIcon(driver);

		CommonFunctions.sendKeysToElement(driver,element, DataMapRowData.get("transferamount"));
		try {
			WebElement elementamount=CommonFunctions.getXpathWebElement(driver,"//input[@name='onBoardingModel.convertedAmount']//parent::ion-input");
			remittanceAmount = CommonFunctions.getAttribute(driver, elementamount,"ng-reflect-model");
		}catch(Exception e) {
			WebElement elementamount=CommonFunctions.getXpathWebElement(driver,"//input[@name='remittanceModel.convertedAmount']//parent::ion-input");
			remittanceAmount = CommonFunctions.getAttribute(driver, elementamount,"ng-reflect-model");
		}
		Assert.assertNotNull(remittanceAmount, "Exchange Rate ,from amount and to amount is not displayed");
		Assert.assertNotNull(exchangeRateLanding, "Exchange Rate ,from amount and to amount is not displayed");
		CommonFunctions.captureScreenshot(driver);
	}
	@When("^User enters the Transfer amount (.+)$")
	public void User_enters_the_Transfer_amount_amt(String str) throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement ratelanding=CommonFunctions.getXpathWebElement(driver,"//div[@class='rak-currency__input-footer']//span[@class='symbol']");
		WebElement element=null;
		String landing="//*//input[@name='onBoardingModel.amount']";////parent::ion-input";
		String login="//*//input[@name='remittanceModel.amount']";////parent::ion-input";
		if(CommonFunctions.isElementdisplayed(driver,landing) ) {//"//input[@name='onBoardingModel.amount']") {//) {
			CommonFunctions.waitForRMTLoadIcon(driver);
			System.out.println("Inside landing page object : "+str);
			element=CommonFunctions.getXpathWebElement(driver,landing);//"//input[@name='onBoardingModel.amount']");
			exchangeRateLanding = CommonFunctions.getText(driver,ratelanding);

		}else if(CommonFunctions.isElementdisplayed(driver,login)){// "//input[@name='remittanceModel.amount']")) {
			CommonFunctions.waitForRMTLoadIcon(driver);
			System.out.println("Inside login page object : "+str);
			exchangeRateLanding = CommonFunctions.getText(driver,ratelanding);

			element=CommonFunctions.getXpathWebElement(driver,login);//"//input[@name='remittanceModel.amount']");

			System.out.println("Inside  page object : ");

		}
		CommonFunctions.waitForRMTLoadIcon(driver);

		CommonFunctions.sendKeysToElement(driver,element, str);
		try {
			WebElement elementamount=CommonFunctions.getXpathWebElement(driver,"//input[@name='onBoardingModel.convertedAmount']//parent::ion-input");
			remittanceAmount = CommonFunctions.getAttribute(driver, elementamount,"ng-reflect-model");
		}catch(Exception e) {
			WebElement elementamount=CommonFunctions.getXpathWebElement(driver,"//input[@name='remittanceModel.convertedAmount']//parent::ion-input");
			remittanceAmount = CommonFunctions.getAttribute(driver, elementamount,"ng-reflect-model");
		}
		Assert.assertNotNull(remittanceAmount, "Exchange Rate ,from amount and to amount is not displayed");
		Assert.assertNotNull(exchangeRateLanding, "Exchange Rate ,from amount and to amount is not displayed");
		CommonFunctions.captureScreenshot(driver);

	}
	@And("^User enters amount after load$")
	public void User_enters_the_Transfer_amount_login() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement ratelanding=CommonFunctions.getXpathWebElement(driver,"//div[@class='rak-currency__input-footer']//span[@class='symbol']");
		WebElement element=null;
		String landing="//*//input[@name='onBoardingModel.amount']//parent::ion-input";
		String login="//*//input[@name='remittanceModel.amount']//parent::ion-input";
		if(CommonFunctions.isElementdisplayed(driver,landing) ) {
			CommonFunctions.waitForRMTLoadIcon(driver);
			System.out.println("Inside landing page object : ");
			element=CommonFunctions.getXpathWebElement(driver,landing);
			exchangeRateLanding = CommonFunctions.getText(driver, LoginPage.exchangeRateLandingScreen);

		}else if(CommonFunctions.isElementdisplayed(driver,login)){
			CommonFunctions.waitForRMTLoadIcon(driver);
			System.out.println("Inside login page object : ");
			exchangeRateLanding = CommonFunctions.getText(driver, LoginPage.exchangeRateLandingScreenLogin);

			element=CommonFunctions.getXpathWebElement(driver,login);

			System.out.println("Inside  page object : ");

		}
		CommonFunctions.waitForRMTLoadIcon(driver);

		driver.manage().logs().toString();
		CommonFunctions.sendKeysToElement(driver,element, DataMapRowData.get("transferamount"));
		remittanceAmount = CommonFunctions.getAttribute(driver, LoginPage.toAmountFetch,"ng-reflect-model");
		Assert.assertNotNull(remittanceAmount, "Exchange Rate ,from amount and to amount is not displayed");
		Assert.assertNotNull(exchangeRateLanding, "Exchange Rate ,from amount and to amount is not displayed");
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User should be on the same page$")
	public void User_selects_Remitting_Currency() throws Throwable {
		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.remittanceCurrencyButtonPreSelection);

		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User selects the Remittance Currency (.+)$")
	public void user_selects_the_remittance_currency(String currency) throws Throwable {
		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement remittanceCurrency=CommonFunctions.getXpathWebElement(driver, "//ion-label[@id='lbl-1']//span[@id='selectedFlag']");
		CommonFunctions.clickButton(driver, remittanceCurrency);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement remittanceCurrencyOption=CommonFunctions.getXpathWebElement(driver, "//*[@class='searchbar-search-icon']");
		CommonFunctions.currencySelect(driver, remittanceCurrencyOption,currency);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User enters the Remittance amount$")
	public void User_enters_the_Remittance_amount() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		exchangeRateLanding = CommonFunctions.getText(driver, LoginPage.exchangeRateLandingScreen);
		CommonFunctions.waitElement(driver, LoginPage.toAmount);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.sendKeysToElement(driver, LoginPage.toAmount, DataMapRowData.get("remittanceamount"));
		transferAmount = CommonFunctions.getAttribute(driver, LoginPage.fromAmountFetch,"ng-reflect-model");
	}

	@Then("^User should see Recipient page$")
	public void user_views_Recipient_screen() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.firstName);
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User should see the mandatory fields Beneficiary First Name,Beneficiary Middle Name,Beneficiary Last Name,Nick Name$")
	public void UsershoulseetheBeneficiariessection() throws Throwable {
		Assert.assertTrue(LoginPage.firstName.isDisplayed()&& LoginPage.firstName.isEnabled()
				,"FirstName is not displayed in Recipient");
		Assert.assertTrue(LoginPage.lastName.isDisplayed()&& LoginPage.lastName.isEnabled()
				,"LastName is not displayed in Recipient");
		Assert.assertTrue(LoginPage.middleName.isDisplayed()&& LoginPage.middleName.isEnabled()
				,"MiddleName is not displayed in Recipient");
		Assert.assertTrue(LoginPage.nickName.isDisplayed()&& LoginPage.nickName.isEnabled()
				,"NickName is not displayed in Recipient");
		CommonFunctions.captureScreenshot(driver);
	}
	@When("^User enters Firstname$")
	public void user_enters_firstName() throws Throwable {
		LoginPage.firstName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.firstName, DataMapRowData.get("firstname"));
	}
	@And("^User enters Lastname$")
	public void user_enters_lastName() throws Throwable {
		LoginPage.lastName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.lastName, DataMapRowData.get("lastname"));
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User enters Middlename$")
	public void user_enters_MiddleName() throws Throwable {
		if(!DataMapRowData.get("middlename").equalsIgnoreCase(" ")
				||!DataMapRowData.get("middlename").equalsIgnoreCase(null)) {
			LoginPage.middleName.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.middleName, DataMapRowData.get("middlename"));
		}
	}
	@And("^User leaves Lastname empty$")
	public void user_enters_lastName_empty() throws Throwable {
		LoginPage.lastName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.lastName, "");
	}
	@When("^User leaves Firstname empty$")
	public void user_enters_firstName_empty() throws Throwable {
		LoginPage.firstName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.firstName, "");
	}
	@And("^User leaves Middlename empty$")
	public void user_enters_MiddleName_empty() throws Throwable {
		if(!DataMapRowData.get("middlename").equalsIgnoreCase(" ")
				||!DataMapRowData.get("middlename").equalsIgnoreCase(null))
			LoginPage.middleName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.middleName, DataMapRowData.get("middlename"));
	}
	@And("^User leaves Nickname empty$")
	public void user_enters_NickName_empty() throws Throwable {
		LoginPage.nickName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.nickName, DataMapRowData.get("nickname"));
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User enters Nickname$")
	public void user_enters_NickName() throws Throwable {
		LoginPage.nickName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.nickName, DataMapRowData.get("nickname"));
		CommonFunctions.captureScreenshot(driver);
	}

	@And("^User sees AccountNumber selected by Default$")
	public void user_accountnumber_selected() throws Throwable {

		CommonFunctions.waitElement(driver, LoginPage.accountButton);
	}

	@And("^User enters BankName$")
	public void user_bankName() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.locateBank);
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		if(CommonFunctions.isElementdisplayed(driver, LoginPage.bankName)) {
			LoginPage.bankName.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.bankName, DataMapRowData.get("bankname"));
		}
		if(CommonFunctions.isElementdisplayed(driver, LoginPage.branchName)) {
			LoginPage.branchName.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.branchName, DataMapRowData.get("branchname"));
		}
		if(CommonFunctions.isElementdisplayed(driver, LoginPage.ifscCode)) {
			LoginPage.ifscCode.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode, DataMapRowData.get("IFSC"));
		}
		CommonFunctions.clickButton(driver, LoginPage.bankSearchNextButton);
		CommonFunctions.waitElement(driver, LoginPage.seeAllButton);
		CommonFunctions.clickButton(driver, LoginPage.seeAllButton);
		CommonFunctions.waitElement(driver, LoginPage.bracnhOption);
		CommonFunctions.branchSelect(driver, LoginPage.bracnhOption,DataMapRowData.get("branchname"));
	}

	@And("^User selects the purpose of payment$")
	public void User_selects_the_purpose_of_payment() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement purpose=CommonFunctions.getXpathWebElement(driver, "//ion-select[@ng-reflect-name='remittanceModel.selectedPurpos']");
		CommonFunctions.waitForRMTLoadIcon(driver);
		if(CommonFunctions.isElementdisplayed(driver,purpose)) {
			Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,purpose),
					"Purpose of payment is not visible or displayed ");
			CommonFunctions.clickButton(driver,purpose);// LoginPage.purpose);
			CommonFunctions.waitForRMTLoadIcon(driver);
			WebElement purposeOption=CommonFunctions.getXpathWebElement(driver, "//button[@ion-button='action-sheet-button']");
			CommonFunctions.dropDownSelect(driver, purposeOption,DataMapRowData.get("purpose"));
		}
	}

	@And("^User selects the reason for payment$")
	public void User_selects_the_reason_for_payment() throws Throwable {

		if(DataMapRowData.get("transferoption").equalsIgnoreCase("Cash Transfer")) {
			CommonFunctions.waitForElementToBeClickable(driver, LoginPage.reason);
			CommonFunctions.clickButton(driver, LoginPage.reason);
			CommonFunctions.waitElement(driver, LoginPage.reasonOption);
			CommonFunctions.dropDownSelect(driver, LoginPage.reasonOption,DataMapRowData.get("reason"));
			CommonFunctions.captureScreenshot(driver);
		} else if(DataMapRowData.get("transferoption").equalsIgnoreCase("Bank Transfer")) {
			CommonFunctions.waitForElementToBeClickable(driver, LoginPage.reasonAcccountTransfer);
			CommonFunctions.clickButton(driver, LoginPage.reasonAcccountTransfer);
			CommonFunctions.waitElement(driver, LoginPage.reasonOption);
			CommonFunctions.dropDownSelect(driver, LoginPage.reasonOption,DataMapRowData.get("reason"));
			CommonFunctions.captureScreenshot(driver);
		}
	}

	@And("^User clicks on Next button in login screen$")
	public void User_clicks_on_Next_button_in_login_screen() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.waitElement(driver, LoginPage.nextButtonLogin);
		CommonFunctions.clickButton(driver, LoginPage.nextButtonLogin);
	}

	@And("^User clicks on Next button in transaction$")
	public void User_clicks_on_Next_button_in_transaction() throws Throwable {
		Thread.sleep(1000);
		CommonFunctions.waitElement(driver, LoginPage.nextButtonTransaction);
		CommonFunctions.captureScreenshot(driver);
		Thread.sleep(1000);
		CommonFunctions.clickButton(driver, LoginPage.nextButtonTransaction);
	}

	@And("^User enters AccountNumber$")
	public void user_accountnumber() throws Throwable {

		if(DataMapRowData.get("remittancecurrency").equalsIgnoreCase("PKR")) {
			//CommonFunctions.waitForElementToBeClickable(driver,LoginPage.ibanNumber);
			//CommonFunctions.clickButton(driver, LoginPage.ibanNumber);
			CommonFunctions.sendKeysToElement(driver, LoginPage.ibanNumber, DataMapRowData.get("accountnumber"));
			CommonFunctions.captureScreenshot(driver);
		} else {
			//CommonFunctions.waitForElementToBeClickable(driver,LoginPage.accountNumber);
			//CommonFunctions.clickButton(driver, LoginPage.accountNumber);
			CommonFunctions.sendKeysToElement(driver, LoginPage.accountNumber, DataMapRowData.get("accountnumber"));
			CommonFunctions.captureScreenshot(driver);
		}
	}

	@Then("^User should see the instant payment screen$")
	public void User_should_see_the_instant_payment_screen() throws Throwable {
		WebElement element=CommonFunctions.elementClickableUI(driver, "//ion-list[contains(@class,'instant-payment-menu list list')]");
		CommonFunctions.isElementdisplayed(driver, element);
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User should see Add new Credit Card option$")
	public void addnewcreditCard() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.addNewCreditCard);
		Assert.assertTrue( LoginPage.addNewCreditCard.isDisplayed(), "Add new Credit Card button/link is not displayed");
	}
	@When("^User selects Add new Credit Card option$")
	public void addnewcreditCard_click() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.addNewCreditCard);
		Assert.assertTrue( LoginPage.addNewCreditCard.isDisplayed()
				&& LoginPage.addNewCreditCard.isEnabled(), "Add new Credit Card button/link is not clickable");
		CommonFunctions.clickButton(driver, LoginPage.addNewCreditCard);
		CommonFunctions.waitForRMTLoadIcon(driver);
		Assert.assertTrue( LoginPage.cardDetails.isDisplayed(), "Add new Credit Card button/link is not displayed");
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User should see verifyCard details page$")
	public void addnewcreditCard_verifycard() throws Throwable {
		Assert.assertTrue( LoginPage.cardDetails.isDisplayed(), "Card number field is not displayed");
		Assert.assertTrue( LoginPage.cardHolderName.isDisplayed(), "cardHolderName field is not displayed");
		Assert.assertTrue( LoginPage.ExpiryYear.isDisplayed(), "Expiry Year is not displayed");
		Assert.assertTrue( LoginPage.ExpiryMonth.isDisplayed(), "Expiry Month is not displayed");
	}
	@When("^User enters cardNumber$")
	public void enterCardNumber() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cardDetails);
		String cardNumber="(//*[@class='rak-input card-number-input item item-block item-md item-input item-multiple-inputs']//*[@class='input input-md']/input)";
		List<WebElement> lstCardNumber=CommonFunctions.getXpathWebElements(driver,cardNumber);
		Assert.assertTrue( LoginPage.cardDetails.isDisplayed(), "cardNumber field is not displayed");
		String[] arrcard= DataMapRowData.get("CreditCardAdd").split("-");
		for(int i=0;i<lstCardNumber.size();i++) {
			WebElement elementcardnumber=CommonFunctions.getXpathWebElement(driver, cardNumber+"["+i+"]");
			CommonFunctions.sendKeysToElement(driver,lstCardNumber.get(i),arrcard[i]);
		}
	}
	@And("^User enters cardHoldername$")
	public void entercardHoldername() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cardHolderName);
		Assert.assertTrue( LoginPage.cardHolderName.isDisplayed(), "cardHolderName field is not displayed");
		CommonFunctions.sendKeysToElement(driver, LoginPage.cardHolderName, DataMapRowData.get("CardHoldername"));
	}
	@And("^User selects Expiry date$")
	public void enterExpiryDate() throws Throwable {
		//Expiry Year
		//CommonFunctions.waitForElementToBeVisible(driver,LoginPage.ExpiryYear);
		Assert.assertTrue( LoginPage.ExpiryYear.isDisplayed()&& LoginPage.ExpiryYear.isEnabled(), "ExpiryYear field is not displayed");
		JavascriptExecutor jsExec = (JavascriptExecutor)driver;
		CommonFunctions.clickButton(driver, LoginPage.ExpiryYear);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.dropDownSelectDown(driver, DataMapRowData.get("ExpiryYear"));
		Assert.assertTrue( LoginPage.ExpiryMonth.isDisplayed()&& LoginPage.ExpiryMonth.isEnabled(), "ExpiryMonth field is not displayed");
		CommonFunctions.clickButton(driver, LoginPage.ExpiryMonth);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.dropDownSelectUp(driver, DataMapRowData.get("ExpiryMonth".trim()));
	}
	@When("^User should see CVV field$")
	public void userCVVField() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cvvAddCard);
		Assert.assertTrue( LoginPage.cvvAddCard.isDisplayed(), "CVV field is not displayed");
	}
	@When("^User enters CVV$")
	public void enterCVV() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cvvAddCard);
		Assert.assertTrue( LoginPage.cvvAddCard.isDisplayed(), "CVV field is not displayed");
		CommonFunctions.sendKeysToElement(driver, LoginPage.cvvAddCard, DataMapRowData.get("CVV"));
	}
	@When("^User selects Save card details$")
	public void addnewcreditCard_save() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveCardDetialsCheckbox);
		Assert.assertTrue( LoginPage.saveCardDetialsCheckbox.isDisplayed()
				&& LoginPage.saveCardDetialsCheckbox.isEnabled(), "saveCardDetialsCheckbox is not available");
		CommonFunctions.clickButton(driver, LoginPage.saveCardDetialsCheckbox);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.saveCardDetialsCheckbox);
	}
	@When("^User selects the pay instant using RAKAccount option$")
	public void User_selects_the_pay_instant_using_RAKAccount_option() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.instantPaymentOption);
	}
	@When("^User selects the payment option$")
	public void User_selects_the_payment_option() throws Throwable {
		WebElement element=CommonFunctions.elementClickableUI(driver, "//ion-list[contains(@class,'instant-payment-menu list list')]");
		CommonFunctions.isElementdisplayed(driver, element);
		CommonFunctions.menuSelect(driver,element,DataMapRowData.get("paymentoption"));
		CommonFunctions.waitForRMTLoadIcon(driver);

	}
	@Then("^User should see the OTP screen$")
	public void User_should_see_the_OTP_screen() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);

		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.confirmButton);
		CommonFunctions.captureScreenshot(driver);
	}
	@When("^User enters the OTP$")
	public void User_enters_the_OTP() throws Throwable {
		CommonFunctions.sendKeysToElement(driver, LoginPage.otpField, "1234");
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User click on confirm Button$")
	public void User_click_on_confirm_Button() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);

		exchangeRateConfirmationScreen = CommonFunctions.getText(driver, LoginPage.exchangeRateConfirmScreen);
		totalAmountConfirmationScreen = CommonFunctions.getText(driver, LoginPage.totalAmountConfirmScreen);
		chargesConfirmationScreen = CommonFunctions.getText(driver, LoginPage.chargesConfirmScreen);
		try {
			try {
				WebElement elementConfirm=CommonFunctions.getXpathWebElement(driver, "//*[contains(text(),'Confirm')]//parent::span//parent::button");
				CommonFunctions.clickButton(driver,elementConfirm);
			}catch(Exception ey) {
				CommonFunctions.clickButton(driver, LoginPage.confirmButton);
			}
		}catch(Exception e) {

			String str="//*[contains(text(),'Confirm')]//parent::span//parent::button";
			WebElement element=CommonFunctions.elementClickable(driver, str);
			Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,element),"Next button is not visbile and clickable");
			Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,element), "Next Button is not visible");
			if(element.isEnabled()) {
				CommonFunctions.clickButton(driver, element);
			}
		}
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.successMessage);
		Assert.assertTrue(LoginPage.successMessage.isDisplayed(), "Success Message Alert popup is not displayed");
	}
	@Then("^User should see transaction successful message$")
	public void User_should_see_transaction_successful_message() throws Throwable {
		String transactionMessage = CommonFunctions.getText(driver, LoginPage.transactionMessage);
		String value = transactionMessage.split("ID")[1];
		transactionReference= value.split(" ")[1];
		System.out.println(transactionReference);
		if(transactionReference.contains(")")) {
			transactionReference = transactionReference.substring(0, transactionReference.length()-1);
		}
		if(!transactionReference.equalsIgnoreCase("")) {
			nickNameBeneficiary=DataMapRowData.get("nickname").toString().toUpperCase();
			updatednickNameBeneficiary=DataMapRowData.get("Newbeneficiary").toString().toUpperCase();
		}
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.clickButton(driver, LoginPage.okButton);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement userProfile=CommonFunctions.getXpathWebElement(driver, "//*//ion-icon[@aria-label='menu' and @ng-reflect-md='md-menu']");//(driver, LoginPage.userProfileButton);
		Assert.assertTrue(userProfile.isDisplayed(), "User should not allow the user to go back from the success screen to editable screen is failed ");
	}
	@And("^Customer should be able to logout of the application$")
	public void Customer_should_be_able_to_logout_of_the_application() throws Throwable {
		CommonFunctions.getXpathWebElementClickable(driver, "//*//ion-icon[@aria-label='menu' and @ng-reflect-md='md-menu']");//(driver, LoginPage.userProfileButton);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.getXpathWebElementClickable(driver,"//*//*[@class='logout-image']");//LoginPage.logOutButton);
		CommonFunctions.captureScreenshot(driver);
		CommonFunctions.getXpathWebElementClickable(driver,"//div[@class='alert-button-group']//button/span[contains(text(),'Yes')]/parent::button");//LoginPage.logOutButton);
		CommonFunctions.waitForRMTLoadIcon(driver);
		Assert.assertTrue(CommonFunctions.getXpathWebElement(driver,"//input[@ng-reflect-name='loginModel.userId']").isDisplayed(),
				"Login Screen with User ID and Password is not displayed");
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User should see the list of applicable remittance currency$")
	public void listRemittanecCurrencies() throws Throwable {
		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement ele=CommonFunctions.getXpathWebElement(driver, "//*[@id='selectedFlag']");
		Assert.assertTrue(ele.isDisplayed()
				&&ele.isEnabled(), "Currency Button option is not available");
		CommonFunctions.clickButton(driver,ele);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement remittanceCurrencyOpt=CommonFunctions.getXpathWebElement(driver, "//*[@class='searchbar-search-icon']");
		WebElement element=CommonFunctions.getXpathWebElement(driver, "//*[@class='remittance__list--item-details']");
		currencyExchangeRate=CommonFunctions.currencylist(driver,element);
		CommonFunctions.waitForRMTLoadIcon(driver);
		Thread.sleep(4000);
		CommonFunctions.captureScreenshot(driver);
		WebElement back=CommonFunctions.getXpathWebElement(driver, "//*[@class='rakiconrak-back-arrow']");
		CommonFunctions.clickButton(driver, back);
		CommonFunctions.waitForRMTLoadIcon(driver);
	}
	@When("^User selects remittance option (.+)$")
	public void user_selects_remittance_option(String option) throws Throwable {
		if(option.toString().toUpperCase().trim().equals("Cash Pickup".toString().toUpperCase().trim())) {
			CommonFunctions.waitForRMTLoadIcon(driver);
			CommonFunctions.waitElement(driver, LoginPage.rmtPage);
			CommonFunctions.clickButton(driver, LoginPage.cashTransferOption);
		}else if(option.toString().toUpperCase().trim().equals("Account Transfer".toString().toUpperCase().trim())) {
			CommonFunctions.waitForRMTLoadIcon(driver);
			CommonFunctions.waitElement(driver, LoginPage.rmtPage);
			CommonFunctions.clickButton(driver, LoginPage.accountTransferOption);
		}
	}
	@When("^User selects the benificiary (.+)$")
	public void benifiaciryaddition(String str) throws Throwable {
		List<WebElement> beneficiaryList=driver.findElements(By.xpath("//*[@class='item item-block item-md']//*[@class='item-inner']//*[@class='input-wrapper']//ion-label[@class='label label-md']"));
		for(int i=1;i< beneficiaryList.size();i++) {
			WebElement ele=driver.findElement(By.xpath("(//*[@class='item item-block item-md']//*[@class='item-inner']//*[@class='input-wrapper']//ion-label[@class='label label-md'])["+i+"]"));
			if(CommonFunctions.isElementdisplayed(driver, ele)) {

				System.out.println("Beneficiary Name : "+ele.getText().toString().toUpperCase().trim()+" size of list is : "+beneficiaryList.size());
				Assert.assertNotNull(ele.getText().toString().toUpperCase().trim(), "Beneficiary is not available");
				if(ele.getText().toString().toUpperCase().trim().equals(str.toString().toUpperCase().trim())) {
					CommonFunctions.clickButton(driver,ele);
					CommonFunctions.waitForRMTLoadIcon(driver);
					System.out.println("Beneficiary Name : "+str);
					break;
				}
			}
		}
	}
	@And("^User should see the Edit link to update beneficiary$")
	public void selectEditlinkEnabled() throws Throwable {
		WebElement editlink=CommonFunctions.getXpathWebElement(driver, "//*[contains(text(),'Change')]");
		Assert.assertTrue(editlink.isDisplayed()
				&&editlink.isEnabled(), "Edit / Change link is visible and not clickable");
	}
	@When("^User selects the Edit link$")
	public void selectEditlink() throws Throwable {
		WebElement editlink=CommonFunctions.getXpathWebElement(driver,"//*[contains(text(),'Change')]");
		Assert.assertTrue(editlink.isDisplayed(), "Edit / Change  link is not available");
		CommonFunctions.clickButton(driver,editlink);
		CommonFunctions.waitForRMTLoadIcon(driver);
	}
	@When("^User selects other benificiary$")
	public void benifiaciryaddition_other() throws Throwable {
		CommonFunctions.getObjectBeneficiaryClick(driver,DataMapRowData.get("Newbeneficiary"));
		CommonFunctions.waitForRMTLoadIcon(driver);
		if(CommonFunctions.getXpathWebElement(driver,"//*[@class='selected-beneficiary']//*[@class='item-value']").isDisplayed()) {
			selectedBeneficiary = DataMapRowData.get("Newbeneficiary").toString().toUpperCase().trim();
		}
		System.out.println("Beneficiary selected is  : "+selectedBeneficiary);
	}
	@And("^User verifies updated contact in the list of benificiaries$")
	public void benifiaciry_verify_updated() throws Throwable {
		boolean flag=CommonFunctions.getObjectBeneficiary(driver,DataMapRowData.get("Newbeneficiary"));
		Assert.assertTrue(flag, "Beneficiary is not available in the list");
		if(flag) {
			selectedBeneficiary = DataMapRowData.get("Newbeneficiary").toString().toUpperCase().trim();
		}
		System.out.println("Beneficiary selected is  : "+selectedBeneficiary);
	}
	@Then("^User should see the Available balance$")
	public void userAvailableAccountBalance() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.availableBalanceAccInfo);
		Assert.assertTrue(LoginPage.availableBalanceAccInfo.isDisplayed(), "Available balance  is not displayed");
		accountInfoAvailableBalance =Integer.parseInt(LoginPage.availableBalanceAccInfo.getText().toString().toUpperCase().trim().split(" ")[1]);
		Assert.assertNotNull(LoginPage.availableBalanceAccInfo.getText().toString().toUpperCase().trim(), "Available balance  is not displayed");
	}
	@Then("^System should display the updated account balance in the Rakwallet account$")
	public void updatedBalanceAccount() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.availableBalanceAccInfo);
		Assert.assertTrue((accountInfoAvailableBalance<walletBalance)
				&& (accountInfoAvailableBalance!=0 && walletBalance!=0) , "Available balance  is not updated");
	}
	@And("^User clicks Locate bank$")
	public void clickLocateBank() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.locateBank);
		Assert.assertTrue(LoginPage.locateBank.isDisplayed(), "Locate Bank link is not available");
		CommonFunctions.clickButton(driver, LoginPage.locateBank);
		CommonFunctions.waitForRMTLoadIcon(driver);
	}
	@Then("^User should see Bank Branch page$")
	public void openBankBranchPage() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "Bank Branch Page is not displayed");

	}
	@When("^User provides BankName$")
	public void bankName() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "Bank name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.bankName, DataMapRowData.get("bankname"));

	}
	@And("^User provides BankName (.+)$")
	public void user_provides_bankname(String bankless) throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "Bank name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.bankName,bankless);

	}

	@And("^User leaves BankName empty$")
	public void bankName_empty() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "Bank name field is not displayed");

		LoginPage.bankName.clear();
		//CommonFunctions.sendKeysToElement(driver, LoginPage.bankName, "");

	}
	@And("^User enters Branchname$")
	public void branchName() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.branchName);
		Assert.assertTrue(LoginPage.branchName.isDisplayed(), "Branch name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.branchName, DataMapRowData.get("branchname"));
		CommonFunctions.waitElement(driver, LoginPage.ifscCode);
		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "Branch name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode, DataMapRowData.get("IFSC"));
	}
	@And("^User enters Branchname (.+)$")
	public void user_enters_branchname(String branchless) throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.branchName);
		Assert.assertTrue(LoginPage.branchName.isDisplayed(), "Branch name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.branchName, branchless);

	}

	@And("^User enters IFSC Code$")
	public void ifscCode() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.ifscCode);
		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "Branch name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode, DataMapRowData.get("IFSC"));
	}
	@And("^User enters 2 characters of IFSC Code$")
	public void ifscCode_twocharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.ifscCode);
		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "ifsc name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode, "SD");
	}
	@And("^User enters more characters of IFSC Code for invalid results message$")
	public void ifscCode_invalidcharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.ifscCode);
		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "ifsc field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode, "SDFGH");
	}
	@And("^User enters more characters of bank Code for invalid results message$")
	public void bank_invalidcharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "bankName field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.bankName, "SDFGH");
	}
	@And("^User enters more characters of branch Code for invalid results message$")
	public void branch_invalidcharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.branchName);
		Assert.assertTrue(LoginPage.branchName.isDisplayed(), "branchName field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.branchName, "SDFGH");
	}
	@And("^User enters 3 characters of IFSC Code for valid results message$")
	public void ifscCode_validcharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.ifscCode);
		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "ifsc field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode, "HDF");
	}
	@And("^User enters 3 characters of bank Code for valid results message$")
	public void bank_validcharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "bankName field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.bankName, "HDF");
	}
	@And("^User enters 3 characters of branch Code for valid results message$")
	public void branch_validcharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.branchName);
		Assert.assertTrue(LoginPage.branchName.isDisplayed(), "branchName field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.branchName, "KAN");
	}
	@And("^User enters 2 characters of bank Code$")
	public void bank_twocharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankName);
		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "bank name field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.bankName,"SD");
	}
	@And("^User enters 2 characters of branch Code$")
	public void branch_twocharacters() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.branchName);
		Assert.assertTrue(LoginPage.branchName.isDisplayed(), "Branch name field is not displayed");

		LoginPage.branchName.clear();
		LoginPage.bankName.clear();
		LoginPage.ifscCode.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.branchName,"SD");
	}
	@When("^User enters IFSC Code (.+)$")
	public void user_enters_ifsc_code(String ifscless) throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.ifscCode);
		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "IFSC code field is not displayed");

		CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode,ifscless);
	}
	@And("^User leaves Branchname empty$")
	public void branchName_empty() throws Throwable {

		CommonFunctions.waitElement(driver, LoginPage.branchName);
		Assert.assertTrue(LoginPage.branchName.isDisplayed(), "Branch name field is not displayed");

		LoginPage.branchName.clear();
		LoginPage.ifscCode.clear();
		LoginPage.ifscCode.clear();
		//CommonFunctions.sendKeysToElement(driver, LoginPage.branchName, "");
		CommonFunctions.waitElement(driver, LoginPage.ifscCode);
		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "Branch name field is not displayed");

		//CommonFunctions.sendKeysToElement(driver, LoginPage.ifscCode, "");
	}
	@And("^User clears all the fields$")
	public void clear_fields() throws Throwable {

		Assert.assertTrue(LoginPage.branchName.isDisplayed(), "Branch name field is not displayed");

		Assert.assertTrue(LoginPage.ifscCode.isDisplayed(), "Branch name field is not displayed");

		Assert.assertTrue(LoginPage.bankName.isDisplayed(), "Branch name field is not displayed");

		LoginPage.branchName.clear();
		LoginPage.ifscCode.clear();
		LoginPage.bankName.clear();
		LoginPage.branchName.sendKeys(" ");
		LoginPage.ifscCode.sendKeys(" ");
		LoginPage.bankName.sendKeys(" ");
	}
	@Then("^User should see the search results and seeAll button enabled$")
	public void seeAll() throws Throwable {
		//CommonFunctions.sendKeysToElement(driver, LoginPage.branchName, DataMapRowData.get("branchname"));

		CommonFunctions.clickButton(driver, LoginPage.bankSearchNextButton);
		CommonFunctions.waitElement(driver, LoginPage.seeAllButton);
		Assert.assertTrue(LoginPage.seeAllButton.isDisplayed()
				&& LoginPage.seeAllButton.isEnabled(), "See All button is not displayed");


	}
	@When("^User Clicks see all option$")
	public void seeAllClick() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.seeAllButton);
		Assert.assertTrue(LoginPage.seeAllButton.isDisplayed(), "Bank name field is not displayed");

		CommonFunctions.clickButton(driver, LoginPage.seeAllButton);

	}
	@When("^User selects the respective bank$")
	public void selectBank() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bracnhOption);
		Assert.assertTrue(LoginPage.bracnhOption.isDisplayed(), "Bank name list is not displayed");

		CommonFunctions.branchSelect(driver, LoginPage.bracnhOption,DataMapRowData.get("branchname"));

	}
	@Then("^User should be navigated to Recipient page with datapopulated in bankName field$")
	public void bankNamepopulated() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.bankinfoRecipientValue);
		Assert.assertTrue(LoginPage.bankinfoRecipientValue.isDisplayed(), "Bank name field is not displayed");

		Assert.assertNotNull(LoginPage.bankinfoRecipientValue.getText().toString().toUpperCase().trim(), "Bank Name is not populated");
	}
	@When("^User clicks back option$")
	public void backButton() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.backButton);
		Assert.assertTrue(LoginPage.backButton.isDisplayed(), "Bank name list is not displayed");

		CommonFunctions.clickButton(driver, LoginPage.backButton);

	}
	@And("User should see the available Wallet balance")
	public void availableBalance() throws Throwable {
		CommonFunctions.waitElement(driver, LoginPage.walletBalance);
		Assert.assertTrue(LoginPage.walletBalance.isDisplayed(), "walletBalance  is not displayed");

		walletBalance=Integer.parseInt(LoginPage.walletBalance.getText().toString().toUpperCase().trim().split("AED")[1].trim());
		Assert.assertNotNull(LoginPage.walletBalance.getText().toString().toUpperCase().trim(), "walletBalance  is not displayed");

	}
	@Then("User should not be allowed to proceed further")
	public void userNotable_toProceed() throws Throwable {
		//CommonFunctions.waitElement(driver,LoginPage.nextButtonTransaction);
		Assert.assertTrue(LoginPage.nextButtonTransaction.isDisplayed()
				&&!LoginPage.nextButtonTransaction.isEnabled(), "Next Button  is displayed but enabled");

		Assert.assertTrue(!LoginPage.nextButtonTransaction.isEnabled(), "Next Button  is enabled");

	}
	@Then("^Customer should see the initial transaction page$")
	public void User_should_elected_currency() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement accountTransferOption=CommonFunctions.getXpathWebElement(driver, "//*[contains(text(),'Bank Transfer')]");
		WebElement cashTransferOption=CommonFunctions.getXpathWebElement(driver, "//*[contains(text(),'Cash Pickup')]");
		Assert.assertTrue(accountTransferOption.isDisplayed()
				&&cashTransferOption.isDisplayed(), "Initial transaction page is not displayed");
		WebElement exchangeRateLandingScreen=CommonFunctions.getXpathWebElement(driver, "//div[@class='rak-currency__input-footer']//span[@class='symbol']");
		exchangeRateLanding = CommonFunctions.getText(driver,exchangeRateLandingScreen);
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User leaves AccountNumber empty$")
	public void user_accountnumber_empty() throws Throwable {
		if(DataMapRowData.get("remittancecurrency").equalsIgnoreCase("PKR")) {
			LoginPage.ibanNumber.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.ibanNumber,"");
		} else {
			LoginPage.accountNumber.clear();
			CommonFunctions.sendKeysToElement(driver, LoginPage.accountNumber,"");
		}
	}
	@And("^User leaves the purpose of payment empty$")
	public void User_selects_the_purpose_of_payment_empty() throws Throwable {
		CommonFunctions.waitForElementToBeClickable(driver, LoginPage.purpose);

		WebElement purpose=CommonFunctions.getXpathWebElement(driver, "//ion-select[@ng-reflect-name='remittanceModel.selectedPurpos']");
		if(CommonFunctions.isElementdisplayed(driver,purpose)) {
			Assert.assertTrue(CommonFunctions.isElementdisplayed(driver,purpose),
					"Purpose of payment is not visible or displayed ");

		}
	}
	@When("^User should see the card in masked format$")
	public void cardMaskedFormat() throws Throwable {
		//CommonFunctions.clickButton(driver, LoginPage.maskedcard);
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.maskedcard);
		Assert.assertTrue(LoginPage.maskedcard.isDisplayed()
				&& LoginPage.maskedcard.getText().toString().toUpperCase().trim().contains("x"), "Card is not displayed in masked format");
	}
	@When("^User selects creditcard$")
	public void selectCreditCard() throws Throwable {
		Assert.assertTrue( LoginPage.maskedcard.isDisplayed(), "Masked card is not displayed");
		List<WebElement> listCards=driver.findElements(By.xpath("//*[@class='holder-name']/text()"));
		for(WebElement ele: listCards) {
			if(ele.getText().toString().toUpperCase().trim().equals(DataMapRowData.get("CreditCard"))) {
				CommonFunctions.clickButton(driver, LoginPage.maskedcard);
				CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cvv);
			}
		}
	}
	@When("^User selects debitcard$")
	public void selectDebitCard() throws Throwable {
		Assert.assertTrue( LoginPage.maskedcard.isDisplayed(), "Masked card is not displayed");
		List<WebElement> listCards=driver.findElements(By.xpath("//*[@class='holder-name']/text()"));
		for(WebElement ele: listCards) {
			if(ele.getText().toString().toUpperCase().trim().equals(DataMapRowData.get("DebitCard"))) {
				CommonFunctions.clickButton(driver, LoginPage.maskedcard);
				CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cvv);
			}
		}
	}
	@When("^User selects RAKBankcreditcard$")
	public void selectRAKBankCreditCard() throws Throwable {
		Assert.assertTrue( LoginPage.maskedcard.isDisplayed(), "Masked card is not displayed");
		List<WebElement> listCards=driver.findElements(By.xpath("//*[@class='holder-name']/text()"));
		for(WebElement ele: listCards) {
			if(ele.getText().toString().toUpperCase().trim().equals(DataMapRowData.get("CreditCard"))) {
				CommonFunctions.clickButton(driver, LoginPage.maskedcard);
				CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cvv);
			}
		}
	}
	@When("^User selects RAKBankdebitcard$")
	public void selectRAKBankDebitCard() throws Throwable {
		Assert.assertTrue( LoginPage.maskedcard.isDisplayed(), "Masked card is not displayed");
		List<WebElement> listCards=driver.findElements(By.xpath("//*[@class='holder-name']/text()"));
		for(WebElement ele: listCards) {
			if(ele.getText().toString().toUpperCase().trim().equals(DataMapRowData.get("DebitCard"))) {
				CommonFunctions.clickButton(driver, LoginPage.maskedcard);
				CommonFunctions.waitForElementToBeVisible(driver, LoginPage.cvv);
			}
		}
	}
	@And("^User should see the edit button to update remittance amount$")
	public void editButton() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.editButtonAmountReview);
		Assert.assertTrue( LoginPage.editButtonAmountReview.isDisplayed()
				&& LoginPage.editButtonAmountReview.isEnabled(), "Edit button/link is not available");

	}
	@And("^User should be able to update the amount$")
	public void editButton_enabled() throws Throwable {
		CommonFunctions.waitForElementToBeVisible(driver, LoginPage.amountReviewButton);
		Assert.assertTrue( LoginPage.amountReviewButton.isDisplayed()
				&& LoginPage.amountReviewButton.isEnabled(), "Amount field is not editable");

	}
	@When("^User clicks remittance edit button$")
	public void editButton_click() throws Throwable {
		CommonFunctions.clickButton(driver, LoginPage.editButtonAmountReview);
		//CommonFunctions.waitForElementToBeVisible(driver,LoginPage.amountReviewButton);
		Assert.assertTrue( LoginPage.amountReviewButton.isDisplayed()
				&& LoginPage.amountReviewButton.isEnabled(), "Amount field is not editable");
	}
	@When("^User updates the Remittance amount (.+) in review page$")
	public void user_enters_the_remittance_amount_in_review_page(String updatedamount) throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);

		CommonFunctions.waitElement(driver, LoginPage.amountReviewButton);

		CommonFunctions.sendKeysToElement(driver, LoginPage.amountReviewButton,updatedamount);

		CommonFunctions.waitForRMTLoadIcon(driver);

		CommonFunctions.waitElement(driver, LoginPage.okTransactionReviewPage);

		CommonFunctions.clickButton(driver, LoginPage.okTransactionReviewPage);
		CommonFunctions.waitForRMTLoadIcon(driver);

		WebElement editButton=CommonFunctions.getXpathWebElement(driver, "(//*[@ng-reflect-label='BENEFICIARYREMITPREVIEWPAGE.ED'])[2]");
		WebElement exchangeRateTextReviewPage=CommonFunctions.getXpathWebElement(driver, "(//*[@label='BENEFICIARYREMITPREVIEWPAGE.EXCHANGE_RATE'])");
		String exchangRateReviewText = CommonFunctions.getText(driver,exchangeRateTextReviewPage).toString().toUpperCase().trim();
		System.out.println("exchangRateReviewText :"+exchangRateReviewText.trim().toString().toUpperCase());
		WebElement totalTranscationCostTextReviewPage=CommonFunctions.getXpathWebElement(driver, "(//*[@label='BENEFICIARYREMITPREVIEWPAGE.TOTAL_TRANS_COST'])");
		String totalTransactionReviewText = CommonFunctions.getText(driver,totalTranscationCostTextReviewPage).toString().toUpperCase().trim();
		System.out.println("totalTransactionReviewText :"+totalTransactionReviewText.trim().toString().toUpperCase());
		Assert.assertNotNull(exchangRateReviewText, "Exchange Rate is not visible in review page");
		Assert.assertNotNull(totalTransactionReviewText, "Exchange Rate is not visible in review page");
	}
	@And("^User enters available Nickname$")
	public void user_enters_NickName_available() throws Throwable {

		LoginPage.nickName.clear();
		CommonFunctions.sendKeysToElement(driver, LoginPage.nickName,firstBeneficiary);
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User should see the Benificiary details populated$")
	public void user_should_see_the_benificiary_details_populated_screen() throws Throwable {
		WebElement element=CommonFunctions.getXpathWebElement(driver,"//*[@class='selected-beneficiary']//*[@class='item-value']");
		Assert.assertNotNull(element.getText().toString().toUpperCase().trim(), "Selected Beneficiary is not visible");
		System.out.println("Beneficiary Name : "+element.getText());
		Assert.assertTrue(element.getText().toString().toUpperCase().trim().equals(selectedBeneficiary.toString().toUpperCase().trim()), "Beneficiary is not available");
	}
	@And("^User should see the defaulted currency$")
	public void default_currency() throws Throwable {
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement defaulted=CommonFunctions.getXpathWebElement(driver,"//*[@class='input-wrapper']//ion-label[@id='lbl-0']//*[@class='type']");
		CommonFunctions.waitForRMTLoadIcon(driver);
		String defaultCurren = CommonFunctions.getText(driver, defaulted);
		Assert.assertTrue(defaultCurren.toString().toUpperCase().trim().equals("AED"), "Currency is not defaulted to 'AED' ");
	}
	@When("^User selects the benificiary$")
	public void benifiaciryaddition_select() throws Throwable {
		CommonFunctions.getObjectBeneficiaryClick(driver,DataMapRowData.get("beneficiary"));
		CommonFunctions.waitForRMTLoadIcon(driver);

		if(CommonFunctions.getXpathWebElement(driver,"//*[@class='selected-beneficiary']//*[@class='item-value']").isDisplayed()) {
			selectedBeneficiary = DataMapRowData.get("beneficiary").toString().toUpperCase().trim();
		}
		System.out.println("Beneficiary selected is  : "+selectedBeneficiary);
	}
	@Then("^User should see the top 5 exchange rate on the RMT Landing page$")
	public void listRemittanecCurrencies_frequent() throws Throwable {

		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement ele=CommonFunctions.getXpathWebElement(driver, "//*[@id='selectedFlag']");
		Assert.assertTrue(ele.isDisplayed()
				&&ele.isEnabled(), "Currency Button option is not available");
		CommonFunctions.clickButton(driver,ele);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement remittanceCurrencyOpt=CommonFunctions.getXpathWebElement(driver, "//*[@class='searchbar-search-icon']");
		List<WebElement> remittanceCurrencyOption=CommonFunctions.getXpathWebElements(driver, "//*[@class='remittance__list--item item item-block item-md']");
		currencyExchangeRateTopFive=CommonFunctions.currencylistTopfive(driver,remittanceCurrencyOption);
		CommonFunctions.clickButton(driver, LoginPage.backButton);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.captureScreenshot(driver);
	}
	@And("^User should see the Exchangerate and amount to be transferred$")
	public void user_enters_the_remittance_amount_then() throws Throwable {
		Assert.assertNotNull(exchangeRateLanding
				, "Exchangerate amount is not displayed");
		Assert.assertNotNull(remittanceAmount
				, "RemittanceAmount to be transferred is not displayed ");
		Assert.assertTrue(!exchangeRateLanding.equalsIgnoreCase("")
				&&!remittanceAmount.equalsIgnoreCase(""), "Exchangerate and amount to be transferred are not displayed ");

	}
	@And("^User verifies contact in the list of benificiaries$")
	public void benifiaciry_verify() throws Throwable {
		boolean flag=CommonFunctions.getObjectBeneficiary(driver,DataMapRowData.get("nickname"));
		Assert.assertTrue(flag
				, "Beneficiary is not available in the list");
		if(flag) {
			selectedBeneficiary = DataMapRowData.get("nickname").toString().toUpperCase().trim();
		}
		System.out.println("Beneficiary selected is  : "+selectedBeneficiary);
	}
	@Then("^User should see the top 5 exchange rate on the RMT remittance page$")
	public void listRemittanecCurrencies_remittance() throws Throwable {

		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement ele=CommonFunctions.getXpathWebElement(driver, "//*[@id='selectedFlag']");
		Assert.assertTrue(ele.isDisplayed()
				&&ele.isEnabled(), "Currency Button option is not available");
		CommonFunctions.clickButton(driver,ele);
		CommonFunctions.waitForRMTLoadIcon(driver);
		WebElement remittanceCurrencyOpt=CommonFunctions.getXpathWebElement(driver, "//*[@class='searchbar-search-icon']");
		List<WebElement> remittanceCurrencyOption=CommonFunctions.getXpathWebElements(driver, "//*[@class='remittance__list--item item item-block item-md']");
		currencyExchangeRateTopFive=CommonFunctions.currencylistTopfive(driver,remittanceCurrencyOption);
		CommonFunctions.clickButton(driver, LoginPage.backButton);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.captureScreenshot(driver);
	}
	@Then("^User selects the frequently used or top 5 currency$")
	public void listRemittanecCurrencies_selects() throws Throwable {

		Thread.sleep(1500);
		CommonFunctions.waitForRMTLoadIcon(driver);
		if(CommonFunctions.getXpathWebElement(driver, "//span[@id='selectedFlag']").isDisplayed()) {
			WebElement ele=CommonFunctions.getXpathWebElement(driver, "//span[@id='selectedFlag']");
			Assert.assertTrue(ele.isDisplayed()
					&&ele.isEnabled(), "Currency Button option is not available");
			CommonFunctions.clickButton(driver,ele);
			CommonFunctions.waitForRMTLoadIcon(driver);
		}
		List<WebElement> remittanceCurrencyListOption=CommonFunctions.getXpathWebElements(driver, "//*[@class='remittance__list--item-details']");
		CommonFunctions.currencylistTopfiveselect(driver, remittanceCurrencyListOption);
		CommonFunctions.waitForRMTLoadIcon(driver);
		CommonFunctions.captureScreenshot(driver);
	}
	@After
	public void embedScreenshot(Scenario scenario) throws Throwable{
		if(scenario.isFailed()) {
			try {
				// Simulating Exceptions
				throw new Exception("Test Failure");
			} catch (Exception ex){
				exceptionMessage=ex.getMessage();
				log.log(Level.ALL, ex.getMessage(), ex);
			}
		}
		System.out.println("Test logs from webdriver : "+driver.manage().logs().toString());   
		System.out.println("get Cookies from webdriver : "+driver.manage().getCookies().toString());   
		System.out.println("Exception Message from logger : "+exceptionMessage);
		String result = CommonFunctions.embedScreenshot(scenario,driver,exceptionMessage);
		if(!driver.equals(null)) {
			DriverManager.destroyDriver(driver);
		}
		System.out.println("Exception Message : "+exceptionMessage);
		try {
			setResult(result,DataMapRowData.get("DataBinding"),DataMapRowData.get("ScenarioDesc"),DataMapRowData.get("Feature"),transactionReference,exchangeRateLanding,transferAmount,remittanceAmount,exchangeRateConfirmationScreen,
					chargesConfirmationScreen,totalAmountConfirmationScreen,exceptionMessage);
		}catch (Exception e){
			System.out.println("Exception : "+e.getMessage());
		}
	}

}
