package functions;

import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.ContextAware;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;


public class CommonFunction {

	

    //public static WebDriver driver;
    //public static WebDriverWait wait = new WebDriverWait(driver, 60);
    public static void dropDownSelectOutsideUae(String value, WebDriver driver) throws InterruptedException {
    	
    	WebDriverWait wait = new WebDriverWait(driver, 60);
    	
        try{
           // WebDriver driver = DriverFactory.getCurrentDriver();
        //	CommonFunction.switchToWebview(driver);
        	 wait.until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='mbsc-fr-btn0 mbsc-fr-btn-e mbsc-fr-btn' and text()='Set']"))));
            wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//div[@class='mbsc-fr-btn0 mbsc-fr-btn-e mbsc-fr-btn' and text()='Set']")));
    			wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//div[@class='mbsc-fr-btn0 mbsc-fr-btn-e mbsc-fr-btn' and text()='Set']")));
            WebElement element = driver.findElement(By.xpath("//div[@role='option']/div[text()='"+value+"']"));
            if(!element.isDisplayed()){
            	System.out.println("pass");
                searchloop: for(int i = 0; i<=10;i++){
                    if(element.isDisplayed()){
                        Thread.sleep(1000);
                        WebElement seletedElement =driver.findElement(By.xpath("//div[@role='option' and @aria-selected='true']/div"));
                        seletedElement.click();
                        Thread.sleep(1000);
                        WebDriverWait wait1 = new WebDriverWait(driver, 40);
                        WebElement newelement = driver.findElement(By.xpath("//div[@role='option']/div[text()='"+value+"']"));
                        wait.until(ExpectedConditions.elementToBeClickable(newelement));
                        newelement.click();
                        Thread.sleep(1000);
                        driver.findElement(By.xpath("//div[@class='mbsc-fr-btn0 mbsc-fr-btn-e mbsc-fr-btn' and text()='Set']")).click();
                        break searchloop;
                    }else{
                       scrollValues(driver);
                    }
                }
            }else{
            //	System.out.println("fail");
                element.click();
                Thread.sleep(1000);
                driver.findElement(By.xpath("//div[@class='mbsc-fr-btn0 mbsc-fr-btn-e mbsc-fr-btn' and text()='Set']")).click();
                Thread.sleep(1000);
            }
           // ExReporter.log(LogStatus.INFO, value +" Value successfully selected in the page");
        } catch (Exception E) {
        	System.out.println(E);
            //ExReporter.log(LogStatus.ERROR, value +" not located in the page");
        }
    }
    
	public static void scrollValues (WebDriver driver) {
		try{

			//WebDriver driver = DriverFactory.getCurrentDriver();

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
				switchToWebview(driver);
			
		}catch (Exception e) {
			//ExReporter.log(LogStatus.ERROR, "Scroll Values Failed");
		}
	}
	
	public static void switchToNative(WebDriver driver) {
		//WebDriver driver = DriverFactory.getCurrentDriver();
		((ContextAware) driver).context("NATIVE_APP");
	}

	public static void switchToWebview(WebDriver driver) {
		//WebDriver driver = DriverFactory.getCurrentDriver();
		Set<String> contextNames = ((ContextAware) driver).getContextHandles();
		for (String contextName : contextNames) {
			//System.out.println(contextName);
			if (contextName.startsWith("WEBVIEW")) {
				((ContextAware) driver).context(contextName);
			}
		}
	}
	
	public static void waitElement(By by, WebDriver driver) {
		WebDriverWait wait = new WebDriverWait(driver, 60);
		wait.until(ExpectedConditions.presenceOfElementLocated(by));
		wait.until(ExpectedConditions.elementToBeClickable(by));
	}
	
	public static void balanceLoadingWaitOutsideUae(String element,WebDriver driver) throws InterruptedException {
		//WebDriver driver = DriverFactory.getCurrentDriver();
		waitloop : for(int i =0 ; i<2;i++){
			try{
				//WebElement el = driver.findElement(SendMoneyOutsideUaePage.availableBalance(Currency));
				waitElement(By.xpath(element), driver);
				break waitloop;
			}catch(Exception e){
				System.out.println(e);
				Thread.sleep(1500);
				
			}
		}
	}
	
	public static void flipUpHalf(WebDriver driver) {
		try{
		//WebDriver driver = DriverFactory.getCurrentDriver();
		((ContextAware) driver).context("NATIVE_APP"); // driver -> your android
														// driver
		Dimension size = driver.manage().window().getSize();
		int startY = (int) (size.height * 0.80);
		int endY = (int) (size.height * 0.50);
		int startX = size.width / 2;
		String type=driver.getClass().toString();
		if(type.contains("IOSDriver"))
		((IOSDriver) driver).swipe(startX, startY, startX, endY, 1000);
		else
			((AndroidDriver) driver).swipe(startX, startY, startX, endY, 1000);
		switchToWebview(driver);
	}catch (Exception e) {
		//ExReporter.log(LogStatus.ERROR, "Screen Flip Failed");
	}
	}
	
	public static void exchangeratevalidationRAKMoney(String Currency,WebDriver driver) {
		try {
			//WebDriver driver = DriverFactory.getCurrentDriver();
			driver.findElement(By.xpath("//div[@class='fin-input-container fin-input-container-half2']//div[@class='input-body2 input-body2-dropdown']//select[@ng-model='rakSendMoney.rakMoney.selectedCurrency' and @title='Select']/preceding-sibling::input")).click();
			CommonFunction.waitElement(By.xpath("//div[@class='mbsc-fr-btn1 mbsc-fr-btn-e mbsc-fr-btn' and text()='Cancel']"),driver);
			driver.findElement(By.xpath("//div[@class='mbsc-fr-btn1 mbsc-fr-btn-e mbsc-fr-btn' and text()='Cancel']")).click();
			
			// wait for and Get the Exchange rate
			CommonFunction.waitElement(By.xpath("//div[@class='fin-input-container rakTransfersexchangerate-block']/p[@class='rakexchangevalue ng-binding']"),driver);
			String value = driver.findElement(By.xpath("//div[@class='fin-input-container rakTransfersexchangerate-block']/p[@class='rakexchangevalue ng-binding']")).getText().toString();
			String r1[] = value.split("=");
			String exRate[] = r1[1].split(" ");
			System.out.println(exRate[0]);
		//	Utilities.fStorein(Driver.TD_File, SCName, TestDataBinder, "Exhange_Rate", exRate[0]);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static void exchangeratevalidation(String Currency,WebDriver driver) {
		try {
			//WebDriver driver = DriverFactory.getCurrentDriver();
			driver.findElement(By.xpath("//fin-input[@option-array='frequencyArray']//select[@class='fin-input fin-select ng-pristine ng-untouched ng-valid mbsc-comp mbsc-sel-hdn']/preceding-sibling::input")).click();
			CommonFunction.waitElement(By.xpath("//div[@class='mbsc-fr-btn1 mbsc-fr-btn-e mbsc-fr-btn' and text()='Cancel']"),driver);
			driver.findElement(By.xpath("//div[@class='mbsc-fr-btn1 mbsc-fr-btn-e mbsc-fr-btn' and text()='Cancel']")).click();
			
			// wait for and Get the Exchange rate
			CommonFunction.waitElement(By.xpath("//div[@class='fin-input-container rakTransfersexchangerate-block']/p[@class='rakexchangevalue ng-binding']"),driver);
			String value = driver.findElement(By.xpath("//div[@class='fin-input-container rakTransfersexchangerate-block']/p[@class='rakexchangevalue ng-binding']")).getText().toString();
			String r1[] = value.split("=");
			String exRate[] = r1[1].split(" ");
			System.out.println(exRate[0]);
		//	Utilities.fStorein(Driver.TD_File, SCName, TestDataBinder, "Exhange_Rate", exRate[0]);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static void flipUp(WebDriver driver) {
		try{
		//WebDriver driver = DriverFactory.getCurrentDriver();
		((ContextAware) driver).context("NATIVE_APP"); // driver -> your android
														// driver
		Dimension size = driver.manage().window().getSize();
		int startY = (int) (size.height * 0.80);
		int endY = 0;
		int startX = size.width / 2;
		String type=driver.getClass().toString();
		if(type.contains("IOSDriver"))
		((IOSDriver) driver).swipe(startX, startY, startX, endY, 1000);
		else
			((AndroidDriver) driver).swipe(startX, startY, startX, endY, 1000);
		switchToWebview(driver);
	}catch (Exception e) {
		//ExReporter.log(LogStatus.ERROR, "Screen Flip Failed");
	}
	}
	
	
	public static void valuePrint(By by, WebDriver driver) {
		try {
			//WebDriver driver = DriverFactory.getCurrentDriver();
			String value = driver.findElement(by).getText().toString();
			System.out.println(value);
		} catch (Exception e) {
			//ExReporter.log(LogStatus.FAIL, "No Such Element to Print");
		}
	}

}
