package servlet;

import dao.Dao4User;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class FriendSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search=req.getParameter("search");
        ArrayList<User> users= Dao4User.getUserBySearch(search);
        req.setAttribute("users",users);
        req.getRequestDispatcher("friendrequest.jsp").forward(req,resp);
    }
}
