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

/**
 *
 * @author truedeveloper
 */
@WebServlet(urlPatterns = {"/loginOrSignupServlet"})
public class loginOrSignupServlet extends HttpServlet {

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
        String db_URL = "jdbc:mysql://localhost:8889/RASH_HOTEL?autoReconnect=true&useSSL=false";
        String driver_name = "com.mysql.jdbc.Driver";
        String username = "root";
        String password = "root";
        Connection connection = null;
        Statement statement = null;
        try {
            Class.forName(driver_name).newInstance();
            connection = DriverManager.getConnection(db_URL, username, password);
            statement = connection.createStatement();
        } catch (Exception err) {
            response.getWriter().println(err);
            response.getWriter().close();
            System.out.println(err);
        }
        response.setContentType("text/html;charset=UTF-8");
        String login = request.getParameter("login");
        String signup = request.getParameter("signup");
        if (login != null) {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            try {
                ResultSet result = statement.executeQuery("SELECT * FROM `Account` WHERE"
                        + " Username=" + "'" + user + "'" + "AND Password=" + "'" + pass + "'");
                result.next();
                response.getWriter().println("<center><h1>Welcome " + result.getString("Username") + "</h1></center>");
                response.getWriter().close();
            } catch (Exception err) {
                response.getWriter().println(err);
                response.getWriter().close();
                System.out.println(err);
            }
        } else if (signup != null) {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String fname = request.getParameter("firstname");
            String lname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String pnumber = request.getParameter("phone-number");
            try {
                int insertAccount = statement.executeUpdate("INSERT INTO `Account`(`Username`, `Password`) VALUES ('" + user + "','" + pass + "')");
                ResultSet insertCustomer = statement.executeQuery("INSERT INTO `Customer`(`Fname`, `Lname`, `Phone#`, `AID`, `Email`) VALUES ("
                        + "'" + fname + "',"
                        + "'" + lname + "',"
                        + "'" + pnumber + "',"
                        + "'" + Integer.parseInt(statement.executeQuery("SELECT ID FROM Account WHERE Username='" + user +"'").getNString("ID")) + "',"
                        + "'" + email + "')"
                );

            } catch (Exception err) {
                response.getWriter().println(err);
                response.getWriter().close();
                System.out.println(err);
            }
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

    private boolean checkUsername(String username, Statement statement) {
        try {
            ResultSet result = statement.executeQuery("SELECT * FROM Account WHERE Username='" + username + "'");
            return result.next();
        } catch (Exception err) {
            System.out.println(err);
        }
        return false;
    }
}
