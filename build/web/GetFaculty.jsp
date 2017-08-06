<%-- 
    Document   : GetFaculty
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    String fid=request.getParameter("fid");
    PreparedStatement getFaculty=(PreparedStatement)application.getAttribute("getFaculty");
    getFaculty.setString(1,fid);
    ResultSet rs=getFaculty.executeQuery();
    if(rs.next())
    {
        session.setAttribute("facultyRs",rs);
    }
    else
    {
        session.setAttribute("msg","Facuty ID does not Exist.");
    }
    response.sendRedirect("a-faculty.jsp");
%>
