<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>My Orders</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <% 
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "nocahce");
            response.setHeader("Expires", "0");
            if(session.getAttribute("validCaptcha")==null)
            {
                response.sendRedirect("index.jsp");
            }
            else if(session.getAttribute("username")==null)
            {
                response.sendRedirect("login.jsp");
            }
        %>
        <nav class="topbar">
            <!-- <label class="logo"><a href="shop.jsp"><img src="images/logo.png"/>ToteLand</label></a>!-->
            <ul>
                <li><a class="nav-link" href="shop.jsp">Shop</a></li>
                <li><a class="nav-link" href="orders.jsp">My Orders</a></li>
                <li><form action="LogoutServlet">
                        <input class="logout nav-link" type="submit" value="Logout">
                    </form></li>
            </ul>
        </nav>
        <h1>My Orders</h1>
    </body>
</html>
