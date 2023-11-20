<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers Page</title>
        <link rel="stylesheet" href="css/Admin_View_Customers.css" type="text/css">
    </head>
    <%
        
        PrintWriter output = response.getWriter();
        String[] column_names = {"Fname", "Lname", "CID", "Phone#", "AID", "Email"};
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        output.println("<body>");
        output.println("<header>");
        output.println("<div class='tab'>");
        output.println("<a href='admin.jsp'>Rooms</a>");
        output.println("</div>");
        output.println("<div class='tab'>");
        output.println("<a href='adminbookings.jsp'>Bookings</a>");
        output.println("</div>");
        output.println("<div class='tab'>");
        output.println("<a href='admincustomers.jsp'>Customers</a>");
        output.println("</div>");
        output.println("</header>");
        output.println("<table>");
        output.println("<th>");
        output.println("<tr>");
        for (int i = 0; i < column_names.length; i++) {
            output.println("<td><strong><h2>" + column_names[i] + "</h2></strong></td>");
        }
        output.println("</th>");
        output.println("</tr>");
        try {
            ResultSet rs = statement.executeQuery("SELECT * FROM CUSTOMER");
            if (rs == null) {
                return;
            }
            while (rs.next()) {
                output.println("<tr>");
                for (int i = 0; i < column_names.length; i++) {
                    output.println("<td>" + rs.getString(column_names[i]) + "</td>");
                }
                output.println("</th>");
            }
        } catch (Exception err) {
            response.getWriter().println("<center>" + err + "</h1></center>");
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);
        }

        output.println("</table>");

        output.println("</body>");


    %>

</html>
