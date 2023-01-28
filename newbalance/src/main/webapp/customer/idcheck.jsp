<%@page import="jdbc.connection.JdbcUtil"%>
<%@page import="jdbc.connection.ConnectionProvider"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
     
     String id = request.getParameter("custId");
  
     String sql = " select count(*) cnt " + 
                    " from user_info  " + 
                    " where user_id =  ?";
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null; 
     
     String jsonResult =  null; 
     
     try{
        conn = ConnectionProvider.getConnection();   // DBCP
        pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
      rs = pstmt.executeQuery();
         
      rs.next();
         int cnt = rs.getInt("cnt");  
         
         jsonResult  = String.format("{ \"count\":%d }", cnt) ;
     }catch(Exception e){
        e.printStackTrace();
     }finally{
        JdbcUtil.close(pstmt);
        JdbcUtil.close(rs);
        JdbcUtil.close(conn);
     }
     
%> 
<%= jsonResult  %>