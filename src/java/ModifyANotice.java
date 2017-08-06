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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) 
public class ModifyANotice extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            int nid=Integer.parseInt(request.getParameter("nid"));
            String ns=request.getParameter("nsub");
            String nb=request.getParameter("nbody");
            String ed=request.getParameter("edate");
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            if(fileName.trim().equals(""))
            {
                PreparedStatement updateANotice1=(PreparedStatement)application.getAttribute("updateANotice1");
                updateANotice1.setString(1,ns);
                updateANotice1.setString(2,nb);
                updateANotice1.setString(3,ed);
                updateANotice1.setInt(4,nid);
                updateANotice1.executeUpdate();
            }
            else
            {
                InputStream pis = filePart.getInputStream();
                PreparedStatement updateANotice2=(PreparedStatement)application.getAttribute("updateANotice2");
                updateANotice2.setString(1,ns);
                updateANotice2.setString(2,nb);
                updateANotice2.setBinaryStream(3, pis);
                updateANotice2.setString(4,fileName);
                updateANotice2.setString(5,ed);
                updateANotice2.setInt(6,nid);
                updateANotice2.executeUpdate();
            }
            

            HttpSession session=request.getSession();
            session.setAttribute("msg","Notice Modified Successfully.");
            response.sendRedirect("admin.jsp");
                
        }
        catch(IOException | NumberFormatException | SQLException | ServletException ee)
        {
            out.println("Exception Occur: "+ee);
        }
    }
}
