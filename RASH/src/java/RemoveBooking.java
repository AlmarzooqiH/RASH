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
import javax.servlet.http.HttpSession;
import java.sql.*;


@WebServlet(urlPatterns = {"/RemoveBooking"})
public class RemoveBooking extends HttpServlet {

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
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        try {
            String action = request.getParameter("action");
            if (action.equals("customer")) {

                response.getWriter().println("<center><h1>In Cusotmer</h1></center>");
                customerRemoveBooking(request, response, session, connection, statement);
            } else if (action.equals("admin")) {
                response.getWriter().println("<center><h1>In Admmin</h1></center>");
                adminRemoveBooking(request, response, session, connection, statement);
            }
        } catch (Exception err) {
            response.getWriter().println("<center><h1>" + err.getMessage() + "</h1></center>");
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

    void customerRemoveBooking(HttpServletRequest request, HttpServletResponse response, HttpSession session, Connection connection, Statement statement) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            int removedRoom = Integer.parseInt(request.getParameter("rid"));
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);
            int didRemove = statement.executeUpdate("DELETE FROM `Booking` WHERE Booking.bid=" + removedRoom);
            response.sendRedirect(request.getContextPath() + "/myBookings.jsp");
        } catch (Exception err) {
            response.getWriter().println("<center><h1>" + err.getMessage() + "</h1></center>");
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);

            response.sendRedirect(request.getContextPath() + "/myBookings.jsp");
        }
    }

    void adminRemoveBooking(HttpServletRequest request, HttpServletResponse response, HttpSession session, Connection connection, Statement statement) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            int removedRoom = Integer.parseInt(request.getParameter("rid"));
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);
            int didRemove = statement.executeUpdate("DELETE FROM `Booking` WHERE Booking.bid=" + removedRoom);
            response.sendRedirect(request.getContextPath() + "/adminbookings.jsp");
        } catch (Exception err) {
            response.getWriter().println("<center><h1>" + err.getMessage() + "</h1></center>");
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);
            response.sendRedirect(request.getContextPath() + "/adminbookings.jsp");
        }
    }
}

