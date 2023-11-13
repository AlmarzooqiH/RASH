<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@page import ="javax.servlet.http.*"%>
<%@page session ="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book a room</title>
        <link rel="stylesheet" href="css/landing.css" type="text/css">
    </head>
    <body>
        <%
            //String db_URL = (String) session.getAttribute("db_URL");
            //String driver_name = (String) session.getAttribute("driver_name");
            //String username = (String) session.getAttribute("username");
            //String password = (String) session.getAttribute("password");
            Connection connection = (Connection) session.getAttribute("connection");
            Statement statement = (Statement) session.getAttribute("statement");
        %>

        <div id="d1">
            <header>
                <img src="css/Images/rash.png" id="logo">
                <div id="hdiv">
                    <font id="username"><%= session.getAttribute("user")%></font>
                </div>
            </header>
            <div id="wdiv">
                <font id="wtext">
                <h3>Welcome to <br> RASH Hotels</h3>
                </font>
            </div>
        </div>
        <section class="about top" id="about">
            <div class="container flex">
                <div class="left">
                    <div class="img">
                        <img src="css/Images/a1.jpg" alt="" class="image1">
                        <img src="css/Images/a2.jpg" alt="" class="image2">
                    </div>
                </div>
                <div class="right">
                    <div class="heading">
                        <h5>RAISING COMFORT TO THE HIGHEST LEVEL</h5>
                        <h2><b>Welcome to RASH Hotels</b></h2>
                        <p>At RASH Hotels, we're dedicated to curating remarkable experiences for our guests. With a
                            commitment to exceptional service, we provide luxurious amenities, including world-class dining,
                            rejuvenating spas, state-of-the-art fitness centers, and serene poolscapes. Our team is here to
                            ensure that your stay is not just comfortable but truly memorable. </p>
                        <p>Whether you're exploring urban hubs or seeking tranquil retreats, we invite you to discover the
                            distinctive charm of RASH Hotels and let us redefine your expectations of hospitality. Be our
                            guest, and let us make your journey exceptional.</p>
                        <a href="booking.jsp" class="btn1">Book Here</a>
                    </div>
                </div>
            </div>
        </section>


        <div id="whycontainer">
            <h2 id="whyus">Why Choose Us?</h2>
            <div id="d2">
                <div class="point" id="p1">
                    <h2 class="ptext">Prime Locations</h2>
                    <img src="css/icons/locations.png" alt="" class="icon" id="locationicon">
                </div>
                <div class="point" id="p2">
                    <h2 class="ptext">Exceptional Service</h2>
                    <img src="css/icons/services.png" alt="" class="icon">
                </div>
                <div class="point" id="p3">
                    <h2 class="ptext">Luxury Amenities</h2>
                    <img src="css/icons/amenities.png" alt="" class="icon">
                </div>
            </div>
        </div>

        <section class="wrapper wrapper2 top" id="pool">
            <div class="container">
                <div class="text" id="righttext">
                    <div class="heading">
                        <h5>Come and Experience</h5>
                        <h2>Our Infinite Pool</h2>
                    </div>

                    <div class="para">
                        <p>Indulge in our luxurious pool with infinity vistas and shimmering mosaics, where a tranquil
                            palm-fringed atmosphere creates a celestial oasis of opulence and relaxation. Together with the
                            soothing
                            rustle of palm leaves, this aquatic masterpiece redefines luxury, offering an unparalleled
                            sanctuary for
                            your senses. </p>
                    </div>
                </div>
            </div>
        </section>
        <div style="height: 100px;"></div>
        <section class="wrapper wrapper2 top" id="spa">
            <div class="container">
                <div class="text" id="lefttext">
                    <div class="heading">
                        <h5>Come and Experience</h5>
                        <h2>Our Luxorious Spa</h2>
                    </div>

                    <div class="para">
                        <p>Our world-class spa offers the epitome of relaxation and rejuvenation, a sanctuary of
                            tranquility where skilled therapists, natural elements, and serene ambiance combine to provide
                            an
                            extraordinary escape, ensuring you leave feeling renewed and revitalized. </p>
                    </div>
                </div>
            </div>
        </section>

        <div id="lastdiv">
            <button id="lastbtn">
                <font id="lastbtnfont">Join The Experience Here</font>
            </button>
        </div>
    </body>
    <footer></footer>