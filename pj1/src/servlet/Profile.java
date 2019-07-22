package servlet;

import dao.Dao4Fav;
import entity.Item;
import entity.User;
import net.sf.json.JSONArray;

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
        User destUser=(User)req.getAttribute("destUser");
        if(user==null)
            resp.sendRedirect("login.jsp");
        else {
            if (destUser == null) {
                destUser = user;
                req.setAttribute("destUser", destUser);
            }
            System.out.println("????");
            req.getRequestDispatcher("profile.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
