<%-- 
    Document   : error03
    Created on : 04 14, 23, 8:11:46 AM
    Author     : marcoo_sg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Failed!</title>
    </head>
    <body>
        <center>
            <div class="navbar">
                <div>GameShop</div>              
            </div>
            <br>
            <h2>The cart is empty!</h2>
            <h3>You haven't added anything to the cart. Please add an item before checking out!</h3>
            <form action="orders.jsp">
                <input type="submit" value="Go back"><br>
            </form>
            <br>
        </center>
    </body>
    <style>
        @font-face {
            font-family: "dogicapixel";
            src: url("fonts/dogicapixel.ttf");
        }
        
        .navbar {
            background-color: green;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;           
            padding: 10px;
            height: 60px;
            padding-left: 30px;
            padding-right: 30px;
        }  
        
        h2,.navbar {
            font-family: "dogicapixel", sans-serif;
        }
        
        .error {
            margin: auto;
        }
    </style>
</html>
