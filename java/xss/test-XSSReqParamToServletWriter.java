// License: MIT (c) GitLab Inc.
package xss;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// Also contains vulnerabilities found under ids: XSS_SERVLET,SERVLET_PARAMETER
public class XSSReqParamToServletWriter extends HttpServlet {

    protected void danger(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String input1 = req.getParameter("input1");
        resp.getWriter().write(input1);
    }

    protected void danger2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String input1 = req.getParameter("input1");
        PrintWriter writer = resp.getWriter();
        writer.write(input1);
    }
}

