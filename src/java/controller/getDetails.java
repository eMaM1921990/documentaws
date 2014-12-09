/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import WSpatern.MetaData;
import WSpatern.ProprestiesFile;
import WSpatern.getFileSecuirty;
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
public class getDetails extends HttpServlet {

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
        getFileSecuirty secure = new getFileSecuirty();
        ProprestiesFile prop = new ProprestiesFile();
        MetaData meta = new MetaData();
        secure.getSecuirty(l.getToken(), request.getParameter("id"));
        List<String> data = new ArrayList<String>();
        List<String> label = new ArrayList<String>();
        List<String> codAtribut = new ArrayList<String>();
        List<String> valoare = new ArrayList<String>();

        prop.getProp(l.getToken(), request.getParameter("id"));
        data = prop.prop;
        label = prop.label;

        meta.getMeta(l.getToken(), request.getParameter("id"));
        codAtribut = meta.codAtribut;
        valoare = meta.valoare;
        secure.getSecuirty(l.getToken(), request.getParameter("id"));
        String buffer = "<div id=\"content\" class=\"row\"><div class=\"fileInfo\"> <div class=\"fixed-div\"><div class=\"infoMenu\">"
                + "<span>File Name : " + request.getParameter("name") + "</span>"
                + "<ul>\n"
                + "                            <li id=\"generalDataTriger\">General</li>\n"
                + "                            <li id=\"whohasaccesDataTriger\">Who has Access</li>\n"
                + "                            <li id=\"metadataTriger\">Meta Data</li>\n"
                + "                        </ul>"
                + "</div></div><div class=\"infoData\">"
                + "<div id=\"generalData\">"
                + "<ul>";
        for (int i = 0; i < data.size(); i++) {
            buffer = buffer + "<li> <span class=\"float-l pdl\">" + label.get(i) + "</span>  <span class=\"pdr\">" + data.get(i) + "</span> </li>";
        }
        buffer = buffer + "</ul></div>"
                + "<div id=\"whohasaccesData\"> \n"
                + "                        <table>\n"
                + "                            <tbody>\n"
                + "                                <tr style=\"font-weight: bold;\">\n"
                + "                                    <td>Users</td>\n"
                + "                                    <td style=\"width: 50px;\">Full</td>\n"
                + "                                    <td style=\"width: 50px;\">Read</td>\n"
                + "                                    <td>Write</td>\n"
                + "                                </tr>"
                + "<tr>\n"
                + "                                    <td style=\"min-width: 100px;\">"+secure.secName+"</td>\n"
                + "                                    <td>";
        
                
                if (secure.hasFull.equals("1")) {
                    buffer=buffer+"<input type=\"checkbox\" checked=\"true\" name=\"1\" disabled/>";
                            } else {
                    buffer=buffer+"<input type=\"checkbox\"  name=\"1\" disabled/>";
                            };
                            
                            buffer=buffer+"</td><td>\n";
               if (secure.hasRead.equals("1")) {
                   buffer=buffer+"<input type=\"checkbox\" checked=\"true\" name=\"2\" disabled/>";
               } else {
                   buffer=buffer+"<input type=\"checkbox\"  name=\"2\" disabled/>";
               }
               buffer=buffer+"</td><td>\n";
               
                if (secure.hasWrite.equals("1")) {
                    buffer=buffer+"<input type=\"checkbox\" checked=\"true\" name=\"3\" disabled/>";
                } else {
                    
                    buffer=buffer+"<input type=\"checkbox\"  name=\"3\" disabled/>";
                }
                
                buffer=buffer+"</td>\n"
                + "                                </tr>\n"
                + "                            </tbody>\n"
                + "                        </table>\n"
                + "\n"
                + "\n"
                + "                    </div> "
                        + "<div id=\"metadata\"><ul>";
                for (int i = 0; i < codAtribut.size(); i++) {
                    buffer=buffer+"<li> <span class=\"float-l pdl\">"+codAtribut.get(i)+"</span>  <span class=\"pdr\">"+valoare.get(i)+"</span> </li>";
                }
                
                buffer=buffer+"</ul></div><div class=\"clear\"> </div></div></div>";

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
