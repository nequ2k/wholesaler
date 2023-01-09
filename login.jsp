<% 

if (session.getAttribute("loggedin")== "true")
{
 response.sendRedirect("http://localhost:8080/webapp/mainpage.jsp");  
}

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" type="text/css" href="style1.css">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>title</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong">




</head>


<body>

    <div id = "container">
      <div id = "content">
        <div id = "logindiv">
          <br>
          <h1> login </h1>
          <form action="loggedin.jsp" method = "post">
          
          <input type="text" name="login" id = "loginput">   <br><br>
          <input type="password" name="password" id = "passinput"> <br><br>
          <input type="submit" value="Login" id = "logbutt">
          </form>
          <h3> No account yet? </h3>
          <a href="registration.jsp"> <button id = "button" value = "Register now!">Register now!</button></a>
          <br><br><br>
        </div>
      </div>
    </div>

</body>
</html>