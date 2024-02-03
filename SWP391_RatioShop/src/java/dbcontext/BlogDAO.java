/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

<<<<<<< HEAD:SWP391_RatioShop/src/java/dal/BlogDAO.java
=======
import model.Blog;
import dbcontext.DBContext;
>>>>>>> 6ac18416a1b70e151d23b56ac44408157d299f8a:SWP391_RatioShop/src/java/DAO/BlogDAO.java
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
<<<<<<< HEAD:SWP391_RatioShop/src/java/dal/BlogDAO.java
import model.Blog;
import model.Blog.BlogData;
import model.Employees;
=======
>>>>>>> 6ac18416a1b70e151d23b56ac44408157d299f8a:SWP391_RatioShop/src/java/DAO/BlogDAO.java

/**
 *
 * @author Duc Hung Computer
 */
public class BlogDAO extends DBContext {

    public ArrayList<Blog> getListBlog() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Blog> data = new ArrayList<Blog>();
        try {
            String strSQL = "select top 10 * from Blogs order by lastUpdate desc ";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) //vao duoc day tuc la rs.next tra ve true
            {
                int blogID = rs.getInt(1);
                String title = rs.getString(2);
                String blogContent = rs.getString(3);
                String blogImage = rs.getString(4);
                Date createDate = rs.getDate(5);
                Date lastUpdate = rs.getDate(6);
                int employeeID = rs.getInt(7);
                Blog b = new Blog(blogID, title, blogContent, blogImage, createDate, lastUpdate, employeeID);
                data.add(b);
            }
        } catch (Exception e) {
            System.out.println("getListBlog:" + e.getMessage());
        }
        return data;
    }

    public Blog getBlogDetailByID(int id) {
        Blog b = new Blog();
        try {
            String strSQL = "SELECT b.*,e.employeeName\n"
                    + "  FROM Blogs b ,Employees e \n"
                    + "  where b.employeeId = e.employeeId\n"
                    + "AND b.blogId = ?";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                b.setTitle(rs.getNString("title"));
                b.setBlogContent(rs.getNString("blogContent"));
                b.setBlogImage(rs.getString("blogImage"));
                b.setCreateDate(rs.getDate("createDate"));
                b.setLastUpdate(rs.getDate("lastUpdate"));
                Employees e = new Employees();
               e.setEmployeeName(rs.getString("employeeName"));
               b.setEmployee(e);
            }
        } catch (SQLException e) {
            System.out.println("getBlogDetailByID:" + e.getMessage());
        }
        return b;
    }

    public List<BlogData> getTwoDifferentTitlesAndIds(int id) {
        List<BlogData> blogDataList = new ArrayList<>();
        try {
            String strSQL = "SELECT TOP 2 blogId, title\n"
                    + "FROM Blogs\n"
                    + "WHERE blogId <> ?\n"
                    + "ORDER BY ABS(blogId - ?);";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            stm.setInt(1, id);
            stm.setInt(2, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt("blogId");
                String title = rs.getNString("title");
                Blog blog = new Blog(); // hoặc sử dụng đối tượng Blog từ nguồn khác
                BlogData blogData = blog.new BlogData(blogId, title);
                blogDataList.add(blogData);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ theo nhu cầu của bạn
        }
        return blogDataList;
    }

}