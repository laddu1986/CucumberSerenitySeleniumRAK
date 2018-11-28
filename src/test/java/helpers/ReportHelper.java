/*package helpers;


import java.io.File;
import java.text.ParseException;
import org.apache.log4j.Logger;
import com.cucumber.stepdefinitions.FundsTransferWithinUaeSteps;

public class ReportHelper {
	//public static HashMap<String, String> scenarioDataMapRowData = new HashMap<>();
	public static String URL="http://automationpractice.com";
	static Logger log;
	public static String reportFilenameWithScreenshots;
	public static String reportFilenameWithOutScreenshots;
	public static  String baseReport;
	public static String screenshots;
	public static String screenshotsPass;
	public static String screenshotsFail;
	public static String workingDir = null;
	public static String testData;
	public static String subFolder = null;
	public static String reportsFolder = null;
	static Logger Log = Logger.getLogger(FundsTransferWithinUaeSteps.class);

	public ReportHelper(String feature_scenario) {
		try {
			initialiseFolderProperties(feature_scenario);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void ReportInitialise() throws Exception{
		workingDir = System.getProperty("user.dir");
		Log.info("workingDir is " + workingDir);
		subFolder = workingDir + "/src/main/resources/";
		Log.info("subFolder is " + subFolder);
		conFigPropertyFile = subFolder+"\\properties\\";
		Log.info("workingDir is " + conFigPropertyFile);
		reportsFolder = workingDir + "/Reports/";//+fn_GetTimeStamp().replace("_","")+"\\";
		Log.info("reportsFolder is " + reportsFolder);
		testData = workingDir + "/GIB/testData/";
		Log.info("pom.tests.testData is " + testData);
		properties=getPropConfigValues(conFigPropertyFile+"projectConfig.properties");
		URL=properties.getProperty("URL").toString();
	}
	public static void folderStructureReport(String testSuitename) throws ParseException {
		//testSuitename=testSuitename.split(";")[0].toString()+"_"+testSuitename.split(";")[1].toUpperCase();
		reportFilenameWithScreenshots=testSuitename+"_"+Util.fn_GetTimeStamp().replace("_","");;//+"_"+fn_GetTimeStamp().replace("_","");
		reportFilenameWithOutScreenshots=testSuitename+"_WithoutScreenshots_"+Util.fn_GetTimeStamp().replace("_","");//+"_"+fn_GetTimeStamp().replace("_","");
		baseReport=reportsFolder + reportFilenameWithScreenshots+"/";
		Log.info("reportsFolder is " + baseReport);
		screenshots = baseReport+"Screenshots/";
		Log.info("reportsFolder is " + screenshots);
		screenshotsPass = screenshots + "/PASS/";
		Log.info("reportsFolder is " + screenshotsPass);
		screenshotsFail = screenshots + "/FAIL/";
		Log.info("reportsFolder is " + screenshotsFail);
	}



	public static void createFolders() {
		// Create Reports Folder
		createFolder(reportsFolder);
		// Create screenshots Folder
		createFolder(screenshots);
		// Create screenshotsPass Folder
		createFolder(screenshotsPass);
		// Create screenshotsFail Folder
		createFolder(screenshotsFail);
	}
	public static void createFolder(String filePath) {
		boolean b = false;
		try {
			File file = new File(filePath);
			if (!file.exists()) {
				b = file.mkdirs();
			}
		} catch (Exception e) {
			Log.info( "Folder is not Created : "+filePath);

		}
	}

	public static void initialiseFolderProperties(String testCase) throws Exception,ParseException{
		//Initilaise Report folders
		ReportInitialise();
		//Intialise the Folder Structure
		folderStructureReport(testCase);
		//Create Folders
		createFolders();
		Log.info("after creating folders  is pass " + screenshotsPass);
		Log.info("after creating folders is fail " + screenshotsFail);
		Log.info("after creating folders is screenshots " + screenshots);
	}

}*/

package helpers;


import static helpers.Util.fn_GetTimeStamp;

import java.io.File;
import java.text.ParseException;

import org.apache.log4j.Logger;



public class ReportHelper {
   //public static HashMap<String, String> scenarioDataMapRowData = new HashMap<>();
   public static String URL="http://automationpractice.com";
   static Logger log;
   public static String reportFilenameWithScreenshots;
   public static String reportFilenameWithOutScreenshots;
   public static  String baseReport;
   public static String screenshots;
   public static String screenshotsPass;
   public static String screenshotsFail;
   public static String workingDir = null;
   public static String testData;
   public static String subFolder = null;
   public static String reportsFolder = null;
   static Logger Log = Logger.getLogger(ReportHelper.class);

   public ReportHelper(String feature_scenario) {
      try {
         initialiseFolderProperties(feature_scenario);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public static void ReportInitialise() throws Exception{
      workingDir = System.getProperty("user.dir");
      System.out.println(workingDir);
      Log.info("workingDir is " + workingDir);
      subFolder = workingDir + "/src/main/resources/";
      Log.info("subFolder is " + subFolder);
      /*conFigPropertyFile = subFolder+"\\properties\\";
      Log.info("workingDir is " + conFigPropertyFile);*/
      reportsFolder = workingDir + "/output/Reports/";//+fn_GetTimeStamp().replace("_","")+"\\";
      Log.info("reportsFolder is " + reportsFolder);
      testData = workingDir + "/GIB/testData/";
      Log.info("pom.tests.testData is " + testData);
      /*properties=getPropConfigValues(conFigPropertyFile+"projectConfig.properties");
      URL=properties.getProperty("URL").toString();*/
   }
   public static void folderStructureReport(String testSuitename) throws ParseException {
      reportFilenameWithScreenshots=testSuitename+"_"+fn_GetTimeStamp().replace("_","");;//+"_"+fn_GetTimeStamp().replace("_","");
      reportFilenameWithOutScreenshots=testSuitename+"_WithoutScreenshots_"+fn_GetTimeStamp().replace("_","");//+"_"+fn_GetTimeStamp().replace("_","");
      baseReport=reportsFolder + reportFilenameWithScreenshots+"/";
      Log.info("reportsFolder is " + baseReport);
      screenshots = baseReport+"Screenshots/";
      Log.info("reportsFolder is " + screenshots);
      screenshotsPass = screenshots + "PASS/";
      Log.info("reportsFolder is " + screenshotsPass);
      screenshotsFail = screenshots + "FAIL/";
      Log.info("reportsFolder is " + screenshotsFail);
   }

   public static void createFolders() {
      // Create Reports Folder
      createFolder(reportsFolder);
      // Create screenshots Folder
      createFolder(screenshots);
      // Create screenshotsPass Folder
      createFolder(screenshotsPass);
      // Create screenshotsFail Folder
      createFolder(screenshotsFail);
   }
   public static void createFolder(String filePath) {
      boolean b = false;
      try {
         File file = new File(filePath);
         if (!file.exists()) {
            b = file.mkdirs();
         }
      } catch (Exception e) {
         Log.info( "Folder is not Created : "+filePath);

      }
   }

   public static void initialiseFolderProperties(String testCase) throws Exception,ParseException{
      //Initilaise Report folders
      ReportInitialise();
      //Intialise the Folder Structure
      folderStructureReport(testCase);
      //Create Folders
      createFolders();
      Log.info("after creating folders  is pass " + screenshotsPass);
      Log.info("after creating folders is fail " + screenshotsFail);
      Log.info("after creating folders is screenshots " + screenshots);
   }

}