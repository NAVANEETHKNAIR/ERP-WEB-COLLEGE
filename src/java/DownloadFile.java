/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author rashid ahmad
 */
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class DownloadFile extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            int a=Integer.parseInt(request.getParameter("nid"));
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            ResultSet rs=st.executeQuery("select ufile,filename from anotice where nid="+a);
            if(rs.next())
            {
                String fname=rs.getString(2);
                response.setContentType("APPLICATION/OCTET-STREAM");   
                response.setHeader("Content-Disposition","attachment; filename="+fname); 
                response.getOutputStream().write(rs.getBytes(1)); 
//                response.setContentType("application/pdf");
//                response.setHeader("Content-Disposition", "inline; filename=\"" + fname + "\"");
//                response.getOutputStream().write(rs.getBytes(1)); 
            }
            
        } catch (IOException | NumberFormatException | SQLException ex) {
            System.out.print("hello "+ex);
        }
    }

}
