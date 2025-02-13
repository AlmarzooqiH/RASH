<%-- 
    Document   : booking
    Created on : Nov 6, 2023, 5:45:43 PM
    Author     : truedeveloper
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
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
<%@page import="java.time.LocalDate"%>
<%@page session ="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book a room</title>
        <link rel="stylesheet" href="css/bookARoom.css" type="text/css">

        <script>
            function updateSubmitButton() {
                var arrivalDate = document.getElementsByName("arrival")[0].value;
                var departureDate = document.getElementsByName("departure")[0].value;
                var submitButton = document.getElementById("findRoomButton");

                // Calculate dateCompare based on arrivalDate and departureDate
                var dateCompare = new Date(departureDate) - new Date(arrivalDate);

                // Update the "disabled" attribute based on dateCompare value
                submitButton.disabled = (dateCompare <= 0) || (departureDate == null) || (departureDate == '');

                // If the button is not disabled, click it
//                if (!submitButton.disabled) {
//
//                    // Remove the event listener after the button is clicked
////                    window.removeEventListener('load', updateSubmitButton);
//                }
            }

            // Add the event listener for the first load
            window.addEventListener('load', updateSubmitButton);
        </script>
    </head>
    <body>

        <jsp:include page="LoggedInUserNavBar.jsp"></jsp:include>
        <%
            Connection connection = (Connection) session.getAttribute("connection");
            Statement statement = (Statement) session.getAttribute("statement");
            ResultSet rs = null;

            PrintWriter output = response.getWriter();
            output.println("<div id=\"center-div\">");
            output.println("<div id=\"filter-rooms-form\">");
            output.println("<form action=\"CheckAvailableRooms\" method=\"GET\" id=\"filter\">");
            output.println("<div id=\"center-elements\">");
            output.println("<h2>Choose the location</h2>");
            String selectedValue = (String) request.getSession().getAttribute("selection");
            output.println("<select name=\"selection\">");
            output.println("<option value=\"1\"" + (selectedValue != null && selectedValue.equals("1") ? " selected" : "") + ">Abu Dhabi</option>");
            output.println("<option value=\"2\"" + (selectedValue != null && selectedValue.equals("2") ? " selected" : "") + ">New York</option>");
            output.println("<option value=\"3\"" + (selectedValue != null && selectedValue.equals("3") ? " selected" : "") + ">Paris</option>");
            output.println("</select>");
            output.println("<h2>Arrival</h2>");
            output.println("<div id=\"date\">");
            output.println("<label>Arrival Date</label>");
            output.println("<input type=\"date\" value=\"" + (session.getAttribute("arrivalDate") != null ? session.getAttribute("arrivalDate") : LocalDate.now()) + "\" name=\"arrival\" onchange=\"updateSubmitButton()\">");
            output.println("<br>");
            output.println("<label>Departure Date</label> <input type=\"date\" name=\"departure\" value=\"" + (session.getAttribute("departureDate") != null ? session.getAttribute("departureDate") : "") + "\" onchange=\"updateSubmitButton()\">");
            output.println("</div>");
            output.println("<input type=\"submit\" value=\"Find a room\" id=\"findRoomButton\">");
            output.println("</form>");
            output.println("</div>");
            output.println("</div>");
            output.println("<div id=\"filtered-rooms\">");
            try {
                int hotel_location;
                if (((String) session.getAttribute("selection")) == null) {
                    hotel_location = 1;
                } else {
                    hotel_location = Integer.parseInt(((String) session.getAttribute("selection")));
                }
                ArrayList<Integer> availableRooms = (ArrayList<Integer>) session.getAttribute("availableRooms");

                if (availableRooms != null) {
                    int RID = 0;
                    int arrayListIndex = 0;
                    int arrayListSize = availableRooms.size();
                    String arrivalDate = (String) session.getAttribute("arrivalDate");
                    String departureDate = (String) session.getAttribute("departureDate");
                    int dateCompare = departureDate.compareTo(arrivalDate);

                    rs = statement.executeQuery("SELECT RID, Type, Room.`Room#`, Price, Location FROM Room, Hotel WHERE Room.HID = " + hotel_location + " AND Hotel.HID =" + hotel_location);
//                    output.println(availableRooms.size);
                    while (rs.next()) {
                        RID = Integer.parseInt(rs.getString("RID"));
                        if ((arrayListIndex < arrayListSize) && (!availableRooms.isEmpty()) && (availableRooms.contains(RID))) {
                            output.println(""
                                    + "<form action=\"ProcessBooking\" method=\"POST\" class=\"rooms\">"
                                    + "<img src=\"css/Images/Hotel-Room.jpg\" alt=\"Dummy Image\">"
                                    + "<div class=\"room-type\"><label>Room type: </label><strong>" + rs.getString("Type") + "</strong></div>"
                                    + "<div class=\"room-number\"><label>Room Number: </label><strong>" + rs.getString("Room#") + "</strong></div>"
                                    + "<div class=\"location\"><label>Location: </label><strong>" + rs.getString("Location") + "</strong></div>"
                                    + "<label class=\"price\">" + rs.getString("Price") + " DHS"  + "</label>"
                                    + "<input type=\"hidden\" name=\"selectedRoom\" value=\"" + rs.getString("Room#") + "\"/>"
                                    + "<input type=\"hidden\" name=\"arrivalDate\" value=\"" + arrivalDate + "\">"
                                    + "<input type=\"hidden\" name=\"departureDate\" value=\"" + departureDate + "\">"
                                    + "<input type=\"hidden\" name=\"rid\" value=\"" + RID + "\">"
                                    + "<input type=\"hidden\" name=\"hid\" value=\"" + hotel_location + "\">"
                                    + "<input type=\"hidden\" name=\"action\" value=\"customer\">"
                                    + "<input type=\"submit\" value=\"Book\" class=\"book-btn\">"
                                    + "</form>");
                        }
                        arrayListIndex++;
                    }
                } else {
                    output.println("<h1>Please select a date.</h1>");
                }
                output.println("</div>");
            } catch (Exception err) {
                output.println("The cause of the error: " + err.getMessage());
            }
            output.println("</div>");

        %>

    </body>
</html>