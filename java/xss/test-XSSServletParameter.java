// License: MIT (c) GitLab Inc.
// scaffold: dependencies=javax.servlet.servlet-api@2.5
package xss;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class XSSServlet extends HttpServlet {

    protected String danger(HttpServletRequest req) throws ServletException, IOException {
        String input1 = req.getParameter("input1");
        return input1;
    }
}

