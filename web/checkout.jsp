<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<title>Thank You for Ordering</title>
	<style>
	@font-face {
                    font-family: "dogicapixel";
                    src: url("fonts/dogicapixel.ttf");
                }

                * {
                    font-family: "dogicapixel", sans-serif;
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
	    .container-box {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 90vh;
        }
        
		.box {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			border: 2px solid #ccc;
		
			padding: 80px;
			border-radius: 10px;
		}
		.btn {
			padding: 10px;
			border: none;
			background-color: #4CAF50;
			color: white;
			font-size: 16px;
			margin: 5px;
			cursor: pointer;
			border-radius: 4px;
		}
		.btn:hover {
			background-color: #3e8e41;
		}
		.btn-box {
			display: flex;
			flex-direction: row;
		}
	</style>
</head>
<body>
    <div class="navbar">
            <div>GameShop</div>
            <form action="LogoutServlet" method="post">
                <button class="btn">Logout</button>
            </form>
	</div>
    
    <div class="container-box">
	<div class="box">
		<h1>Thank You for Ordering!</h1>
		<div class="btn-box">
                        <form action="ShopServlet" method="post">
                            <button class="btn" >Back to Shop</button>
                        </form>
			
			<form action="LogoutServlet" method="post">
                            <button class="btn">Logout</button>
                        </form>
		</div>
	</div>
	</div>
</body>
</html>