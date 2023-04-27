<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Captcha</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <main>
            <div class="navbar">
                <div>GameShop</div>               
            </div>
            
            <div class="login-page">
                
                <div class="form">
                    <h1>Captcha</h1>
                    <p>To continue, type the</p>
                    <p>characters you see in</p>
                    <p>the picture.</p>
                    <img src="images/captcha.png"/>
                  <form class="login-form" action="CaptchaServlet" method="post">
                    <input type="text" name="captchaText" placeholder="Captcha" required/>
                    <button>Confirm</button>
                  </form>
                </div>
            </div>
        </main>
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
        
.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
img {
  width: 200px;
  height: 200px;
  object-fit: contain;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "dogicapixel", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: green;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  font-family: "dogicapixel", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
        </style>
</html>
