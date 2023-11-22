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

/**
 *
 * @author truedeveloper
 */
@WebServlet(urlPatterns = {"/ProcessBooking"})
public class ProcessBooking extends HttpServlet {

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
        try {

            HttpSession session = request.getSession();
            Connection con = (Connection) session.getAttribute("connection");
            Statement stmt = (Statement) session.getAttribute("statement");
            String action = request.getParameter("action");
            if (action.equals("customer")) {
                response.getWriter().println("<center><h1>In Cusotmer</h1></center>");
                customerAddBooking(request, response, session, con, stmt);
            } else if (action.equals("admin")) {
                response.getWriter().println("<center><h1>In Admmin</h1></center>");
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                adminAddBooking(request, response, session, con, stmt, customerID);
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

    void customerAddBooking(HttpServletRequest request, HttpServletResponse response, HttpSession session, Connection con, Statement stmt)
            throws ServletException, IOException {
        try {
            ResultSet rs = stmt.executeQuery("SELECT CID FROM Account, Customer WHERE " + session.getAttribute("aid") + "= Customer.AID");
//            response.getWriter().println(rs.next());
//            response.getWriter().println(rs.getString("CID"));
            if (rs.next()) {
                int customerID = Integer.parseInt(rs.getString("CID"));
                int roomID = Integer.parseInt(request.getParameter("selectedRoom"));
                int hid = Integer.parseInt(request.getParameter("hid"));
                String arrival = request.getParameter("arrivalDate");
                String departure = request.getParameter("departureDate");
                stmt.executeUpdate("INSERT INTO `Booking`(`Arrival`, `Departure`, `CID`, `RID`, `HID`) VALUES ('" + arrival + "','" + departure + "','" + customerID + "','" + roomID + "','" + hid + "')");
            }

            session.setAttribute("connection", con);
            session.setAttribute("statement", stmt);
            response.sendRedirect(request.getContextPath() + "/booking.jsp");
        } catch (Exception err) {
            System.err.println(err);
            response.getWriter().println(err);
            response.getWriter().println("<br>Failed to add a room");
            session.setAttribute("connection", con);
            session.setAttribute("statement", stmt);
            response.sendRedirect(request.getContextPath() + "/booking.jsp");
            System.err.println("FAILED TO ADD THE ROOM!!!!!!!");
        }
    }

    void adminAddBooking(HttpServletRequest request, HttpServletResponse response, HttpSession session, Connection con, Statement stmt, int customerID)
            throws ServletException, IOException {
        try {
            response.getWriter().println("<center><h1>In admin fjunctoij</h1></center>");

            int roomID = Integer.parseInt(request.getParameter("rid"));
            response.getWriter().println("<center><h1>,kjhgfdfhcgjvhkjlklihougiyfturdy</h1></center>");
            int hotel_location = Integer.parseInt(request.getParameter("hid"));
            String arrival = request.getParameter("arrival");
            String departure = request.getParameter("departure");
            stmt.executeUpdate("INSERT INTO `Booking`(`Arrival`, `Departure`, `CID`, `RID`, `HID`) VALUES ('" + arrival + "','" + departure + "','" + customerID + "','" + roomID + "','" + hotel_location + "')");
            session.setAttribute("connection", con);
            session.setAttribute("statement", stmt);
            response.sendRedirect(request.getContextPath() + "/admin.jsp");
        } catch (Exception err) {
            System.err.println(err);
            response.getWriter().println(err);
            response.getWriter().println("<br>Failed to add a room");
            session.setAttribute("connection", con);
            session.setAttribute("statement", stmt);
            response.sendRedirect(request.getContextPath() + "/admin.jsp");
            System.err.println("FAILED TO ADD THE ROOM!!!!!!!");
        }
    }
}
