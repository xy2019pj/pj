package servlet;

import dao.Dao4Friend;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FriendChange extends HttpServlet {
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
