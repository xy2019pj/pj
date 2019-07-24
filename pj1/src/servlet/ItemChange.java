package servlet;

import dao.Dao4Item;
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

@MultipartConfig()
@WebServlet("/itemchange")
public class ItemChange extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            String itemName=req.getParameter("item");
            Item item= Dao4Item.getItemByName(itemName);
            req.setAttribute("item",item);
            req.getRequestDispatcher("itemchange.jsp").forward(req,resp);
        }
        else
            resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            String oldName=req.getParameter("oldName");
            if(oldName!=null) {
                String name=req.getParameter("name");
                String intro=req.getParameter("intro");
                String place=req.getParameter("place");
                String time=req.getParameter("time");
                Part photo = req.getPart("picture");
                String picture="picture\\Others\\"+name+".jpg";
                photo.write("D:\\1_学习\\1卓越软件开发基础\\pj\\picture\\Others\\"+name+".jpg");
                Part video = req.getPart("video");
                String videoName="video\\"+name+".mp4";
                video.write("D:\\1_学习\\1卓越软件开发基础\\pj\\video\\"+name+".mp4");
                Item newItem=new Item(name,"其他",picture,null,0,intro,place,time,videoName);
                Dao4Item.changeItem(oldName,newItem);
                req.getRequestDispatcher("itemchange.jsp").forward(req,resp);
            }else {
                resp.sendRedirect("itemmanage");
            }
        }
        else
            resp.sendRedirect("login.jsp");
    }
}
