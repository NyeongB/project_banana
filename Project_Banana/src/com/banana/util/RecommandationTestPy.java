package com.banana.util;

import org.python.util.PythonInterpreter;



public class RecommandationTestPy
{


	public static void main(String[] args)
	{

		System.setProperty("python.cachedir.skip", "true");
        PythonInterpreter interpreter = new PythonInterpreter();
        interpreter.execfile("RecommandSimilarUser.py");
        interpreter.exec("print('test')");

	}

}
