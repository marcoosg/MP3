package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CartQuantityServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String action = request.getParameter("action");
        int item = Integer.valueOf(request.getParameter("item"));
        int quantity = Integer.valueOf(request.getParameter("quantity"));
        
        HttpSession session = request.getSession();
        String user = (String)session.getAttribute("username");
        
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopDB?autoReconnect=true&useSSL=false","root","password");
            
            if (conn != null) 
            { 
                if (action != null) 
                {
                    if (action.equals("increase")) 
                    {
                        quantity += 1;
                        String sql = "UPDATE CART SET QUANTITY=? WHERE USER_ID=? AND ITEM_ID=? ";
                        PreparedStatement preparedStmt = conn.prepareStatement(sql);
                        preparedStmt.setInt (1, quantity);
                        preparedStmt.setString   (2, user);
                        preparedStmt.setInt (3, item);
                        
                        preparedStmt.execute();
                        response.sendRedirect("shop.jsp");
                    }

                    if (action.equals("decrease")) 
                    {

                    }
                }
                else 
                {
                    response.sendRedirect("shop.jsp");
                }
                conn.close();
            }    
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
