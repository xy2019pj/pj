package servlet;

import dao.Dao4Fav;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FavoriteChange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")!=null) {
            String username = ((User) req.getSession().getAttribute("user")).getUsername();
            String itemName = req.getParameter("itemName");
            Dao4Fav.changeFavByName(username,itemName);
            req.getRequestDispatcher("favorite.jsp").forward(req, resp);
        }
        else resp.sendRedirect("login.jsp");
    }
}
