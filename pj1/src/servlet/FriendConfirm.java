package servlet;

import dao.Dao4Friend;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/friendconfirm")
public class FriendConfirm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null) {
            String friendName = req.getParameter("friendName");
            String confirm=req.getParameter("confirm");
            if(confirm.equals("true"))
                Dao4Friend.addFriendByName(user.getUsername(),friendName);
            else
                Dao4Friend.deleteFriendByName(user.getUsername(),friendName);
            resp.sendRedirect("friends.jsp");
        }
        else resp.sendRedirect("login.jsp");
    }
}
