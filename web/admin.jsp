<%-- 
    Document   : admin
    Created on : Jul 27, 2017, 4:19:43 AM
    Author     : rashid ahmad
--%>




<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    String aid=(String)session.getAttribute("aid");
    String aname=(String)session.getAttribute("aname");
    if(aid==null && aname==null)  
    {
        session.setAttribute("msg","Please Login First!!");
        response.sendRedirect("index.jsp");
    } 
%> 
<html>
	<head>
		
    <!-- Website Title & Description for Search Engine purposes -->
    <title></title>
    <meta name="description" content="">

    <!-- Mobile viewport optimized -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="datetimepicker/css/datetimepicker.min.css" rel="stylesheet"  />
    <link href="DataTables/datatables.min.css" rel="stylesheet"/>
		
    <!-- Custom CSS -->
    <link href="includes/css/styles.css" rel="stylesheet">

    <!-- Include Modernizr in the head, before any other Javascript -->
    <script src="includes/js/modernizr-2.6.2.min.js"></script>
		
	</head>
	<body>
	
	<div class="bg">
    	<div class="header">
            <div class="container  text-center">
                <a class="logo-hyper" href="index.jsp"><b>Skyline ERP</b></a>
            </div>
        </div>
        <div class="container ">
        	<div class="row">
            	<div class="menu col-md-12 ">
                	<div class="menu1 pull-left">
                    	<a href='a-student.jsp'>Student</a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href='a-faculty.jsp'>Faculty</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href='admin.jsp'>Notice</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href='logout.jsp'>Logout</a>
                    </div>
                    <div class="menu1 pull-right">
                    	<p>Welcome &nbsp;&nbsp; <b><%=aname%></b></p>
                    </div>
                </div>
            </div>
                <%
                    String msg=(String)session.getAttribute("msg");
                    ResultSet anoticeRs=(ResultSet)session.getAttribute("anoticeRs");
                    if(msg!=null)  
                    {
                %>
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <p><%=msg%></p>
                    </div>
                </div>
                <%
                    session.setAttribute("msg", null);
                    }
                %>
        	<div class="row">
            	<div class="notice-table col-md-12 pull-left">
            		<h4 class="text-center">Notice Details</h4><hr/>
                	<table id="mydata" class=" table table-striped table-bordered hover" cellspacing="0" width="100%">
                    	<thead>
                          <tr>
                              <th>ID</th>
                              <th>Subject</th>
                              <th>Body</th>
                              <th>File Name</th>
                              <th>Posted Date</th>
                              <th>Expiry Date</th>
                          </tr>
                      	</thead>
                      	<tfoot>
                          <tr>
                              <th>ID</th>
                              <th>Subject</th>
                              <th>Body</th>
                              <th>File Name</th>
                              <th>Posted Date</th>
                              <th>Expiry Date</th>
                          </tr>
                      	</tfoot>
                      	<tbody>
                        <%
                          PreparedStatement getAllANotice=(PreparedStatement)application.getAttribute("getAllANotice");
                          ResultSet rs=getAllANotice.executeQuery();
                          while(rs.next())
                          {
                              int nid=rs.getInt(1);
                        %>
                            <tr>
                              <td><%= nid %></td>
                              <td><%= rs.getString(2) %></td>
                              <td><%= rs.getString(3) %></td>
                              <td><a href="DownloadFile?nid=<%=nid%>"><%= rs.getString(5) %></a></td>
                              <td><%= rs.getString(6) %></td>
                              <td><%= rs.getString(7) %></td>
                            </tr>
                        <%
                          }
                        %>
                      	</tbody>
                  	</table>
              	</div>
                
            </div>
        <%
            if(anoticeRs!=null)
            {
        %>
            <div class="row">
            	<div class=" col-md-8 ">
                	<div class="box text-center">
                    	<br>
                        <form action="GetANotice.jsp"  method="post" class="form-inline" data-toggle="validator" role="form">
                            <div class="form-group">
                              <input type="text" value="<%=anoticeRs.getInt(1)%>" class="form-control" name="nid" placeholder="Notice ID" required>
                            </div>
                            <button type="submit" class="btn btn-primary">GO</button>
                      	</form>
                        
                        <hr>
                        <form action="ModifyANotice" enctype="multipart/form-data" method="post" data-toggle="validator" class="form-horizontal" role="form">   
                        	<br><b>Notice ID: <%=anoticeRs.getInt(1)%></b> <br> <br> 
                                <input type="hidden" name="nid" value="<%=anoticeRs.getInt(1)%>"/>
                        	<div class="form-group">
                                <div class="col-sm-10 col-sm-offset-1">
                                  <input type="text" value="<%=anoticeRs.getString(2)%>" class="form-control" name="nsub" placeholder="Notice Subject" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-10 col-sm-offset-1">
                                  <textarea class="form-control" rows="4" name="nbody" required ><%=anoticeRs.getString(3)%></textarea>
                                </div>
                            </div>
                            <div class="form-group">                                
                            	<div class="col-sm-10 col-sm-offset-1">
                            		<b>File Uploaded: <%=anoticeRs.getString(5)%> </b> <br>
                                  <input type="file" class="form-control" name="file" >
                                </div>
                            </div>
                            <b>Expiry Date: <%=anoticeRs.getString(7)%></b> <br>
                            <div class='input-group date col-sm-10 col-sm-offset-1' id='datepicker1'>
                                <input type='text' value="<%=anoticeRs.getString(7)%>" class="form-control" name='edate' required/>
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <br/>
                            
                            <div class="form-group"> 
                                <div class="col-sm-offset-1 col-sm-10">
                                  <button type="submit" class="btn btn-primary">Update</button> &nbsp;&nbsp;&nbsp;
                                  <a href="DelANotice.jsp?nid=<%=anoticeRs.getInt(1)%>" class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%
                session.setAttribute("anoticeRs", null);
                }
                else
                {%>
                <div class="row">
            	<div class=" col-md-8 ">
                	<div class="box text-center">
                    	<br>
                        <form action="GetANotice.jsp" method="post"  class="form-inline" data-toggle="validator" role="form">
                            <div class="form-group">
                              <input type="text" class="form-control" name="nid" placeholder="Notice ID" required>
                            </div>
                            <button type="submit" class="btn btn-primary">GO</button>
                      	</form>
                        
                        <hr>
                        <form action="ModifyANotice.jsp" enctype="multipart/form-data" method="post" data-toggle="validator" class="form-horizontal" role="form">   
                        	<br><b>Notice ID: </b> <br> <br>                         
                        	<div class="form-group">
                                <div class="col-sm-10 col-sm-offset-1">
                                  <input type="text" class="form-control" name="nsub" placeholder="Notice Subject" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-10 col-sm-offset-1">
                                  <textarea class="form-control" rows="4" name="nbody" required ></textarea>
                                </div>
                            </div>
                            <div class="form-group">                                
                            	<div class="col-sm-10 col-sm-offset-1">
                            		<b>File Uploaded: </b> <br>
                                  <input type="file" class="form-control" name="file" >
                                </div>
                            </div>
                            <b>Expiry Date: </b> <br>
                            <div class='input-group date col-sm-10 col-sm-offset-1' id='datepicker1'>
                              <input type='text' class="form-control" name='edate' placeholder="Change Notice Expiry Date" required/>
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <br/>
                            
                            <div class="form-group"> 
                                <div class="col-sm-offset-1 col-sm-10">
                                  <button type="submit" class="btn btn-primary">Update</button> &nbsp;&nbsp;&nbsp;
                                  <button type="submit" class="btn btn-danger">Delete</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%}%>
                <div class=" col-sm-4 pull-right">
                	<div class="box">
                    	<h5 class="text-center"> New Notice </h5>
                        <br>
                        <form action="AddANotice" enctype="multipart/form-data" method="post" data-toggle="validator" class="form-horizontal" role="form">
              				
                            <div class="form-group">
                                <div class="col-sm-10 col-sm-offset-1">
                                  <input type="text" class="form-control" name="nsub" placeholder="Notice Subject" required>
                                </div>
                                <span class=" text-center help-block with-errors"></span>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-10 col-sm-offset-1">
                                  <textarea class="form-control" rows="4" name="nbody" placeholder="Notice Body" required ></textarea>
                                </div>
                                <span class=" text-center help-block with-errors"></span>
                            </div>
                            <div class="form-group">                                
                            	<div class="col-sm-10 col-sm-offset-1">
                                	Upload File:<br>
                                  <input type="file" class="form-control" name="file" >
                                </div>
                            </div>
                            <div class='input-group date col-sm-10 col-sm-offset-1' id='datepicker2'>
                              <input type='text' class="form-control" name='edate' placeholder="Enter Notice Expiry Date" required/>
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <span class=" text-center help-block with-errors"></span>
                            <br/>
                            
                            <div class="form-group"> 
                                <div class="col-sm-offset-1 col-sm-10">
                                  <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="footer">
            <div class="container text-center">
                Design & Develop By RASHID AHMAD, FAROOQ ANSARI, HARSHITA MISHRA
            </div>
        </div>
    </div>
	

  <script type="text/javascript" src="includes/js/jquery-1.8.2.min.js"></script>
  <script src="DataTables/datatables.min.js"></script>
  <script src="includes/js/validator.js"></script>
  <script src="includes/js/jquery.multiselect.js"></script>
  <script src="datetimepicker/js/moment.min.js"></script>
  <script src="datetimepicker/js/datetimepicker.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript">

      $(document).ready(function() {
      $('#mydata').dataTable();
    });

    $(function () {
      $('#datepicker1').datetimepicker({
        format: 'DD/MM/YYYY',
        minDate: new Date()
      });
      $('#datepicker2').datetimepicker({
        format: 'DD/MM/YYYY',
        minDate: new Date()
      });
    });

    $('select[multiple]').multiselect({
        columns: 2,
        placeholder: 'Select'
    });

  </script>
	
	</body>
</html>

