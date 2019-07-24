package servlet;

import dao.Dao4Item;
import entity.Item;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/show")
public class Show extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("><<<<");
        System.out.println(req.getParameter("category"));
        req.getRequestDispatcher("show.jsp").forward(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        String search=req.getParameter("search");
        ArrayList<Item> items =null;
        if(category==null||category.equals("null"))
            category="全部";
        items=Dao4Item.getItemsByCategory(category);
        if(search!=null&&!search.equals("null")&&!search.equals(""))
            items=Dao4Item.getItemsBySearch(category,search);
        resp.setCharacterEncoding("utf8");
        resp.getWriter().write(JSONArray.fromObject(items).toString());
    }
}
