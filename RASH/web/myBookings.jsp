<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers Page</title>
        <link rel="stylesheet" href="css/myBooking.css" type="text/css">
        <link rel="stylesheet" href="css/LogoAndNavBar.css" type="text/css">
    </head>
    <%
        PrintWriter output = response.getWriter();
        String[] column_names = {"BID", "Hotel.Location", "Arrival", "Departure", "Booking.RID"};
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        output.println("<body>");
        out.println("<div class=\"banner\">"
                + "<div class=\"navbar\">"
                + "<img src=\"css/Images/RASH-removebg-preview.png\" alt=\"Rash Hotels\" class=\"logo\">"
                + "<ul>"
                + "<li><a href=\"booking.jsp\">Book</a></li>"
                + "<li><a href=\"myBookings.jsp\">My Bookings</a></li>"
                + "</ul>"
                + "</div>"
                + "</div>");
        output.println("<header>");
        output.println("<table>");
        output.println("<th>");
        output.println("<tr>");
        for (int i = 0; i < column_names.length; i++) {
            if (i == 1) {
                output.println("<td><strong><h2>Location</h2></strong></td>");
                continue;
            } else if (i == 4) {
                output.println("<td><strong><h2>Room#</h2></strong></td>");
                break;
            }
            output.println("<td><strong><h2>" + column_names[i] + "</h2></strong></td>");
        }
        output.println("</th>");
        output.println("</tr>");
        try {
            ResultSet rs = statement.executeQuery("SELECT Booking.BID, Hotel.Location, Booking.Arrival, Booking.Departure, Booking.RID FROM Booking JOIN Hotel ON Booking.HID = Hotel.HID JOIN Customer ON Booking.CID = Customer.CID WHERE Customer.AID = " + ((String) request.getSession().getAttribute("aid")) + " AND Hotel.HID = Booking.HID;");

            if (rs == null) {
                return;
            }
            while (rs.next()) {
                output.println("<form action=\"RemoveBooking\" method=\"POST\">");
                output.println("<tr>");
                for (int i = 0; i < column_names.length; i++) {
                    output.println("<td>" + rs.getString(column_names[i]) + "</td>");
                }
                output.println("<input type='hidden' name='rid' value=" + rs.getString("Booking.BID") + ">");
                output.println("<input type='hidden' name='action' value=\"customer\"'>");
                output.println("<td><input type=\"submit\" value=\"Cancel Booking\"/></td>");
                output.println("</tr>");
                output.println("</form>");
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


