<%-- 
    Document   : ModifyStu
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>




<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    int or=Integer.parseInt(request.getParameter("oroll"));
    int r=Integer.parseInt(request.getParameter("roll"));
    String n=request.getParameter("name");
    String f=request.getParameter("fname");
    String e=request.getParameter("email");
    String c=request.getParameter("course");
    String p=request.getParameter("phone");
    String s=request.getParameter("status");
    PreparedStatement updateStudent=(PreparedStatement)application.getAttribute("updateStudent");
    updateStudent.setString(2,n);
    updateStudent.setString(3,f);
    updateStudent.setString(4,e);
    updateStudent.setString(5,c);
    updateStudent.setString(6,p);
    updateStudent.setString(7,s);
    updateStudent.setInt(8,or);
    
    if(r!=or)
    {
        PreparedStatement getStudent=(PreparedStatement)application.getAttribute("getStudent");
        getStudent.setInt(1,r);
        ResultSet rs=getStudent.executeQuery();
        if(!rs.next())
        {
            updateStudent.setInt(1,r);
            updateStudent.executeUpdate();
            session.setAttribute("msg","Student Details Successfully Updated.");
        }
        else
        {
            session.setAttribute("msg","New Roll Already Exist.");
        }
    }
    else
    {
        updateStudent.setInt(1,r);
        updateStudent.executeUpdate();
        session.setAttribute("msg","Student Details Successfully Updated.");
    }
    response.sendRedirect("a-student.jsp");
%>
