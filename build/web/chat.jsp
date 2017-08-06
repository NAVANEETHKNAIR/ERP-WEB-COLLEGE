<%--     Document   : chat    Created on : Jul 27, 2017, 4:19:43 AM    Author     : rashid ahmad--%><%@page import="java.sql.*"%><%@page import="java.time.format.DateTimeFormatter"%><%@page import="java.time.LocalDate"%><!DOCTYPE html><%    String roll=(String)session.getAttribute("roll");    String sname=(String)session.getAttribute("sname");    if(roll==null && sname==null)      {        session.setAttribute("msg","Please Login First!!");        response.sendRedirect("index.jsp");    } %> <html>	<head>				<!-- Website Title & Description for Search Engine purposes -->		<title></title>		<meta name="description" content="">				<!-- Mobile viewport optimized -->		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">				<!-- Bootstrap CSS -->		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">		<link href="bootstrap/css/bootstrap-glyphicons.css" rel="stylesheet">    <link href="DataTables/datatables.min.css" rel="stylesheet"/>  		<link href="includes/css/jquery.multiselect.css" rel="stylesheet" type="text/css">				<!-- Custom CSS -->		<link href="includes/css/styles.css" rel="stylesheet">				<!-- Include Modernizr in the head, before any other Javascript -->		<script src="includes/js/modernizr-2.6.2.min.js"></script>			</head>	<body>		<div class="bg">    	<div class="header">            <div class="container  text-center">                <a class="logo-hyper" href="index.jsp"><b>Skyline ERP</b></a>            </div>        </div>        <div class="container ">        	<div class="row">            	<div class="menu col-md-12 ">                	<div class="menu1 pull-left">                      <a href='student.jsp'>Home</a> &nbsp;&nbsp;&nbsp;&nbsp;                    	<a href='chat.jsp'>Chat</a> &nbsp;&nbsp;&nbsp;&nbsp;                                          <a href='index.jsp'>Logout</a>                    </div>                    <div class="menu1 pull-right">                    	<p>Welcome &nbsp;&nbsp; <b><%=sname%></b></p>                    </div>                </div>            </div>            <%                String msg=(String)session.getAttribute("msg");                if(msg!=null)                  {            %>            <div class="panel panel-primary">                <div class="panel-heading text-center">                    <p><%=msg%></p>                </div>            </div>            <%                session.setAttribute("msg", null);                }            PreparedStatement getStudent=(PreparedStatement)application.getAttribute("getStudent");                getStudent.setString(1, roll);                ResultSet rs=getStudent.executeQuery();                rs.next();                String fn=rs.getString(3);                String e=rs.getString(4);                String c=rs.getString(5);                String p=rs.getString(6);                rs.close();                            %>                        </div>            <div class="row">                <div class=" col-sm-4 ">                  <div class="box">                      <h5 class="text-center"> Chat </h5>                        <br>                        <form action="ChatPro.jsp" method="post"  data-toggle="validator" class="form-horizontal" role="form">                            <div class="form-group">                                <input type="hidden" name="sid" value="<%=roll%>"/>                                <div class="col-sm-10 col-sm-offset-1">                                  <input type="text" class="form-control" name="m" placeholder ="Message" required>                                </div>                            </div>                            <div class="form-group">                                <div class="col-sm-10 col-sm-offset-1">                                  Select Faculty:<br>                                  <select name="r" multiple class="form-control" required>                                <%                                    PreparedStatement getFacultyID=(PreparedStatement)application.getAttribute("getFacultyID");                                    getFacultyID.setString(1, c);                                    ResultSet rs1=getFacultyID.executeQuery();                                    int x=0;                                    while(rs1.next())                                    {                                        String fid=rs1.getString(1);                                        PreparedStatement getFaculty=(PreparedStatement)application.getAttribute("getFaculty");                                        getFaculty.setString(1, fid);                                        ResultSet rs2=getFaculty.executeQuery();                                        rs2.next();                                %>                                                                      <option value="<%=++x+"."+rs2.getString("name")%>"><%=rs2.getString("name")%></option>                                <%                                    }                                %>                                  </select>                                                               </div>                            </div>                                                        <div class="form-group">                                 <div class="col-sm-offset-1 col-sm-10">                                  <button type="submit" class="btn btn-primary">Upload</button>                                </div>                            </div>                        </form>                    </div>                </div>                <div class="notice-table col-md-8 pull-left">                  <h4 class="text-center">Student Chat</h4><hr/>                  <%                  PreparedStatement getChat=(PreparedStatement)application.getAttribute("getChat");                    getChat.setString(1, roll);                    getChat.setString(2, sname);                ResultSet crs=getChat.executeQuery();                while(crs.next())                {String n="";                PreparedStatement getFaculty=(PreparedStatement)application.getAttribute("getFaculty");    getFaculty.setString(1, crs.getString(2));    ResultSet rs2=getFaculty.executeQuery();    if(rs2.next()){        n=rs2.getString(2);    }                   PreparedStatement getStudent2=(PreparedStatement)application.getAttribute("getStudent");    getStudent2.setString(1, crs.getString(2));    ResultSet rs3=getStudent2.executeQuery();    if(rs3.next()){        n=rs3.getString(2);    }                 %>                Sender : <b><%=n%></b> Date: <b><%=crs.getString(5)%></b><br/>                Message: <b><%=crs.getString(4)%></b><br/><hr/>                <%                    }                  %>                </div>            </div>                    </div>        <div class="footer">            <div class="container text-center">                Design & Develop By RASHID AHMAD, FAROOQ ANSARI, HARSHITA MISHRA            </div>        </div>    </div>	  <script type="text/javascript" src="js/jquery-2.2.2.min.js"></script>  <script src="DataTables/datatables.min.js"></script>  <script src="bootstrap/js/bootstrap.min.js"></script>  <script src="includes/js/validator.js"></script>  <script src="includes/js/jquery.multiselect.js"></script>    <script type="text/javascript">      $(document).ready(function() {      $('#mydata').dataTable();    });    $('select[multiple]').multiselect({        columns: 2,        placeholder: 'Select'    });  </script>		</body></html>