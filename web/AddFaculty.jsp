<%-- 
    Document   : AddFaculty
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    String n=request.getParameter("name");
    String e=request.getParameter("email");
    String c[]=request.getParameterValues("course");
    String p=request.getParameter("phone");
    String pw= "";
    String fid= "";
    String msg="";
    int FID_LENGTH = 6;
    String letters = n+p;
    ResultSet rs;
    do
    {
    for (int i=0; i<FID_LENGTH; i++)
    {
        int index = 0 + (int)(Math.random() * (letters.length()-1)); 
        fid += letters.charAt(index);
    }
    PreparedStatement getFaculty=(PreparedStatement)application.getAttribute("getFaculty");
    getFaculty.setString(1,fid);
    rs=getFaculty.executeQuery();
    }
    while(rs.next());
    
    int PASSWORD_LENGTH = 8;
    letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
    for (int i=0; i<PASSWORD_LENGTH; i++)
    {
        int index = 0 + (int)(Math.random() * (letters.length()-1)); 
        pw += letters.charAt(index);
    }
    
    PreparedStatement insertFaculty=(PreparedStatement)application.getAttribute("insertFaculty");
    insertFaculty.setString(1,fid);
    insertFaculty.setString(2,n);
    insertFaculty.setString(3,e);
    insertFaculty.setString(4,p);
    insertFaculty.setString(5,pw);
    insertFaculty.executeUpdate();
    
    PreparedStatement insertFacultyCourse=(PreparedStatement)application.getAttribute("insertFacultyCourse");
    for(int i = 0; i < c.length; i++) 
    {
        insertFacultyCourse.setString(1,fid);
        insertFacultyCourse.setString(2,c[i]);
        insertFacultyCourse.executeUpdate();
    }
    msg="Faculty Successfully Registered. Faculty ID & Password Send to given Email ID.";

    String subject="Faculty Successfully Registered";
    String body="You are Registered Successfullly and Your User ID: "+fid+" and Password: "+pw;
    final String aemail=application.getInitParameter("aemail");
    final String apass=application.getInitParameter("apass");
    try
    {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");  
        properties.put("mail.smtp.socketFactory.port", "465");  
        properties.put("mail.smtp.socketFactory.class",  
              "javax.net.ssl.SSLSocketFactory");  
        properties.put("mail.smtp.auth", "true");  
        properties.put("mail.smtp.port", "465");
        Session ses = Session.getInstance(properties,    
            new javax.mail.Authenticator() {  
             protected PasswordAuthentication getPasswordAuthentication() {  
             return new PasswordAuthentication(aemail, apass); } 
            });  

        Message message = new MimeMessage(ses);  
        message.setFrom(new InternetAddress(aemail));  
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(e));  
        message.setSubject(subject);  
        message.setText(body);  
        Transport.send(message); 
        //insertFaculty.executeUpdate();
        //msg="Faculty Successfully Registered. Faculty ID & Password Send to given Email ID.";
    }
    catch(Exception ex)
    {
        msg=msg+" Mail sending Fail.<br/>";
    }
    session.setAttribute("msg",msg);
    response.sendRedirect("a-faculty.jsp");
%>
