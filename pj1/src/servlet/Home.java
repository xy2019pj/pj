package servlet;

import dao.Dao4Item;
import entity.Item;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/")
public class Home extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException{
        System.out.println("jiuzhou!");
        /*热门展品*/
        ArrayList<Item> hotItem= Dao4Item.getHotItems();
        req.setAttribute("items",hotItem);
        /*转发到首页页面*/
        req.getRequestDispatcher("home.jsp").forward(req,res);
    }
}
