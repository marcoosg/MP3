<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>

<html>
    <head>
        <% 
            
            if(session.getAttribute("validCaptcha")==null)
            {
                response.sendRedirect("index.jsp");
            }
            else if (session.getAttribute("username")==null)
            {
                response.sendRedirect("login.jsp");
            }
        %>
	<title>GameShop</title>
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

		/* Style for game cards */
		.game-section {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			align-items: flex-start;
			padding: 20px;
		}

		.game-card {
			border: 1px solid #ccc;
			border-radius: 5px;
			box-shadow: 0px 0px 5px grey;
			display: inline-block;
			margin: 10px;
			margin-top: 0px;
			padding: 10px;
			width: 200px;
			height: 300px;
			overflow: hidden;
			text-align: center;
			height: 365px;
		}
                

		.game-card img {
		    margin-top: 20px;
			max-width: 100%;
			max-height: 80%;
			object-fit: cover;
		}
    
		/* Style for add to cart button */
		.add-to-cart {
			background-color: green;
			color: white;
			border: none;
			padding: 10px;
			border-radius: 5px;
			cursor: pointer;
			width: 150px;
			transition: background-color 0.3s;
                        font-size: 11px;
		}

		.add-to-cart:hover {
			background-color: darkgreen;
		}

		/* Style for image container */
		.image-container {
			background-color: #f0f0f0;
			display: flex;
			justify-content: center;
			align-items: center;
			padding: 20px;
		}

		.image-container img {
			max-width: 100%;
			max-height: 100%;
			object-fit: contain;
			margin-top: 30px;
			margin-bottom: 30px;
			
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
                
                
                
	</style>
    </head>
    <body>
	<!-- Navbar -->
	<div class="navbar">
            <div>GameShop</div>
            <form action="LogoutServlet" method="post">
                <button>Logout</button>
            </form>
	</div>

        <div class="image-container">
            <img src="https://via.placeholder.com/800x200.png?text=GameShop+Banner" alt="GameShop Banner">
	</div>

	<!-- Game section -->
	<h2 class="gamelisttitle"> Featured Games </h2>
	<div class="game-section">
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopDB?autoReconnect=true&useSSL=false","root","password");
                try
                {
                     if (conn2 != null) 
                    {

                        Statement stmt = conn2.createStatement();
                        ResultSet results = stmt.executeQuery("SELECT * FROM ITEM ORDER BY ITEM_ID asc");
                        while (results.next()) 
                        { 
            %>
                    
                        <div class="game-card">
                            <img src="images/<%=results.getString("ITEM_IMG")%>" style='height: 80px; width: 80px;'>
                            <h3><%=results.getString("ITEM_NAME") %></h3>
                            <p>&#8369 <%=results.getString("ITEM_PRICE") %> .00</p>
                            <form action="AddToCartServlet?item=<%=results.getString("ITEM_ID")%>&quantity=1" method="post">
                                <button class="add-to-cart">Add to cart</button>
                            </form>
                            
                        </div>    
                        
                        
            <%

                        } 
                        results.close();
                        conn2.close();
                    }
                }   
                catch (SQLException sqle)
                {
                    System.out.println("SQLException error occured - " 
                                + sqle.getMessage());
                } 
                
                	
                
            %>
            
           
	</div>

	<!-- Image container -->


	<!-- Shopping cart container -->
	<div class="cart-container">
            <h2>Shopping Cart</h2>
            <table class="cart-table">
		<thead>
                    <tr>
                   	<th>Title</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Remove</th>
                    </tr>
		</thead>
		<tbody>
                <%   
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShopDB?autoReconnect=true&useSSL=false","root","password");
                try
                {
                     if (conn3 != null) 
                    {
                        String user = (String)session.getAttribute("username");
                        String query = "SELECT * FROM CART JOIN ITEM ON CART.ITEM_ID=ITEM.ITEM_ID WHERE USER_ID = ?";
                        PreparedStatement ps = conn3.prepareStatement(query);
                        ps.setString(1, user);
                        ResultSet cart = ps.executeQuery();
                        while (cart.next()) 
                        { %>
                            <tr>
                                <td><%=cart.getString("ITEM_NAME") %></td>
                                <td>&#8369 <%=cart.getString("ITEM_PRICE") %> .00</td>
                                <td><%=cart.getString("QUANTITY") %></td>
                                <td class="cart-remove">X</td>
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
                    <form action="checkout.jsp" method="post">
                        <button class="checkout">Proceed to Checkout</button>
                    </form>
                </div>
	</div>
        
    </body>

</html>