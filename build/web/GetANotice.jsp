<%-- 
    Document   : GetANotice
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    int nid=Integer.parseInt(request.getParameter("nid").trim());
    PreparedStatement getANotice=(PreparedStatement)application.getAttribute("getANotice");
    getANotice.setInt(1,nid);
    ResultSet rs=getANotice.executeQuery();
    if(rs.next())
    {
        session.setAttribute("anoticeRs",rs);
    }
    else
    {
        session.setAttribute("msg","Notice ID does not Exist.");
    }
    response.sendRedirect("admin.jsp");
%>
