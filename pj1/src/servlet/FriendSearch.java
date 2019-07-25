package servlet;

import dao.Dao4User;
import entity.User;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/friendsearch")
public class FriendSearch extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search=req.getParameter("search");
        ArrayList<User> users= Dao4User.getUserBySearch(search);
        resp.setCharacterEncoding("utf8");
        resp.getWriter().write(JSONArray.fromObject(users).toString());
    }
}
