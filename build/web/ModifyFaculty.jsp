<%-- 
    Document   : ModifiyFaculty
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    String ofid=request.getParameter("ofid");
    String fid=request.getParameter("fid");
    String n=request.getParameter("name");
    String e=request.getParameter("email");
    String c[]=request.getParameterValues("course");
    String p=request.getParameter("phone");
    PreparedStatement updateFaculty=(PreparedStatement)application.getAttribute("updateFaculty");
    updateFaculty.setString(2,n);
    updateFaculty.setString(3,e);
    updateFaculty.setString(4,p);
    updateFaculty.setString(5,ofid);
    int x=0;
    if(!fid.equals(ofid))
    {
        PreparedStatement getFaculty=(PreparedStatement)application.getAttribute("getFaculty");
        getFaculty.setString(1,fid);
        ResultSet rs=getFaculty.executeQuery();
        if(!rs.next())
        {
            updateFaculty.setString(1,fid);
            updateFaculty.executeUpdate();
            PreparedStatement updateFacultyCourseFid=(PreparedStatement)application.getAttribute("updateFacultyCourseFid");
            updateFacultyCourseFid.setString(1, fid);
            updateFacultyCourseFid.setString(2, ofid);
            updateFacultyCourseFid.executeUpdate();
            session.setAttribute("msg","Faculty Details Successfully Updated.");
        }
        else
        {
            x=1;
            session.setAttribute("msg","New Faculty ID Already Exist.");
        }
    }
    else
    {
        updateFaculty.setString(1,fid);
        updateFaculty.executeUpdate();
        session.setAttribute("msg","Faculty Details Successfully Updated.");
    }
    if(c!=null && x==0)
    {
        PreparedStatement deleteFacultyCourse=(PreparedStatement)application.getAttribute("deleteFacultyCourse");
        deleteFacultyCourse.setString(1, fid);
        deleteFacultyCourse.executeUpdate();
        PreparedStatement insertFacultyCourse=(PreparedStatement)application.getAttribute("insertFacultyCourse");
        for(int i = 0; i < c.length; i++) 
        {
            insertFacultyCourse.setString(1,fid);
            insertFacultyCourse.setString(2,c[i]);
            insertFacultyCourse.executeUpdate();
        }
    }
    response.sendRedirect("a-faculty.jsp");
%>
