<% session.setAttribute("loggedin", "false");

%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong">
    <link rel="stylesheet" type="text/css" href="style1.css">
    

</head>
<body>

    <div id = "container">
        <div id = "content">
          <div id = "panel">
            <div class = "ptile"> 

                <div id = "tile">
                <a href="index.jsp"> <img src="logo.png" style="width:90%; height:90%;"></a> 
                </div>
                <div id = "tile">
                    
                </div> 

                
            </div>

            <div class = "ptile">

                

                <div id = "tile">
                    <form action='index.jsp' method = 'get'>
                                
                                 <input type='text' style='height:100%; width:70%; margin-top:15px; margin-bottom: 15px;' name='query'> 
                                 <input type='submit' style='height:100%; width:20%;  margin-top:15px; margin-bottom: 15px;' value="?">
                                 
                                 
                             </form>
                </div> 
                <div id = "tile">
                    
                </div> 
                 
            </div>

            <div class = "ptile">

               

                <div id = "tile">
                    <a href = "login.jsp"> Zaloguj  </a>
                </div> 
                 
                 <div id = "tile">
                    <a href = "registration.jsp"> Zarejestruj  </a>
                </div> 
            </div>


          </div>
                
                

           <% 
         if(request.getParameter("query")!=null)
         {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM product WHERE name LIKE '%" + request.getParameter("query") + "%'");
        ResultSet x = ps.executeQuery(); 

        while(x.next())
        {
        int id = x.getInt(1); 
        String name = x.getString(2); 
        String price = x.getString(3);
        String image = x.getString(4); 
        String description = x.getString(5); 
        int szt = x.getInt(6);
        
        
        out.println(
        "<div style = 'width:250px; height:400px; float:left; border:1px solid black; margin: 10px; text-align:center'> <img src = '" + image +  "' style='width:200px; height:200px; margin:10px;  border-radius: 25px;'>" +  "<br> " + 
         name + "<br>" + "cena: " + price + "<br>" + "dostepne sztuki: " + szt + "<br>" + "<form action ='login.jsp' method = 'post'> <input type='hidden' name = 'id_prod' value ='"+id+"'>  <input type='submit' value='zamow'> </form>" +"  </div>");
        }
         }
         else 
         {
         Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM product");
        ResultSet x = ps.executeQuery(); 

        while(x.next())
        {
        int id = x.getInt(1); 
        String name = x.getString(2); 
        String price = x.getString(3);
        String image = x.getString(4); 
        String description = x.getString(5); 
        int szt = x.getInt(6);
        
        
       out.println(
        "<div style = 'width:250px; height:400px; float:left; border:1px solid black; margin: 10px; text-align:center'> <img src = '" + image +  "' style='width:200px; height:200px; margin:10px;  border-radius: 25px;'>" +  "<br> " + 
         name + "<br>" + "cena: " + price + "<br>" + "dostepne sztuki: " + szt + "<br>" + "<form action ='login.jsp' method = 'post'> <input type='hidden' name = 'id_prod' value ='"+id+"'> <input type='submit' value='zamow'> </form>" +"  </div>");
        }
         
         }
           

           
           %>
                
                
        </div>
      </div>
  

    
</body>
</html>
