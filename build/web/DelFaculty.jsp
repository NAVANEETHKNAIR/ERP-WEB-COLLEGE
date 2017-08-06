<%-- 
    Document   : DelFaculty
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    String fid=request.getParameter("fid");
    PreparedStatement deleteFaculty=(PreparedStatement)application.getAttribute("deleteFaculty");
    PreparedStatement deleteFacultyCourse=(PreparedStatement)application.getAttribute("deleteFacultyCourse");
    deleteFaculty.setString(1,fid);
    deleteFacultyCourse.setString(1, fid);
    PreparedStatement getFaculty=(PreparedStatement)application.getAttribute("getFaculty");
    getFaculty.setString(1,fid);
    ResultSet rs=getFaculty.executeQuery();
    if(rs.next())
    {
        deleteFaculty.executeUpdate();
        deleteFacultyCourse.executeUpdate();
        session.setAttribute("msg","Faculty Deleted Successfully.");
    }
    else
    {
        session.setAttribute("msg"," Faculty ID does not Exist.");
    }
    response.sendRedirect("a-faculty.jsp");
%>
