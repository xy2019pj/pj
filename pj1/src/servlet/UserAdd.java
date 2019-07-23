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
//            req.getRequestDispatcher("useradd.jsp");
            resp.sendRedirect("useradd.jsp");
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            String email=req.getParameter("email");
            String admin=req.getParameter("admin");
            char auth;
            if(admin!=null&&admin.equals("true"))
                auth='a';
            else auth='n';
            User newUser=new User(username,auth,password,email,null);
            int status=newUser.add();
            req.setAttribute("status",status);
            req.getRequestDispatcher("usermanage.jsp").forward(req,resp);
        }
        else resp.sendRedirect("login.jsp");
    }
}
