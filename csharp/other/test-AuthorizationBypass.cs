// License: LGPL-3.0 License (c) security-code-scan
using System.Web.Mvc;

class AuthorizationBypassUnsafe : Controller
{
  public ActionResult Login()
  {
  }

  [Authorize]
  public ActionResult Logout()
  {
  }
}

[Authorize]
class AuthorizationBypassSafe : Controller
{
  public ActionResult Login()
  {
  }

  [Authorize]
  public ActionResult Logout()
  {
  }
}