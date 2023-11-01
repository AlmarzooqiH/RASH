
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
<<<<<<< HEAD
                response.getWriter().println("<center><h1>Invalid username or password</h1></center>");
=======
                response.getWriter().println(err);
>>>>>>> db88fef557e9f670d853121edb801760381e6e15
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
                statement.executeUpdate("INSERT INTO `Account`(`Username`, `Password`) VALUES ('" + user + "','" + pass + "')");
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
                response.getWriter().println("<center><h1>Customer has been added successfully</h1></center>");
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
