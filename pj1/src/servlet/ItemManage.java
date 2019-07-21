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

@WebServlet("/itemmanage")
public class ItemManage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            ArrayList<Item> allItems= Dao4Item.getItemsByCategory("全部");
            req.setAttribute("items",allItems);
            req.getRequestDispatcher("itemmanage.jsp").forward(req,resp);
        }
        else resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String deleteItem=req.getParameter("deleteItem");
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a') {
            if (deleteItem != null)
                Dao4Item.deleteItem(deleteItem);
            req.getRequestDispatcher("itemmanage.jsp").forward(req,resp);
        }
        else resp.sendRedirect("login.jsp");
    }
}
