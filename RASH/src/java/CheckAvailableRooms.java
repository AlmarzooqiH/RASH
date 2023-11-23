/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;


@WebServlet(urlPatterns = {"/CheckAvailableRooms"})
public class CheckAvailableRooms extends HttpServlet {

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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        ResultSet rs = null;
        ArrayList<Integer> availableRooms = new ArrayList<Integer>();
        try {
            String arrivalDate = request.getParameter("arrival");
            String departureDate = request.getParameter("departure");
            rs = statement.executeQuery("SELECT ROOM.RID FROM ROOM LEFT JOIN Booking ON ROOM.RID = Booking.RID WHERE (Booking.RID IS NULL OR (Booking.Departure < '" + arrivalDate + "' AND Booking.Arrival > '" + departureDate + "') OR Booking.BID IS NULL)");

            if (rs != null) {
                while (rs.next()) {
                    availableRooms.add(Integer.parseInt(rs.getString("RID")));
                }
            }
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);
            session.setAttribute("availableRooms", availableRooms);
            session.setAttribute("arrivalDate", request.getParameter("arrival"));
            session.setAttribute("departureDate", request.getParameter("departure"));
            session.setAttribute("selection", request.getParameter("selection"));
            response.sendRedirect(request.getContextPath() + "/booking.jsp");
        } catch (Exception err) {
            out.println(err.getMessage());
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);
            response.sendRedirect(request.getContextPath() + "/booking.jsp");
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
