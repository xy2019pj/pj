package servlet;

import dao.Dao4User;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProfileChange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User oldUser=(User)req.getSession().getAttribute("user");
        if (oldUser!=null) {
            User newUser = (User) req.getAttribute("user");
            Dao4User.changeUserByName(oldUser.getUsername(), newUser);
            req.getSession().setAttribute("user", newUser);
            resp.sendRedirect("profile");
        }
        else resp.sendRedirect("login.jsp");

    }
}
