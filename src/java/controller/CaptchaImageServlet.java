
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.ByteArrayOutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.util.Base64;
import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;

public class CaptchaImageServlet extends HttpServlet 
{
    public void init(ServletConfig config) throws ServletException 
    {
    
    
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("image/png");
         
        Captcha captcha = new Captcha.Builder(200, 50)
        .addText()
        .addNoise()
        .addNoise()
        .addNoise()
        .addBackground()
        .build();
        
       
        HttpSession session = request.getSession();
        session.setAttribute("captcha",captcha);
        BufferedImage bufferedImage = captcha.getImage();
        
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage, "png", output);
        String imageAsBase64 = Base64.getEncoder().encodeToString(output.toByteArray());
        request.setAttribute("imageAsBase64", imageAsBase64);
        request.getRequestDispatcher("captcha.jsp").forward(request, response);
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
