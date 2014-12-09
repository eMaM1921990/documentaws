/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import WSpatern.LoginWS;
import WSpatern.ValidTokenWS;
import bean.LoginBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.Encryption;

/**
 *
 * @author emam
 */
public class LoginServ extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        LoginWS l = new LoginWS();
        LoginBeans login = new LoginBeans();
        
        
        try (PrintWriter out = response.getWriter()) {
            l.getLoginAuth(request.getParameter("username"), request.getParameter("password"));
            String remmber;
            if (request.getParameter("remmber") == null) {
                remmber = "off";
            } else {
                remmber = "on";
            }
            if (LoginWS.valid == true) {
                if (remmber.equals("on")) {

                    Cookie c = new Cookie("username", request.getParameter("username"));
                    Cookie p = new Cookie("pass", request.getParameter("password"));
                    response.addCookie(c);
                    response.addCookie(p);
                }
                HttpSession session = request.getSession();
                login.setUsername(request.getParameter("username"));
                login.setExpire(LoginWS.expire);
                login.setTokenId(LoginWS.tokekn);
                login.setUnitId(LoginWS.unitId);
                login.setUserId(LoginWS.userId);

                session.setAttribute("loginsession", login);

                response.sendRedirect("mainpage.jsp");
            } else {
                response.sendRedirect("Login.jsp?msg="+URLEncoder.encode("Invalid username or password"));
            }
            /* TODO output your page here. You may use following sample code. */

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
