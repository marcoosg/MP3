<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Shop</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    
    <body>
    	<!-- <label class="logo"><a href="shop.jsp"><img src="images/logo.png"/>ToteLand</label></a>!-->
            
       	<div class="topbar">
            <ul>
            	<li><form action="LogoutServlet">
                        <input class="logout" type="submit" value="Logout"></form></li>
                <li><a class="nav-link" href="orders.jsp">My Orders</a></li>
                <li><a class="nav-link" href="shop.jsp">Shop</a></li>      
            </ul>
      	</div>
         
        <div class="bodybox">
        
        	<div class="banner"> IMG HERE WELCOME MESSAGE </div>
            
            <div class="gamelistbox">
            
            	<h1 class="gamelisttitle">Our Products</h1>
                
            	<div class="gameitems">
                    <div class="gameimg"></div>
                    <div class="title-price">
                    	<h2 class="gametitle"> GAME4 </h2>
                      	<h3 class="gameprice"> $100 </h3>
                    </div>
                </div>
                
                <div class="gameitems">
                    <div class="gameimg"></div>
                    <div class="title-price">
                    	<h2 class="gametitle"> GAME4 </h2>
                      	<h3 class="gameprice"> $100 </h3>
                    </div>
                </div>
                
               <div class="gameitems">
                    <div class="gameimg"></div>
                    <div class="title-price">
                    	<h2 class="gametitle"> GAME4 </h2>
                      	<h3 class="gameprice"> $100 </h3>
                    </div>
                </div>
                
               <div class="gameitems">
                    <div class="gameimg"></div>
                    <div class="title-price">
                    	<h2 class="gametitle"> GAME4 </h2>
                      	<h3 class="gameprice"> $100 </h3>
                    </div>
                </div>
       
       		</div>
            
            <div class="cartbox">
            
           		<h1 class="gamelisttitle">Cart</h1>
                
                <div class="cartlabels">
               
                
            </div>
   
        </div>
      
    </body>
    
	<style>
    
    * {
    box-sizing: border-box;
    }
    
    .logout {
   	width: 100px;
	background: #9999CC;
	color: black;
	border: none;
	padding:10px;
	border-radius: 20px;
	text-shadow: none;
	}
	
    .logout:hover {
	background: #808080;
	border: 1px solid #eee;
	border-radius: 20px;
	border: none;
    }

    body {
  	background-color: #303030;
    margin: 0;
    align-content: center;
	}
    
    .topbar {
  	overflow: hidden;
    padding-right: 25px;
	}
    
    .topbar li {
    float: right;
    display:block;
    color: #f2f2f2;
    text-align: center;
    padding: 20px;
    padding-bottom: 0px;
    text-decoration: none;

    }
    
    .topbar a {
    color: white;
    }
    
    .nav-link:hover {
  	color: #9999CC ;
	}
    
    .nav-link {
  	text-decoration: none;
	}
    
    .bodybox {
    background-color: #404040;
    padding: 50px;
    margin: 40px;
    border-radius: 25px;
    }
    
    .banner {
    background-color: #9999CC;
	padding: 50px;
    margin: 20px;
    border-radius: 25px;
    height: 250px;
    }
    
    .gamelistbox {
    background-color: 9999CC;
	padding: 50px;
    padding-top: 20px;
    margin: 20px;
    margin-top: 40px;
    border-radius: 25px;
    }
    
    .gamelisttitle {
    text-align: center;
    padding-bottom: 10px;
    }
    
    .gameitems {
    padding: 10px;
    margin: 10px;
    display: flex;
    }
    
    .gameimg {
    height: 150px;
    width: 120px;
    border-style: solid;
    }
    
    .gametitle {
	padding-top: 25px;
    padding-left: 20px;
    }
    
    .gameprice {
    padding-left: 20px;
    }
    
    .title-price {
    }
    
    .cartbox {
    background-color: 9999CC;
    padding: 50px;
    padding-top: 20px;
    margin: 20px;
    margin-top: 40px;
    border-radius: 25px;
    }
 
    </style>
    
</html>