package com.cucumber.pageFactory;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

public class ApplicationPage extends BasePage {

    public ApplicationPage(WebDriver driver){
        super(driver);
    }
    @FindBy(how= How.XPATH,using="//div[@class='swiper-slide']//div[@class='text-box']//input[@ng-model='fields.finacleUserCorporateId']")
    public static WebElement finacleUserCorporateId;

    @FindBy(how= How.XPATH,using="//div[@class='swiper-slide']//input[@ng-model='fields.finacleUserPassword']")
    public static WebElement finacleUserPassword;

    @FindBy(how= How.XPATH,using="//div[@class='col-sm-11 login-form']//button[@class='login-btn rakLoginBtn-middle ng-binding ng-scope']")
    public static WebElement loginButton;

    @FindBy(how= How.XPATH,using="//i[@class='spirt-icon send-money-icon']")
    public static WebElement sendmoneyIcon;
    @FindBy(xpath = "//i[@class='spirt-icon send-money-icon']")
    public static By sendmoney;
    @FindBy(xpath = "//div[@class='tab-links']//span[contains(text(),'RAKMoney')]")
    public static WebElement RAKMoney;

    @FindBy(how= How.XPATH,using="//fin-input[@option-array='toBenTypeArray']//select[@class='fin-input fin-select ng-pristine ng-untouched ng-valid mbsc-comp mbsc-sel-hdn']/preceding-sibling::input")
    public static WebElement ngpristine;

    @FindBy(how= How.XPATH,using="//div[@ng-hide='rakSendMoney.rakMoney.isPromoSelected']//fin-input[@option-array='fromAccountArray']//select[@class='fin-input fin-select ng-pristine ng-untouched ng-valid mbsc-comp mbsc-sel-hdn']/preceding-sibling::input")
    public static WebElement rakSendMoney;
    @FindBy(how= How.XPATH,using="//div[@class='fin-input-container fin-input-container-half2']//div[@class='input-body2 input-body2-dropdown']//select[@ng-model='rakSendMoney.rakMoney.selectedCurrency' and @title='Select']/preceding-sibling::input")
    public static WebElement selectedCurrency;
    @FindBy(how= How.XPATH,using="//fin-input[@type='money']//div[@class='input-body']//input[@ng-model='rakSendMoney.rakMoney.amount']")
    public static WebElement amount;
    @FindBy(how= How.XPATH,using="//fin-input[@option-array='purposeArray']//select[@class='fin-input fin-select ng-pristine ng-untouched ng-valid mbsc-comp mbsc-sel-hdn']/preceding-sibling::input")
    public static WebElement purpose;

    @FindBy(how= How.XPATH,using="//fin-input[@option-array='reasonArray']//select[@class='fin-input fin-select ng-pristine ng-untouched ng-valid mbsc-comp mbsc-sel-hdn']/preceding-sibling::input")
    public static WebElement reason;
    @FindBy(how= How.XPATH,using="//div[@class='label-wrap']//button[@class='btn--special-btn btn-middle rak-button-right ng-binding' and contains(text(),'Proceed')]")
    public static WebElement proceed;
    @FindBy(xpath = "//div[@class='label-wrap']//button[@class='btn--special-btn btn-middle rak-button-small ng-binding' and contains(text(),'Confirm')]")
    public static By confirm;
    @FindBy(xpath = "//div[@class='summary-BenfReq main-form-heading-ServiceReq']//span[contains(text(),'ransaction')]")
    public static By ransaction;
    @FindBy(xpath = "//p[@class='rak-sum-txt']//span[@class='rak-sum-label ng-binding' and text()='Reference ID']/following::span[1]")
    public static By referenceid;


    //div[@class='label-wrap']//button[@class='btn--special-btn btn-middle rak-button-right ng-binding' and contains(text(),'Proceed')]
}
