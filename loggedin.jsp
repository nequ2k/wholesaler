
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
         String login = request.getParameter("login"); 
         String haslo = request.getParameter("password"); 
        
        if((login.equals("admin")) && (haslo.equals("admin")))
        {
            session.setAttribute("loggedin", "true");
            response.sendRedirect("http://localhost:8080/webapp/adminpage.jsp"); 
        }
        else 
        {
       
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM client WHERE email = '" + login + "' AND password = '" + haslo + "'");
        ResultSet x = ps.executeQuery(); 
          
           if(x.next())
           {
         //HttpSession session = request.getSession();
          session.setAttribute("loggedin", "true");
          session.setAttribute("id_k", x.getInt(1));
          session.setAttribute("name", x.getString(2));
          session.setAttribute("surname", x.getString(3)); 
          session.setAttribute("email", x.getString(4));
          response.sendRedirect("http://localhost:8080/webapp/mainpage.jsp"); 
         
           }        
        else 
        {
          session.setAttribute("loggedin", "false");
          response.sendRedirect("http://localhost:8080/webapp/");  
        }
        
        }
        
        catch(Exception e)
        {
        out.println(e); 
        }
        }
        
        
            
       
        %>
        
   
    </body>
</html>
