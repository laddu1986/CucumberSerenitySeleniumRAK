package helpers;


import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.LocalFileDetector;
import org.openqa.selenium.remote.RemoteWebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import functions.CommonFunction;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import static helpers.DriverHelper.getDr;
import static helpers.DriverHelper.setDr;
import static helpers.Utils.ResultsPath;
import static helpers.Utils.connectDB;

public class Util {
	public static Logger logger = Logger.getLogger("Inside helper Class "+ Util.class.getName().toUpperCase());

	public static void closeDr() {
		logger.info("Closing browser and driver");
		getDr().close();
		getDr().quit();
	}
	public static String replacePathSymbol(String str) {
		str = str.replace("/", "-");
		String[] a = str.split("-");
		int length = a.length;
		String str1 = a[length - 1];
		return str1;
	}

	public static void openUrl(String URL) {
		logger.info("Opening URL: " +URL);
		getDr().get(URL);
	}

	public static void waitFor(long fWait) {
		logger.info("Impplicity wait for " + fWait + " ns.");
		try {
			Thread.sleep(fWait);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	public static String fn_TakeSnapshot(WebDriver driver, String DestFilePath) throws Exception{
		String TS = fn_GetTimeStamp();
		File srcfileObj;
		String OS = driver.getClass().toString();
		//System.out.println(OS);
		if(OS.contains("Android")) {
			CommonFunction.switchToNative(driver);
			TakesScreenshot tss=(TakesScreenshot) driver;
			srcfileObj= tss.getScreenshotAs(OutputType.FILE);
			CommonFunction.switchToWebview(driver);
		}else {

			TakesScreenshot tss=(TakesScreenshot) driver;
			srcfileObj= tss.getScreenshotAs(OutputType.FILE);

		}
		DestFilePath=DestFilePath+TS+".png";
		File DestFileObj=new File(DestFilePath/*,"_test.png"*/);
		//System.out.println("relative path :  "+DestFileObj.getPath());
		FileUtils.copyFile(srcfileObj, DestFileObj);
		return DestFilePath;
	}
	public static String fn_GetTimeStamp(){
		DateFormat DF=DateFormat.getDateTimeInstance();
		Date dte=new Date();
		String DateValue=DF.format(dte);
		DateValue=DateValue.replaceAll(":", "_");
		DateValue=DateValue.replaceAll(",", "");
		DateValue=DateValue.replaceAll(" ", "_");
		return DateValue;
	}
	public static WebElement fluentWait(By locator) {
		long timeStart = System.currentTimeMillis();
		WebElement elem = (new WebDriverWait(DriverHelper.dr, 10))
				.until(ExpectedConditions.presenceOfElementLocated(locator));
		long timeEnd = System.currentTimeMillis();
		logger.info("Element waited for: " + (timeEnd - timeStart) + " ms.");
		return elem;
	}

	public static String getText(By locator) {
		return fluentWait(locator).getText();
	}

	public static String getAttr(By locator, String attr) {
		return fluentWait(locator).getAttribute(attr);
	}

	public static boolean verifyText(By locator, String expectedText) {
		return getText(locator).equals(expectedText);
	}

	public static boolean verifyTitle(String expectedTitle) {
		return getDr().getTitle().equals(expectedTitle);
	}

	public static boolean elemExist(By locator) {
		return (getDr().findElements(locator).size() != 0);
	}

	public static boolean elemPresent(By locator) {
		return fluentWait(locator).isDisplayed();
	}

	public static void click(By locator) {
		fluentWait(locator).click();
	}

	public static void dbClick(By locator) {
		(new Actions(getDr())).doubleClick(fluentWait(locator)).perform();
	}

	public static void rClick(By locator) {
		(new Actions(getDr())).contextClick(fluentWait(locator)).perform();
	}

	public static void hover(By locator) {
		(new Actions(getDr())).moveToElement(fluentWait(locator)).perform();
	}

	public static void sendKeys(By locator, String text) {
		fluentWait(locator).sendKeys(text);
	}

	public static void drag(By elemLocator, By destLocator) {
		(new Actions(getDr()))
		.dragAndDrop(fluentWait(elemLocator), fluentWait(destLocator))
		.perform();
	}

	public static void dslcAll(By locator) {
		(new Select(fluentWait(locator))).deselectAll();
	}

	public static void dslcByIndex(By locator, int index) {
		(new Select(fluentWait(locator))).deselectByIndex(index);
	}

	public static void dslcByValue(By locator, String value) {
		(new Select(fluentWait(locator))).deselectByValue(value);
	}

	public static void dslctByText(By locator, String text) {
		(new Select(fluentWait(locator))).deselectByVisibleText(text);
	}

	public static void slcMultiple(By locator) {
		System.out.println((new Select(fluentWait(locator))).isMultiple());
	}

	public static void slcByValue(By locator, String value) {
		(new Select(fluentWait(locator))).selectByValue(value);
	}

	public static void slcByIndex(By locator, int index) {
		(new Select(fluentWait(locator))).selectByIndex(index);
	}

	public static void slcByText(By locator, String text) {
		(new Select(fluentWait(locator))).selectByVisibleText(text);
	}

	public static String slcGetAllSelected(By locator) {
		Select selectBox = new Select(fluentWait(locator));
		List<WebElement> selectOptions = selectBox.getAllSelectedOptions();
		String allSelectedText = "";
		for (WebElement temp : selectOptions) {
			allSelectedText = allSelectedText + " " + temp.getText();
			System.out.println("allSelectedText: " + allSelectedText);
		}
		return allSelectedText;
	}

	public static void slcGetAllOptions(By locator) {
		Select selectBox = new Select(fluentWait(locator));
		List<WebElement> selectOptions = selectBox.getOptions();
		for (WebElement temp : selectOptions) {
			System.out.println("getText" + temp.getText());
		}
	}

	public static void scrollTo(By locator) {
		((JavascriptExecutor) getDr())
		.executeScript("arguments[0].scrollIntoView(true);", fluentWait(locator));
	}

	public static void scrollBottom() {
		((JavascriptExecutor) getDr())
		.executeScript("window.scrollTo(0,Math.max(document.documentElement.scrollHeight,document.body.scrollHeight,document.documentElement.clientHeight));");
	}

	public static void upload(By inputLocator, String path) {
		LocalFileDetector detector = new LocalFileDetector();
		File f = detector.getLocalFile(path);
		WebElement elem = fluentWait(inputLocator);
		((RemoteWebElement) elem).setFileDetector(detector);
		elem.sendKeys(f.getAbsolutePath());
		logger.info("Uploading file: " + f.getAbsolutePath());
	}


	public static String mailConfirmAddr() {
		WebDriver newDr = new FirefoxDriver();
		WebDriver orig = getDr();
		newDr.get("http://putsbox.com/");
		setDr(newDr);
		click(By.cssSelector(".btn.btn-primary.btn-large"));
		String addr = getAttr(By.id("putsbox-token-input"), "value");
		closeDr();
		setDr(orig);
		logger.info("Got testing email address: " + addr);
		return addr;
	}

	public static void mailConfirmRefresh(String addr, By linkLocator) {
		String s = addr.split("@")[0];
		getDr().get("http://putsbox.com/" + s + "/inspect");
		waitFor(3000);
		getDr().get(getAttr(By.linkText("HTML"), "href"));
		getDr().get(getAttr(linkLocator, "href"));
	}

	public static void setSlider(By handleLocator, By trackLocator, int percentage) {
		int width = Integer.parseInt(fluentWait(trackLocator).getCssValue("width").replace("px", ""));
		int dx = (int) (percentage / 100.0 * width);
		(new Actions(getDr())).dragAndDropBy(fluentWait(handleLocator), -999, 0).perform();
		(new Actions(getDr())).dragAndDropBy(fluentWait(handleLocator), dx, 0).perform();
	}
	public synchronized static void setResult(String result,
			String dataBinding,String scenario,String feature,String transaction,
			String exratelandingscreen, String fromamount, String toamount, 
			String exrateconfirmscreen, String charges, String totaldebit,String ReasonOfFailure) throws Exception{
		String imageName=result.split(";")[1];
		String statusTest=result.split(";")[0];
		String executiondate=getSysDate();
		String query="";
		if(statusTest.toUpperCase().equalsIgnoreCase("FAIL")) {
			query="INSERT INTO ExecutionResults (IterationDate,ScenarioID,DataBinding,Feature,Status,Screenshot,ReasonOfFailure,Transaction_Reference,Exchange_Rate_Landing_Screen,From_Amount,To_Amount,Exchange_Rate_Confirmation_Screen,Charges,Total_Debit_Amount) VALUES ('"+executiondate+"','"+scenario+"','"+dataBinding+"','"+feature+"','"+statusTest+"','"+imageName+"','"+ReasonOfFailure+"','"+transaction+"','"+exratelandingscreen+"','"+fromamount+"','"+toamount+"','"+exrateconfirmscreen+"','"+charges+"','"+totaldebit+"')";
			System.out.print("query is : @@@@ "+query);
		}else {
			query="INSERT INTO ExecutionResults (IterationDate,ScenarioID,DataBinding,Feature,Status,Screenshot,Transaction_Reference,Exchange_Rate_Landing_Screen,From_Amount,To_Amount,Exchange_Rate_Confirmation_Screen,Charges,Total_Debit_Amount) VALUES ('"+executiondate+"','"+scenario+"','"+dataBinding+"','"+feature+"','"+statusTest+"','"+imageName+"','"+transaction+"','"+exratelandingscreen+"','"+fromamount+"','"+toamount+"','"+exrateconfirmscreen+"','"+charges+"','"+totaldebit+"')";
			System.out.print("query is : @@@@ "+query);
		}
		connectDB(ResultsPath,query);
	}
	public static String getSysDate() {
		DateFormat dateFormat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date=new Date();
		return dateFormat.format(date).toString();

	}
}
