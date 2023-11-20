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
        //String db_URL = (String) session.getAttribute("db_URL");
        //String db_URL = "jdbc:mysql://localhost:8889/RASH_HOTEL?autoReconnect=true&useSSL=false";
        //String driver_name = (String) session.getAttribute("driver_name");
        //String username = (String) session.getAttribute("username");
        //String password = (String) session.getAttribute("password");
        //Connection connection = DriverManager.getConnection(db_URL, username, password);
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        ResultSet rs = null;
        PrintWriter res = response.getWriter();
    %>

    <%
        res.println("<header>");

        res.println("<div class='tab'>");
        res.println("<a href='admin.jsp'>Rooms</a>");
        res.println("</div>");
        res.println("<div class='tab'>");
        res.println("<a href='adminbookings.jsp'>Bookings</a>");
        res.println("</div>");
        res.println("<div class='tab'>");
        res.println("<a href='admin.jsp'>Custmers</a>");
        res.println("</div>");

        res.println("</header>");
    %>
    <%
        //body starts
        res.println("<body>");
        rs = statement.executeQuery("SELECT * FROM room");
        //table start
        res.println("<section id='table'>");

        res.println("<div class='row'>");
        res.println("<div class='col c1 id'>RID</div>");
        res.println("<div class='col c2 roomType'>Room Type</div>");
        res.println("<div class='col c1 id'>HID</div>");
        res.println("<div class='col c2 roomNum'>Room Number</div>");
        res.println("<div class='col c1 price'>Price</div>");
        res.println("<div class='col c2 button'></div>");
        res.println("</div>");

        while (rs.next()) {
            String rid = rs.getString("room.RID");
            String type = rs.getString("room.Type");
            String hid = rs.getString("room.HID");
            String roomNum = rs.getString("room.Room#");
            String price = rs.getString("room.Price");

            // Display data as list items
            res.println("<form action='adminAddBookingPage' method=\"GET\" class='row'>");
            res.println("<div class='col c1 id'>" + rid + "</div>");
            res.println("<div class='col c2 roomType'>" + type + "</div>");
            res.println("<div class='col c1 id'>" + hid + "</div>");
            res.println("<div class='col c2 roomNum'>" + roomNum + "</div>");
            res.println("<div class='col c1 price'>" + price + "</div>");
            res.println("<div class='col c2 button'> <button>book</button> </div>");
            res.println("<input type='hidden' name='rid' value='" + rid + "'>");
            res.println("<input type='hidden' name='action' value='admin'>");
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
