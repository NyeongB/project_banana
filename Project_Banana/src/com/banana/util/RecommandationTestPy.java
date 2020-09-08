package com.banana.util;

import java.io.StringWriter;

import org.python.util.PythonInterpreter;



public class RecommandationTestPy
{


	public static void main(String[] args)
	{

		System.setProperty("python.cachedir.skip", "true");
        PythonInterpreter interpreter = new PythonInterpreter();      
              
        
        interpreter.execfile("RecommandSimilarUser1.py");
        interpreter.exec("print(userReco())");
      
        
        interpreter.close();
       

	}

}
