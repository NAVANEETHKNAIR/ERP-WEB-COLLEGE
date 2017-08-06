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
public class ModifyFNotice extends HttpServlet {

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
            String c[]=request.getParameterValues("course");
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            if(fileName.trim().equals("") && c==null)
            {
                PreparedStatement updateFNotice1=(PreparedStatement)application.getAttribute("updateFNotice1");
                updateFNotice1.setString(1,ns);
                updateFNotice1.setString(2,nb);
                updateFNotice1.setString(3,ed);
                updateFNotice1.setInt(4,nid);
                updateFNotice1.executeUpdate();
            }
            else if(!(fileName.trim().equals("")) && c==null)
            {
                InputStream pis = filePart.getInputStream();
                PreparedStatement updateFNotice2=(PreparedStatement)application.getAttribute("updateFNotice2");
                updateFNotice2.setString(1,ns);
                updateFNotice2.setString(2,nb);
                updateFNotice2.setBinaryStream(3, pis);
                updateFNotice2.setString(4,fileName);
                updateFNotice2.setString(5,ed);
                updateFNotice2.setInt(6,nid);
                updateFNotice2.executeUpdate();
            }
            else if(fileName.trim().equals("") && c!=null)
            {
                PreparedStatement updateFNotice3=(PreparedStatement)application.getAttribute("updateFNotice3");
                updateFNotice3.setString(1,ns);
                updateFNotice3.setString(2,nb);
                String cr="";
                for (String c1 : c) {
                    cr = cr+" " + c1;
                }
                updateFNotice3.setString(3,cr);
                updateFNotice3.setString(4,ed);
                updateFNotice3.setInt(5,nid);
                updateFNotice3.executeUpdate();
            }
            else
            {
                InputStream pis = filePart.getInputStream();
                PreparedStatement updateFNotice4=(PreparedStatement)application.getAttribute("updateFNotice4");
                updateFNotice4.setString(1,ns);
                updateFNotice4.setString(2,nb);
                updateFNotice4.setBinaryStream(3, pis);
                updateFNotice4.setString(4,fileName);
                updateFNotice4.setString(5,ed);
                String cr="";
                for(int i = 0; i < c.length; i++) 
                {
                    cr=cr+" "+c[i];
                }
                updateFNotice4.setString(6,cr);
                updateFNotice4.setInt(7,nid);
                updateFNotice4.executeUpdate();
            }
            

            HttpSession session=request.getSession();
            session.setAttribute("msg","Notice Modified Successfully.");
            response.sendRedirect("faculty.jsp");
                
        }
        catch(IOException | NumberFormatException | SQLException | ServletException ee)
        {
            out.println("Exception Occur: "+ee);
        }
    }
}
