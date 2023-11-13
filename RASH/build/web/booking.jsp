<%-- 
    Document   : booking
    Created on : Nov 6, 2023, 5:45:43 PM
    Author     : truedeveloper
--%>

<%--<%
            String db_URL = (String) session.getAttribute("db_URL");
            String driver_name = (String) session.getAttribute("driver_name");
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");
            Connection connection = (Connection) session.getAttribute("connection");
            Statement statement = (Statement) session.getAttribute("statement");
            ResultSet rs = null;
%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@page import ="javax.servlet.http.*"%>
<%@page session ="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book a room</title>
        <link rel="stylesheet" href="css/bookARoom.css" type="text/css">
    </head>
    <body>
        <jsp:include page="LogoAndNavbar.jsp"></jsp:include>
        <%
            Connection connection = (Connection) session.getAttribute("connection");
            Statement statement = (Statement) session.getAttribute("statement");
            ResultSet rs = null;
            response.getWriter().println("<div id=\"center-div\">");
            response.getWriter().println("<div id=\"filter-rooms-form\">");
            response.getWriter().println("<form action=\"\" method=\"POST\" id=\"filter\">");
            response.getWriter().println("<div id=\"center-elements\">");
            response.getWriter().println("<h2>Choose the location</h2>");
            response.getWriter().println("<select name=\"selection\">");
            response.getWriter().println("<option value=\"1\">Abu Dhabi</option>");
            response.getWriter().println("<option value=\"2\">New York</option>");
            response.getWriter().println("<option value=\"3\">Paris</option>");
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
            int hotel_location;
            if (request.getParameter("selection") == null) {
                hotel_location = 1;
            } else {
                hotel_location = Integer.parseInt(request.getParameter("selection"));
            }
            rs = statement.executeQuery("SELECT Type, Room.`Room#`, Price, Location FROM Room, Hotel WHERE Room.HID = " + hotel_location + " AND Hotel.HID =" + hotel_location);

            while (rs.next()) {
//                System.out.println("<div class=\"rooms\"><img src=\"css/Images/Hotel-Room.jpg\" alt=\"Dummy Image\"> <div class=\"room-type\"><label>Room type: </label> <strong>" + rs.getString("Type") + "</strong></div><div class=\"room-number\"><label>Room Number </label> <strong>" + rs.getString("Room#") + " </strong></div><div class=\"location\"><label>Location: </label><strong>" + rs.getString("Location") + "</strong></div><label class=\"price\">" + rs.getString("Price") + "</label>  <input type=\"hidden\" name=\"selectedRoom\"value=" + rs.getString("Room#") + "><input type=\"submit\" value=\"Book\" class=\"book-btn\"></div>");
                response.getWriter().println("<form action=\"ProcessBooking\" method=\"POST\" class=\"rooms\"><img src=\"css/Images/Hotel-Room.jpg\" alt=\"Dummy Image\"> <div class=\"room-type\"><label>Room type: </label> <strong>" + rs.getString("Type") + "</strong></div><div class=\"room-number\"><label>Room Number </label> <strong>" + rs.getString("Room#") + " </strong></div><div class=\"location\"><label>Location: </label><strong>" + rs.getString("Location") + "</strong></div><label class=\"price\">" + rs.getString("Price") + "</label>  <input type=\"hidden\" name=\"selectedRoom\"value=" + rs.getString("Room#") + "><input type=\"submit\" value=\"Book\" class=\"book-btn\"></form>");
            }
            
            response.getWriter().println("</div>");
            response.getWriter().println("</div>");

        %>
    </body>
</html>