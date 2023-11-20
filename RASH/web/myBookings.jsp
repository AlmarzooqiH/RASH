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
        <title>My bookings</title>
    </head>
    <%
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        if (statement == null) {
            statement = connection.createStatement();
        }
        ResultSet rs = null;
        PrintWriter res = response.getWriter();
    %>
    <jsp:include page="LoggedInUserNavBar.jsp"></jsp:include>
    <%
        //body starts
        res.println("<body>");
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
        try {
            rs = statement.executeQuery("SELECT CID FROM Account, Customer WHERE " + session.getAttribute("aid") + "= Customer.AID");
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
                res.println("</form>");
            }
            res.println("yes");
        } catch (Exception err) {
            res.println("<center><h1>" + err.getMessage() + "</h1></center>");
        }
        //table end
        res.println("</section>");

        //body ends
        res.println("</body>");
    %>

</body>
<footer></footer>
</html>
