package servlet;

import dao.Dao4Item;
import entity.Item;
import entity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

@WebServlet("/home")
public class Home extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException{
        req.getRequestDispatcher("home.jsp").forward(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("jiuzhou!");
        /*热门展品*/
        resp.setCharacterEncoding("utf8");
        ArrayList<Item> hotItems= Dao4Item.getHotItems();
        Writer out=resp.getWriter();
        JSONArray items=new JSONArray();
        items.element(JSONArray.fromObject(hotItems));
        ArrayList<Item> recentItems=Dao4Item.getRecentItems();
        items.element(JSONArray.fromObject(recentItems));
        String json=items.toString();
        out.write(json);
    }
}
