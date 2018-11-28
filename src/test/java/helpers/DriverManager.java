package helpers;

import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

/**
 * A generic WebDriver manager, it works with local and remote instances of WebDriver.
 *
 * @author: Confusions Personified
 * @src: http://rationaleemotions.wordpress.com/2013/07/31/parallel-webdriver-executions-using-testng/
 */
public class DriverManager {

    /*
    This simple line does all the mutlithread magic.
    For more details please refer to the src link above :)
    */
    public static WebDriver driverInstance=null;
    private static ThreadLocal<WebDriver> driver = new ThreadLocal<WebDriver>();
    static Logger log;

    static {
    	log = Logger.getLogger(DriverManager.class);
    }

    public static WebDriver getDriver(String browser) {
    		log.info("Thread has no WedDriver, creating new one");
    		setWebDriver(DriverHelper.createInstance(browser));
    		log.debug("Getting instance of remote driver" + driver.get().getClass());
    		driverInstance=driver.get();
    		return driverInstance;
    }
    
    public static WebDriver getDriver(String browser,String model, String version) {
		log.info("Thread has no WedDriver, creating new one");
		setWebDriver(DriverHelper.createInstance(browser,model,version));
		log.debug("Getting instance of remote driver" + driver.get().getClass());
		driverInstance=driver.get();
		return driverInstance;
}

    public static void setWebDriver(WebDriver driver) {
    		driver.manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);
    		DriverManager.driver.set(driver);
    }
    
    public static WebDriver getdriverInstance(){
    		return driverInstance;
    }

    /**
     * Returns a string containing current browser name, its version and OS name.
     * This method is used in the the *WebDriverListeners to change the test name.
     * */
    public static String getBrowserInfo(){
    	log.debug("Getting browser info");
    	return null;
    }
    
    public static void destroyDriver(WebDriver webDriver) {
    	webDriver.quit();
    }
}