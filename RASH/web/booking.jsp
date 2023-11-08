<%-- 
    Document   : booking
    Created on : Nov 6, 2023, 5:45:43 PM
    Author     : truedeveloper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book a room</title>
        <link rel="stylesheet" href="css/bookARoom.css" type="text/css">
    </head>
    <body>
        <jsp:include page="LogoAndNavbar.jsp"></jsp:include>
        <%!
            String db_URL = "jdbc:mysql://localhost:8889/RASH_HOTEL?autoReconnect=true&useSSL=false";
            String driver_name = "com.mysql.jdbc.Driver";
            String username = "root";
            String password = "root";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
        %>
        <%
            try {
                Class.forName(driver_name).newInstance();
                connection = DriverManager.getConnection(db_URL, username, password);
                statement = connection.createStatement();
            } catch (Exception err) {
                response.getWriter().println(err);
                response.getWriter().close();
                System.out.println(err);
            }
        %>
        <%
            response.getWriter().println("<div id=\"center-div\">");
            response.getWriter().println("<div id=\"filter-rooms-form\">");
            response.getWriter().println("<form action=\"\" method=\"POST\" id=\"filter\">");
            response.getWriter().println("<div id=\"center-elements\">");
            response.getWriter().println("<h2>Choose the location</h2>");
            response.getWriter().println("<select name=\"selection\">");
            response.getWriter().println("<option value=\"1\">Abu Dhabi</option>");
            response.getWriter().println("<option value=\"2\">Dubai</option>");
            response.getWriter().println("<option value=\"3\">Ras al Khaimah</option>");
            response.getWriter().println("<option value=\"4\">New York</option>");
            response.getWriter().println("<option value=\"5\">Tokyo</option>");
            response.getWriter().println("<option value=\"6\">Paris</option>");
            response.getWriter().println("<option value=\"7\">Sydney</option>");
            response.getWriter().println("<option value=\"8\">London</option>");
            response.getWriter().println("<option value=\"9\">Barcelona</option>");
            response.getWriter().println("<option value=\"10\">Berlin</option>");
            response.getWriter().println("</select>");
            response.getWriter().println("<h2>Arrival</h2>");
            response.getWriter().println("<div id=\"date\">");
            response.getWriter().println("<label>Arrival Date</label>");
            response.getWriter().println("<input type=\"date\" name=\"arrival\">");
            response.getWriter().println("<br>");
            response.getWriter().println("<label>Departure Date</label> <input type=\"date\" name=\"departure\">");
            response.getWriter().println("</div>");
            response.getWriter().println("<input type=\"submit\" value=\"Find a room\">");
            response.getWriter().println("</form>");
            response.getWriter().println("</div>");
            response.getWriter().println("</div>");
            response.getWriter().println("<div id=\"filtered-rooms\">");
            int hotel_location = Integer.parseInt(request.getParameter("selection"));
            rs = statement.executeQuery("SELECT Type, Room.`Room#`, Price, Location FROM Room, Hotel WHERE Room.HID = " + hotel_location +" AND Hotel.HID =" + hotel_location);

            while (rs.next()) {
                response.getWriter().println("<div class=\"rooms\"><img src=\"css/Images/Hotel-Room.jpg\" alt=\"Dummy Image\"> <div class=\"room-type\"><label>Room type: </label> <strong>" + rs.getString("Type") + "</strong></div><div class=\"room-number\"><label>Room Number </label> <strong>" + rs.getString("Room#") + " </strong></div><div class=\"location\"><label>Location: </label><strong>" + rs.getString("Location") + "</strong></div><label class=\"price\">" + rs.getString("Price") + "</label><input type=\"submit\" value=\"Book\" class=\"book-btn\"></div>");
            }

            response.getWriter().println("</div>");
            response.getWriter().println("</div>");
            connection.close();
            statement.close();
            rs.close();
        %>
    </body>
</html>

