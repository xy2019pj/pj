package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class Register extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        /*重定向到注册页面*/
        res.sendRedirect("register.jsp");
    }
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
        int flag=0;
        /*获取用户信息*/
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        char auth=req.getParameter("auth").charAt(0);
        User user = new User(username,auth, password, email);
        /*注册*/
        flag = user.signup();
        if (flag == 0) {//注册成功
            req.getSession().setAttribute("user",user);
            req.getRequestDispatcher("/jiuzhou").forward(req, res);
        } else {//注册失败
            req.setAttribute("flag", flag);
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }
}
