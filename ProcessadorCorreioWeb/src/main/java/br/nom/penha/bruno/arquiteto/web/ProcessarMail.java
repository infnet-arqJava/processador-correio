/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.nom.penha.bruno.arquiteto.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.nom.penha.bruno.arquiteto.correio.ProcessarPropagandaCorreio;

/**
 *
 */
@WebServlet(name = "ProcessarMail", urlPatterns = {"/processarMail"})
public class ProcessarMail extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = -266835813018382061L;
	@EJB
    ProcessarPropagandaCorreio ejb;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ejb.enviarMensagem(request.getParameter("mensagem"));

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessarMail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Email foi enviado!!!</h1>");
            out.println("</body>");
            out.println("</html>");
             
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
