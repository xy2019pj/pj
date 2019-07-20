package servlet;

import dao.Dao4Item;
import entity.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/show")
public class Show extends HttpServlet {
    public static int flag = 0;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String category = req.getParameter("category");
        ArrayList<Item> items =null;
        /*搜索时传参*/
        if(category.startsWith("search=")) {
            String content=category.substring(category.indexOf('=')+1);
            items=Dao4Item.getItemsBySearch(content);
        }
        /*根据类别传参*/
        else{
            items=Dao4Item.getItemsByCategory(category);
        }
        req.setAttribute("items", items);
        req.getRequestDispatcher("show.jsp").forward(req, res);
    }
}
