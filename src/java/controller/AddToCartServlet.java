package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddToCartServlet extends HttpServlet 
{
    Connection conn4;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            HttpSession session = request.getSession();
            
            String user = (String)session.getAttribute("username");
            int item = Integer.valueOf(request.getParameter("item"));
            int quantity = Integer.valueOf(request.getParameter("quantity"));
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopDB?autoReconnect=true&useSSL=false","root","password");
            String sql = "INSERT INTO CART (USER_ID, ITEM_ID, QUANTITY) VALUES (?,?,?)";
            PreparedStatement preparedStmt = conn4.prepareStatement(sql);
            preparedStmt.setString (1, user);
            preparedStmt.setInt (2, item);
            preparedStmt.setInt   (3, quantity);
             preparedStmt.execute();
             conn4.close();
             response.sendRedirect("shop.jsp");
             
        }
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " 
                        + sqle.getMessage());
        } 
        catch (ClassNotFoundException nfe)
        {
                System.out.println("ClassNotFoundException error occured - " 
                + nfe.getMessage());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
