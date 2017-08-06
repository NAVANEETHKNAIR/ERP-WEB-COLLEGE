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
import java.sql.SQLException;
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
public class SUploads extends HttpServlet {

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            PreparedStatement insertSUpload=(PreparedStatement)application.getAttribute("insertSUpload");
            int roll=Integer.parseInt(request.getParameter("roll"));
            String s=request.getParameter("sub");
            String fn[]=request.getParameterValues("fname");
            String fns="";
            for (String fn1 : fn) {
                fns = fns+", " + fn1;
            }
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            InputStream pis = filePart.getInputStream();
            
            insertSUpload.setInt(1, roll);
            insertSUpload.setString(2, s);
            insertSUpload.setString(3, fns);
            insertSUpload.setBinaryStream(4, pis);
            insertSUpload.setString(5, fileName);
            LocalDate cDate = LocalDate.now();
            String cd=cDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
            insertSUpload.setString(6, cd);

            insertSUpload.executeUpdate();
            HttpSession session=request.getSession();
            session.setAttribute("msg","File Uploaded Successfully.");
            response.sendRedirect("student.jsp");
                
        }
        catch(IOException | NumberFormatException | SQLException | ServletException ee)
        {
            out.println("Exception Occur: "+ee);
        }
    }
}
