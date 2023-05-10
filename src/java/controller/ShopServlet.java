
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ShopServlet extends HttpServlet 
{
    Connection conn2;
    Connection conn3;
    
    @Override
    public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        try 
        {	
            Class.forName(config.getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUserName");
            String password = config.getInitParameter("dbPassword");
            StringBuffer url1 = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"))
                    .append("?autoReconnect=true&useSSL=false");
            conn2 = DriverManager.getConnection(url1.toString(),username,password);
            conn3 = DriverManager.getConnection(url1.toString(),username,password);
                  
            
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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
             if (conn2 != null) 
            {

                Statement stmt = conn2.createStatement();
                ResultSet records = stmt.executeQuery("SELECT * FROM ITEM ORDER BY ITEM_ID asc");
                request.setAttribute("results", records);
                request.getRequestDispatcher("shop.jsp").forward(request, response);
                
                records.close();
                conn2.close();
            } 
        }
        catch (SQLException sqle)
        {
            System.out.println("SQLException error occured - " 
                        + sqle.getMessage());
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
