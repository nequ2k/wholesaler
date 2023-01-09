<% if (session.getAttribute("loggedin")=="false") 
{
 response.sendRedirect("http://localhost:8080/webapp/");  
}
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

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

    <div id = "container">
        <div id = "content">
          <div id = "panel">
            <div class = "ptile"> 

                <div id = "tile">
                <a href="mainpage.jsp"> <img src="logo.png" style="width:90%; height:90%;"></a> 
                </div>

                <div id = "tile">
                    <a href = "profile.jsp">  Admin Center </a>
                </div>  
            </div>

            <div class = "ptile">

                <div id = "tile">
                
                </div>

                <div id = "tile">
                   
                </div> 
                 
            </div>

            <div class = "ptile">

                <div id = "tile">
                    
                </div> 

                <div id = "tile">
                    <a href = "logout.jsp"> Wyloguj <img src="logout.png" style="width:20px; height:20px;"> </a>
              
                    
                </div> 
                 
            </div>


          </div>
                
       <div style="width:100%; border: 1px solid black; text-align:center;">
           
           DODAJ PRZEDMIOT
           
           <form action="adminpage.jsp">
            
            Nazwa:   <input type="text" name ="name"> <br>
            Cena:  <input type="text" name ="price"> <br>
            Opis:   <input type="text" name ="opis"> <br>
            Sciezka:  <input type="text" name ="picture"> <br>
            Sztuk:   <input type="text" name ="sztuk"> <br>
            <input type="submit" value="dodaj" name="dodaj">
               
           </form>
           
       </div>
       
            <div style="width:100%; border: 1px solid black; text-align:center;">
           
          USUN PRZEDMIOT
          
           <form action="adminpage.jsp">
            
            Szukaj: <input type="text" name ="query"> <br>
            <input type="submit" value="usun" name ="usun">
            
           </form>
          
            
            
            <%  
                  

ut.println("????????????????????"); 

            %>
               
           
           
          
           
       </div>
            
            

                
                
        </div>
      </div>
  

    
</body>
</html>
