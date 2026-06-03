/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import DB.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AJAY YADAV
 */
public class event extends HttpServlet {

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
             String company=(String)st.getAttribute("comp");
  
            String sub=request.getParameter("t1");
            String msg=request.getParameter("t2");
            DBconnection db=new DBconnection();
            db.pstmt=db.con.prepareStatement("insert into event(com_id,subject,event,e_date) values(?,?,?,curdate())");
               db.pstmt.setString(1, company);
               db.pstmt.setString(2, sub);
               db.pstmt.setString(3, msg);
               
                int x=db.pstmt.executeUpdate();
               if(x>0)
               {
               
               response.sendRedirect("event.jsp?msg=Events add Complete!!!!!!!...!!");
               }
               else
               {
               response.sendRedirect("event.jsp?msg=errror!!!!!!...!!...!!");
               
               
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
