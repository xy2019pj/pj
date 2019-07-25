package servlet;

import dao.Dao4Fav;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/favoritechange")
public class FavoriteChange extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")!=null) {
            String username = ((User) req.getSession().getAttribute("user")).getUsername();
            String itemChangeName = req.getParameter("itemChangeName");
            if(itemChangeName!=null)Dao4Fav.changeFavByName(username,itemChangeName);
            String itemOpenName = req.getParameter("itemOpenName");
            if(itemOpenName!=null)Dao4Fav.openFavByName(username,itemOpenName);
            resp.sendRedirect("favorite.jsp");
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user")!=null) {
            String username = ((User) req.getSession().getAttribute("user")).getUsername();
            String itemChangeName = req.getParameter("itemChangeName");
            if(itemChangeName!=null)Dao4Fav.changeFavByName(username,itemChangeName);
            String itemOpenName = req.getParameter("itemOpenName");
            if(itemOpenName!=null)Dao4Fav.openFavByName(username,itemOpenName);
            resp.sendRedirect("profile");
        }
        else resp.sendRedirect("login.jsp");
    }
}
