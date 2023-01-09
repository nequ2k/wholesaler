<% 
if (session.getAttribute("loggedin")=="false") 
{
 response.sendRedirect("http://localhost:8080/webapp/");  
}

%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
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
        
          <div id = "panel">
            <div class = "ptile"> 

                <div id = "tile">
                <a href="mainpage.jsp"> <img src="logo.png" style="width:90%; height:90%;"></a> 
                </div>

                <div id = "tile">
                    <a href = "profile.jsp">  <% out.println(session.getAttribute("name") + " " + session.getAttribute("surname")); %> </a>
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
            Koszyk: 
          
         
      <% 
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");   
          PreparedStatement ps = conn.prepareStatement("SELECT name, price, product.id FROM product, cart WHERE cart.product_id = product.id"); 
          ps.executeQuery(); 
          ResultSet x = ps.executeQuery(); 
          int i =0;
          double summary=0; 
            
           out.println("<table style='width:33%; border:1px solid black; border-radius:10px;  margin: 0 auto;'>"); 
           out.println("<form action='addorder.jsp' method='post'>");
           while(x.next())
        {
           
           String name = x.getString(1); 
           String price = x.getString(2); 
           summary += Float.parseFloat(price);
           String id_prod = x.getString(3); 
           i++; 
     
           out.println("<tr> <input type='hidden' name='"+i+"' value ='"+id_prod+"'>" +"<td>" + name + "</td>" + "<td>" + price + " zł</td>" +"</tr>");
        }
          DecimalFormat df = new DecimalFormat("#.##");
          out.println("<tr> <td><input type='hidden' name='rows' value ='"+i+"'> </td> </tr>");
          out.println("<tr> <td> Summary : " + "</td>" + "<td>  " + df.format(summary) + " zł </td> </tr>");
          out.println("<tr> <td><input type='submit' value='order' style='border-radius:10px;'></td> </tr>");
          out.println("</form>"); 
          out.println("</table>"); 
     %>

        </div>
      </div>
  

    
</body>
</html>