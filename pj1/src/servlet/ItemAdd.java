package servlet;

import entity.Item;
import entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/itemadd")
@MultipartConfig()
public class ItemAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            resp.sendRedirect("itemadd.jsp");
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getContentType());
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            String name=req.getParameter("name");
            String intro=req.getParameter("intro");
            String place=req.getParameter("place");
            String time=req.getParameter("time");
            Part photo = req.getPart("picture");
            String picture="picture\\Others\\"+name+".jpg";
//            photo.write("D:\\1_学习\\1卓越软件开发基础\\pj\\picture\\Others\\"+name+".jpg");
            photo.write("D:\\codeDev\\java\\workplace\\pj\\pj1\\out\\artifacts\\pj1_war_exploded\\picture\\Others\\"+name+".jpg");
            Part video = req.getPart("video");
            String videoName="video\\"+name+".mp4";
//            video.write("D:\\1_学习\\1卓越软件开发基础\\pj\\video\\"+name+".mp4");
            video.write("D:\\codeDev\\java\\workplace\\pj\\pj1\\out\\artifacts\\pj1_war_exploded\\video\\"+name+".mp4");
            Timestamp currentTime = new Timestamp(new java.util.Date().getTime());
            Item newItem=new Item(name,"其他",picture,currentTime,0,intro,place,time,videoName);
            int status=newItem.add();
            req.setAttribute("status",status);
            req.getRequestDispatcher("itemadd.jsp").forward(req,resp);
        }
        else resp.sendRedirect("login.jsp");
    }
}
