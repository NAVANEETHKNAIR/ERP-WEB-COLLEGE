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
import java.time.*;
import java.time.format.DateTimeFormatter;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig(maxFileSize = 16177215) 
public class AddANotice extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            PreparedStatement insertANotice=(PreparedStatement)application.getAttribute("insertANotice");
            String ns=request.getParameter("nsub");
            String nb=request.getParameter("nbody");
            String ed=request.getParameter("edate");
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            InputStream pis = filePart.getInputStream();
            
            insertANotice.setString(1, ns);
            insertANotice.setString(2, nb);
            LocalDate cDate = LocalDate.now();
            String cd=cDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
            insertANotice.setString(5, cd);
            insertANotice.setString(6, ed);
            insertANotice.setBinaryStream(3, pis);
            insertANotice.setString(4, fileName);

            insertANotice.executeUpdate();

            HttpSession session=request.getSession();
            session.setAttribute("msg","Notice Added Successfully.");
            response.sendRedirect("admin.jsp");
                
        }
        catch(Exception ee)
        {
            out.println("Exception Occur: "+ee);
            ee.printStackTrace();
        }
    }

}
