/*
package helpers;

import com.google.inject.Binder;
import com.google.inject.Module;
import org.openqa.selenium.WebDriver;

public class TestModule implements Module {
    @Override
    public void configure(Binder binder) {a*/
/**//*

      */
/*  BrowserLauncher bl = new BrowserLauncher();*//*

        WebDriver driver = null;//bl.launchBrowser("Firefox");
        binder.bind(WebDriver.class).toInstance(driver);
    }
}*/
