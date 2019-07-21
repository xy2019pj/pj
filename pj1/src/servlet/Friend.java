package servlet;

import dao.Dao4Friend;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/friend")
public class Friend extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if (user!=null) {
            String username = user.getUsername();
            ArrayList<String> friends = Dao4Friend.getFriendsByName(username);
            ArrayList<String> friendRequests = Dao4Friend.getRequestByName(username);
            req.setAttribute("friends", friends);
            req.setAttribute("friendRequests", friendRequests);
            req.getRequestDispatcher("friends.jsp").forward(req, resp);
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if (user!=null) {
            String username = user.getUsername();
            String friName = req.getParameter("friendName");
            Dao4Friend.changeFriendsByName(username, friName);
            req.getRequestDispatcher("friend").forward(req, resp);
        }
        else resp.sendRedirect("login.jsp");
    }
}
