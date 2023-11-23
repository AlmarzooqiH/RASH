<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to Walk In Booking, Select Departure Date</title>
        <script>
            // Function to set the minimum date to today and enable/disable submit button
            function setMinDate() {
                var today = new Date().toISOString().split('T')[0];
                var departureDateInput = document.getElementById('departureDate');
                departureDateInput.min = today;

                // Enable or disable the submit button based on the selected departure date
                var submitButton = document.getElementById('submitButton');
                departureDateInput.addEventListener('input', function () {
                    submitButton.disabled = departureDateInput.value <= today;
                });
            }
        </script>
    </head>
    <body onload="setMinDate()">
        <%
            PrintWriter output = response.getWriter();
            String selectedValue = (String) request.getSession().getAttribute("selection");
            output.println("<select name=\"selection\">");
            output.println("<option value=\"1\"" + (selectedValue != null && selectedValue.equals("1") ? " selected" : "") + ">Abu Dhabi</option>");
            output.println("<option value=\"2\"" + (selectedValue != null && selectedValue.equals("2") ? " selected" : "") + ">New York</option>");
            output.println("<option value=\"3\"" + (selectedValue != null && selectedValue.equals("3") ? " selected" : "") + ">Paris</option>");
            output.println("</select>");
            out.println("<h1>Welcome to Walk In Booking, Select Departure Date:</h1>");
            out.println("<form>");
            out.println("<label for=\"departureDate\">Departure Date:</label>");
            out.println("<input type=\"date\" id=\"departureDate\" name=\"departureDate\" min=\"" + LocalDate.now() + "\" required>");
            out.println("<br>");
            out.println("<input type=\"submit\" id=\"submitButton\" value=\"Submit\" disabled>");
            out.println("</form>");
        %>
    </body>
</html>
