<!DOCTYPE html>
<html>

    <head>
        <title>Locations</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 800px;
                margin: 0 auto;
                color: #555;
                font-size: 18px;
            }

            h1, h2 {
                color: #333;
                text-align: center;
            }

            p {
                line-height: 1.5;
            }

            .location {
                margin: 40px 0;
                display: flex;
            }

            .location img {
                width: 50%;
                height: auto;
                margin-right: 20px;
                transition: transform 0.3s ease;
                max-width: 100%;
                box-shadow: 0 0 10px rgba(0,0,0,0.2);
            }

            .location-right {
                flex-direction: row-reverse;
            }

            .location-right img {
                margin-left: 20px;
                margin-right: 0;
            }

            .text {
                width: 50%;
            }

            img:hover {
                transform: scale(1.05);
            }

        </style>

    </head>

    <body>
        <jsp:include page="LogoAndNavbar.jsp"></jsp:include>
        <h1>Locations</h1>

        <div class="location">
            <img src="css/Images/ADRASH.webp" alt="Abu Dhabi">
            <div class="text">
                <h2>Abu Dhabi</h2>
                <p>Discover opulence in the heart of Abu Dhabi at Rash Hotel, where modern design meets traditional Arabian influences. Enjoy breathtaking views of the Arabian Gulf, upscale amenities, and a blend of international and local cuisines. Whether for business or leisure, Rash Hotel ensures a memorable stay in this dynamic city.</p>
            </div>
        </div>

        <div class="location location-right">
            <img src="css/Images/NYRASH.webp" alt="New York">
            <div class="text">
                <h2>New York</h2>
                <p>Experience urban luxury in the iconic skyline of New York City at Rash Hotel. Located in Manhattan, the hotel offers unparalleled access to famous attractions. With contemporary design, a rooftop lounge, and state-of-the-art facilities, Rash Hotel caters to both business and leisure travelers, providing a sophisticated retreat in the city that never sleeps.</p>
            </div>
        </div>

        <div class="location">
            <img src="css/Images/parisrash.jpeg" alt="Paris">
            <div class="text">
                <h2>Paris</h2>
                <p>Indulge in elegance at Rash Hotel in the heart of Paris. With classic architecture and stylish interiors, the hotel captures the essence of Parisian sophistication. Conveniently situated near iconic landmarks, the hotel offers a comfortable retreat with gourmet dining options, providing a quintessentially French experience in the City of Lights.</p>
            </div>
        </div>

    </body>

</html>
