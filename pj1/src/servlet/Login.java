package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        /*转发到登录页面*/
        res.sendRedirect("login.jsp");
    }
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
        int status=0;
        //获取用户信息
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        char auth=req.getParameter("auth").charAt(0);
        User user=new User(username,auth,password,null);
        //登录
        status = user.login();
        if (status == 0) {//登陆成功
            req.getSession().setAttribute("user", user);
            req.getRequestDispatcher("").forward(req,res);
        } else {//登陆失败
            req.setAttribute("status", status);
            req.getRequestDispatcher("/jiuzhou/login").forward(req, res);
        }
    }
}
