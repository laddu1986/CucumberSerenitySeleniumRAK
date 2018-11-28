package com.app.functions;

import static helpers.ReportHelper.screenshotsFail;
import static helpers.ReportHelper.screenshotsPass;
import static helpers.Util.fn_TakeSnapshot;
import static helpers.Utils.captureScreen;
import static helpers.Utils.getImageName;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.logging.ConsoleHandler;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Level;

import com.cucumber.pageFactory.LoginPage;
import org.openqa.selenium.ContextAware;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.cucumber.listener.Reporter;

import cucumber.api.Scenario;
import helpers.DriverManager;
import helpers.ReportHelper;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;
import net.serenitybdd.core.annotations.findby.By;

public class CommonFunctions {
	public static ArrayList<String> currencylistTopfive(WebDriver driver,List<WebElement> elements) throws InterruptedException {
		ArrayList<String> listCurrencyRate=new ArrayList<String>();
		for(WebElement element:elements) {
			if(element.findElement(By.xpath("//*[@name='star']")).isDisplayed()
					&&element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).isDisplayed()
					&&element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).isDisplayed()){

				Assert.assertTrue(element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).isDisplayed(), "Starred Currency is not visible");
				Assert.assertNotNull(element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).getText().trim().toUpperCase(),"Exchange Rate for starrred Currency is not populated");
				Assert.assertTrue(element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).isDisplayed(), "Starred Currency is not visible");
				Assert.assertNotNull(element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).getText().toString().toUpperCase().trim(),"Exchange Rate for starrred Currency is not populated");
				listCurrencyRate.add(element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).getText().trim().toString().toUpperCase()
						+"="+element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).getText().trim().toString().toUpperCase());
			}
		}
		Collections.sort(listCurrencyRate);
		return listCurrencyRate;

	}
	public static ArrayList<String> currencylist(WebDriver driver,WebElement element) throws InterruptedException {
		ArrayList<String> listCurrencyRate=new ArrayList<String>();
		String starrreddata="*";
		waitForElementToBeVisible(driver, element);
		Thread.sleep(1000);
		List<WebElement>listCurrencies=element.findElements(By.xpath("//div[@class='remittance__list--item-details-name']"));
		List<WebElement>listExchangeRates=element.findElements(By.xpath("//div[@class='remittance__list--item-details-val']"));
		if(listCurrencies.size()==listExchangeRates.size()) {
			for(int i=0,j=0;i<listCurrencies.size();i++) {
				if(listCurrencies.get(i).isDisplayed()
						&&listExchangeRates.get(i).isDisplayed()) {
					Assert.assertTrue(listCurrencies.get(i).isDisplayed(), "Currency is not visible");
					Assert.assertNotNull(listCurrencies.get(i).getText().toString().toUpperCase().trim(),"Exchange Rate for Currency is not populated");
					Assert.assertTrue(listExchangeRates.get(i).isDisplayed(), "Exchange Rate for the Currency is not visible");
					Assert.assertNotNull(listExchangeRates.get(i).getText().toString().toUpperCase().trim(),"Exchange Rate Currency is not populated");
					listCurrencyRate.add(listCurrencies.get(i).getText().trim().toString().toUpperCase()
							+"="+listExchangeRates.get(i).getText().trim().toString().toUpperCase());
				}
			}
		}
		List<WebElement> starElement=CommonFunctions.getXpathWebElements(driver, "//*//*[@name='star']");
		for(WebElement ele: starElement) {
			Assert.assertTrue(ele.isDisplayed(), "Exchange Rate for the starrred Currency is not visible");
			Assert.assertTrue(ele.getAttribute("role").trim().toString().toUpperCase().equals("img".trim().toString().toUpperCase()), "Exchange Rate for the starrred Currency is not visible");

		}
		Collections.sort(listCurrencyRate);
		return listCurrencyRate;

	}
	public static boolean getObjectBeneficiary(WebDriver driver,String tableData) {
		boolean flag=false;
		List<WebElement>beneficiaryList=CommonFunctions.getXpathWebElements(driver,"//*[@class='item item-block item-md']//*[@class='label label-md']");
		for(int i=1;i<=beneficiaryList.size();i++) {
			WebElement element=CommonFunctions.getXpathWebElement(driver, "(//*[@class='item item-block item-md']//*[@class='label label-md'])["+i+"]");
			if(element.isDisplayed()
					&&element.getText().toString().toUpperCase().trim()
					.equals(tableData.trim().toUpperCase().toString())) {
				Assert.assertNotNull(element.getText().toString().toUpperCase().trim(), "Beneficiary is not available : "+beneficiaryList.size());
				System.out.println("Added beneficiary : "+tableData.trim().toUpperCase().toString());
				System.out.println("Added beneficiary in UI : "+element.getText().toString().toUpperCase().trim());                   
				flag=true;
			}
		}
		return flag;

	}
	public static void getObjectBeneficiaryClick(WebDriver driver,String tableData) throws Exception {
		boolean flag=false;
		List<WebElement>beneficiaryList=CommonFunctions.getXpathWebElements(driver,"//*[@class='item item-block item-md']//*[@class='label label-md']");
		for(int i=1;i<=beneficiaryList.size();i++) {
			WebElement element=CommonFunctions.getXpathWebElement(driver, "(//*[@class='item item-block item-md']//*[@class='label label-md'])["+i+"]");
			if(element.isDisplayed()
					&&element.getText().toString().toUpperCase().trim().equals(tableData.trim().toUpperCase().toString())) {
				Assert.assertNotNull(element.getText().toString().toUpperCase().trim(), "Beneficiary is not available : "+beneficiaryList.size());
				Assert.assertTrue(element.getText().toString().toUpperCase().trim()
						.equals(tableData.trim().toUpperCase().toString()), "Beneficiary is not Added / updated  : "+beneficiaryList.size());
				CommonFunctions.clickButton(driver, element);
				CommonFunctions.waitForRMTLoadIcon(driver);
				break;
			}
		}
	}
	public static void getObjectBeneficiaryInitialClick(WebDriver driver,String tableData) throws Exception {
		boolean flag=false;
		List<WebElement>beneficiaryList=CommonFunctions.getXpathWebElements(driver,"//*[@class='item item-block item-md']//*[@class='label label-md']");
		for(int i=1;i<=beneficiaryList.size();i++) {
			WebElement element=CommonFunctions.getXpathWebElement(driver, "(//*[@class='item item-block item-md']//*[@class='label label-md'])["+i+"]");
			if(element.isDisplayed()
					&&element.getText().toString().toUpperCase().trim().equals(tableData.trim().toUpperCase().toString())) {
				Assert.assertNotNull(element.getText().toString().toUpperCase().trim(), "Beneficiary is not available : "+beneficiaryList.size());
				Assert.assertTrue(element.getText().toString().toUpperCase().trim()
						.equals(tableData.trim().toUpperCase().toString()), "Beneficiary is not Added / updated  : "+beneficiaryList.size());
				CommonFunctions.clickButton(driver, element);
				CommonFunctions.waitForRMTLoadIcon(driver);
				break;
			}
		}
	}
	public static void currencylistTopfiveselect(WebDriver driver,List<WebElement> elements) throws Exception {
		ArrayList<String> listCurrencyRate=new ArrayList<String>();
		for(WebElement element:elements) {
			if(element.findElement(By.xpath("//*[@name='star']")).isDisplayed()
					&&element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).isDisplayed()
					&&element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).isDisplayed()){

				Assert.assertTrue(element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).isDisplayed(), "Starred Currency is not visible");
				Assert.assertNotNull(element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).getText().trim().toUpperCase(),"Exchange Rate for starrred Currency is not populated");
				Assert.assertTrue(element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).isDisplayed(), "Starred Currency is not visible");
				Assert.assertNotNull(element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).getText().toString().toUpperCase().trim(),"Exchange Rate for starrred Currency is not populated");
				listCurrencyRate.add(element.findElement(By.xpath("//div[@class='remittance__list--item-details-name']")).getText().trim().toString().toUpperCase()
						+"="+element.findElement(By.xpath("//div[@class='remittance__list--item-details-val']")).getText().trim().toString().toUpperCase());
			}
		}
		Collections.sort(listCurrencyRate);
		CommonFunctions.clickButton(driver,listCurrencyRate.get(0));
		CommonFunctions.waitForRMTLoadIcon(driver);
	}
	public static WebElement elementClickable(WebDriver driver ,String str) {

		WebElement element = null;
		int i=1;
		boolean flag=true;
		for(i=1;i<=30;i++) {
			//while(flag) {
			if(CommonFunctions.isElementdisplayedEnabled(driver,"("+str+")["+i+"]")) {
				flag=false;
				element= driver.findElement(By.xpath("("+str+")["+i+"]"));
				CommonFunctions.waitForElementToBeClickable(driver, element);
				System.out.println("element is visible and enabled ");

			}
			i++;
		}
		//}
		return element;         


	}
	public static WebElement elementClickableUI(WebDriver driver ,String str) {

		WebElement element = null;
		int i=1;
		boolean flag=true;
		for(i=1;i<=20;i++) {

			//while(flag) {
			if(CommonFunctions.isElementdisplayed(driver,"("+str+")["+i+"]")) {
				flag=false;
				System.out.println("element is visible and ");
				return driver.findElement(By.xpath("("+str+")["+i+"]"));
			}
			i++;
		}
		return element;         


	}
	public static void clickButtonText(WebDriver driver,String text) throws Exception {
		WebElement element=null;
		boolean flag=false;
		//driver.findElements(By.ByjQuerySelector.xpath(""));
		for(WebElement ele:driver.findElements(/*net.serenitybdd.core.annotations.findby.*/By.buttonText(text))){
			if(ele.isDisplayed()&&ele.isEnabled()) {
				element=ele;
				flag=true;
				System.out.println(text+" Button is visible with X Coordinate : "+ele.getLocation().getX());
				System.out.println(text+" Button is visible with Y Coordinate : "+ele.getLocation().getY());
				System.out.println(text+" Button is visible with tag name : "+ele.getTagName());
			}
		}
		Assert.assertTrue(flag,text+" button is not visbile and clickable");
		if(flag) {
			CommonFunctions.clickButton(driver, element);
		}
	}
	public static boolean isElementdisplayed(WebDriver driver, String element){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		boolean flag=false;
		try {
			WebElement ele=driver.findElement(By.xpath(element));
			flag=ele.isDisplayed();
		}catch(Exception e) {
			System.out.println("WebElement is not visible : "+flag);
			//flag=false;
			//break;
		}
		//flag?"element is visible":"element is not visible"
		return flag;
	}
	public static boolean isElementdisplayedEnabled(WebDriver driver, String element){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		boolean flag=false;
		try {
			WebElement ele=driver.findElement(By.xpath(element));
			flag=ele.isDisplayed()&&ele.isEnabled();
		}catch(Exception e) {
			System.out.println("WebElement is not visible and not enabled : "+flag);
			flag=false;
		}
		//flag?"element is visible":"element is not visible"
		return flag;
	}

	public static WebDriver launchBrowser(HashMap<String,String> hm){

		System.setProperty("sauceTestName", hm.get("ScenarioID")+"_"+hm.get("DataBinding"));
		WebDriver driver = DriverManager.getDriver(hm.get("Devicetype"));
		//WebDriver driver = DriverManager.getDriver(hm.get("Devicetype"),hm.get("devicemodel"),hm.get("deviceversion"));
		System.out.println(" scenario ID in : launchBrowser ######  "+hm.get("ScenarioID"));
		ReportHelper reportHelper=new ReportHelper(hm.get("ScenarioID")+"_"+hm.get("DataBinding"));
		WebDriverWait wait = new WebDriverWait(driver, 60);
		return driver;
	}

	public static WebElement getXpathWebElement(WebDriver driver,String text) {
		WebElement element=null;
		boolean flag=false;
		for(WebElement ele:driver.findElements(net.serenitybdd.core.annotations.findby.By.xpath(text))){
			if(ele.isDisplayed()) {
				element=ele;
				flag=true;
				System.out.println(text+" Element is visible : x Coordinate "+ele.getLocation().getX());
				System.out.println(text+" Element is visible : y Coordinate"+ele.getLocation().getY());
				System.out.println(text+" Element is visible with tag name : "+ele.getTagName());
			}
		}
		return element;
	}
	public static void enterData(WebDriver driver,String xpath,String data) {
		JavascriptExecutor jse = (JavascriptExecutor)driver;
		jse.executeScript("document.getElementByXpath('"+xpath+"').value='"+data+"';");
	}
	public static void scrollInto(WebDriver driver,String str) {
		WebElement element=null;
		((JavascriptExecutor)driver).executeScript("document.evaluate("+str+", document, null,"
				+ " XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).scrollIntoViewIfNeeded();");    
		Point point = element.getLocation();
		int xcord = point.getX();  
		int ycord = point.getY();
	}
	public static List<WebElement> getXpathWebElements(WebDriver driver,String text) {
		List<WebElement>listWebElements=new ArrayList<WebElement>();
		WebElement element=null;
		boolean flag=false;
		for(WebElement ele:driver.findElements(net.serenitybdd.core.annotations.findby.By.xpath(text))){
			if(ele.isDisplayed()) {
				element=ele;
				flag=true;
				System.out.println(text+" Element is visible : x Coordinate "+ele.getLocation().getX());
				System.out.println(text+" Element is visible : y Coordinate"+ele.getLocation().getY());
				System.out.println(text+" Element is visible with tag name : "+ele.getTagName());
				listWebElements.add(ele);
			}
		}
		Assert.assertTrue(flag&&!listWebElements.isEmpty(),text+" Element is not visbile");
		return listWebElements;
	}
	public static void getXpathWebElementClickable(WebDriver driver,String text) throws Exception {
		WebElement element=null;
		boolean flag=false;
		for(WebElement ele:driver.findElements(net.serenitybdd.core.annotations.findby.By.xpath(text))){
			if(ele.isDisplayed()&&ele.isEnabled()) {
				element=ele;
				flag=true;
				System.out.println(text+" Element is visible and clickable: X Coordinate "+ele.getLocation().getX());
				System.out.println(text+" Element is visible : Y Coordinate"+ele.getLocation().getY());
				System.out.println(text+" Element is visible with tag Name : "+ele.getTagName());

			}
		}
		Assert.assertTrue(flag,text+" Element is not visbile and clickable");
		if(flag) {
			CommonFunctions.clickButton(driver, element);
			CommonFunctions.waitForRMTLoadIcon(driver);
		}
	}

	public static void initPage(WebDriver driver){
		PageFactory.initElements(driver, LoginPage.class);
	}

	// Function to capture screenshot and place it in the required location
	public static void captureScreenshot(WebDriver driver) throws Exception {
		String scrnPath = null;
		try {
			scrnPath = fn_TakeSnapshot(driver, screenshotsPass);
			String imagePath=getImageName(scrnPath);
			Reporter.addStepLog("<a href='file:///" + scrnPath + "'> Screenshot : "+imagePath+"</a>");
			//Reporter.addStepLog("<a href='" + captureScreen(driver) + "'>ClickContact</a>");
		} catch (Exception e) {
			scrnPath = fn_TakeSnapshot(driver, screenshotsFail);
			String imagePath=getImageName(scrnPath);
			Reporter.addStepLog("<a href='file:///" + scrnPath + "'> Screenshot : "+imagePath+"</a>");  
			e.printStackTrace();
		}
	}
	public static void waitWebView(WebDriver driver) throws InterruptedException {
		waitloop:
			for (int i = 0; i < 50; i++) {
				Set<String> contextNames = ((ContextAware) driver).getContextHandles();
				for (String contextName : contextNames) {
					if (contextName.startsWith("WEBVIEW")) {
						Set<String> contextNamess = ((ContextAware) driver).getContextHandles();
						for (String contextNamee : contextNamess) {
							if (contextNamee.startsWith("WEBVIEW")) {
								((ContextAware) driver).context(contextNamee);
							}
						}
						break waitloop;
					} else {
						Thread.sleep(2000);
					}
				}
			}
	}
	public static void waitForElementToBeVisible(WebDriver driver, WebElement element){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		wait.until(ExpectedConditions.visibilityOf(element));
	}
	public static boolean waitForElementToBeVisi(WebDriver driver, String element){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		boolean flag=false;
		try {
			driver.findElement(By.xpath(element));
			return true;
		}
		catch (org.openqa.selenium.NoSuchElementException e) {
			return false;
		}
	}
	public static boolean isElementdisplayed(WebDriver driver, WebElement element){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		boolean flag=false;
		try {
			flag=element.isDisplayed();
		}catch(Exception e) {
			flag=true;
		}
		return flag;
	}

	public static void waitForElementToBeClickable(WebDriver driver, WebElement element){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		wait.until(ExpectedConditions.elementToBeClickable(element));
	}

	public static void waitForStaleness(WebDriver driver, WebElement element){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		wait.until(ExpectedConditions.stalenessOf(element));
	}

	public static void waitForRMTLoadIcon(WebDriver driver){
		WebDriverWait wait = new WebDriverWait(driver, Integer.parseInt(getProjectProperty("waitTime")));
		try {
			wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@class='loading-content']//*[@class='double-bounce2']")));
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void closeApp(WebDriver driver){
		((IOSDriver) driver).closeApp();
	}

	public static void launchApp(WebDriver driver){
		((IOSDriver) driver).launchApp();
	}

	public static void resetApp(WebDriver driver){
		((IOSDriver) driver).resetApp();
	}

	public static void sendKeysToElement(WebDriver driver,WebElement element, String keysToSend) {
		waitForElementToBeClickable(driver,element);
		element.clear();
		element.sendKeys(keysToSend);
	}
	public static void clickButton(WebDriver driver,WebElement element) throws Exception {
		Thread.sleep(4000);
		waitForElementToBeClickable(driver,element);
		element.getTagName();
		Assert.assertTrue(element.isDisplayed()&&
				element.isEnabled(), "Element is not displayed");
		try {
			JavascriptExecutor jse = (JavascriptExecutor)driver;
			jse.executeScript("arguments[0].style.outline = \"thick solid #0000FF\";", element);
			jse.executeScript("arguments[0].scrollIntoView(true)", element); 
			System.out.println("inside java script executor for click: "+element.getLocation().getX());
			System.out.println("inside java script executor for click: "+element.getLocation().getY());

			element.click();
		}catch(Exception e) {

			Actions actions = new Actions(driver);
			actions.moveToElement(element).click().perform();
			System.out.println("inside actions executor for click: "+element.getLocation().getX());
			System.out.println("inside actions executor for click: "+element.getLocation().getY());
		}
	}
	public static void clickButton(WebDriver driver,String elementText) throws Exception {
		WebElement element=CommonFunctions.getXpathWebElement(driver, elementText);
		Thread.sleep(4000);
		waitForElementToBeClickable(driver,element);
		element.getTagName();
		Assert.assertTrue(element.isDisplayed()&&
				element.isEnabled(), "Element is not displayed");
		try {
			JavascriptExecutor jse = (JavascriptExecutor)driver;
			jse.executeScript("arguments[0].style.outline = \"thick solid #0000FF\";", element);
			jse.executeScript("arguments[0].scrollIntoView(true)", element); 
			System.out.println("inside java script executor for click: "+element.getLocation().getX());
			System.out.println("inside java script executor for click: "+element.getLocation().getY());
			element.click();
		}catch(Exception e) {

			Actions actions = new Actions(driver);
			actions.moveToElement(element).click().perform();
			System.out.println("inside actions executor for click: "+element.getLocation().getX());
			System.out.println("inside actions executor for click: "+element.getLocation().getY());
		}
	}
	public static void dropDownSelect(WebDriver driver,WebElement element, String option) {
		element.findElement(By.xpath("//span[contains(text(),'"+option+"')]")).click();
	}

	public static boolean isElementVisible(WebDriver driver,WebElement element) {
		boolean flag=false;
		try {
			element.isDisplayed();
			flag=true;
		}catch(Exception e) {

		}
		return flag;

	}
	public static void dropDownSelectDown(WebDriver driver,String value) throws InterruptedException {
		try{
			CommonFunctions.waitForElementToBeVisible(driver, driver.findElement(By.xpath("//*[contains(text(),'Done')]")));
			System.out.println(value);
			WebElement element = driver.findElement(By.xpath("//*[contains(text(),'"+value+"')]"));
			String strAttSet=element.getAttribute("class")+" "+"picker-opt-selected";
			System.out.println("setting attribute : "+strAttSet);
			if(!element.isDisplayed()){
				searchloop: for(int i = 0; i<=10;i++){
					if(element.isDisplayed()){
						Thread.sleep(1000);
						/*//WebElement seletedElement =driver.findElement(By.xpath("//div[@class='picker-col']/div"));
						//System.out.println("passewd column");
						//seletedElement.click();
						 */	
						setAttribute(driver,element,"class",strAttSet);
						System.out.println("value is selected");
						Thread.sleep(1000);
						driver.findElement(By.xpath("//*[contains(text(),'Done')]")).click();
						System.out.println("passewd done");
						break searchloop;
					}else{
						CommonFunctions.scrollValuesDown(driver);
					}
				}
			}else{
				System.out.println("else loop");
				element.click();
				System.out.println("else loop clicked");
				Thread.sleep(1000);
				setAttribute(driver,element,"class",strAttSet);
				System.out.println("value is selected");
				Thread.sleep(1000);
				driver.findElement(By.xpath("//*[contains(text(),'Done')]")).click();
				Thread.sleep(1000);
			}
			System.out.println("passed");
		} catch (Exception E) {
			E.printStackTrace();
		}
	}
	public static void dropDownSelectUp(WebDriver driver,String value) throws InterruptedException {
		try{
			CommonFunctions.waitForElementToBeVisible(driver, driver.findElement(By.xpath("//*[contains(text(),'Done')]")));
			System.out.println(value);
			WebElement element = driver.findElement(By.xpath("//*[contains(text(),'"+value+"')]"));
			String strAttSet=element.getAttribute("class")+" "+"picker-opt-selected";
			System.out.println("setting attribute : "+strAttSet);
			if(!element.isDisplayed()){
				searchloop: for(int i = 0; i<=10;i++){
					if(element.isDisplayed()){
						Thread.sleep(1000);
						//WebElement seletedElement =driver.findElement(By.xpath("//div[@class='picker-col']/div"));
						//System.out.println("passewd column");
						//seletedElement.click();
						setAttribute(driver,element,"class",strAttSet);
						System.out.println("value is selected");
						Thread.sleep(1000);
						driver.findElement(By.xpath("//*[contains(text(),'Done')]")).click();
						System.out.println("passewd done");
						break searchloop;
					}else{
						CommonFunctions.scrollValuesUp(driver);
					}
				}
			}else{
				System.out.println("else loop");
				element.click();
				System.out.println("else loop clicked");
				Thread.sleep(1000);
				setAttribute(driver,element,"class",strAttSet);
				System.out.println("value is selected");
				Thread.sleep(1000);
				driver.findElement(By.xpath("//*[contains(text(),'Done')]")).click();
				Thread.sleep(1000);
			}
			System.out.println("passed");
		} catch (Exception E) {
			E.printStackTrace();
		}
	}
	public static void scrollValuesDown (WebDriver driver) {
		try{
			((ContextAware) driver).context("NATIVE_APP"); // driver -> your android
			// driver
			Dimension size = driver.manage().window().getSize();
			int startY = (int) (size.height * 0.70);
			int endY = (int) (size.height * 0.72);
			int startX = size.width / 2;
			String type=driver.getClass().toString();
			if(type.contains("IOSDriver"))
				((IOSDriver) driver).swipe(startX, startY, startX, endY, 1000);
			else
				((AndroidDriver) driver).swipe(startX, startY, startX, endY, 1000);
			waitWebView(driver);

		}catch (Exception e) {
			System.out.println("scroll up");
		}
	}

	public static void scrollValuesUp (WebDriver driver) {
		try{
			((ContextAware) driver).context("NATIVE_APP"); // driver -> your android
			// driver
			Dimension size = driver.manage().window().getSize();
			int startY = (int) (size.height * 0.85);
			int endY = (int) (size.height * 0.60);
			int startX = size.width / 2;
			String type=driver.getClass().toString();
			if(type.contains("IOSDriver"))
				((IOSDriver) driver).swipe(startX, startY, startX, endY, 1000);
			else
				((AndroidDriver) driver).swipe(startX, startY, startX, endY, 1000);
			waitWebView(driver);

		}catch (Exception e) {
			System.out.println("scroll up");
		}
	}
	public static void setAttribute(WebDriver driver,WebElement element, String attName, String attValue) {
		JavascriptExecutor jse = (JavascriptExecutor)driver;
		jse.executeScript("arguments[0].setAttribute(arguments[1], arguments[2]);", 
				element, attName, attValue);
	}

	public static void menuSelect(WebDriver driver,WebElement element, String option) {
		element.findElement(By.xpath("//*[contains(text(),'"+option+"')]")).click();
	}

	public static void branchSelect(WebDriver driver,WebElement element, String option) {
		//element.findElement(By.xpath("//ion-item[1]//div[contains(normalize-space(),'"+option+"')]/h2")).click();
		element.findElement(By.xpath("(//h2[@class='rak-heading-2'])[1]")).click();
	}

	public static String getText(WebDriver driver,WebElement element) {
		String text = element.getText().toString();
		return text;
	}

	public static String getAttribute(WebDriver driver,WebElement element, String Attribute) {
		String attrbdata=element.getAttribute(Attribute);
		return attrbdata;
	}

	public static void currencySelect(WebDriver driver,WebElement element, String currency) throws InterruptedException {
		waitForElementToBeClickable(driver, element.findElement(By.xpath("//div[@class='remittance__list--item-details-name' and contains(text(),'"+currency+"')]")));
		Thread.sleep(1000);
		element.findElement(By.xpath("//div[@class='remittance__list--item-details-name' and contains(text(),'"+currency+"')]")).click();
	}

	public static void waitElement(WebDriver driver,WebElement element) {
		waitForElementToBeVisible(driver,element);
		waitForElementToBeClickable(driver,element);
	}

	public static Boolean loopTransactionDetails(WebDriver driver,WebElement element) {
		waitForElementToBeVisible(driver,element);
		List<WebElement> nelemets = element.findElements(By.xpath("//ion-nav//page-transaction-history//div[@class='info-wrap'][1]"));
		int n = nelemets.size();
		System.out.println(n);
		Boolean result = true;
		for(int i = 1 ; i <=n ; i++) {
			String value = getText(driver,driver.findElement(By.xpath("(//page-transaction-history//div[@class='transaction-body']//div[@class='info-wrap'][1]//div[@class='ref'][1])["+i+"]")));
			System.out.println(value);
			if(value.equalsIgnoreCase(null)) {
				result = false;
			}
		}
		return result;
	}

	public static Boolean loopBeneficiaryDetails(WebDriver driver,WebElement element) {
		waitForElementToBeVisible(driver,element);
		List<WebElement> nelemets = element.findElements(By.xpath("//page-beneficiaries//ion-list[contains(@class,'info-wrap list list')]//div[@class='add-info']"));
		int n = nelemets.size();
		System.out.println(n);
		Boolean result = true;
		for(int i = 1 ; i <=n ; i++) {
			String value = getText(driver,driver.findElement(By.xpath("(//page-beneficiaries//ion-list[contains(@class,'info-wrap list list')]//div[@class='details'])["+i+"]")));
			System.out.println(value);
			if(value.equalsIgnoreCase(null)) {
				result = false;
			}
		}
		return result;
	}

	public static String getProjectProperty(String keyIndex) {
		Properties properties = null;
		try {
			File file = new File(System.getProperty("user.dir") + "/Database/projectProperties.properties");
			FileInputStream fileInput = new FileInputStream(file);
			properties = new Properties();
			properties.load(fileInput);
			fileInput.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return properties.getProperty(keyIndex);
	}

	public static String embedScreenshot(Scenario scenario, WebDriver driver,String excep) {
		String scrnPath= null;
		String result="";
		String imagePath="";
		if(scenario.isFailed()) {
			result="FAIL";
			Reporter.addScenarioLog(result);
			try {
				scrnPath = fn_TakeSnapshot(driver, screenshotsFail);
				imagePath=getImageName(scrnPath);
				// System.out.println("image path  @@@@@@@@@@@@@@@@@@@@@@@@@ :  "+imagePath);
				Reporter.addStepLog("<a href='file:///" + scrnPath + "'> Screenshot : "+imagePath+"</a>");
			} catch (Exception e) {
				e.printStackTrace();
			}
			imagePath=getImageName(scrnPath);
			Reporter.addStepLog("<a href='file:///" + scrnPath + "'> Screenshot : "+imagePath+"</a>");
		}else {
			result="PASS";
			Reporter.addScenarioLog(result);
			try {
				scrnPath = fn_TakeSnapshot(driver, screenshotsPass);
				imagePath=getImageName(scrnPath);
				Reporter.addStepLog("<a href='file:///" + scrnPath + "'> Screenshot : "+imagePath+"</a>");
			} catch (Exception e) {
				e.printStackTrace();
				Reporter.addStepLog("<a href='file:///" + scrnPath + "'>Screenshot</a>");
			}
		}
		return result+";"+imagePath;
	}
	public static String capturelog(java.util.logging.Logger LOGGER) {
		Handler consoleHandler = null;

		Handler fileHandler  = null;

		try{

			//Creating consoleHandler and fileHandler

			consoleHandler = new ConsoleHandler();

			fileHandler  = new FileHandler("./javacodegeeks.log");

			//Assigning handlers to LOGGER object

			LOGGER.addHandler(consoleHandler);

			LOGGER.addHandler(fileHandler);

			//Setting levels to handlers and LOGGER

			consoleHandler.setLevel(Level.ALL);

			fileHandler.setLevel(Level.ALL);

			LOGGER.setLevel(Level.ALL);

			LOGGER.config("Configuration done.");



			//Console handler removed

			LOGGER.removeHandler(consoleHandler);



			LOGGER.log(Level.FINE, "Finer logged");

		}catch(IOException exception){

			LOGGER.log(Level.SEVERE, "Error occur in FileHandler.", exception);

		}

		return null;

	}


}
