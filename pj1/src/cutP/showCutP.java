package cutP;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.Dao4Item;
import entity.Item;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;

@WebServlet("/showcutp")
public class showCutP extends HttpServlet {
    public static int flag = 0;

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("show.jsp").forward(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        String search=req.getParameter("search");
        ArrayList<Item> items =null;
        if(category==null)
            category="全部";
        items=Dao4Item.getItemsByCategory(category);
        if(search!=null)
            items=Dao4Item.getItemsBySearch(category,search);


        resp.setCharacterEncoding("utf8");
        Writer out=resp.getWriter();
        JSONArray it=new JSONArray();
        it.element(JSONArray.fromObject(items));
        //ArrayList<Item> recentItems=Dao4Item.getRecentItems();
        //it.element(JSONArray.fromObject(recentItems));
        String json=it.toString();
        out.write(json);

        Page<Item> pages=new Page<>();
        pages.setPageNo(1);
        pages.setList(items);

    }
}
