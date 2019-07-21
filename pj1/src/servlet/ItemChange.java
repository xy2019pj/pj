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

@WebServlet("/itemchange")
public class ItemChange extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            String itemName=req.getParameter("item");
            Item item= Dao4Item.getItemByName(itemName);
            req.setAttribute("item",item);
            req.getRequestDispatcher("itemchange,jsp").forward(req,resp);
        }
        else
            resp.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=(User)req.getSession().getAttribute("user");
        if(user!=null&&user.getAuth()=='a'){
            String oldName=req.getParameter("oldName");
            Item newItem=(Item)req.getAttribute("item");
            Dao4Item.changeItem(oldName,newItem);
            req.getRequestDispatcher("itemchange").forward(req,resp);
        }
        else
            resp.sendRedirect("login.jsp");
    }
}
