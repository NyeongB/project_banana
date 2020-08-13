package com.banana.util;

import org.python.util.PythonInterpreter;

public class RecommandationTestPy
{

	private static PythonInterpreter interpreter;

	public static void main(String[] args)
	{

		interpreter = new PythonInterpreter();
		interpreter.exec("print('tets')");

	}

}
