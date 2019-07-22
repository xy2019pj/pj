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

@WebServlet("/getfav")
public class GetFav extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        User destUser=(User)req.getAttribute("destUser");
        if(destUser==null) {
            destUser = user;
            req.setAttribute("destUser",destUser);
        }
        if (user!=null) {
            ArrayList<Item> favItems = Dao4Fav.getFavByName(destUser.getUsername());
            String favArray = (JSONArray.fromObject(favItems)).toString();
            resp.setCharacterEncoding("utf8");
            resp.getWriter().write(favArray);
        }
        else resp.sendRedirect("login.jsp");
    }
}
