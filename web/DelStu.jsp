<%-- 
    Document   : DelStu
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    int r=Integer.parseInt(request.getParameter("roll"));
    
    PreparedStatement deleteStudent=(PreparedStatement)application.getAttribute("deleteStudent");

    deleteStudent.setInt(1,r);
    PreparedStatement getStudent=(PreparedStatement)application.getAttribute("getStudent");
    getStudent.setInt(1,r);
    ResultSet rs=getStudent.executeQuery();
    if(rs.next())
    {
        deleteStudent.executeUpdate();
        session.setAttribute("msg","Student Deleted Successfully.");
    }
    else
    {
        session.setAttribute("msg"," Roll does not Exist.");
    }
    response.sendRedirect("a-student.jsp");
%>
