<%-- 
    Document   : logout
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>

<%
session.invalidate();
response.sendRedirect("index.jsp");
%>