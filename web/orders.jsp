<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>My Orders</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <style>
            /* Font */
                @font-face {
                    font-family: "dogicapixel";
                    src: url("fonts/dogicapixel.ttf");
                }

                * {
                    font-family: "dogicapixel", sans-serif;
                }
                
		/* Style for navbar */
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

		/* Style for logout button */
		.navbar button {
			background-color: white;
			color: green;
			border: none;
			padding: 10px;
			border-radius: 20px;
			cursor: pointer;
			transition: background-color 0.3s, color 0.3s;
			width: 100px;
			height: 40px;
		}

		.navbar button:hover {
			background-color: white;
			color: red;
		}
		
		.gamelisttitle {
		    text-align: center;
		}
                /* Style for shopping cart container */
		.cart-container {
			background-color: #f0f0f0;
			border: 1px solid #ccc;
			border-radius: 5px;
			box-shadow: 0px 0px 5px grey;
			padding: 20px;
			padding-top: 0px;
			margin-top: 20px;
			margin-left: 150px;
			margin-right: 150px;
		}

		.cart-table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 10px;
		}

		.cart-table th,
		.cart-table td {
			padding: 5px;
			text-align: center;
		}

		.cart-table th {
			background-color: green;
			color: white;
			font-weight: bold;
		}

		.cart-table tr:nth-child(even) {
			background-color: #e0e0e0;
		}

		.cart-remove {
			color: red;
			font-weight: bold;
			cursor: pointer;
                        text-decoration:none;
		}

		.cart-remove:hover {
			text-decoration: underline;
		}
		.checkoutbox {
		    text-align: center;
		}
		.checkout {
		    background-color: green;
			color: white;
			border: none;
			padding: 10px;
			border-radius: 5px;
			cursor: pointer;
			width: 250px;
			transition: background-color 0.3s;
			margin-top: 50px;
			
		}
		
		.checkout:hover {
			background-color: darkgreen;
		}
                .qty-buttons
                {
                    color:black;
                    text-align:center;
                    font-size: 30px;
                    text-decoration:none;
                }
                .qty-buttons:hover {
			text-decoration: underline;
		}
        </style>
    </head>
    <body>
        <% 
            
            if(session.getAttribute("validCaptcha")==null)
            {
                response.sendRedirect("index.jsp");
            }
            else if(session.getAttribute("username")==null)
            {
                response.sendRedirect("login.jsp");
            }
        %>
        <!-- Navbar -->
	<div class="navbar">
            <div>GameShop</div>
            <form action="orders.jsp" method="post">
                <button>My Orders</button>
            </form>
            <form action="LogoutServlet" method="post">
                <button>Logout</button>
            </form>
	</div>
        
        <!-- Shopping cart container -->
	<div class="cart-container">
            <h2>My Orders</h2>
            <table class="cart-table">
		<thead>
                    <tr>
                   	<th>Title</th>
			<th>Price</th>
			<th>Quantity</th>
                    </tr>
		</thead>
		<tbody>
                <%   
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopDB?autoReconnect=true&useSSL=false","root","password");
                int total = 0;
                try
                {
                     if (conn3 != null) 
                    {
                        String user = (String)session.getAttribute("username");
                        String query = "SELECT * FROM ORDERS JOIN ITEM ON ORDERS.ITEM_ID=ITEM.ITEM_ID WHERE USER_ID = ?";
                        PreparedStatement ps = conn3.prepareStatement(query);
                        ps.setString(1, user);
                        ResultSet cart = ps.executeQuery();
                        while (cart.next()) 
                        { 
                            int initial = Integer.valueOf(cart.getString("ITEM_PRICE"))*Integer.valueOf(cart.getString("QUANTITY"));
                            total = total + initial;
                            %>
                            <tr>
                                <td><%=cart.getString("ITEM_NAME") %></td>
                                <td>&#8369 <%=cart.getString("ITEM_PRICE") %> .00</td>
                                <td>
                                    <%=cart.getString("QUANTITY") %>
                                </td>
                                
                            </tr>

                    <%  }
                    cart.close();
                    }     
                } 
                catch (SQLException sqle)
                {
                    System.out.println("SQLException error occured - " 
                                + sqle.getMessage());
                }

                %>
                </tbody>
            </table>
                <div class="checkoutbox">
                    <p>Total: &#8369 <%out.print(Integer.toString(total));%>.00</p>
                    <form action="shop.jsp" method="post">
                        <button class="checkout">Back to Shop</button>
                    </form>
                </div>
		
	</div>
    </body>
</html>
