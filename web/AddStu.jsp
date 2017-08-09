<%-- 
    Document   : AddStu
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>
<%@page import="javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page errorPage="error.jsp" %>
<%
    int r=Integer.parseInt(request.getParameter("roll"));
    String n=request.getParameter("name");
    String f=request.getParameter("fname");
    String e=request.getParameter("email");
    String c=request.getParameter("course");
    String p=request.getParameter("phone");
    String pw= "";
    String msg="";
    PreparedStatement getStudent=(PreparedStatement)application.getAttribute("getStudent");
    getStudent.setInt(1,r);
    ResultSet rs=getStudent.executeQuery();
    if(!rs.next())
    {
        int PASSWORD_LENGTH = 8;
        String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
        for (int i=0; i<PASSWORD_LENGTH; i++)
        {
            int index = 0 + (int)(Math.random() * (letters.length()-1)); 
            pw += letters.charAt(index);
        }
        PreparedStatement insertStudent=(PreparedStatement)application.getAttribute("insertStudent");
        insertStudent.setInt(1,r);
        insertStudent.setString(2,n);
        insertStudent.setString(3,f);
        insertStudent.setString(4,e);
        insertStudent.setString(5,c);
        insertStudent.setString(6,p);
        insertStudent.setString(7,"Current");
        insertStudent.setString(8,pw);
        insertStudent.executeUpdate();
        msg="Student Successfully Registered. Password Send to given Email ID.";
        
        String subject="Student Successfully Registered";
        String body="You are Registered Successfullly  Plz loging on http://68.66.193.111 and Your User ID: "+r+" and Password: "+pw;
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
            //insertStudent.executeUpdate();
            //msg="Student Successfully Registered. Password Send to given Email ID.";
        }
        catch(Exception ex)
        {
            msg=msg+" Mail sending Fail.<br/>";
        }
    }
    else
    {
        msg="Roll No.( "+r+" ) Already Exist.";
    }
    session.setAttribute("msg",msg);
    response.sendRedirect("a-student.jsp");
%>
