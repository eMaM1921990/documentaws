/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import WSpatern.ValidTokenWS;
import WSpatern.WorkFlow;
import bean.LoginBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author emam
 */
public class getWorkFlow extends HttpServlet {

    ValidTokenWS valid = new ValidTokenWS();
    WorkFlow flow = new WorkFlow();
    List<String> flowid = new ArrayList<String>();
    List<String> flowname = new ArrayList<String>();

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

        valid.TokenStats(l.getToken());
         if (valid.valid == true) {
             
             flow.getWorkFlow(l.getToken(), request.getParameter("id"));
            flowid = flow.Flowid;
            flowname = flow.Flowname;
         }
         
         String buffer="<div style=\"width: 100%; height: 40px; display: block; float: left; position: relative;\">"
                 + "<div id=\"workflowPopupX\">x</div> </div>"
                 + "<h2>"+request.getParameter("name")+"</h2>"
                 + "<span>Workflow Name:</span>"
                 + "<select id=\"workflw\">";
         
         for(int i = 0; i < flowid.size(); i++){
             buffer=buffer+"<option value="+flowid.get(i)+">"+flowname.get(i)+"</option>";
         }
         buffer=buffer+"</select>"
                 + "<span>Comments:</span>"
                 + "<input type=\"hidden\" value="+request.getParameter("id")+" id=\"fileid\"/>"
                 + "<textarea name=\"Comments\" cols=\"\" rows=\"\" placeholder=\"Comments\" id=\"comments\"></textarea>"
                 + "<input  name=\"submit\" value=\"Submit\" type=\"submit\" id=\"send\"/>\"";
                        
         
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
