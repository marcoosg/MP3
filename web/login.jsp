<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <link href="style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <main>
            <div class="login-container">
                <h1>Login</h1>
                    <form action="LoginServlet" method="post">
                        <div><input class="login-form" type="text" name="username" placeholder="Username" required><br></div>
                        <div><input class="login-form" type="password" name="password" placeholder="Password" required><br></div>
                        <div><input class="submit" type="submit" value="Login"><br></div>
                    </form>
            </div>
        </main>
    </body>
</html>
