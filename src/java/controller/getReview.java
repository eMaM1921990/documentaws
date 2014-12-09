/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import bean.LoginBeans;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;


/**
 *
 * @author emam
 */
public class getReview extends HttpServlet {

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
        HttpSession session = request.getSession();
        LoginBeans l = (LoginBeans) session.getAttribute("loginsession");
        /// Perview 
            HttpClient httpclient = new DefaultHttpClient();
            HttpGet httpget = new HttpGet("https://documenta-dms.com/DMSWS/api/v1/file/" + l.getToken()+ "/pdf_by_id/" + request.getParameter("id"));
            HttpResponse responses = httpclient.execute(httpget);

            HttpEntity entity = responses.getEntity();
            if (entity != null) {
                long len = entity.getContentLength();
                InputStream inputStream = entity.getContent();

                File f = new File(request.getRealPath("/fackpath") + "/" + l.getUserId() + "." + request.getParameter("name").substring(0, request.getParameter("name").lastIndexOf(".")) + ".pdf");
                f.createNewFile();

                FileOutputStream fos = new FileOutputStream(f);
                int inByte;
                while ((inByte = inputStream.read()) != -1) {
                    fos.write(inByte);
                }
                inputStream.close();
                fos.close();
                // write the file to whether you want it.
            }
            
             String buffer="<iframe style='width: 100%; height: 530px' src='web/viewer.html?file=../fackpath/"
            +l.getUserId() + "."
           + request.getParameter("name").substring(0, request.getParameter("name").lastIndexOf("."))
           +".pdf#zoom=100'></iframe>";
            
            response.getWriter().write(buffer);
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
