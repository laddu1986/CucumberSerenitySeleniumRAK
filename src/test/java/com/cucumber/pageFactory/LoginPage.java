package com.cucumber.pageFactory;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

public class LoginPage extends BasePage {

	public LoginPage(WebDriver driver){
		super(driver);
	}

	@FindBy(how= How.XPATH,using="//*[@class='selected-beneficiary']//*[@class='item-value']")
	public static WebElement selectedbenficiaryname;
	@FindBy(how= How.XPATH,using="(//*[@class='selected-beneficiary']//*[@class='item-value'])[2]")
	public static WebElement selectedbenficiarynameUpdate;
	//*[contains(text(),'Change')]
	/*@FindBy(how= How.XPATH,using="//*[@class='edit']")
	public static WebElement editlink;*/
	@FindBy(how= How.XPATH,using="//*[@class='rakiconrak-back-arrow']")
	public static WebElement backButton;
	@FindBy(how= How.XPATH,using=" //*[@class='bank-info-list']//*[@class='item-value']")
	public static WebElement bankinfoRecipientValue;
	@FindBy(how= How.XPATH,using="(//*[@class='okey-btn'])")
	public static WebElement okTransactionReviewPage;
	@FindBy(how= How.XPATH,using="(//*[@name='remittanceModel.amount']/input)[2]")
	public static WebElement amountReviewButton;
	@FindBy(how= How.XPATH,using="//*[@class='wallet icon icon-md ion-md-cash item-icon' and @aria-label='cash']")////following-sibling::text()")
	public static WebElement walletBalance;
	@FindBy(how= How.XPATH,using="//*[@class='amount']")
	public static WebElement availableBalanceAccInfo;
	@FindBy(how= How.XPATH,using="//*[@class='holder-name']/text()")
	public static WebElement maskedcard;
	@FindBy(how= How.XPATH,using="//*[@ng-reflect-name='remittanceModel.cardSecurityPi']//*[@class='input-cover']")
	public static WebElement cvv;
	@FindBy(how= How.XPATH,using="//*[contains(text(),'Add new Credit Card')]")
	public static WebElement addNewCreditCard;
	@FindBy(how= How.XPATH,using="//*[@class='rak-input card-number-input item item-block item-md item-input item-multiple-inputs input-has-value item-input-has-value']//*[@class='input input-md']/input")
	public static WebElement cardDetails;
	@FindBy(how= How.XPATH,using="//*//ion-input[@ng-reflect-name='remittanceModel.cardHolderName']//*[@ng-reflect-name='remittanceModel.cardHolderName']")
	public static WebElement cardHolderName;
	@FindBy(how= How.XPATH,using="//*[@aria-labelledby='lbl-130']/span")
	public static WebElement ExpiryMonth;
	@FindBy(how= How.XPATH,using="//*[@aria-labelledby='lbl-131']/span")
	public static WebElement ExpiryYear;
	@FindBy(how= How.XPATH,using="//*//ion-input[@ng-reflect-name='remittanceModel.securityCode']//*[@ng-reflect-name='remittanceModel.securityCode']")
	public static WebElement cvvAddCard;
	@FindBy(how= How.XPATH,using="//*[contains(text(),'Done')]")
	public static WebElement doneCardAdd;
	@FindBy(how= How.XPATH,using="//page-add-card[4]//*//ion-checkbox//*[@class='checkbox-icon']/div")
	public static WebElement saveCardDetialsCheckbox;
	@FindBy(how= How.XPATH,using="(//*[@ng-reflect-label='BENEFICIARYREMITPREVIEWPAGE.ED'])[2]")
	public static WebElement editButtonAmountReview;
	@FindBy(how= How.XPATH,using="//*[contains(text(),'Change')]")
	public static WebElement editlink;
	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//ion-label[@id='lbl-0']//*[@class='type']")
	public static WebElement defaultCurrency;
	@FindBy(how= How.XPATH,using="//input[@ng-reflect-name='identifier_code1']")
	public static WebElement ifscCode;
	@FindBy(how= How.XPATH,using="//div[@class='rak-currency__input-footer']//span[@class='symbol']")
	public static WebElement exchangeRateLandingScreenLogin;
	@FindBy(how= How.XPATH,using="//input[@ng-reflect-name='loginModel.userId']")
	public static WebElement userID;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Transfer History')]")
	public static WebElement transferHistory;

	@FindBy(how= How.XPATH,using="//*[@class='list-item ']")
	public static WebElement transferDetails;

	@FindBy(how= How.XPATH,using="(//*[contains(text(),'Transfer History')])[3]")
	public static WebElement transferHistoryPage;

	@FindBy(how= How.XPATH,using="//input[@ng-reflect-name='loginModel.passWord']")
	public static WebElement password;

	@FindBy(how= How.XPATH,using="//span[@id='selectedFlag']")
	public static WebElement remittanceCurrencyButtonPreSelection;

	@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//ion-segment-button[contains(text(),'Bank Transfer')]")
	public static WebElement accountTransferOptionPostCurrency;

	@FindBy(how= How.XPATH,using="//*[@class='available-balance']")
	public static WebElement availableBalanceIcon;

	//@FindBy(how= How.XPATH,using="/html/body/ion-app/ng-component/ion-nav/page-account-info/ion-content/div[2]/div[2]/div[2]/div/ion-list/ion-item[1]/div[1]/div/ion-label/div")
	@FindBy(how= How.XPATH,using="//*[@label='ACCOUNTINFOPAGE.IBAN']//parent::small//preceding::div[@class='account-data']")
	public static WebElement iBanNumber;

	@FindBy(how= How.XPATH,using="//*[@class='amount']")
	public static WebElement availableBalance;

	@FindBy(how= How.XPATH,using="//*[@class='alert-sub-title']")
	public static WebElement errorMessage;

	@FindBy(how= How.XPATH,using="//*[@controlname='preLoginModel.forgotEmiratesID']//*[@class='rak-input-message-error showMessage']")
	public static WebElement errorMessageEmiratesID;

	//*[@ion-button='alert-button']//*[text()='Ok']
	@FindBy(how= How.XPATH,using="//button[@ion-button='alert-button']//*[text()='Ok']")
	public static WebElement errorOkButtton;

	//@FindBy(how= How.XPATH,using="//button[@class='rak-input-password-toggle disable-hover item-button button button-md button-clear button-clear-md button-clear-md-dark']")
	@FindBy(how= How.XPATH,using="//div[@class='rak-input-password-holder']//*[@class='rakiconrak-eye-close']//parent::span//parent::button")
	public static WebElement viewPasswordButton;

	//@FindBy(how= How.XPATH,using="//button[@class='rak-button-active rak-button-full disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//*[contains(text(),'Sign In')]//parent::button")
	public static WebElement signin;

	@FindBy(how= How.XPATH,using="//span[@class='button-inner' and text()='Ok']/parent::button")
	public static WebElement okbutton;

	@FindBy(how= How.XPATH,using="//ion-icon[@ios='ios-log-out']")
	public static WebElement logoutbutton;

	@FindBy(how= How.XPATH,using="//span[@class='button-inner' and contains(text(),'Yes')]")
	public static WebElement yesbutton;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Cash Pickup')]")
	public static WebElement cashTransferOption;

	@FindBy(how= How.XPATH,using="//ion-segment-button[contains(text(),'Bank Transfer')]")
	public static WebElement accountTransferOption;

	//@FindBy(how= How.XPATH,using="//form[@class='ng-untouched ng-pristine ng-valid']//span[@id='selectedFlag']")
	@FindBy(how= How.XPATH,using="//span[@id='selectedFlag']")
	public static WebElement remittanceCurrencyButton;

	@FindBy(how= How.XPATH,using="//span[@id='selectedFlag']")
	public static WebElement remittanceCurrencyButtonAccountTransfer;

	@FindBy(how= How.XPATH,using="//page-sample-transaction-currency")
	public static WebElement remittanceCurrencyOption;

	@FindBy(how= How.XPATH,using="//*[@class='input-cover']")
	public static WebElement fromCurrency;

	@FindBy(how= How.XPATH,using="//*[@class='output-cover']")
	public static WebElement toCurrency;

	//@FindBy(how= How.XPATH,using="//form[@class='ng-untouched ng-pristine ng-valid']//input[@name='onBoardingModel.amount']")
	@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//input[@name='onBoardingModel.amount']")
	public static WebElement fromAmount;

	@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//input[@name='onBoardingModel.amount']//parent::ion-input")
	public static WebElement fromAmountFetch;
	/*    
    @FindBy(how= How.XPATH,using="//page-sample-transaction//form[@class='ng-pristine ng-valid ng-touched']//input[@name='onBoardingModel.amount']")
    public static WebElement fromAmountAccountTransfer;*/

	@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//input[@name='onBoardingModel.convertedAmount']")
	public static WebElement toAmount;

	@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//input[@name='onBoardingModel.convertedAmount']//parent::ion-input")
	public static WebElement toAmountFetch;

	@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//div[@class='rak-currency__input-footer']//span[@class='symbol']")
	public static WebElement exchangeRateLandingScreen;

	@FindBy(how= How.XPATH,using=".//*[@ng-reflect-name='remittanceModel.firstName']/input")
	public static WebElement firstName;

	@FindBy(how= How.XPATH,using=".//*[@ng-reflect-name='remittanceModel.LastName']/input")
	public static WebElement lastName;

	@FindBy(how= How.XPATH,using=".//*[@ng-reflect-name='remittanceModel.nickName']/input")
	public static WebElement nickName;

	@FindBy(how= How.XPATH,using=".//*[@ng-reflect-name='remittanceModel.middleName']/input")
	public static WebElement middleName;

	@FindBy(how= How.XPATH,using=".//*[@ng-reflect-name='remittanceModel.accountNumber']/input")
	public static WebElement accountNumber;

	@FindBy(how= How.XPATH,using=".//*[@ng-reflect-name='remittanceModel.iBANno']/input")
	public static WebElement ibanNumber;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Locate Bank')]")
	public static WebElement locateBank;

	@FindBy(how= How.XPATH,using="//ion-radio[@value='A']")
	public static WebElement accountButton;

	@FindBy(how= How.XPATH,using="//ion-select[@ng-reflect-name='remittanceModel.selectedPurpos']")
	public static WebElement purpose;

	@FindBy(how= How.XPATH,using="//page-remittance-recipient[2]//ion-select[@ng-reflect-name='remittanceModel.selectedPurpos']")
	public static WebElement purposeAccountTransfer;

	@FindBy(how= How.XPATH,using="//ion-select[@ng-reflect-name='remittanceModel.selectedReason']")
	public static WebElement reason;

	@FindBy(how= How.XPATH,using="//page-remittance-recipient[2]//ion-select[@ng-reflect-name='remittanceModel.selectedReason']")
	public static WebElement reasonAcccountTransfer;

	@FindBy(how= How.XPATH,using="//button[@ion-button='action-sheet-button']")
	public static WebElement purposeOption;

	@FindBy(how= How.XPATH,using="//div[@class='action-sheet-group']")
	public static WebElement employmentOption;

	@FindBy(how= How.XPATH,using="//page-beneficiary-remittance//*[contains(text(),'Next')]//parent::span//parent::button")
	public static WebElement nextButtonBeneficiaryTransaction;

	@FindBy(how= How.XPATH,using="//button[@ion-button='action-sheet-button']")
	public static WebElement reasonOption;

	//@FindBy(how= How.XPATH,using="//form[@class='formStyle ng-valid ng-dirty ng-touched']//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	//@FindBy(how= How.XPATH,using="//form[@class='formStyle ng-dirty ng-touched ng-valid']//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//page-remittance-recipient//*[contains(text(),'Next')]//parent::span//parent::button")
	public static WebElement submitTransaction;

	//@FindBy(how= How.XPATH,using="//ion-list[@class='instant-payment-menu list list-md']")
	@FindBy(how= How.XPATH,using="//ion-list[contains(@class,'instant-payment-menu list list')]")
	public static WebElement instantPaymentOption;

	@FindBy(how= How.XPATH,using="//input[@ng-reflect-name='other_bank_name']")
	public static WebElement bankName;

	@FindBy(how= How.XPATH,using="//input[@ng-reflect-name='other_branch_name']")
	public static WebElement branchName;

	//@FindBy(how= How.XPATH,using="//form[@class='ng-valid ng-dirty ng-touched']//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	//@FindBy(how= How.XPATH,using="//page-remittance-bank-locator//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//page-remittance-bank-locator//*[contains(text(),'Next')]//parent::span//parent::button")
	public static WebElement bankSearchNextButton;

	//@FindBy(how= How.XPATH,using="//button[@class='see-all-btn pull-right disable-hover button button-md button-default button-default-md button-round button-round-md']")
	@FindBy(how= How.XPATH,using="//page-remittance-bank-locator//*[contains(text(),'See All')]//parent::span//parent::button")
	public static WebElement seeAllButton;

	//@FindBy(how= How.XPATH,using="//ion-item[@class='list-item item item-block item-md']//ion-label[@class='label label-md']")
	//@FindBy(how= How.XPATH,using="//ion-list[@class='branch-list list list-md']")
	@FindBy(how= How.XPATH,using="//ion-list[contains(@class,'branch-list list list')]")
	public static WebElement bracnhOption;

	@FindBy(how= How.XPATH,using="//custom-input[@controlname='remittanceModel.modeType']//ion-input[@class='input input-md ng-untouched ng-pristine ng-invalid']/input")
	public static WebElement otpField;

	//@FindBy(how= How.XPATH,using="//page-remittance-preview//div[@class='page-body-start show-body']//div[@class='item-info']")
	@FindBy(how= How.XPATH,using="//div[@class='page-body-start show-body']//div[@class='item-info']")
	public static WebElement exchangeRateConfirmScreen;

	//@FindBy(how= How.XPATH,using="//page-remittance-preview//div[@class='bank-info-list']//div[contains(text(),'transaction cost')]//following-sibling::div[@class='item-value']")
	//@FindBy(how= How.XPATH,using="//page-remittance-preview//div[@class='bank-info-list']//*[contains(text(),'transaction cost')]//parent::div[1]//following-sibling::div[@class='item-value']")
	@FindBy(how= How.XPATH,using="//div[@class='bank-info-list']//*[contains(text(),'transaction cost')]//parent::div[1]//following-sibling::div[@class='item-value']")
	public static WebElement totalAmountConfirmScreen;

	//@FindBy(how= How.XPATH,using="//page-remittance-preview//div[@class='bank-info-list']//*[contains(text(),'transaction cost')]")
	//@FindBy(how= How.XPATH,using="//page-remittance-preview//div[@class='bank-info-list']//*[contains(text(),'transaction cost')]//parent::div")
	@FindBy(how= How.XPATH,using="//div[@class='bank-info-list']//*[contains(text(),'transaction cost')]//parent::div")
	public static WebElement chargesConfirmScreen;

	//@FindBy(how= How.XPATH,using="//button[@class='rak-button-active rak-button-full disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//*[contains(text(),'Confirm')]//parent::span//parent::button")
	public static WebElement confirmButton;

	@FindBy(how= How.XPATH,using="//div[@class='message-holder' and contains(normalize-space(),'Successful')]")
	public static WebElement successMessage;

	//@FindBy(how= How.XPATH,using="//div[@class='awesome-holder']//button[@class='rak-button-active rak-button-full disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//*[contains(text(),'OK')]//parent::span//parent::button")
	public static WebElement okButton;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Ok')]//parent::span//parent::button")
	public static WebElement okButtonPwd;

	//@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//page-sample-transaction[2]//*[@class='button-inner']//parent::button")
	public static WebElement nextButton;

	//@FindBy(how= How.XPATH,using="//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//*[contains(text(),'Next')]//parent::span//parent::button")
	public static WebElement nextButtonLogin;

	@FindBy(how= How.XPATH,using="//*[@class='tab-selector latest-transaction']")
	public static WebElement latestTransaction;

	//@FindBy(how= How.XPATH,using="//*[@class='filter-btn']//ion-icon[@class='icon icon-md ion-ios-funnel']") 
	@FindBy(how= How.XPATH,using="//ion-icon[contains(@class,'ion-ios-funnel')]")
	public static WebElement dateFilterButton;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-label='DATERANGEPICKERPAGE.TRANSACTIO']") 
	public static WebElement dateRangeHeading;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-label='DATERANGEPICKERPAGE.DONE']") 
	public static WebElement doneTransaction;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'See full History')]")
	public static WebElement seeFullHistory;

	@FindBy(how= How.XPATH,using="//*[@class='rak-header-navigation' and contains(normalize-space(),'Transaction History')]")
	public static WebElement transactionHistory;

	@FindBy(how= How.XPATH,using="//page-transaction-history//div[@class='tab-holder']//*[contains(text(),'All')]")
	public static WebElement showAllTransactions;

	@FindBy(how= How.XPATH,using="//page-transaction-history//div[@class='tab-holder']//*[contains(text(),'Debits')]")
	public static WebElement debitTransactions;

	@FindBy(how= How.XPATH,using="//page-transaction-history//div[@class='tab-holder']//*[contains(text(),'Credits')]")
	public static WebElement creditTransactions;

	//@FindBy(how= How.XPATH,using="//page-transaction-history//ion-icon[@class='icon icon-md ion-ios-funnel']")
	@FindBy(how= How.XPATH,using="//page-transaction-history//ion-icon[contains(@class,'funnel')]")
	public static WebElement dateFilter;

	@FindBy(how= How.XPATH,using="(//page-transaction-history//div[@class='transaction-body']//div[@class='ico-block']/img[@alt='added-balance']//following::div[@class='info-wrap']/div[1])[1]")
	public static WebElement creditTransactionDescription;

	@FindBy(how= How.XPATH,using="(//page-transaction-history//div[@class='transaction-body']//div[@class='ico-block']/img[@alt='account-ico']//following::div[@class='info-wrap']/div[1])[1]")
	public static WebElement debitTransactionDescription;

	@FindBy(how= How.XPATH,using="//ion-nav")
	public static WebElement appMain;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Problem logging in?')]")
	public static WebElement problemSigninin;

	@FindBy(how= How.XPATH,using="//page-recover-credentials//div[@class='rak-header-holder' and contains(normalize-space(),'Recover Credentials')]")
	public static WebElement recoverCredentialsPage;

	@FindBy(how= How.XPATH,using="//ion-radio[@ng-reflect-value='forgotPassword']//span")
	public static WebElement forgotPassword;

	@FindBy(how= How.XPATH,using="//ion-radio[@ng-reflect-value='forgotUserID']//span")
	public static WebElement forgotUserId;

	@FindBy(how= How.XPATH,using="//ion-radio[@ng-reflect-value='forgotBlockedUserID']//span")
	public static WebElement userIdBlocked;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Proceed')]//parent::span//parent::button")
	public static WebElement proceedButtonRecoverCredentials;

	@FindBy(how= How.XPATH,using="(//*[contains(text(),'Proceed')]//parent::span//parent::button)[2]")
	public static WebElement proceedButtonRecoverCredentialsScreen;

	@FindBy(how= How.XPATH,using="//page-forgot-emiratesid-mobile//div[@class='rak-header-holder' and contains(normalize-space(),'Enable User ID')]")
	public static WebElement enableUserIdScreen;

	@FindBy(how= How.XPATH,using="//page-forgot-emiratesid-mobile//div[@class='rak-header-holder' and contains(normalize-space(),'Forgot User ID')]")
	public static WebElement forgotUserIdScreen;

	@FindBy(how= How.XPATH,using="//page-forgot-emiratesid-mobile//div[@class='rak-header-holder' and contains(normalize-space(),'Forgot Password')]")
	public static WebElement forgotPasswordScreen;

	@FindBy(how= How.XPATH,using="//ion-input[@ng-reflect-name='preLoginModel.forgotEmiratesID']//input")
	public static WebElement emiratesID;

	@FindBy(how= How.XPATH,using="//ion-input[@ng-reflect-name='preLoginModel.forgotMobileNumb']//input")
	public static WebElement regMobileNumber;

	@FindBy(how= How.XPATH,using="//page-forgot-emiratesid-mobile//*[@ng-reflect-name='preLoginModel.forgotMobileNumb']/input")
	public static WebElement mobileNumberForgotPassword;

	//@FindBy(how= How.XPATH,using="//page-remittance-recipient//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//page-remittance-recipient//*[contains(text(),'Next')]//parent::span//parent::button")
	public static WebElement nextButtonTransaction;

	//@FindBy(how= How.XPATH,using="//page-remittance-recipient[2]//button[@class='rak-button-active rak-button-full rak-button disable-hover button button-md button-default button-default-md button-round button-round-md button-md-primary']")
	@FindBy(how= How.XPATH,using="//page-remittance-recipient[2]//*[contains(text(),'Next')]//parent::span//parent::button")
	public static WebElement nextButtonTransactionAccountTransfer;

	//@FindBy(how= How.XPATH,using="//page-sample-transaction[@class='ion-page show-page']//div[@class='currency-divider']")
	@FindBy(how= How.XPATH,using="//page-sample-transaction[@class='ion-page show-page']//div[@class='currency-divider currency-divider--down']")
	public static WebElement currencyDivider;

	@FindBy(how= How.XPATH,using="//*[@class='click-block click-block-enabled click-block-active']")
	public static WebElement laodIcon;

	@FindBy(how= How.XPATH,using="//div[@class='message-holder']/h5")
	public static WebElement transactionMessage;

	//page-remittance-preview/following-sibling::page-remittance-init//div[@class='profile']
	@FindBy(how= How.XPATH,using="//*[@class='user-profile']//*[@aria-label='menu']")
	public static WebElement userProfileButton;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Manage Beneficiaries')]")
	public static WebElement manageBeneficiaries;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Manage Payment Cards')]")
	public static WebElement managePaymentOption;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Change Password')]")
	public static WebElement changePassword;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-name='personalInfoModel.currentPwd']/input")
	public static WebElement currentPassword;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Change Password')]//parent::span//parent::button")
	public static WebElement changePasswordButton;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-name='personalInfoModel.newPwd']/input")
	public static WebElement newPassword;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-name='personalInfoModel.confirmPwd']/input")
	public static WebElement confirmPassword;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Update Personal Info')]")
	public static WebElement updatePersonalInfo;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Edit')]")
	public static WebElement editPersonalInfo;

	//@FindBy(how= How.XPATH,using="//div[@class='edit-pic']//ion-icon[@class='icon icon-md ion-md-create']")
	@FindBy(how= How.XPATH,using="//div[@class='edit-pic']//ion-icon[contains(@class,'create')]")
	public static WebElement editImageIcon;

	@FindBy(how= How.XPATH,using="//div[@class='hero-section']//*[@class='rak_heading_2']")
	public static WebElement fullname;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//*[@id='lbl-78']//following-sibling::ion-select[@class='select select-md ng-untouched ng-pristine ng-valid']//*[@class='select-text']")
	public static WebElement nationalityEditPersonal;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//*//following-sibling::ion-input[@name='emirates']")
	public static WebElement emiratesIDEditPersonal;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//*//following-sibling::ion-input[@name='passport']")
	public static WebElement passportEditPersonal;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//*[@id='lbl-77']//following-sibling::ion-select[@class='select select-md ng-untouched ng-pristine ng-valid']//*[@class='select-text']")
	public static WebElement genderEditPersonal;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-name='personalInfoModel.empStatus']")
	public static WebElement employmentStatus;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-name='personalInfoModel.maritalStatu']")
	public static WebElement maritalStatus;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Save')]")
	public static WebElement savePersonalInfo;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//ion-input[@name='firstname']")
	public static WebElement saveInfoPageGender;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//ion-input[@name='lastname']")
	public static WebElement saveInfoPageNationality;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//ion-input[@name='passport']")
	public static WebElement saveInfoPagePassport;

	@FindBy(how= How.XPATH,using="//*[@class='input-wrapper']//ion-input[@name='emirates']")
	public static WebElement saveInfoPageEmiratesID;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-header='PERSONALINFO.GENDER']//ion-label")
	public static WebElement gender;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-header='PERSONALINFO.NATIONALITY']//ion-label")
	public static WebElement nationality;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-label='PERSONALINFO.PPNO']//ion-label")
	public static WebElement passport;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-label='PERSONALINFO.EID']//ion-label")
	public static WebElement emiratesid;

	@FindBy(how= How.XPATH,using="//*[@class='hero-icon']/img")
	public static WebElement imagePhoto;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-value='RESIDENCE']")
	public static WebElement residence;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-value='OFFICE']")
	public static WebElement office;

	@FindBy(how= How.XPATH,using="//div[@class='rak-header-holder']//*[@class='rak-header-navigation']//*[@class='rakiconrak-back-arrow']")
	public static WebElement backbutton;

	@FindBy(how= How.XPATH,using="//*[@class='rak-header-navigation']")
	public static WebElement managePaymentHeading;

	@FindBy(how= How.XPATH,using="//div[@class='hero-section']//*[@class='rak_heading_2']")
	public static WebElement totalBeneficiaries;

	@FindBy(how= How.XPATH,using="//*[@class='add-info']")
	public static WebElement infoBeneficiary;

	@FindBy(how= How.XPATH,using="//*[@class='tab-switcher']//*[contains(text(),'Bank')]")
	public static WebElement bankBeneficiariesTab;

	@FindBy(how= How.XPATH,using="//*[@class='tab-switcher']//*[contains(text(),'Cash')]")
	public static WebElement cashBeneficiariesTab;

	@FindBy(how= How.XPATH,using="//*[@class='rak-header-holder' and contains(normalize-space(),'Beneficiaries')]")
	public static WebElement beneficiariesScreen;

	@FindBy(how= How.XPATH,using="(//*//ion-list[contains(@class,'info-wrap list list')]//div[@class='details'])[1]")
	public static WebElement beneficiaryDetails;

	@FindBy(how= How.XPATH,using="(//*//ion-list[contains(@class,'info-wrap list list')]//ion-icon[@aria-label='trash'])[1]")
	public static WebElement deleteBeneficiaryIcon;

	@FindBy(how= How.XPATH,using="(//*//*[contains(@class,'info-wrap list list')]//div[@class='details'])[1]//preceding-sibling::h3")
	public static WebElement beneficiary;

	@FindBy(how= How.XPATH,using="//*[@class='selected-beneficiary']//div[@class='item-value']")
	public static WebElement selectedBeneficiaryPage;

	@FindBy(how= How.XPATH,using="//*[@class='selected-beneficiary']//*[@class='item-value']")
	public static WebElement benificiaryAdded;

	@FindBy(how= How.XPATH,using="//*[@ng-reflect-label='BENEFICIARYREMITTANCEPAGE.EDIT']")
	public static WebElement editButtonBeneficiary;

	@FindBy(how= How.XPATH,using="//button//span[@class='button-inner' and contains(text(),'Yes')]")
	public static WebElement deleteBeneficiaryConfirmButton;

	@FindBy(how= How.XPATH,using="(//*[@class='hero-section']//*[@class='rak_heading_2'])[2]")
	public static WebElement totalBeneficiariesPostDeletion;

	@FindBy(how= How.XPATH,using="//*[@class='tab-switcher']//*[contains(text(),'Cash')]")
	public static WebElement cashTab;

	@FindBy(how= How.XPATH,using="//*[@class='tab-switcher']//*[contains(text(),'Bank')]")
	public static WebElement bankTab;

	@FindBy(how= How.XPATH,using="//*//*[@class='logout-image']")
	public static WebElement logOutButton;

	@FindBy(how= How.XPATH,using="//*[@class='alert-button-group']//button/span[contains(text(),'Yes')]/parent::button")
	public static WebElement logOutConfirm;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'View Charges')]")
	public static WebElement rmtPage;

	@FindBy(how= How.XPATH,using="//*[contains(text(),'Account Balance & Info')]")
	public static WebElement accountBalanceInformation;
}
