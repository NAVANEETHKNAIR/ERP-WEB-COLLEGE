/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author rashid ahmad
 */
import javax.servlet.*;  
import java.sql.*;  
import java.util.logging.Level;
import java.util.logging.Logger;
public class CtxListener implements ServletContextListener
{   
    Connection con;
    @Override
    public void contextInitialized(ServletContextEvent event) 
    {  
        try
        {  
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","VirtualClass","VirtualClass");         

            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/skyline","root","Nokia123@");
            PreparedStatement insertStudent=con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?)");
            PreparedStatement getStudent=con.prepareStatement("select * from student where roll=?");
            PreparedStatement getAllStudent=con.prepareStatement("select * from student");
            PreparedStatement updateStudent=con.prepareStatement("update student set roll=?,name=?,fname=?,email=?,course=?,phone=?,status=? where roll=?");
            PreparedStatement deleteStudent=con.prepareStatement("delete from student where roll=?");
            PreparedStatement alogin=con.prepareStatement("select * from admin where aid=? and pass=?");
            PreparedStatement slogin=con.prepareStatement("select * from student where roll=? and pass=?");
            PreparedStatement flogin=con.prepareStatement("select * from faculty where fid=? and pass=?");
            PreparedStatement insertFaculty=con.prepareStatement("insert into faculty values(?,?,?,?,?)");
            PreparedStatement getFaculty=con.prepareStatement("select * from faculty where fid=?");
            PreparedStatement getAllFaculty=con.prepareStatement("select * from faculty");
            PreparedStatement getFacultyCourse=con.prepareStatement("select * from faculty_course where fid=?");
            PreparedStatement insertFacultyCourse=con.prepareStatement("insert into faculty_course values(?,?)");
            PreparedStatement deleteFaculty=con.prepareStatement("delete from faculty where fid=?");
            PreparedStatement deleteFacultyCourse=con.prepareStatement("delete from faculty_course where fid=?");
            PreparedStatement updateFaculty=con.prepareStatement("update faculty set fid=?,name=?,email=?,phone=? where fid=?");
            PreparedStatement updateFacultyCourseFid=con.prepareStatement("update faculty_course set fid=? where fid=?");
            PreparedStatement insertANotice=con.prepareStatement("insert into anotice (sub,body,ufile,filename,pdate,expdate)values(?,?,?,?,?,?)");
            PreparedStatement getAllANotice=con.prepareStatement("select * from anotice");
            PreparedStatement getANotice=con.prepareStatement("select * from anotice where nid=?");
            PreparedStatement updateANotice1=con.prepareStatement("update anotice set sub=?,body=?,expdate=? where nid=?");
            PreparedStatement updateANotice2=con.prepareStatement("update anotice set sub=?,body=?,ufile=?,filename=?,expdate=? where nid=?");
            PreparedStatement deleteANotice=con.prepareStatement("delete from anotice where nid=?");
            PreparedStatement insertFNotice=con.prepareStatement("insert into fnotice (sub,body,ufile,filename,pdate,expdate,course,fid)values(?,?,?,?,?,?,?,?)");
            PreparedStatement getAllFNotice=con.prepareStatement("select * from fnotice");
            PreparedStatement getFNotice=con.prepareStatement("select * from fnotice where nid=?");
            PreparedStatement updateFNotice1=con.prepareStatement("update fnotice set sub=?,body=?,expdate=? where nid=?");
            PreparedStatement updateFNotice2=con.prepareStatement("update fnotice set sub=?,body=?,ufile=?,filename=?,expdate=? where nid=?");
            PreparedStatement updateFNotice3=con.prepareStatement("update fnotice set sub=?,body=?,course=?,expdate=? where nid=?");
            PreparedStatement updateFNotice4=con.prepareStatement("update fnotice set sub=?,body=?,ufile=?,filename=?,expdate=?,course=? where nid=?");
            PreparedStatement deleteFNotice=con.prepareStatement("delete from fnotice where nid=?");
            PreparedStatement getAllANoticeC=con.prepareStatement("select * from anotice where expdate>=?");
            PreparedStatement getAllFNoticeC=con.prepareStatement("select * from fnotice where expdate>=?");
            PreparedStatement getAllFNoticeFid=con.prepareStatement("select * from fnotice where fid=?");
            PreparedStatement getFacultyID=con.prepareStatement("select fid from faculty_course where course=?");
            PreparedStatement insertSUpload=con.prepareStatement("insert into suploads (roll,sub,fnames,ufile,filename,udate) values(?,?,?,?,?,?)");
            PreparedStatement getSUpload=con.prepareStatement("select * from suploads where roll=?");
            PreparedStatement getAllSUpload=con.prepareStatement("select * from suploads");
            PreparedStatement insertChat=con.prepareStatement("insert into chat (sid,rid,msg,mdate) values(?,?,?,?)");
            PreparedStatement getChat=con.prepareStatement("select * from chat where sid=? or rid=? ");
            PreparedStatement getStuByCourse=con.prepareStatement("select * from student where course=?");
            
            Statement st=con.createStatement();
            ServletContext ctx=event.getServletContext();     
            ctx.setAttribute("stmt", st);  
            ctx.setAttribute("dbcon", con);
            ctx.setAttribute("getStuByCourse", getStuByCourse);
            ctx.setAttribute("insertChat", insertChat);
            ctx.setAttribute("getChat", getChat);
            ctx.setAttribute("insertStudent", insertStudent);
            ctx.setAttribute("getStudent", getStudent);
            ctx.setAttribute("getAllStudent", getAllStudent);
            ctx.setAttribute("updateStudent", updateStudent);
            ctx.setAttribute("deleteStudent", deleteStudent);
            ctx.setAttribute("alogin", alogin);
            ctx.setAttribute("slogin", slogin);
            ctx.setAttribute("flogin", flogin);
            ctx.setAttribute("insertFaculty", insertFaculty);
            ctx.setAttribute("getFaculty", getFaculty);
            ctx.setAttribute("getAllFaculty", getAllFaculty);
            ctx.setAttribute("getFacultyCourse", getFacultyCourse);
            ctx.setAttribute("insertFacultyCourse", insertFacultyCourse);
            ctx.setAttribute("deleteFaculty", deleteFaculty);
            ctx.setAttribute("deleteFacultyCourse", deleteFacultyCourse);
            ctx.setAttribute("updateFaculty", updateFaculty);
            ctx.setAttribute("updateFacultyCourseFid", updateFacultyCourseFid);
            ctx.setAttribute("insertANotice", insertANotice);
            ctx.setAttribute("getAllANotice", getAllANotice);
            ctx.setAttribute("getANotice", getANotice);
            ctx.setAttribute("updateANotice1", updateANotice1);
            ctx.setAttribute("updateANotice2", updateANotice2);
            ctx.setAttribute("deleteANotice", deleteANotice);
            ctx.setAttribute("insertFNotice", insertFNotice);
            ctx.setAttribute("getAllFNotice", getAllFNotice);
            ctx.setAttribute("getFNotice", getFNotice);
            ctx.setAttribute("updateFNotice1", updateFNotice1);
            ctx.setAttribute("updateFNotice2", updateFNotice2);
            ctx.setAttribute("updateFNotice3", updateFNotice3);
            ctx.setAttribute("updateFNotice4", updateFNotice4);
            ctx.setAttribute("deleteFNotice", deleteFNotice);
            ctx.setAttribute("getAllANoticeC", getAllANoticeC);
            ctx.setAttribute("getAllFNoticeC", getAllFNoticeC);
            ctx.setAttribute("getAllFNoticeFid", getAllFNoticeFid);
            ctx.setAttribute("getFacultyID", getFacultyID);
            ctx.setAttribute("insertSUpload", insertSUpload);
            ctx.setAttribute("getSUpload", getSUpload);
            ctx.setAttribute("getAllSUpload", getAllSUpload);

        }
        catch(Exception e)
        {
                e.printStackTrace();
        }  
    }   
    public void contextDestroyed(ServletContextEvent e) {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(CtxListener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }  
}  