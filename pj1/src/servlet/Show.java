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
        String search=req.getParameter("search");
        ArrayList<Item> items =null;
        if(category==null)
            category="全部";
        items=Dao4Item.getItemsByCategory(category);
        if(search!=null)
            items=Dao4Item.getItemsBySearch(category,search);
        req.setAttribute("items", items);
        req.getRequestDispatcher("show.jsp").forward(req, res);
    }
}
