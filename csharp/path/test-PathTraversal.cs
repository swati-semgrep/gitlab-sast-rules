// License: LGPL-3.0 License (c) security-code-scan
using System.Web;
using System.Web.Mvc;
using System.Diagnostics;

public class PathTraversal : Controller
{
    [HttpGet]
    public string Get(string myParam)
    {
        byte[] fileBytes = System.IO.File.ReadAllBytes(myParam);
        return "ok";
    }
}

