package Controller;

import Model.Accounts;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Owwl
 */
public class MyShippingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyShippingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyShippingController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO dao = new OrderDAO();
        Accounts account = (Accounts) request.getSession().getAttribute("account");
        int shipperId = account.getAccountId();

        request.setAttribute("availableList", dao.getOrdersByShipping(shipperId));
        request.getRequestDispatcher("MyShipping.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        OrderDAO dao = new OrderDAO();
        int orderId = Integer.parseInt(request.getParameter("id"));
        System.out.println("sss"+orderId);
        if (action.equals("sendback")) {
            try {
                dao.RemoveShipping(orderId);
                response.sendRedirect(request.getContextPath() + "/myship?success");
            } catch (Exception ex) {
                response.sendRedirect(request.getContextPath() + "/myship?fail");
            }
        }
        else
        {
           try {
               int status =Integer.parseInt( request.getParameter("status"));
               String note = request.getParameter("note");
                dao.SetShippingStatusAndNote(orderId,status,note);
                if(status == 4)
                {
                    dao.setShippingDate(orderId);
                }
                response.sendRedirect(request.getContextPath() + "/myship?success");
            } catch (Exception ex) {
                response.sendRedirect(request.getContextPath() + "/myship?fail");
            } 
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
