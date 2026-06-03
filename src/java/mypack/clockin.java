/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import DB.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AJAY YADAV
 */
public class clockin extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession st=request.getSession(true);
             String user=(String)st.getAttribute("user2");
             String com_id=(String)st.getAttribute("comp");
           
             DBconnection db=new DBconnection();
             Calendar c=Calendar.getInstance();
             int h=c.get(Calendar.HOUR);
              int m=c.get(Calendar.MINUTE);
               int s1=c.get(Calendar.SECOND);
               String time=h+":"+m+":"+s1;
             db.pstmt=db.con.prepareStatement("select emp_id from attendance where aten_date=curdate()");
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
                response.sendRedirect("attendance.jsp?msg=You are already  clock-in please clock-out first!!!!!!!...!!");
               
            }
            else
            {
             db.pstmt=db.con.prepareStatement("insert into attendance(emp_id,com_id,aten_date,in_time,cout_date) values(?,?,curdate(),?,curdate())");
               db.pstmt.setString(1, user);
               db.pstmt.setString(2,com_id);
               db.pstmt.setString(3,time);
            
             int x=db.pstmt.executeUpdate();
               if(x>0)
               {
               
               response.sendRedirect("attendance.jsp?msg=You are clock-in!!!!!!!...!!");
               }
               else
               {
               response.sendRedirect("attendance.jsp?msg=You are clock-out!!!!!!...!!...!!");
               
               
               }
            
            
            }
        } catch(Exception e) {            
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
