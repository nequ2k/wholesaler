
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
          <h1> registration </h1>
          
          <form action="register.jsp" method = "post">
          e-mail: <input type="text" name="email" id = "loginput" style="height:20px;">   <br><br>
          name: <input type="text" name="name" id = "loginput" style="height:20px;"> <br><br>
          surname: <input type="text" name="surname" id = "loginput" style="height:20px;"> <br><br>
          password: <input type="password" name="password" id = "loginput" style="height:20px;"> <br><br>
          password (confirm): <input type="password" name="password" id = "loginput" style="height:20px;"> <br><br>
          <%
              if(request.getParameter("error")!=null)
              {
              out.println("<h5 style='color:red'>Wprowadzono nieprawidlowe dane.</h5>");
                }
          %>
          <input type="submit" value="Register" id = "logbutt">
          </form>
          <h3> You have an account? </h3>
          <a href="http://localhost:8080/webapp/login.jsp"> <button id = "button" value = "Login now!">Login now!</button></a>
          <br><br><br>
        </div>
      </div>
    </div>

</body>
</html>