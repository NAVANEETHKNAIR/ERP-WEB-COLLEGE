<%-- 
    Document   : ChatPro
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    java.util.Date d=new java.util.Date();
    java.text.SimpleDateFormat sd=new java.text.SimpleDateFormat("dd MMM yyyy h:mm:ss a");
    String dt=sd.format(d);
    
    PreparedStatement insertChat=(PreparedStatement)application.getAttribute("insertChat");
    String i=request.getParameter("sid");
    String m=request.getParameter("m");
    String r[]=request.getParameterValues("r");
    for(int x = 0; x < r.length; x++) 
    {
        insertChat.setString(1, i);
        insertChat.setString(2, r[x]);
        insertChat.setString(3, m);
        insertChat.setString(4, dt);
        insertChat.executeUpdate();
    }
    
    
    session.setAttribute("msg","Message Send");
    PreparedStatement getFaculty=(PreparedStatement)application.getAttribute("getFaculty");
    getFaculty.setString(1, i);
    ResultSet rs1=getFaculty.executeQuery();
    if(rs1.next()){
        response.sendRedirect("fchat.jsp");
    }else{
        response.sendRedirect("chat.jsp");
    }
    
%>
