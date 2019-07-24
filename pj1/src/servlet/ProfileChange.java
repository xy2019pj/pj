package servlet;

import dao.Dao4User;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/profilechange")
public class ProfileChange extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User oldUser=(User)req.getSession().getAttribute("user");
        if (oldUser!=null) {
            String password=req.getParameter("password");
            if(Dao4User.getPwdByUser(oldUser).equals(password)) {
                String username=req.getParameter("username");
                String email=req.getParameter("email");
                String intro=req.getParameter("intro");
                User newUser=new User(username,oldUser.getAuth(),password,email,null);
                newUser.setIntro(intro);
                Dao4User.changeUserByName(oldUser.getUsername(), newUser);
                req.getSession().setAttribute("user", newUser);
//                resp.sendRedirect("profile");
                resp.getWriter().write("1");
            }
        }else{
            resp.getWriter().write("2");
        }
//        else resp.sendRedirect("login.jsp");

    }
}
