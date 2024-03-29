package servlet;

import dao.Dao4User;
import entity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        /*转发到登录页面*/
        res.sendRedirect("login.jsp");
    }
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
        int status=0;
        //获取用户信息
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user=new User(username,'n',password,null,null);
        //登录
        status = user.login();

        if (status == 0) {//登陆成功
            User actUser= Dao4User.getActuserByUser(user);
            req.getSession().setAttribute("user", actUser);
            //res.sendRedirect("home.jsp");
            res.getWriter().write("1");
        }else {
            res.getWriter().write("2");
        }
        /*
        else if(status==1)
//            res.getWriter().append("2");
        else if(status==2)
//             res.getWriter().append("2");*/
    }
}
