<%@page import="java.sql.*"%>
<% 
	String ut=request.getParameter("utype");
	String u=request.getParameter("uid");
	String p=request.getParameter("pwd");
        
	if(ut.equals("Student"))
	{
            try{
                PreparedStatement slogin=(PreparedStatement)application.getAttribute("slogin");
                slogin.setInt(1, Integer.parseInt(u));
                slogin.setString(2, p);
                ResultSet rs=slogin.executeQuery();
                if(rs.next())
                {
                    session.setAttribute("roll", u);
                    session.setAttribute("sname", rs.getString(2));
                    response.sendRedirect("student.jsp");
                }
                else
                {
                    session.setAttribute("msg","Wrong Entries!!");
                    response.sendRedirect("index.jsp");
                } 
            }catch(Exception ex){
                session.setAttribute("msg","Wrong Entries!!");
                response.sendRedirect("index.jsp");
            }            
	}
	else if(ut.equals("Faculty"))
	{
            PreparedStatement flogin=(PreparedStatement)application.getAttribute("flogin");
            flogin.setString(1, u);
            flogin.setString(2, p);
            ResultSet rs=flogin.executeQuery();
            if(rs.next())
            {
                session.setAttribute("fid", u);
                session.setAttribute("fname", rs.getString(2));
                response.sendRedirect("faculty.jsp");
            }
            else
            {
                session.setAttribute("msg","Wrong Entries!!");
                response.sendRedirect("index.jsp");
            }  
	}
	else 
	{
            PreparedStatement alogin=(PreparedStatement)application.getAttribute("alogin");
            alogin.setString(1, u);
            alogin.setString(2, p);
            ResultSet rs=alogin.executeQuery();
            if(rs.next())
            {
                session.setAttribute("aid", u);
                session.setAttribute("aname", rs.getString(3));
                response.sendRedirect("admin.jsp");
            }
            else
            {
                session.setAttribute("msg","Wrong Entries!!");
                response.sendRedirect("index.jsp");
            }  	
	}
%>