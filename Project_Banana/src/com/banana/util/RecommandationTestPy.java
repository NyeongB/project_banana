package com.banana.util;

import org.python.util.PythonInterpreter;

public class RecommandationTestPy
{

	private static PythonInterpreter interpreter;

	public static void main(String[] args)
	{

		interpreter = new PythonInterpreter();
		interpreter.exec("import cx_Oracle as oci");
		interpreter.exec("import numpy as np");
		interpreter.exec("import pandas as pd");
		interpreter.exec("from IPython.display import display");
		interpreter.exec("import json");
		interpreter.exec("");
		interpreter.exec("import sys");
		interpreter.exec("");
		interpreter.exec("");
		interpreter.exec("# Oracle 서버와 연결(Connection 맺기)");
		interpreter.exec("conn = oci.connect('13.231.82.47:1521/xe')");
		interpreter.exec("");
		interpreter.exec("# Connection 확인");
		interpreter.exec("print(conn.version)");
		interpreter.exec("");
		interpreter.exec("");
		interpreter.exec("");
		interpreter.exec("");
		interpreter.exec("");
		interpreter.exec("");

	}

}
