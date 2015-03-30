/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import WSpatern.Search;
import bean.LoginBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import utils.CssClass;

/**
 *
 * @author emam
 */
public class search_result extends HttpServlet {

    public static Vector<String> files = new Vector<String>();
    public static Vector<String> files_Id = new Vector<String>();
    CssClass css = new CssClass();

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
        Search s = new Search();
        s.getFile(l.getToken(), request.getParameter("dirid"), request.getParameter("name"));
        List<String> files = s.files;
        List<String> fileid = s.files_Id;
        String buffer = "";

        for (int i = 0; i < files.size(); i++) {
            buffer = buffer + "<li>"
                    + "<div class=\"row files\">\n"
                    + "<div onclick=\"data('" + fileid.get(i) + "', '" + files.get(i) + "')\" class=\"in-block float-l opens\">\n"
                    + " <span class='" + css.getCssClass(files.get(i).substring(files.get(i).lastIndexOf(".") + 1, files.get(i).length())) + "'>" + files.get(i) + "</span>"
                    + " </div> "
                    + "<div class=\"clear\"></div>"
                    + "</div>"
                    + "</li>";

        }
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
