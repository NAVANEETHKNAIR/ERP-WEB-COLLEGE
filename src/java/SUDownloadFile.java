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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rahulchauhan
 */
public class SUDownloadFile extends HttpServlet {

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            int a=Integer.parseInt(request.getParameter("suid"));
            ServletContext application=getServletContext();
            Statement st=(Statement)application.getAttribute("stmt");
            ResultSet rs=st.executeQuery("select ufile,filename from suploads where suid="+a);
            if(rs.next())
            {
                String fname=rs.getString(2);
                response.setContentType("APPLICATION/OCTET-STREAM");   
                response.setHeader("Content-Disposition","attachment; filename="+fname); 
                response.getOutputStream().write(rs.getBytes(1)); 
            }
            
        } catch (IOException | NumberFormatException | SQLException ex) {
            System.out.print("hello "+ex);
        }
    }
}
