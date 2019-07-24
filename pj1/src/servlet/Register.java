package servlet;

import dao.Dao4User;
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
        String modeS =req.getParameter("mode");

        if(modeS==null||modeS.equals("checkName")){
            if(Dao4User.getUserByName(username)==null){
                System.out.println("2");
                res.getWriter().write("2");
            }else {
                System.out.println("1");
                res.getWriter().write("1");
            }
        }else{
            if(modeS.equals("signUp")){
                char auth='n';
                User user = new User(username,auth, password, email,null);
                /*注册*/
                flag = user.signup();
                if (flag == 0) {//注册成功
                    System.out.println("注册成功，user="+user.getUsername()+";password="+user.getPassword());//
                req.getSession().setAttribute("user",user);
               res.getWriter().write("1");
//            req.getRequestDispatcher("/jiuzhou").forward(req, res);
                } else {//注册失败
            req.setAttribute("flag", flag);
                    res.getWriter().write("2");
//            req.getRequestDispatcher("register.jsp").forward(req, res);
                }
            }
        }
    }
}
