// License: LGPL-3.0 License (c) security-code-scan
using System.Web.Mvc;

class Csrf
{
    [HttpPost]
    public ActionResult ControllerMethod(string input)
    {
        return null;
    }

    [HttpDelete]
    public ActionResult ControllerMethod(string input)
    {
        return null;
    }

    [HttpPatch]
    public ActionResult ControllerMethod(string input)
    {
        return null;
    }

    [HttpPut]
    public ActionResult ControllerMethod(string input)
    {
        return null;
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult ControllerMethod2(string input)
    {
        return null;
    }

    [HttpDelete]
    [ValidateAntiForgeryToken]
    public ActionResult ControllerMethod2(string input)
    {
        return null;
    }

    [HttpPatch]
    [ValidateAntiForgeryToken]
    public ActionResult ControllerMethod2(string input)
    {
        return null;
    }

    [HttpPut]
    [ValidateAntiForgeryToken]
    public ActionResult ControllerMethod2(string input)
    {
        return null;
    }
}
