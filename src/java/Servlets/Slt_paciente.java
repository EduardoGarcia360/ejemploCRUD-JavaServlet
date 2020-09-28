/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Utils.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.Paciente;
/**
 *
 * @author Eduardo
 */
@WebServlet(name = "Slt_paciente", urlPatterns = {"/Slt_paciente"})
public class Slt_paciente extends HttpServlet {

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
        String accion = request.getParameter("accion");
        Connection cnx = Conexion.getConexion();
        if (accion.equals("listar")) {
            this.listPaciente(cnx, request, response);
        } else if (accion.equals("editar")) {
            this.editPaciente(cnx, request, response);
        }
    }
    
    private void listPaciente (Connection cnx, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            PreparedStatement sta = cnx.prepareStatement("{call SPR_SEL_GRID_PACIENTE}");
            ResultSet rs = sta.executeQuery();
            ArrayList<Paciente> lista = new ArrayList<>();
            while (rs.next()) {
                Paciente p = new Paciente(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5)
                );
                lista.add(p);
            }
            request.setAttribute("listar", lista);
            request.getRequestDispatcher("Pages/Paciente/index.jsp").forward(request, response);
        }catch(Exception e) {
            this.defaultError(e, response);
        }
    }
    
    private void editPaciente (Connection cnx, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            //se obtienen los parametros
            String codigo = request.getParameter("codigo");
            //se crean las conexiones para el spr
            StringBuilder sb = new StringBuilder();
            sb.append("{call SPR_SEL_PACIENTE_BY_ID(?)}");
            PreparedStatement sta = cnx.prepareCall(sb.toString());
            //se sustituyen los valores para los parametros
            sta.setString(1, codigo);
            ResultSet rs = sta.executeQuery();
            ArrayList<Paciente> lista = new ArrayList<>();
            while (rs.next()) {
                Paciente p = new Paciente(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5)
                );
                lista.add(p);
            }
            request.setAttribute("editar", lista);
            request.getRequestDispatcher("Pages/Paciente/gestion.jsp").forward(request, response);
        }catch(Exception e) {
            this.defaultError(e, response);
        }
    }
    
    private void defaultError (Exception e, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletMant</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletMant at " + e.getMessage() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
