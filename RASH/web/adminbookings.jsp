<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@page import ="javax.servlet.http.*"%>
<%@page import = "java.io.*"%>
<%@page session ="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/employee.css" type="text/css">
        <title>ADMIN Page</title>
    </head>
    <%
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        ResultSet rs = null;
        PrintWriter res = response.getWriter();
    %>

    <%
        res.println("<header>");
//
//        res.println("<div class='tab'>");
//        res.println("<a href='admin.jsp'>Rooms</a>");
//        res.println("</div>");
        res.println("<div class='tab'>");
        res.println("<a href='adminbookings.jsp'>Bookings</a>");
        res.println("</div>");
        res.println("<div class='tab'>");
        res.println("<a href='admincustomers.jsp'>Customers</a>");
        res.println("</div>");

        res.println("</header>");
    %>
    <%
        //body starts
        res.println("<body>");
        rs = statement.executeQuery("SELECT * FROM booking, customer WHERE booking.CID = customer.CID");
        //table start
        res.println("<section id='table'>");

        res.println("<div class='row'>");
        res.println("<div class='col c1 id'>BID</div>");
        res.println("<div class='col c2 id'>RID</div>");
        res.println("<div class='col c1 roomNum'>Arrival</div>");
        res.println("<div class='col c2 roomNum'>Departure</div>");
        res.println("<div class='col c1 id'>CID</div>");
        res.println("<div class='col c2 roomNum'>First Name</div>");
        res.println("<div class='col c1 roomNum'>Last Name</div>");
        res.println("<div class='col c2 roomNum'>Phone#</div>");
        res.println("<div class='col c1 button'> </div>");
        res.println("</div>");
        while (rs.next()) {
            String bid = rs.getString("booking.BID");
            String arrival = rs.getString("booking.Arrival");
            String departure = rs.getString("booking.Departure");
            String cid = rs.getString("booking.CID");
            String rid = rs.getString("booking.RID");
            String firstName = rs.getString("customer.Fname");
            String lastName = rs.getString("customer.Lname");
            String phoneNum = rs.getString("customer.Phone#");

            // Display data as list items
            res.println("<form action=\"RemoveBooking\" method=\"POST\" class='row'>");
            res.println("<div class='col c1 id'>" + bid + "</div>");
            res.println("<div class='col c2 id'>" + rid + "</div>");
            res.println("<div class='col c1 roomNum'>" + arrival + "</div>");
            res.println("<div class='col c2 roomNum'>" + departure + "</div>");
            res.println("<div class='col c1 id'>" + cid + "</div>");
            res.println("<div class='col c2 roomNum'>" + firstName + "</div>");
            res.println("<div class='col c1 roomNum'>" + lastName + "</div>");
            res.println("<div class='col c2 roomNum'>" + phoneNum + "</div>");
            res.println("<div class='col c1 button'> <input type=\"submit\" value=\"cancel\"/> </div>");
            res.println("<input type='hidden' name='rid' value='" + bid + "'>");
            res.println("<input type='hidden' name='action' value=\"admin\"'>");
            res.println("</form>");
        }
        //table end
        res.println("</section>");

        //body ends
        res.println("</body>");
    %>

</body>
<footer></footer>
</html>
