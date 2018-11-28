package pageobjects;

import helpers.DriverHelper;
import org.openqa.selenium.WebDriver;

public abstract class BaseClass {
	public static WebDriver driver= DriverHelper.dr;
	public static boolean bResult;

	public  BaseClass(WebDriver driver){
		BaseClass.driver = driver;
		BaseClass.bResult = true;
	}

}
