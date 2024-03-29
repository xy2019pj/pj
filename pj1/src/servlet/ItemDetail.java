package servlet;

import dao.Dao4Item;
import dao.Dao4Fav;
import entity.Item;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@MultipartConfig()
@WebServlet("/itemdetail")
public class ItemDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=((User)req.getSession().getAttribute("user"));
        String itemName=req.getParameter("itemName");
        if(itemName!=null)
            Dao4Item.increaseClickNum(itemName);
        else itemName=(String)req.getAttribute("itemName");
        Item item= Dao4Item.getItemByName(itemName);
        String fav;
        if(user!=null) {
            String username=user.getUsername();
            ArrayList<Item> favItems = Dao4Fav.getFavByName(username);
            fav = "false";
            for (int i = 0; i < favItems.size(); i++) {
                if (favItems.get(i).getName().equals(item.getName()))
                    fav = "true";
            }
        }
        else fav="false";
        req.setAttribute("item",item);
        req.setAttribute("fav",fav);
        req.getRequestDispatcher("itemdetail.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemName=req.getParameter("itemName");
        String username=((User)req.getSession().getAttribute("user")).getUsername();
        Dao4Fav.addFavByName(username,itemName);
        req.setAttribute("itemName",itemName);
        req.getRequestDispatcher("/jiuzhou/show/itemdetail").forward(req,resp);
    }
}
