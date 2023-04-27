<!DOCTYPE html>

<html>
    <head>
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
            <button>Logout</button>
	</div>

        <div class="image-container">
            <img src="https://via.placeholder.com/800x200.png?text=GameShop+Banner" alt="GameShop Banner">
	</div>

	<!-- Game section -->
	<h2 class="gamelisttitle"> Featured Games </h2>
	<div class="game-section">
            <div class="game-card">
		<img src="https://via.placeholder.com/150x200.png?text=Game+1" alt="Game 1">
		<h3>Game 1</h3>
		<p>$20.00</p>
		<button class="add-to-cart">Add to cart</button>
            </div>
            <div class="game-card">
		<img src="https://via.placeholder.com/150x200.png?text=Game+2" alt="Game 2">
		<h3>Game 2</h3>
		<p>$25.00</p>
		<button class="add-to-cart">Add to cart</button>
            </div>
            <div class="game-card">
		<img src="https://via.placeholder.com/150x200.png?text=Game+3" alt="Game 3">
		<h3>Game 3</h3>
		<p>$30.00</p>
		<button class="add-to-cart">Add to cart</button>
            </div>
            <div class="game-card">
		<img src="https://via.placeholder.com/150x200.png?text=Game+4" alt="Game 4">
		<h3>Game 4</h3>
		<p>$15.00</p>
            	<button class="add-to-cart">Add to cart</button>
            </div>
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
                    <tr>
			<td></td>
			<td></td>
			<td></td>
			<td class="cart-remove">X</td>
                    </tr>
                    <tr>
			<td></td>
			<td></td>
			<td></td>
			<td class="cart-remove">X</td>
                    </tr>
                    <tr>
			<td></td>
			<td></td>
			<td></td>
			<td class="cart-remove">X</td>
                    </tr>
                </tbody>
            </table>
		<div class="checkoutbox">
			<button class="checkout">Proceed to Checkout</button>
		</div>
	</div>
        
    </body>

</html>