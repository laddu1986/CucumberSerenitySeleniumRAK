package com.cucumber.stepdefinitions;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;

import java.util.HashMap;


public class DriverFactory {
    public static WebDriver driver;
    public static HashMap<String,String> hmdata=null;
    public static WebDriver initialize(String deviceType) {
        if (driver == null)
           driver= createNewDriverInstance(deviceType);
        return driver;
    }
    public static WebDriver createNewDriverInstance(String deviceType) {
       if(deviceType.equals("firefox")){
           String geckodriver="C:\\Users\\Shashavalil\\Documents\\Framework\\Core_Frameworks\\cucumber-jvm-template-master\\cucumber-jvm-template-master\\src\\test\\resources\\drivers\\geckodriver.exe";
           System.setProperty("webdriver.gecko.driver",geckodriver);
           FirefoxProfile ffProf = new FirefoxProfile();
           driver = new FirefoxDriver(ffProf);
        }
       else{
           String geckodriver="C:\\Users\\Shashavalil\\Documents\\Framework\\Core_Frameworks\\cucumber-jvm-template-master\\cucumber-jvm-template-master\\src\\test\\resources\\drivers\\chromedriver.exe";
           System.setProperty("webdriver.chrome.driver",geckodriver);
            driver = new ChromeDriver();
            System.out.println("driver instance : @@@@@ " + driver.toString());
            driver.manage().window().maximize();
        }
       // driver = new FirefoxDriver();
        driver.get("https://google.co.in");
        if(driver.getCurrentUrl().equals("https://google.co.in")){
            System.out.println("launced successfully");
        }
  return driver;
    }
    public static void destroyDriver() {
        driver.quit();
        driver = null;
    }
}