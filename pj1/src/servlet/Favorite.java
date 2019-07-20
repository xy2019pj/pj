package servlet;

import dao.Dao4Fav;
import entity.Item;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/favorite")
public class Favorite extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")!=null) {
            String username = ((User) req.getSession().getAttribute("user")).getUsername();
            ArrayList<Item> items = Dao4Fav.getFavByName(username);
            req.setAttribute("items", items);
            req.getRequestDispatcher("favorite.jsp").forward(req, res);
        }
        else res.sendRedirect("login.jsp");
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")!=null) {
            String username = ((User) req.getSession().getAttribute("user")).getUsername();
            String itemName = req.getParameter("itemName");
            Dao4Fav.changeFavByName(username,itemName);
            req.getRequestDispatcher("favorite.jsp").forward(req, res);
        }
        else res.sendRedirect("login.jsp");
    }
}
