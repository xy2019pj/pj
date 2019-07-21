package servlet;

import dao.Dao4Fav;
import dao.Dao4User;
import entity.Item;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/profile")
public class Profile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if (user!=null) {
            ArrayList<Item> favItems = Dao4Fav.getFavByName(user.getUsername());
            req.setAttribute("items", favItems);
            req.getRequestDispatcher("profile.jsp").forward(req, resp);
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User oldUser=(User)req.getSession().getAttribute("user");
        if (oldUser!=null) {
            User newUser = (User) req.getAttribute("user");
            Dao4User.changeUserByName(oldUser.getUsername(), newUser);
            req.getSession().setAttribute("user", newUser);
            req.getRequestDispatcher("profile").forward(req, resp);
        }
        else resp.sendRedirect("login.jsp");
    }
}
