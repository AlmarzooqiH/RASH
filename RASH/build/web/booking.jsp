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
        <div id="center-div">
            <div id="filter-rooms-form">
                <form action="filter" method="POST" id="filter">
                    <div id="center-elements">
                        <h2>Choose the location</h2>
                        <select name="selection">
                            <option name="AUH">Abu Dhabi</option>    
                            <option name="DXB">Dubai</option>
                            <option name="RKT">Ras al Khaimah</option>
                            <option name="JFK">New York</option>
                            <option name="HND">Tokyo</option>
                            <option name="CDG">Paris</option>
                            <option name="SYD">Sydney</option>
                            <option name="EGLL">London</option>
                            <option name="BCN">Barcelona</option>
                            <option name="SXF">Berlin</option>
                        </select>
                        <h2>Arrival</h2>
                        <div id="date">
                            <label>Arrival Date</label>
                            <input type="date" name="arrival">
                            <br>
                            <label>Departure Date</label> <input type="date" name="departure">
                        </div>
                        <input type="submit" value="Find a room">
                        </form>
                    </div>
            </div>
            <div id="filtered-rooms">
                <div class="rooms">
                    <img src="css/Images/Hotel-Room.jpg" alt="Dummy Image">
                    <label class="price">Price</label>
                    <input type="submit" value="Book" class="book-btn">
                </div>
            </div>
        </div>
    </body>
</html>
