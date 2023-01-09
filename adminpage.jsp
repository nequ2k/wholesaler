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
                if(request.getParameter("dodaj")!=null)
                {
                String cena = request.getParameter("price");
                String nazwa = request.getParameter("name");
                String opis = request.getParameter("opis");
                String sciezka = request.getParameter("picture");
                String sztuk = request.getParameter("sztuk");
                
                
                
       
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO product (name, price, image, description, szt) VALUES ('" + nazwa + "','" + cena + "','" + sciezka + "','" + opis + "','" + sztuk + "')");
        ps.executeUpdate(); 
        }
        catch(Exception e)
        {
        out.println(e); 
        }
            }
            if(request.getParameter("usun")!=null)
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
        "<div style = 'width:50%; height:150px; border:1px solid black; margin: 5px; text-align:center'> " + 
         name + "   " + "cena: " + price + "   " + "dostepne sztuki: " + szt + "   " + "<form action ='delete.jsp' method = 'post'> <input type='hidden' name = 'id_prod' value ='"+id+"'> <input type='submit' value='usun' name = 'del'> </form>" +"  </div>");
        }
            
            
                
         if(request.getParameter("del")!=null)
                {
                
                String id2 = request.getParameter("id_prod");
                
                ps = conn.prepareStatement("DELETE FROM product WHERE id = " + id2);
                ps.executeUpdate();  
                }
                
            }

            %>
               
           
           
          
           
       </div>
            
            

                
                
        </div>
      </div>
  

    
</body>
</html>
