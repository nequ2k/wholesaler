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
        try 
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop","root","");
        String email = request.getParameter("email"); 
        String imie = request.getParameter("name"); 
        String nazwisko = request.getParameter("surname"); 
        String haslo = request.getParameter("password");
        
        if(email.length()<3 || haslo.length()<8)
        {
             response.sendRedirect("http://localhost:8080/webapp/registration.jsp?error=nieprawidlowe_dane"); 
        }
        
        PreparedStatement ps = conn.prepareStatement("INSERT INTO client (name, surname, email, password) VALUES ( '"+imie+"' , '"+nazwisko+"','"+email+"','"+haslo+"');");
        ps.executeUpdate(); 
        response.sendRedirect("http://localhost:8080/webapp/login.jsp");  
        
        }
        
        catch(Exception e)
        {
        out.println(e); 
        }
        

            
       
        %>
        
    </body>
</html>
