<%-- 
    Document   : GetStu
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    int r=Integer.parseInt(request.getParameter("roll"));
    PreparedStatement getStudent=(PreparedStatement)application.getAttribute("getStudent");
    getStudent.setInt(1,r);
    ResultSet rs=getStudent.executeQuery();
    if(rs.next())
    {
        session.setAttribute("stuRs",rs);
    }
    else
    {
        session.setAttribute("msg","Roll No. does not Exist.");
    }
    response.sendRedirect("a-student.jsp");
%>
