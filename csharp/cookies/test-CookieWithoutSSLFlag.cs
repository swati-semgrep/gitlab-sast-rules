// License: LGPL-3.0 License (c) security-code-scan
using System.Web;

class CookieWithoutSSLFlag
{
  static void BadCookie()
  {
    // default is left
    var cookie = new HttpCookie("test");

    Response.Cookies.Add(cookie);

    // or explicitly set to false
    HttpCookie cookie2 = new HttpCookie("test");
    cookie2.Secure = false;

    Response.Cookies.Add(cookie2);
  }

  static void GoodCookie()
  {
    var cookie = new HttpCookie("test");
    cookie.Secure = true; //Add this flag

    Response.Cookies.Add(cookie);
  }
}