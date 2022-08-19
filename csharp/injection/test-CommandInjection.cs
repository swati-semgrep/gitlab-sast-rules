// License: LGPL-3.0 License (c) security-code-scan

using System.Diagnostics;

class Test
{
	static void Main()
	{
		var p = new Process();
		p.StartInfo.FileName = "exportLegacy.exe";
		p.StartInfo.Arguments = " -user " + Console.ReadLine() + " -role user";
		p.Start();
	}
}
