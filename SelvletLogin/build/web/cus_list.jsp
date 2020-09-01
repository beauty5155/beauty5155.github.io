<%-- 
    Document   : cus_list
    Created on : Sep 1, 2020, 11:51:01 AM
    Author     : Beauty Kumari
--%>
<%@ page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
  <%      
        String id = request.getParameter("id");
        out.println(id);
        String name = request.getParameter("name");
        out.println(name);
        String contact = request.getParameter("contact");
        out.println(contact);
        String bought = request.getParameter("bought");
        out.println(bought);
        String credit = request.getParameter("credit");
        out.println(credit);
        String debit = request.getParameter("debit");
        out.println(debit);
     
        Connection conn = null;
        Statement stmt = null;
       
        try {
        
            final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            final String DB_URL = "jdbc:mysql://localhost/pcms";
            final String USER = "root";
            final String PASS = "";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            int nContact = 0, nId = 0, nBought = 0, nCredit = 0, nDebit = 0;
            String sql;
            sql = ("SELECT * FROM `pcms_db`");
            nId = Integer.parseInt(id);
            nContact = Integer.parseInt(contact);
            nBought = Integer.parseInt(bought);
            nCredit = Integer.parseInt(credit);
            nDebit = Integer.parseInt(debit);
            stmt.executeUpdate(sql);
            out.println(sql);

            if (stmt != null) {
                stmt.close();
            }
            
            conn.close();
          } catch (SQLException se) {
              se.printStackTrace();
          } catch (Exception e) {
              e.printStackTrace();
        } 
    %>
    </body>
</html>
