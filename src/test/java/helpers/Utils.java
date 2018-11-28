package helpers;

import com.codoid.products.exception.FilloException;
import com.codoid.products.fillo.Connection;
import com.codoid.products.fillo.Fillo;
import com.codoid.products.fillo.Recordset;
import cucumber.api.Scenario;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.remote.Augmenter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static helpers.Util.replacePathSymbol;

@SuppressWarnings("ALL")
public class Utils {
    public static String DBPath = System.getProperty("user.dir") + "/Database/TestDataSheet.xls";
    public static String ResultsPath = System.getProperty("user.dir") + "/output/ExecutionResults.xls";
    public static String DBScnPath = System.getProperty("user.dir") + "/Database/ScenarioSheet.xls";

    public static HashMap<String, String> getDataMap(ArrayList<HashMap<String, String>> hmList,
                                                     String dataBinding) {
        HashMap<String, String> scenarioData = new HashMap<>();
        //get the Data associated with feature file
        for (HashMap hm : hmList) {
            if (hm.get("ScenarioID").equals(dataBinding)) {
                scenarioData = hm;
                break;
            }
        }

        return scenarioData;
    }

    public static HashMap<String, String> getDataMapBinding(ArrayList<HashMap<String, String>> hmList,
                                                            String dataBinding) {
        HashMap<String, String> scenarioData = new HashMap<>();
//get the Data associated with feature file
        for (HashMap hm : hmList) {
            if (hm.get("DataBinding").toString().equalsIgnoreCase(dataBinding)) {
                scenarioData = hm;
                break;
            }
        }

        return scenarioData;
    }

    /**/
    public static Recordset connectDBRunQuery(String DBPath, String query) throws FilloException {
        Fillo fillo = new Fillo();
        Connection connection = fillo.getConnection(DBPath);
        //System.out.println("query  ----- : " + query);
        Recordset rs = connection.executeQuery(query);
        rs.moveNext();
        //System.out.println("connection ----- : " + connection.toString()+"rs :"+rs);
        return rs;
    }

    //
    public static ArrayList<HashMap<String, String>> getData(Recordset rs) throws FilloException {
        ArrayList<String> alFields = new ArrayList<String>();
        ArrayList<HashMap<String, String>> alMap = new ArrayList<HashMap<String, String>>();
        alFields = rs.getFieldNames();
        while (rs.next()) {
            HashMap<String, String> map = new HashMap<String, String>();
            for (String str : alFields) {
                map.put(str, rs.getField(str));
            }
            alMap.add(map);
        }

        return alMap;

    }

    public static ArrayList<String> getScenariosRun(Recordset rs) throws FilloException {
        ArrayList<String> alscen = new ArrayList<String>();
        //  rs.movePrevious();
        if (rs.getCount() == 1) {
            //System.out.println("fields from scenario sheet if row is recordset is Unique: " + rs.getField("Feature") + ";" + rs.getField("ScenarioID") + ";" + rs.getField("DataBinding") + ";" + rs.getField("Devicetype"));
            alscen.add(rs.getField("Feature") + ";" + rs.getField("ScenarioID") + ";" + rs.getField("DataBinding") + ";" + rs.getField("Devicetype"));
        } else {
            //  rs.movePrevious();
            //  rs.moveFirst();
            int i = 0;
            // if(i<rs.getCount())
            while (i < rs.getCount()) {
                //rs.moveFirst();
                // System.out.println("fields from scenario sheet if row or recordset is not Unique: " + rs.getField("Feature") + ";" + rs.getField("ScenarioID") + ";" + rs.getField("DataBinding") + ";" + rs.getField("Devicetype"));
                alscen.add(rs.getField("Feature") + ";" + rs.getField("ScenarioID") + ";" + rs.getField("DataBinding") + ";" + rs.getField("Devicetype"));

                rs.next();
                i++;
            }
        }
        return alscen;
    }
    public static ArrayList<String> getFeatureList(ArrayList<String> stringlist, String string) throws FilloException {
        ArrayList<String> listScenario_DB_Feature = new ArrayList<>();

        for (String str : stringlist) {
            if (str.split(";")[0].toUpperCase().toString().equalsIgnoreCase(string.toUpperCase().toString())) {
                listScenario_DB_Feature.add(str);
            }
        }
        return listScenario_DB_Feature;
    }

    public static ArrayList<String> getScenariosExecute() throws FilloException {
        ArrayList<String> listScenario_DB = null;
        try {
            //ScenarioID	DataBinding	Devicetype

            String queryScenarios = "Select Feature,ScenarioID,DataBinding,DeviceType from ScenariosPicker where Control ='YES'";

            // System.out.println("queryScenarios  ------ " + queryScenarios);
            Recordset rsScenarios = Utils.connectDBRunQuery(DBPath, queryScenarios);
            // System.out.println("record set ------ " + rsScenarios);

            listScenario_DB = Utils.getScenariosRun(rsScenarios);

        } catch (FilloException e) {

        } finally {

        }
        return listScenario_DB;
    }

    public static HashMap<String, String> getListDataMapsforScenario(ArrayList<HashMap<String,
            String>> listDataRows, String scenarioTag) throws FilloException {
        HashMap<String, String> hashMap = new HashMap<>();
        for (HashMap<String, String> hm : listDataRows) {
            if (hm.get("DataBinding").equals(scenarioTag)) {
                hashMap = hm;
                break;
            }
        }
        return hashMap;
    }

    public static void embedScreenshot(Scenario scenario, WebDriver driver) {
        if (scenario.isFailed()) {
            try {
                scenario.write("Current Page URL is " + driver.getCurrentUrl());
//            byte[] screenshot = getScreenshotAs(OutputType.BYTES);
                byte[] screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES);
                scenario.embed(screenshot, "image/png");
            } catch (WebDriverException somePlatformsDontSupportScreenshots) {
                System.err.println(somePlatformsDontSupportScreenshots.getMessage());
            }
        }

    }

    public static String captureScreen(WebDriver webDriver) {
        String path;
        try {
            WebDriver augmentedDriver = new Augmenter().augment(webDriver);
            File source = ((TakesScreenshot) augmentedDriver).getScreenshotAs(OutputType.FILE);
            path = "./screenshots/" + source.getName();
            FileUtils.copyFile(source, new File(path));
        } catch (IOException e) {
            path = "Failed to capture screenshot: " + e.getMessage();
        }
        return path;
    }

    public static HashMap<String, ArrayList<HashMap<String, String>>> getExcelData() throws FilloException {
        ArrayList<String> listScenario_DB = Utils.getScenariosExecute();
        // System.out.println("list of scenarios for  @@@@@@@@@@@@@@@@@@@@@@@@@: " + listScenario_DB);

        ArrayList<HashMap<String, String>> listDataRow = new ArrayList<HashMap<String, String>>();
        HashMap<String, ArrayList<HashMap<String, String>>> mapScenarioListData = new HashMap<String, ArrayList<HashMap<String, String>>>();
        for (String str : listScenario_DB) {
            //  Select ScenarioID,DataBinding from ScenariosPicker where Control ='YES' and ScenarioID =''
            String strQueryData = "Select * from " + str.split(";")[0] + " where DataBinding ='" + str.split(";")[2] + "'";// and ScenarioID='"+ str.split(";")[1] +"'";
            Recordset rsData = Utils.connectDBRunQuery(DBPath, strQueryData);
            //  System.out.print("second query size :" + rsData.getCount() + " and field : " + rsData.getField("DataBinding"));
            if (rsData.getCount() == 1) {
                HashMap<String, String> hmRowData = new HashMap<String, String>();
                hmRowData = getHashMap(rsData);
                listDataRow.add(hmRowData);
            } else {
                HashMap<String, String> hmRowData = new HashMap<String, String>();
                while (rsData.next()) {
                    hmRowData = getHashMap(rsData);
                    listDataRow.add(hmRowData);
                }
            }

            mapScenarioListData.put(str.split(";")[1], listDataRow);
        }
        return mapScenarioListData;
    }

    public static ArrayList<HashMap<String, String>> getExcelData(ArrayList<String> scenariosToRun) throws FilloException {
        ArrayList<HashMap<String, String>> listDataRow = new ArrayList<HashMap<String, String>>();
        HashMap<String, ArrayList<HashMap<String, String>>> mapScenarioListData = new HashMap<String, ArrayList<HashMap<String, String>>>();
        for (String str : scenariosToRun) {
            String strQueryData = "Select * from " + str.split(";")[0] + " where  DataBinding='" + str.split(";")[2] + "'";
            Recordset rsData = Utils.connectDBRunQuery(DBPath, strQueryData);
            if (rsData.getCount() >= 1) {
                HashMap<String, String> hmRowData = new HashMap<String, String>();
                hmRowData = getHashMap(rsData);
                System.out.println("data for execution :" + hmRowData);
                listDataRow.add(hmRowData);
            }

        }
        return listDataRow;
    }

    public static HashMap<String, String> getHashMap(Recordset rsData) throws FilloException {
        HashMap<String, String> hmRowData = new HashMap<String, String>();
        ArrayList<String> dataColumns = rsData.getFieldNames();
        for (String str1 : dataColumns) {
            hmRowData.put(str1, rsData.getField(str1));
        }
        return hmRowData;
    }


    public static Object[] getArrayFromHash(Map<String, String> hashMap) {
        ArrayList<String> al = new ArrayList<>();
        String[] str = null;
        for (Object key : hashMap.keySet()) {
            String lKey = (String) key;
            String list = hashMap.get(key);
            al.add(lKey + "-" + list);
        }
        return al.toArray();
    }

    public static ArrayList<HashMap<String, String>> getListMapDataWithScenarioIds(List<Object[]> scenarioList,
                                                                                   ArrayList<HashMap<String, String>> Wholedata) {
        ArrayList<HashMap<String, String>> getExactScenarioDatarequired = new ArrayList<>();
        for (int i = 0; i < scenarioList.size(); i++) {
            HashMap<String, String> hmData = new HashMap<>();
            hmData = Wholedata.get(i);
            hmData.put("scenario", scenarioList.get(i)[1].toString());
            getExactScenarioDatarequired.add(hmData);
        }

        return getExactScenarioDatarequired;
    }

    public static ArrayList<HashMap<String, String>> addScenarioListHashMap(ArrayList<HashMap<String, String>> Wholedata, String scenario) {
        // for(int i=0;i< scenarioList.size();i++){
        Wholedata.get(0).put("scenario", scenario);
        //   }

        return Wholedata;
    }

    public static HashMap<String, String> getHashMapDataRow(ArrayList<HashMap<String, String>> hmList, String scenario) {
        HashMap<String, String> hashMap = new HashMap<String, String>();
        for (HashMap<String, String> hm : hmList) {
            if (hm.get("scenario").equalsIgnoreCase(scenario.toString())) {
                hashMap = hm;
                break;
            }
        }
        return hashMap;
    }

    public static ArrayList<HashMap<String, String>> addScenarioRunListHashMaps(ArrayList<HashMap<String, String>> Wholedata, ArrayList<String> scenario) {
        // for(int i=0;i< scenarioList.size();i++){
        // Feature	ScenarioID	DataBinding	Devicetype
        for (int i = 0; i < scenario.size(); i++) {
            Wholedata.get(i).put("Feature", scenario.get(i).split(";")[0]);
            Wholedata.get(i).put("DataBinding", scenario.get(i).split(";")[2]);
            Wholedata.get(i).put("Devicetype", scenario.get(i).split(";")[3]);
        }
        //   }

        return Wholedata;
    }

    public static void connectDB(String DBPath, String query) throws FilloException {
        Connection connection = null;
        try {
            Fillo fillo = new Fillo();
            connection = fillo.getConnection(DBPath);
            //System.out.println("query  ----- : " + query);
            int rs = connection.executeUpdate(query);
            System.out.print("recordset insert : " + rs);
        } catch (Exception e) {

        } finally {
            connection.close();
        }
        // connection.executeUpdate("INSERT");
        //System.out.println("connection ----- : " + connection.toString()+"rs :"+rs);
    }

    public static String getImageName(String scrnPath) {
        // String string=System.getProperty("TestType").replace("@","").trim();
        //System.out.println("file report scrnPath 1 :  "+scrnPath);
        String imagename = replacePathSymbol(scrnPath);
        //System.out.println("file report name  with path in Extent Cucumber Formatter after  3 :  "+imagename.toString());
        return imagename;
    }
}