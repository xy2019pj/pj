package servlet;

import dao.Dao4Fav;
import dao.Dao4User;
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
        String destUser=req.getParameter("destUser");
        User dUser;
        if(user!=null) {
            if (destUser == null) dUser = user;
            else dUser= Dao4User.getUserByName(destUser);
            req.setAttribute("destUser", dUser);
            req.getRequestDispatcher("profile.jsp").forward(req, resp);
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        User destUser=Dao4User.getUserByName(req.getParameter("destUser"));
        if(destUser==null) {
            destUser = user;
            req.setAttribute("destUser",destUser);
        }
        ArrayList<Item> favItems = Dao4Fav.getFavByName(destUser.getUsername());
        ArrayList<Item> subItems=new ArrayList<>();
        for(int i=0;i<favItems.size()&&i<5;i++)
            subItems.add(favItems.get(i));
        String favArray = (JSONArray.fromObject(subItems)).toString();
        resp.setCharacterEncoding("utf8");
        resp.getWriter().write(favArray);
    }
}
