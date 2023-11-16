
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet(urlPatterns = {"/loginOrSignupServlet"})
public class loginOrSignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String db_URL = "jdbc:mysql://localhost:8889/RASH_HOTEL?autoReconnect=true&useSSL=false";
        String driver_name = "com.mysql.jdbc.Driver";
        String username = "root";
        String password = "root";
        Connection connection = null;
        Statement statement = null;

        HttpSession session = request.getSession();
        session.setAttribute("db_URL", db_URL);
        session.setAttribute("driver_name", driver_name);

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
                ResultSet result = statement.executeQuery("SELECT * FROM `Account` WHERE Username='" + user + "' AND Password=SHA2('" + pass + "', 256)");
                if (result.next()) {
                    if (result.getString("TYPE").equals("ADMIN")) {
                        response.sendRedirect(request.getContextPath() + "/admin.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/landing.jsp");
                    }
                } else {
                    response.getWriter().println("<center><h1>username or password are invalid!</h1></center>");
                    response.getWriter().close();
                }
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("pass", user);
                request.getSession().setAttribute("aid", (Object)result.getString("ID"));
                session.setAttribute("connection", connection);
                session.setAttribute("statement", statement);

            } catch (Exception err) {
                response.getWriter().println("<center><h1>username or password are invalid!</h1></center>");
                response.getWriter().close();
                System.out.println(err);
            }
        } else if (signup != null) {
            String user = request.getParameter("username");
            if (checkUsername(user, statement)) {
                response.getWriter().println("<center><h1>Username taken!</h1></center>");
                response.getWriter().close();
                return;
            }
            String pass = request.getParameter("password");
            String fname = request.getParameter("firstname");
            String lname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String pnumber = request.getParameter("phone-number");
            try {
                statement.executeUpdate("INSERT INTO `Account` (`Username`, `Password`) VALUES ('" + user + "', SHA2('" + pass + "', 256))");
                ResultSet insertAccount = statement.executeQuery("SELECT ID FROM Account WHERE Username='" + user + "'");
                insertAccount.next();
                int aid = insertAccount.getInt("ID");
                statement.executeUpdate("INSERT INTO `Customer`(`Fname`, `Lname`, `Phone#`, `AID`, `Email`) VALUES ("
                        + "'" + fname + "',"
                        + "'" + lname + "',"
                        + "'" + pnumber + "',"
                        + "'" + aid + "',"
                        + "'" + email + "')"
                );
                session.setAttribute("user", user);
                session.setAttribute("aid", aid);
                session.setAttribute("pass", pass);
                session.setAttribute("firstname", fname);
                session.setAttribute("lastname", lname);
                session.setAttribute("email", email);
                session.setAttribute("phone-number", pnumber);
                session.setAttribute("connection", connection);
                session.setAttribute("statement", statement);
                response.sendRedirect(request.getContextPath() + "/landing.jsp");
                response.getWriter().close();
            } catch (Exception err) {
                response.getWriter().println(err);
                response.getWriter().close();
                System.out.println(err);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

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
