package servlet;

import dao.Dao4User;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/usermanage")
public class UserManage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){//管理员权限
            ArrayList<User> allUsers= Dao4User.getAllUser();
            req.setAttribute("users",allUsers);
            req.getRequestDispatcher("usermanage.jsp").forward(req,resp);
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a') {
            String deleteUser = req.getParameter("deleteUser");
            String changeAuth = req.getParameter("changeAuth");
            if (deleteUser != null)
                Dao4User.deleteUser(deleteUser);
            if (changeAuth != null)
                Dao4User.changeAuthByName(changeAuth);
            resp.sendRedirect("usermanage");
        }
        else resp.sendRedirect("login.jsp");
    }
}
