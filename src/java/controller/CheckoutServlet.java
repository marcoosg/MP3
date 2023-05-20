package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckoutServlet extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
         try
        {
            HttpSession session = request.getSession();
            
            String user = (String)session.getAttribute("username");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopDB?autoReconnect=true&useSSL=false","root","password");
            
            String query = "SELECT * FROM CART WHERE USER_ID = ?";
            PreparedStatement ps1 = conn4.prepareStatement(query);
            ps1.setString(1, user);
            ResultSet rs = ps1.executeQuery();
            
            if(rs.next()==false)
            {
                response.sendRedirect("error03.jsp");
            }
            else
            {
                String sql = "INSERT INTO ORDERS SELECT * FROM CART WHERE USER_ID=?";
                PreparedStatement preparedStmt = conn4.prepareStatement(sql);
                preparedStmt.setString (1, user);
                preparedStmt.execute();

                sql = "DELETE FROM CART WHERE USER_ID=?";
                PreparedStatement ps = conn4.prepareStatement(sql);
                ps.setString (1, user);
                ps.execute();

                conn4.close();
                response.sendRedirect("checkout.jsp");
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
