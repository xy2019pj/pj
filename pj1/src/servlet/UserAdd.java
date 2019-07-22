package servlet;

import entity.Item;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/useradd")
public class UserAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            req.getRequestDispatcher("useradd.jsp");
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            User userAdd=(User)req.getAttribute("user");
            int status=userAdd.add();
            req.setAttribute("status",status);
        }
        else resp.sendRedirect("login.jsp");
    }
}
