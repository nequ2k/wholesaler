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
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        String new_email = request.getParameter("new_email"); 
        
        PreparedStatement ps = conn.prepareStatement("UPDATE client SET email = '"+new_email+"' WHERE id = "+session.getAttribute("id_k"));
        ps.executeUpdate();  
        session.setAttribute("email", new_email); 
        
    
    %>
    
    <div id = "container">
        <div id = "content">
          <div id = "panel">
            <div class = "ptile"> 

                <div id = "tile">
                <a href="mainpage.jsp"> <img src="logo.png" style="width:90%; height:90%;"></a> 
                </div>

                <div id = "tile">
                    <a href = "profile.jsp">     <% out.println(session.getAttribute("name") + " " + session.getAttribute("surname")); %> </a>
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
 <h1> Email has been changed! </h2> 
        </div>
      </div>
  

    
</body>
</html>
