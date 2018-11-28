package com.cucumber.runners;


import java.io.*;
import java.util.ArrayList;


import java.io.*;
import java.util.ArrayList;

public class RunMvnFromJava {
    public static BufferedReader inStream;
    public static void main(String[] args) throws FileNotFoundException {
      /*  ScriptRunner scriptRunner=new ScriptRunner();
        try {
            scriptRunner.run("testjavascript.js");
        } catch (Exception e) {
            e.printStackTrace();
        }*/
// TODO Auto-generated method stub
        String str="@Login_Negative,@Login_Positive";
       // for(String str : string.split(",")) {
            String cmd = "mvn clean install -DTestType=@" + str;
            Process theProcess = null;
            try {
                theProcess = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c", cmd});
                //"mvn clean install -DTestType=@Login_Negative,@Login_Positive");//,"mvn integration-test -DskipTests -P interactive -e");
            } catch (IOException e) {
                System.err.println("Error on exec() method");
                e.printStackTrace();
            }

// read from the called program's standard output stream
            try {
                inStream = new BufferedReader(new InputStreamReader(theProcess.getInputStream()));
                System.out.println(inStream.readLine());
            } catch (IOException e) {
                System.err.println("Error on inStream.readLine()");
                e.printStackTrace();
            }
        }
    //}

}

       /* in.close();
                }
                }
                }*/
/*public class RunMvnFromJava {

   public static void main(String[] args) throws IOException, InterruptedException {

        Process p = null;

        try {
            p = Runtime.getRuntime().exec("C:\\Users\\Shashavalil\\Documents\\Softwares\\apache-maven-3.5.0-bin\\apache-maven-3.5.0\\bin\\mvn.bat clean install");
        } catch (IOException e) {
            System.err.println("Error on exec() method");
            e.printStackTrace();
        }

        copy(p.getInputStream(), System.out);
        p.waitFor();

    }

    public static void copy(InputStream in, OutputStream out) throws IOException {
        while (true) {
            int c = in.read();
            if (c == -1)
                break;
            out.write((char) c);
        }
    }
  public static void runCommand(String cmd)throws IOException
   {

       // The actual procedure for process execution:
       //runCommand(String cmd);
       // Create a list for storing output.
       ArrayList list = new ArrayList();
       // Execute a command and get its process handle
      // Runtime.getRuntime().exec(new String[] { "cmd.exe", "/c", "server.bat" } );   //new String[] { "cmd.exe", "/c","mvn clean install -DTestType=@Login_Negative,@Login_Positive"}
       Process proc = Runtime.getRuntime().exec(new String[] { "cmd.exe", "/c",cmd});//"mvn clean install -DTestType=@Login_Negative,@Login_Positive"});
      *//* // Get the handle for the processes InputStream
       InputStream istr = proc.getInputStream();
       // Create a BufferedReader and specify it reads
       // from an input stream.

       BufferedReader br = new BufferedReader(new InputStreamReader(istr));
       String str; // Temporary String variable
       // Read to Temp Variable, Check for null then
       // add to (ArrayList)list
       while ((str = br.readLine()) != null)
           list.add(str);
       // Wait for process to terminate and catch any Exceptions.
       try {
           proc.waitFor();
       }
       catch (InterruptedException e) {
           System.err.println("Process was interrupted");
       }
       // Note: proc.exitValue() returns the exit value.
       // (Use if required)
       br.close(); // Done.*//*
       // Convert the list to a string and return
      // return (String[])list.toArray(new String[0]);
   }
    // Actual execution starts here
    public static void main(String args[]) throws Exception {
      *//*  CucumberResultsOverview results = new CucumberResultsOverview();
        results.setOutputDirectory(".//target");
        results.setOutputName(".//target//cucumber-results");
        results.setSourceFile(".//target//cucumber.json");
        results.executeFeaturesOverviewReport();*//*
        try
        {
            // Run and get the output.
            *//*String outlist[] = *//*runCommand("mvn clean install -DTestType=@Login_Negative,@Login_Positive");
            // Print the output to screen character by character.
            // Safe and not very inefficient.
         *//*  for (int i = 0; i < outlist.length; i++)
               System.out.println(outlist[i]);*//*
        }
        catch (Exception e) {
            System.err.println(e);
        }
    }*/


