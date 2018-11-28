package helpers;

import com.codoid.products.exception.FilloException;
import com.codoid.products.fillo.Connection;
import com.codoid.products.fillo.Fillo;
import com.codoid.products.fillo.Recordset;
import org.testng.TestNG;
import org.testng.xml.XmlClass;
import org.testng.xml.XmlInclude;
import org.testng.xml.XmlSuite;
import org.testng.xml.XmlTest;
 
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@SuppressWarnings("ALL")
public class Helper {
    public static Connection connection;
  //  public static Recordset recordset = null;
    public static Fillo fillo;

    //public String filePath;
    public static String createFile(String fileName) {
        String homeDir = System.getProperty("user.dir") + "\\src\\test\\resources\\pom.tests.xmlFiles\\";
       /* Helper helper=new Helper();helper.*/
        String createdFilePath = null;
        boolean flag = false;
        File file = new File(homeDir + fileName);
        if (!file.exists()) {
            try {
                if (file.createNewFile())
                    createdFilePath = file.getCanonicalPath();
            } catch (IOException ioe) {
                System.out.println("Error while Creating File in Java" + ioe);
            }

        }
        return createdFilePath;

    }

    public static HashMap getDataResultSet(String filepath, String query) throws FilloException {
        Recordset recordset=null;
        HashMap<String,String> hmDataMap=new HashMap<>();
        fillo = new Fillo();
        try {
            connection = fillo.getConnection(filepath);
            recordset = connection.executeQuery(query);
            hmDataMap=getDataMap(recordset);
        } catch (FilloException e) {
            e.printStackTrace();
        } finally {
            recordset.close();
            connection.close();
        }

        return hmDataMap;
    }
    public static Recordset getDataRecordSet(String filepath, String query) throws FilloException {
        Recordset recordset=null;
        HashMap<String,String> hmDataMap=new HashMap<>();
        fillo = new Fillo();
        try {
            connection = fillo.getConnection(filepath);
            recordset = connection.executeQuery(query);
        } catch (FilloException e) {
            e.printStackTrace();
        } finally {
           connection.close();
        }
        return recordset;
    }
    public static HashMap<String,String> getDataMap(Recordset recordset) throws FilloException{
        HashMap<String,String> hmDataMap=new HashMap<>();
        recordset.moveNext();
        ArrayList<String>columnNames=recordset.getFieldNames();
        for(String str : columnNames){
            hmDataMap.put(str,recordset.getField(str));
        }
       return hmDataMap;
    }
    public static XmlSuite getParallelMode(XmlSuite xmlSuite,String str) {
        if (str.toUpperCase().equals("TESTS".toString())) {
            xmlSuite.setParallel(XmlSuite.PARALLEL_TESTS);
        }else if (str.toUpperCase().equals("METHODS".toString())) {
            xmlSuite.setParallel(XmlSuite.PARALLEL_METHODS);
        }else if (str.toUpperCase().equals("CLASSES".toString())) {
            xmlSuite.setParallel(XmlSuite.PARALLEL_CLASSES);
        }else if (str.toUpperCase().equals("INSTANCES".toString())) {
            xmlSuite.setParallel(XmlSuite.PARALLEL_INSTANCES);
        }else {
            xmlSuite.setParallel(XmlSuite.PARALLEL_NONE);
        }
        return xmlSuite;
    }
  public static XmlSuite getSuiteXmlTests(ArrayList<XmlTest> xmlTestList,XmlSuite xmlSuite){
      //  XmlSuite xmlSuite1=new XmlSuite();
       for(XmlTest xmlTest: xmlTestList)
           xmlSuite.addTest(xmlTest);
        return xmlSuite;
  }
  public static String  createSuites(Recordset recordset,
                                    String suiteName,
                                    String xmlName) {
        XmlSuite suite = new XmlSuite();
        ArrayList<XmlTest> alXmlTest=new  ArrayList<XmlTest>();
        XmlTest xmlTest = new XmlTest();

        String excludedMethods="";
        try {
            while (recordset.next()) {
                String includedMethods="";
                ArrayList<String> allColumns=recordset.getFieldNames();

                for(String str:allColumns){
                    if(str.toString().startsWith("excludeMethod")
                            ||str.toUpperCase().contains("excludeMethod")){
                        excludedMethods=excludedMethods+recordset.getField(str.toString())+"-";
                    }
                }
                includedMethods=includedMethods.substring(0,includedMethods.length()-1).trim();
                String testClassName =  recordset.getField("TestClassName");
                String listenersClass = "framework.listeners." + recordset.getField("listenersClass");
                String param1=recordset.getField("parametername1")+"-"+recordset.getField("parameterValue1");
                String param2=recordset.getField("parametername2")+"-"+recordset.getField("dataBinding");
                String threadCount = recordset.getField("threadCount");
                String parallel = recordset.getField("parallel");
                ArrayList<String> listeners = new ArrayList<>();
                listeners.add(listenersClass);
                suite.setName(suiteName);
                suite.setThreadCount(Integer.valueOf(threadCount));
              //  suite.setDataProviderThreadCount(Integer.valueOf((dataproviderthreadcount)));
                suite=getParallelMode(suite,parallel);
                suite.setVerbose(2);
                suite.setListeners(listeners);
                System.out.println("includedMethods final string : "+includedMethods);
                xmlTest =  getTest(suite,
                        testClassName,
                        includedMethods,
                        excludedMethods,
                        param1,
                        param2);
                alXmlTest.add(xmlTest);
            }
          // List<XmlTest> disntictList = alXmlTest.stream().distinct().collect(Collectors.toList());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            recordset.close();
        }
        return writeTestNGFile(suite, xmlName);
    }
    public static String  createSuiteCucumber(String mapping,
                                       String suiteName,
                                       String xmlName,ArrayList<String> dataBnd) {
        XmlSuite suite = new XmlSuite();
        ArrayList<XmlTest> alXmlTest=new  ArrayList<XmlTest>();
        ArrayList<String> dataBindingList=new  ArrayList<>();

        XmlTest xmlTest = new XmlTest();
       // FundsTransferWithinUae;functionality;FundsTransferWithinUae_Scn_002;chrome
               suite.setName(suiteName);
               suite.setThreadCount(4);//.setThreadCount(5);
               //suite.setDataProviderThreadCount(5);
               HashMap<String,String> hm=new HashMap<>();
               hm.put("Devicetype",mapping.split(";")[3]);
               suite.setParameters(hm);
                   String ab=mapping.split(";")[0]+"_"+mapping.split(";")[1]+"_"+mapping.split(";")[2];
                   String testClassName=mapping.split(";")[0]+mapping.split(";")[1]+mapping.split(";")[2];
                   String param1="Devicetype"+"-"+mapping.split(";")[3];
                   dataBindingList=(dataBnd);
                   suite=getParallelMode(suite,"CLASSES");
                   suite.setVerbose(2);
                   System.out.println("suite  : "+suite);
                   xmlTest =  getSimpleTest(suite,
                           testClassName,
                           param1,dataBindingList);
                   alXmlTest.add(xmlTest);
              // }
            // List<XmlTest> disntictList = alXmlTest.stream().distinct().collect(Collectors.toList());
        return writeTestNGFile(suite, xmlName);
    }
    public static XmlTest getTest(XmlSuite suite,String ... strings) {
        List<String> listValue=Arrays.asList(strings);
        String testClassName=listValue.get(0);
        String includedMethods=listValue.get(1);
        String excludedMethods=listValue.get(2);
        String param1=listValue.get(3);
        String param2=listValue.get(4);
        /*Test tag*/
        XmlTest test1 = new XmlTest(suite);
        HashMap<String, String> hmParam = new HashMap<String, String>();
        hmParam.put(param1.split("-")[0],param1.split("-")[1]);
        hmParam.put(param2.split("-")[0], param2.split("-")[1]);
        test1.setParameters(hmParam);
        test1.setName((testClassName.trim()+"_".trim()+param2.split("-")[1]).trim());
        /*Class tag*/
        List<XmlClass> lstClasses = new ArrayList<XmlClass>();
        XmlClass xmlClass = new XmlClass();
        xmlClass.setName("pom.tests." +testClassName);
        /*Exclude tag*/
        List<String> lstxmlExclude = new ArrayList<String>();
        for(String str :excludedMethods.split("-")) {
            lstxmlExclude.add(str);
        }
        xmlClass.setExcludedMethods(lstxmlExclude);
        /*Include tag*/
        List<XmlInclude> lstxmlInclude = new ArrayList<XmlInclude>();
        XmlInclude xmlInclude=null;
        for(String str :includedMethods.split("-")) {
            xmlInclude = new XmlInclude(str);
            lstxmlInclude.add(xmlInclude);
        }
        xmlClass.setIncludedMethods(lstxmlInclude);
        lstClasses.add(xmlClass);
        test1.setClassNames(lstClasses);
        return test1;
    }
    public static XmlTest getSimpleTest(XmlSuite suite,
                                        String testClassName,
                                        String param1,ArrayList<String >arrayList) {
        /*Test tag*/
        XmlTest test1 = new XmlTest(suite);
        HashMap<String, String> hmParam = new HashMap<String, String>();
        hmParam.put(param1.split("-")[0],param1.split("-")[1]);
        test1.setParameters(hmParam);
        test1.setName((testClassName.trim()));
        /*Class tag*/
        List<XmlClass> lstClasses = new ArrayList<XmlClass>();
        for(String str : arrayList) {
            XmlClass xmlClass = new XmlClass();
            HashMap<String, String> hmap = new HashMap<>();
            xmlClass.setName("com.cucumber.testCucumber." + "FundsTransferWithinUaeTest");
            hmap.put(("DataBinding"),
                    (str.split(";")[3]));
            xmlClass.setParameters(hmap);
            lstClasses.add(xmlClass);
        }
        test1.setClasses(lstClasses);
        return test1;
    }
    public static String writeTestNGFile(XmlSuite suite, String xmlName) {
      String xmlPath=System.getProperty("user.dir") +"/suites/"+ xmlName;
        try {
            FileWriter writer = new FileWriter(new File(xmlPath));
            BufferedWriter bw = new BufferedWriter(writer);
            bw.write(suite.toXml());
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return xmlPath;
    }

    public static void createSuite(Recordset recordset,
                                   String suiteName,
                                   String xmlName) {
        XmlSuite suite = new XmlSuite();
        ArrayList<String> listeners = new ArrayList<>();
        listeners.add("framework.listeners.TestNGSuiteListener");
        suite.setName(suiteName);
        suite.setThreadCount(1);
        suite.setDataProviderThreadCount(1);
        suite.setParallel(XmlSuite.PARALLEL_TESTS);
        suite.setVerbose(2);
        suite.setListeners(listeners);
        XmlTest xmlTest = null;
        try {
            while (recordset.next()) {
                // Run	TestcaseName	username	password	password_Wrong
                String testName = recordset.getField("TestcaseName");
                String username = recordset.getField("username");
                String password = recordset.getField("password");
                String password_Wrong = recordset.getField("password_Wrong");
                xmlTest = getTest(suite);
                suite.addTest(xmlTest);
                writeTestNGFile(suite, xmlName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            recordset.close();
        }
    }

    public static ArrayList<String> getSheetNames(Recordset recordset) {
        ArrayList<String> alSheetNames = new ArrayList<String>();
        try {
            while (recordset.next()) {
                // Run	TestcaseName	username	password	password_Wrong
                String testName = recordset.getField("SheetName");
                alSheetNames.add(testName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            recordset.close();
        }
        return alSheetNames;
    }
    public static String getColumnData(Recordset recordset,String columnName) {
        String testName="";
        try {
            while (recordset.next()) {
                // Run	TestcaseName	username	password	password_Wrong
                testName = recordset.getField(columnName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return testName;
    }
    public static boolean runTestNGMasterSuite(ArrayList<String> xmlSuiteList){
        TestNG testNG = new TestNG();
       /* suites.add(System.getProperty("user.dir") + "/target/parallel.xml");*/
        testNG.setTestSuites(xmlSuiteList);
       // testNG.setThreadCount(4);
        //testNG;//.setParallel(XmlSuite.ParallelMode.TESTS);
        testNG.run();
        return testNG.hasFailure();
    }
}
