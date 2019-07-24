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

@WebServlet("/friendrequest")
public class FriendRequest extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null) {
            ArrayList<String> friendRequest=Dao4Friend.getRequestByName(user.getUsername());
            req.setAttribute("friendRequest",friendRequest);
            req.getRequestDispatcher("friendrequest.jsp").forward(req, resp);
        }
        else
            resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=((User)req.getSession().getAttribute("user"));
        if(user!=null) {
            String friendName = req.getParameter("friendName");
            String username = user.getUsername();
            Dao4Friend.addRequestByName(username, friendName);
            resp.sendRedirect("friendrequest");
        }
        else resp.sendRedirect("login.jsp");
    }
}
