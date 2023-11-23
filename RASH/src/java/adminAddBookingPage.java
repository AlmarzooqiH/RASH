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
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/adminAddBookingPage"})
public class adminAddBookingPage extends HttpServlet {

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
        try (PrintWriter output = response.getWriter()) {
            HttpSession session = request.getSession();
            Connection connection = (Connection) session.getAttribute("connection");
            Statement statement = (Statement) session.getAttribute("statement");
            try {
                ResultSet rs = statement.executeQuery("SELECT Location FROM Hotel WHERE HID = " + request.getParameter("hid"));
                if (rs.next()) {
                    output.println("<h1>Selected location: " + rs.getString("Location") + "</h1>");
                }
                rs = statement.executeQuery("SELECT AID,CID FROM CUSTOMER");
                output.println("<script>");
                output.println("function updateSubmitButton() {");
                output.println("var arrivalDate = document.getElementsByName('arrival')[0].value;");
                output.println("var departureDate = document.getElementsByName('departure')[0].value;");
                output.println("var submitButton = document.getElementById('findRoomButton');");
                output.println("var dateCompare = new Date(departureDate) - new Date(arrivalDate);");
                output.println("submitButton.disabled = (dateCompare <= 0) || (departureDate == null) || (departureDate == '');");
                output.println("}");
                output.println("window.onload = function () {");
                output.println("updateSubmitButton();");
                output.println("};");
                output.println("</script>");
                output.println("<form action=\"ProcessBooking\" method=\"POST\"");
                output.println("</select><br><h1>Select Customer</h1>");
                output.println("<select name=\"customerID\">");
                while (rs.next()) {
                    int currentCustomer = Integer.parseInt(rs.getString("CID"));
                    output.println("<option value=\"" + currentCustomer + "\">" + currentCustomer + "</option>");
                }
                output.println("</select>");
                output.println("<h2>Arrival</h2>");
                output.println("<div id=\"date\">");
                output.println("<label>Arrival Date</label>");
                output.println("<input type=\"date\" value=\"" + LocalDate.now() + "\" name=\"arrival\" onchange=\"updateSubmitButton()\">");
                output.println("<br>");
                output.println("<label>Departure Date</label> <input type=\"date\" name=\"departure\" onchange=\"updateSubmitButton()\">");
                output.println("</div>");
                output.println("<input type='hidden' name='hid' value='" + request.getParameter("hid") + "'>");
                output.println("<input type='hidden' name='action' value='admin'>");
                output.println("<input type='hidden' name='rid' value='" + request.getParameter("rid") + "'>");
                output.println("<input type=\"submit\" value=\"Book the room\" id=\"findRoomButton\">");
                output.println("</form>");
                output.println("</div>");
                output.println("</div>");
                output.println("<div id=\"filtered-rooms\">");
            } catch (Exception err) {
                output.println(err.getMessage());
            }
        } catch (Exception err) {
            response.getWriter().println(err.getMessage());
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
