package helpers;


import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.AndroidMobileCapabilityType;
import io.appium.java_client.remote.MobileCapabilityType;


import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.app.functions.CommonFunctions;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;

public class DriverHelper {
	public static Logger logger = Logger.getLogger("Inside helper Class "+ DriverHelper.class.getName().toUpperCase());
	public static WebDriver dr;
	public static String workingDir  = System.getProperty("user.dir");
	public static String URL="http://automationpractice.com";
	public static String subFolder="\\src\\test\\resources";
	public static String RepFolder="\\src\\test\\resources\\ExtentReports";
	public static String USERNAME = "rakqaadmin";
	public static String ACCESS_KEY = "706e4a21-3272-4fc5-ade4-2b6f5627eb74";

	public static WebDriver getDr() {
		return dr;
	}
	public static JavascriptExecutor javascriptExecutor=null;
	public static void setDr(WebDriver dr) {
		DriverHelper.dr = dr;
	}
	
	public static WebDriver createInstance(String browserName) {
		WebDriver driver = null;
		browserName = (browserName != null) ? browserName : "FIREFOX";

		switch (Browser.valueOf(browserName.toUpperCase().toString())) {
		case FIREFOX:
			String geckodriver="C:\\Users\\Shashavalil\\Documents\\Framework\\Core_Frameworks\\cucumber-jvm-template-master\\cucumber-jvm-template-master\\src\\test\\resources\\drivers\\geckodriver.exe";
			System.setProperty("webdriver.gecko.driver",geckodriver);
			FirefoxProfile ffProf = new FirefoxProfile();
			driver = new FirefoxDriver(ffProf);
			break;
		case IE:
			driver = new InternetExplorerDriver();
			break;
		case CHROME:
			String chromedriver="C:\\Users\\Shashavalil\\Documents\\Framework\\Core_Frameworks\\cucumber-jvm-template-master\\cucumber-jvm-template-master\\src\\test\\resources\\drivers\\chromedriver.exe";
			System.setProperty("webdriver.chrome.driver",chromedriver);
			driver = new ChromeDriver();
			System.out.println("driver instance : @@@@@ " + driver.toString());
			driver.manage().window().maximize();
			//driver = new ChromeDriver();
			break;
		case HTMLUNIT:
			driver = new HtmlUnitDriver();
			break;
		case HTMLUNITJS:
			driver = new HtmlUnitDriver(true);
			break;
		case ANDROID:

			try {
				driver = initiateDevice(browserName);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;
		case IOS:
			try {
				driver = initiateDevice(browserName);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;
		case ANDROID_SAUCE:
			try {
				driver = initiateDevice(browserName);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;
		case IOS_SAUCE:
			try {
				driver = initiateDevice(browserName);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;

		default:
			driver = new FirefoxDriver();
			break;
		}
		return driver;
	}

	
	public static WebDriver createInstance(String browserName, String model, String version) {
		WebDriver driver = null;
		browserName = (browserName != null) ? browserName : "FIREFOX";

		switch (Browser.valueOf(browserName.toUpperCase().toString())) {
		case FIREFOX:
			String geckodriver="C:\\Users\\Shashavalil\\Documents\\Framework\\Core_Frameworks\\cucumber-jvm-template-master\\cucumber-jvm-template-master\\src\\test\\resources\\drivers\\geckodriver.exe";
			System.setProperty("webdriver.gecko.driver",geckodriver);
			FirefoxProfile ffProf = new FirefoxProfile();
			driver = new FirefoxDriver(ffProf);
			break;
		case IE:
			driver = new InternetExplorerDriver();
			break;
		case CHROME:
			String chromedriver="C:\\Users\\Shashavalil\\Documents\\Framework\\Core_Frameworks\\cucumber-jvm-template-master\\cucumber-jvm-template-master\\src\\test\\resources\\drivers\\chromedriver.exe";
			System.setProperty("webdriver.chrome.driver",chromedriver);
			driver = new ChromeDriver();
			System.out.println("driver instance : @@@@@ " + driver.toString());
			driver.manage().window().maximize();
			//driver = new ChromeDriver();
			break;
		case HTMLUNIT:
			driver = new HtmlUnitDriver();
			break;
		case HTMLUNITJS:
			driver = new HtmlUnitDriver(true);
			break;
		case ANDROID:

			try {
				driver = initiateDevice(browserName);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;
		case IOS:
			try {
				driver = initiateDevice(browserName);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;
		case ANDROID_SAUCE:
			try {
				driver = initiateDevice(browserName, model, version);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;
		case IOS_SAUCE:
			try {
				driver = initiateDevice(browserName);//new HtmlUnitDriver(true);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			break;

		default:
			driver = new FirefoxDriver();
			break;
		}
		return driver;
	}


	
	private static enum Browser {
		FIREFOX,
		CHROME,
		IE,
		HTMLUNIT,
		ANDROID,
		IOS,
		HTMLUNITJS,
		IOS_SAUCE,
		ANDROID_SAUCE;

	}
	
	public static WebDriver initiateDevice(String deviceType) throws MalformedURLException {
		System.out.println("Called openBrowser in device : "+deviceType);
		if(deviceType.toUpperCase().toString().equalsIgnoreCase("ANDROID".toUpperCase().toString())) {
			System.out.println("Called openBrowser");
			System.out.println(CommonFunctions.getProjectProperty("selhost"));
			String URL = "http://"+CommonFunctions.getProjectProperty("selhost")+":4444/wd/hub";
			System.out.println(URL);
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, "Android");
			capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, CommonFunctions.getProjectProperty("mobileudid"));
			capabilities.setCapability(MobileCapabilityType.APP, CommonFunctions.getProjectProperty("androidapppath"));
			capabilities.setCapability(MobileCapabilityType.NO_RESET, "true");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability(AndroidMobileCapabilityType.CHROMEDRIVER_EXECUTABLE, CommonFunctions.getProjectProperty("chromedriverpath"));
			try {
				//remoteDriver = new AndroidDriver<>(new URL(host), capabilities);
				dr = new AndroidDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else  if(deviceType.toUpperCase().toString().equalsIgnoreCase("IOS".toUpperCase().toString())) {
			System.out.println("Called openBrowser");
			System.out.println(CommonFunctions.getProjectProperty("selhost"));
			String URL = "http://"+CommonFunctions.getProjectProperty("selhost")+":4444/wd/hub";
			System.out.println(URL);
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, "iOS");
			capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "627a911f635d96c083339681b51b47a0b0b1a095");
			capabilities.setCapability(MobileCapabilityType.APP, "/Users/rakbank/Desktop/Apps/RMT.ipa");
			capabilities.setCapability(MobileCapabilityType.NO_RESET, "true");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, "10.0.2");
			capabilities.setCapability("usePrebuiltWDA", "true");
			capabilities.setCapability("wdaLocalPort", "8100");
			try {
				dr = new IOSDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else  if(deviceType.toUpperCase().toString().equalsIgnoreCase("ANDROID_SAUCE".toUpperCase().toString())) {
			System.out.println("Called openBrowser");
			//String URL = "http://127.0.0.1:4725/wd/hub";

			String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability("platformName", "Android");
			capabilities.setCapability("deviceName", "Android Emulator");
			capabilities.setCapability("platformVersion", "6.0");
			capabilities.setCapability("app", "sauce-storage:RMT.apk");
			capabilities.setCapability("deviceOrientation", "portrait");
			capabilities.setCapability("appiumVersion", "1.6.4");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			//capabilities.setCapability("timeZone", "Kolkata");
			capabilities.setCapability("name", System.getProperty("sauceTestName"));
			//capabilities.setCapability("name", "Android Simulator");

			try {
				dr = new AndroidDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		else  if(deviceType.trim().toUpperCase().toString().equalsIgnoreCase("IOS_SAUCE".trim().toUpperCase().toString())) {
			System.out.println("Called openBrowser");
            //String URL = "http://127.0.0.1:4725/wd/hub";

        	    String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
            DesiredCapabilities capabilities = new DesiredCapabilities();
            capabilities.setCapability("platformName", "iOS");
    	    		capabilities.setCapability("deviceName", "iPhone 6 Simulator");
    	    		capabilities.setCapability("platformVersion", "11.0");
    	    		//capabilities.setCapability("app", "sauce-storage:FinacleMobileApp.zip");
    	    		capabilities.setCapability("app", "sauce-storage:RMT.zip");
    	    		capabilities.setCapability("deviceOrientation", "portrait");
    	    		capabilities.setCapability("appiumVersion", "1.7.2");
    	    		//capabilities.setCapability("timeZone", "Kolkata");
    	    		capabilities.setCapability("name", "IOS Simulator");
    	    		capabilities.setCapability("noReset", "true");
    	    		capabilities.setCapability("fullReset", "false");
    	    		capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
            try {
                dr = new IOSDriver(new URL(URL), capabilities);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }	


			/* 	DesiredCapabilities caps = DesiredCapabilities.iphone();
        	caps.setCapability("appiumVersion", "1.4.16");
        	caps.setCapability("deviceName","iPhone 6");
        	caps.setCapability("deviceOrientation", "portrait");
        	caps.setCapability("platformVersion","9.2");
        	caps.setCapability("platformName", "iOS");
        	caps.setCapability("browserName", "");
        	caps.setCapability("app","sauce-storage:myapp.zip");*/
			/*// 	String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			System.out.println("Called openBrowser");
			String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			//File file=new File("/Users/rakbank/Downloads/RMT_UAT.app");
			// File file=new File("/Users/rakbank/Desktop/Apps/FinacleMobileApp.zip");
			DesiredCapabilities capabilities = new DesiredCapabilities().iphone();
			capabilities.setCapability("platformName", "iOS");
			capabilities.setCapability("deviceName","iPhone X Simulator");
			//capabilities.setCapability("deviceName", "iPhone Simulator");
			capabilities.setCapability("browserName", "");
			capabilities.setCapability("platformVersion", "11.0");
			//capabilities.setCapability("app", "https://conv.rakbankonline.ae/corp1/retail/IPA/RMT.app.zip");//MobileCapabilityType.APP
			//capabilities.setCapability(MobileCapabilityType.APP, "sauce-storage:RMT.zip");
			//capabilities.setCapability("app", file.getAbsolutePath());
			//capabilities.setCapability(MobileCapabilityType.APP, "https://conv.rakbankonline.ae/corp1/retail/IPA/RMT.ipa");
			capabilities.setCapability("app", "sauce-storage:RMT.zip");
			//capabilities.setCapability("app", "sauce-storage:FinacleMobileApp.zip");
			capabilities.setCapability("deviceOrientation", "portrait");
			capabilities.setCapability("appiumVersion", "1.7.2");//"1.6.4");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability("timeZone", "Kolkata");
			capabilities.setCapability("name", System.getProperty("sauceTestName"));
			System.out.println("After setting capabilities : "+capabilities.getCapability("app"));*/
			/*String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			DesiredCapabilities capabilities = new DesiredCapabilities();
			//capabilities.setCapability(CapabilityType.BROWSER_NAME, "iOS 11.0");
			capabilities.setCapability("deviceName", "iPhone 8 Simulator");
			//capabilities.setCapability(CapabilityType.PLATFORM, "MAC 11.0");
			capabilities.setCapability("appiumVersion", "1.7.2");
			capabilities.setCapability("app", "sauce-storage:RMT.zip");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability("timeZone", "Kolkata");
			capabilities.setCapability("name", System.getProperty("sauceTestName"));
			try {
				//dr = new IOSDriver(new URL(URL), capabilities);
				dr = new RemoteWebDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}*/

		

		return dr;
	}


	
	public static WebDriver initiateDevice(String deviceType, String model, String version) throws MalformedURLException {
		System.out.println("Called openBrowser in device : "+deviceType);
		if(deviceType.toUpperCase().toString().equalsIgnoreCase("ANDROID".toUpperCase().toString())) {
			System.out.println("Called openBrowser");
			System.out.println(CommonFunctions.getProjectProperty("selhost"));
			String URL = "http://"+CommonFunctions.getProjectProperty("selhost")+":4444/wd/hub";
			System.out.println(URL);
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, "Android");
			//capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "04ea4f298291ff9e");
			capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "04ea4f298291ff9e");
			//capabilities.setCapability(MobileCapabilityType.APP, "/Users/rakbank/Desktop/RAK2FAUNSIGN.apk");
			//capabilities.setCapability(MobileCapabilityType.APP, "/Users/rakbank/Downloads/RAKBANK.apk");//devopsadmin@123
			capabilities.setCapability(MobileCapabilityType.APP, "/Users/rakbank/Desktop/RMT.apk");
			capabilities.setCapability(MobileCapabilityType.NO_RESET, "true");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability(AndroidMobileCapabilityType.CHROMEDRIVER_EXECUTABLE, "/Users/rakbank/Desktop/Framework/RAK Bank/Drivers/chrome_2_30/chromedriver");
			//capabilities.setCapability(AndroidMobileCapabilityType.CHROMEDRIVER_EXECUTABLE, "/Users/rakbank/Desktop/Framework/RAK Bank/Drivers/chrome_2_36/chromedriver");
			try {
				//remoteDriver = new AndroidDriver<>(new URL(host), capabilities);
				dr = new AndroidDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else  if(deviceType.toUpperCase().toString().equalsIgnoreCase("IOS".toUpperCase().toString())) {
			System.out.println("Called openBrowser");
			System.out.println(CommonFunctions.getProjectProperty("selhost"));
			String URL = "http://"+CommonFunctions.getProjectProperty("selhost")+":4444/wd/hub";
			System.out.println(URL);
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, "iOS");
			capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "627a911f635d96c083339681b51b47a0b0b1a095");
			capabilities.setCapability(MobileCapabilityType.APP, "/Users/rakbank/Desktop/Apps/RMT.ipa");
			capabilities.setCapability(MobileCapabilityType.NO_RESET, "true");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, "10.0.2");
			capabilities.setCapability("usePrebuiltWDA", "true");
			capabilities.setCapability("wdaLocalPort", "8100");
			try {
				dr = new IOSDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else  if(deviceType.toUpperCase().toString().equalsIgnoreCase("ANDROID_SAUCE".toUpperCase().toString())) {
			System.out.println("Called openBrowser");
			//String URL = "http://127.0.0.1:4725/wd/hub";

			String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			DesiredCapabilities capabilities = new DesiredCapabilities();
			capabilities.setCapability("platformName", "Android");
			capabilities.setCapability("deviceName", model);
			capabilities.setCapability("platformVersion", version);
			//capabilities.setCapability("app", "https://conv.rakbankonline.ae/corp2/APK/RAK2FAUNSIGN.apk");
			capabilities.setCapability("app", "sauce-storage:RMT.apk");
			capabilities.setCapability("deviceOrientation", "portrait");
			capabilities.setCapability("appiumVersion", "1.6.4");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			//capabilities.setCapability("timeZone", "Kolkata");
			capabilities.setCapability("name", System.getProperty("sauceTestName"));
			//capabilities.setCapability("name", "Android Simulator");

			try {
				dr = new AndroidDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		else  if(deviceType.trim().toUpperCase().toString().equalsIgnoreCase("IOS_SAUCE".trim().toUpperCase().toString())) {
			System.out.println("Called openBrowser");
            //String URL = "http://127.0.0.1:4725/wd/hub";

        	    String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
            DesiredCapabilities capabilities = new DesiredCapabilities();
            capabilities.setCapability("platformName", "iOS");
    	    		capabilities.setCapability("deviceName", "iPhone 6 Simulator");
    	    		capabilities.setCapability("platformVersion", "11.0");
    	    		//capabilities.setCapability("app", "sauce-storage:FinacleMobileApp.zip");
    	    		capabilities.setCapability("app", "sauce-storage:RMT.zip");
    	    		capabilities.setCapability("deviceOrientation", "portrait");
    	    		capabilities.setCapability("appiumVersion", "1.7.2");
    	    		//capabilities.setCapability("timeZone", "Kolkata");
    	    		capabilities.setCapability("name", "IOS Simulator");
    	    		capabilities.setCapability("noReset", "true");
    	    		capabilities.setCapability("fullReset", "false");
    	    		capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
            try {
                dr = new IOSDriver(new URL(URL), capabilities);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }	


			/* 	DesiredCapabilities caps = DesiredCapabilities.iphone();
        	caps.setCapability("appiumVersion", "1.4.16");
        	caps.setCapability("deviceName","iPhone 6");
        	caps.setCapability("deviceOrientation", "portrait");
        	caps.setCapability("platformVersion","9.2");
        	caps.setCapability("platformName", "iOS");
        	caps.setCapability("browserName", "");
        	caps.setCapability("app","sauce-storage:myapp.zip");*/
			/*// 	String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			System.out.println("Called openBrowser");
			String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			//File file=new File("/Users/rakbank/Downloads/RMT_UAT.app");
			// File file=new File("/Users/rakbank/Desktop/Apps/FinacleMobileApp.zip");
			DesiredCapabilities capabilities = new DesiredCapabilities().iphone();
			capabilities.setCapability("platformName", "iOS");
			capabilities.setCapability("deviceName","iPhone X Simulator");
			//capabilities.setCapability("deviceName", "iPhone Simulator");
			capabilities.setCapability("browserName", "");
			capabilities.setCapability("platformVersion", "11.0");
			//capabilities.setCapability("app", "https://conv.rakbankonline.ae/corp1/retail/IPA/RMT.app.zip");//MobileCapabilityType.APP
			//capabilities.setCapability(MobileCapabilityType.APP, "sauce-storage:RMT.zip");
			//capabilities.setCapability("app", file.getAbsolutePath());
			//capabilities.setCapability(MobileCapabilityType.APP, "https://conv.rakbankonline.ae/corp1/retail/IPA/RMT.ipa");
			capabilities.setCapability("app", "sauce-storage:RMT.zip");
			//capabilities.setCapability("app", "sauce-storage:FinacleMobileApp.zip");
			capabilities.setCapability("deviceOrientation", "portrait");
			capabilities.setCapability("appiumVersion", "1.7.2");//"1.6.4");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability("timeZone", "Kolkata");
			capabilities.setCapability("name", System.getProperty("sauceTestName"));
			System.out.println("After setting capabilities : "+capabilities.getCapability("app"));*/
			/*String URL = "https://" + USERNAME + ":" + ACCESS_KEY + "@ondemand.saucelabs.com:443/wd/hub";
			DesiredCapabilities capabilities = new DesiredCapabilities();
			//capabilities.setCapability(CapabilityType.BROWSER_NAME, "iOS 11.0");
			capabilities.setCapability("deviceName", "iPhone 8 Simulator");
			//capabilities.setCapability(CapabilityType.PLATFORM, "MAC 11.0");
			capabilities.setCapability("appiumVersion", "1.7.2");
			capabilities.setCapability("app", "sauce-storage:RMT.zip");
			capabilities.setCapability(MobileCapabilityType.TAKES_SCREENSHOT, "true");
			capabilities.setCapability("timeZone", "Kolkata");
			capabilities.setCapability("name", System.getProperty("sauceTestName"));
			try {
				//dr = new IOSDriver(new URL(URL), capabilities);
				dr = new RemoteWebDriver(new URL(URL), capabilities);
			} catch (Exception e) {
				e.printStackTrace();
			}*/

		

		return dr;
	}



}
