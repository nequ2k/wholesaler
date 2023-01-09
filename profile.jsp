<% if (session.getAttribute("loggedin")=="false") 
{
 response.sendRedirect("http://localhost:8080/webapp/");  
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
    <title>main page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong">
</head>
<body>

    <div id = "container" style="text-align: center;">
        <div id = "content">
          <div id = "panel">
            <div class = "ptile"> 

                <div id = "tile">
                <a href="mainpage.jsp"> <img src="logo.png" style="width:90%; height:90%;"></a> 
                </div>

                <div id = "tile">
                    <a href = "profile.jsp">  <% out.println(session.getAttribute("name") + " " + session.getAttribute("surname")); %></a>
                </div>  
            </div>

            <div class = "ptile">

                <div id = "tile">
                    <a href = "orders.jsp"> Orders </a>
                </div>

                <div id = "tile">
                  
                </div> 
                 
            </div>

            <div class = "ptile">

                <div id = "tile">
                     <a href = "cart.jsp"> Cart </a>
                </div> 

                <div id = "tile">
                    <a href = "logout.jsp"> Wyloguj <img src="logout.png" style="width:20px; height:20px;"> </a>
              
                    
                </div> 
                 
            </div>

             

          </div>
                Ustawienia profilu

           <table style="width:50%; border:1px solid black;  margin: 0 auto;">
  <tr>
    <td>Name: </td>
    <td><% out.println(session.getAttribute("name"));%></td>
    <td> <form method="post" action="editName.jsp"> <input type="text" name="new_name"> <input type="submit" name="editName" value="update"/> </form></td>
  </tr> 
  <tr>
    <td>Surname: </td>
    <td><% out.println(session.getAttribute("surname"));%></td>
    <td> <form method="post" action="editSurname.jsp"> <input type="text" name="new_surname"> <input type="submit" name="editSurname" value="update"/> </form> </td>
  </tr>
  <tr>
    <td>Email: </td>
    <td><% out.println(session.getAttribute("email"));%></td>
    <td> <form method="post" action="editEmail.jsp"> <input type="text" name="new_email"> <input type="submit" name="editEmail" value="update"/> </form></td>
  </tr>
  <tr>
    <td>Password: </td>
    <td> ************ </td>
    <td> <form method="post" action="editPassword.jsp"> <input type="text" name="new_passwrod">  <input type="submit" name="editPass" value="update"/> </form></td>
  </tr>
</table>
     
                
                
                
                
                
        </div>
      </div>
  

    
</body>
</html>
