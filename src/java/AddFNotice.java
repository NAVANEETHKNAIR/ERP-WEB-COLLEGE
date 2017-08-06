/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author rashid ahmad
 */
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
public class AddFNotice extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            HttpSession session=request.getSession();
            String fid=(String)session.getAttribute("fid");
            PreparedStatement insertFNotice=(PreparedStatement)application.getAttribute("insertFNotice");
            String ns=request.getParameter("nsub");
            String nb=request.getParameter("nbody");
            String ed=request.getParameter("edate");
            Part filePart = request.getPart("file");
            String c[]=request.getParameterValues("course");
            String cr="";
            for(int i = 0; i < c.length; i++) 
            {
                cr=cr+" "+c[i];
            }
            String fileName = filePart.getSubmittedFileName();
            InputStream pis = filePart.getInputStream();
            
            insertFNotice.setString(1, ns);
            insertFNotice.setString(2, nb);
            LocalDate cDate = LocalDate.now();
            String cd=cDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
            insertFNotice.setString(5, cd);
            insertFNotice.setString(6, ed);
            insertFNotice.setString(7, cr);
            insertFNotice.setString(8, fid);
            insertFNotice.setBinaryStream(3, pis);
            insertFNotice.setString(4, fileName);

            insertFNotice.executeUpdate();

            session.setAttribute("msg","Notice Added Successfully.");
            response.sendRedirect("faculty.jsp");
                
        }
        catch(Exception ee)
        {
            out.println("Exception Occur: "+ee);
            ee.printStackTrace();
        }
    }
}
