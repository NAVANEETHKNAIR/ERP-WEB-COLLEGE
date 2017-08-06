<%-- 
    Document   : DelANoties
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    int nid=Integer.parseInt(request.getParameter("nid").trim());
    
    PreparedStatement deleteANotice=(PreparedStatement)application.getAttribute("deleteANotice");

    deleteANotice.setInt(1,nid);
    PreparedStatement getANotice=(PreparedStatement)application.getAttribute("getANotice");
    getANotice.setInt(1,nid);
    ResultSet rs=getANotice.executeQuery();
    if(rs.next())
    {
        deleteANotice.executeUpdate();
        session.setAttribute("msg","Notice Deleted Successfully.");
    }
    else
    {
        session.setAttribute("msg"," Notice ID does not Exist.");
    }
    response.sendRedirect("admin.jsp");
%>
