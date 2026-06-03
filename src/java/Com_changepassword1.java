/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class Com_changepassword1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             HttpSession st=request.getSession(true);
            
         String old=request.getParameter("t1");
            String npass=request.getParameter("t2");
            String user=(String)st.getAttribute("user1");
            DBconnection db=new DBconnection();
           
            db.pstmt=db.con.prepareStatement("select pass from company_login where id='"+user+"'");
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next())
            {
             String pass=db.rst.getString(1);
             if(pass.equals(old))
             {
             
             db.pstmt=db.con.prepareStatement("update company_login set pass=? where id='"+user+"'");
             db.pstmt.setString(1, npass);
             int i=db.pstmt.executeUpdate();
             if(i>0)
             {
            response.sendRedirect("CompanyChanPass.jsp?msg=Password change successfull..");
              
             }
             }
             
             else
             {
             response.sendRedirect("CompanyChanPass.jsp?msg=Old Password not match!!!!");
             }
            }
            
        
        } catch(Exception e) {            
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
