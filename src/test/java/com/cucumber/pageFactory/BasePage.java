package com.cucumber.pageFactory;
import org.openqa.selenium.WebDriver;

public abstract class BasePage {
   public static WebDriver testdriver;
   public static boolean bResult;
   public BasePage(WebDriver driver){
      BasePage.testdriver = driver;
      BasePage.bResult = true; 
   }
} 