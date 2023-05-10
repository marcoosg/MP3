package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet 
{
    
    Connection conn1;
    
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
                conn1 = DriverManager.getConnection(url1.toString(),username,password);
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
                if(conn1 != null)
                {
                    String user = request.getParameter("username");
                    String pass = request.getParameter("password");

                    // Create and Execute the PreparedStatement
                    String query = "SELECT * FROM USERS WHERE USER_ID = ?";
                    PreparedStatement ps = conn1.prepareStatement(query);
                    ps.setString(1, user);
                    ResultSet rs = ps.executeQuery();

                    //checking if the inputs username and password match
                    if(rs.next()) //email exists
                    {
                        if(pass.equals(rs.getString("USER_PASS").trim()))
                        {
                            //username and password match, creat HttpSession
                            HttpSession session = request.getSession();
                            session.setAttribute("username", user);
                            response.sendRedirect("shop.jsp");
                        }
                        else //wrong password
                        {
                            response.sendRedirect("error02.jsp");
                        }
                    }
                    else //username does not exist
                    {
                        
                        response.sendRedirect("error02.jsp");
                       
                    }
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
