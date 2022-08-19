// License: LGPL-3.0 License (c) security-code-scan

using System.DirectoryServices;

class LdapInjection
{
	static void Main(string input)
	{
        var searcher = new DirectorySearcher();
        searcher.Filter = "(cn=" + input + ")";
        searcher.Filter = "(cn=" + "test" + ")";
	}
}
