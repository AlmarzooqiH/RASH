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
        <title>My Bookings</title>
    </head>
    <%
        Connection connection = (Connection) session.getAttribute("connection");
        Statement statement = (Statement) session.getAttribute("statement");
        ResultSet rs = null;
        PrintWriter res = response.getWriter();
    %>
    <%--<jsp:include page="LoggedInUserNavBar.jsp"></jsp:include>--%>
    <%
        //body starts
        try {
            res.println("<body>");
            try {
                rs = statement.executeQuery("SELECT * FROM BOOKING WHERE BOOKING.CID IN (SELECT CID FROM ACCOUNT, CUSTOMER WHERE CUSTOMER.AID=" + ((String) session.getAttribute("aid")) + ")");
                int customerID = Integer.parseInt(rs.getString("CID"));
                if(rs == null)
                {
                    return ;
                }
            } catch (Exception err) {
//                response.getWriter().println(err.getMessage());
                session.setAttribute("connection", connection);
                session.setAttribute("statement", statement);
            }
            //table start
            res.println("<section id='table'>");

            res.println("<div class='row'>");
            res.println("<div class='col c1 id'>BID</div>");
            res.println("<div class='col c2 id'>RID</div>");
            res.println("<div class='col c1 roomNum'>Arrival</div>");
            res.println("<div class='col c2 roomNum'>Departure</div>");
            res.println("<div class='col c1 id'>CID</div>");
            res.println("<div class='col c1 button'> </div>");
            res.println("</div>");
//            res.println(rs.getArray("BID"));
//int i = 0;
            while (rs.next()) {
//                res.println(i);
//                i++;
                String bid = rs.getString("booking.BID");
                String arrival = rs.getString("booking.Arrival");
                String departure = rs.getString("booking.Departure");
                String cid = rs.getString("booking.CID");
                String rid = rs.getString("booking.RID");

                // Display data as list items
                res.println("<form action=\"RemoveBooking\" method=\"POST\" class='row'>");
                res.println("<div class='col c1 id'>" + bid + "</div>");
                res.println("<div class='col c2 id'>" + rid + "</div>");
                res.println("<div class='col c1 roomNum'>" + arrival + "</div>");
                res.println("<div class='col c2 roomNum'>" + departure + "</div>");
                res.println("<div class='col c1 id'>" + cid + "</div>");
                res.println("<div class='col c1 button'> <input type=\"submit\" value=\"cancel\"/> </div>");
                res.println("<input type='hidden' name='rid' value='" + bid + "'>");
                res.println("</form>");
            }
            //table end
            res.println("</section>");

            //body ends
            res.println("</body>");
        } catch (Exception err) {
                        response.getWriter().println("<center><h1>You don't have any bookings.</h1></center>");
//            response.getWriter().println(err);
            session.setAttribute("connection", connection);
            session.setAttribute("statement", statement);
        }
    %>

</body>
<footer></footer>
</html>
