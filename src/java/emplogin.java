/*
 * To change this template, choose Tools | Templates
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
public class emplogin extends HttpServlet {

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
            HttpSession st=request.getSession();
            String user=request.getParameter("t1");
            String pass=request.getParameter("t2");
            DBconnection db=new DBconnection();
           
            db.pstmt=db.con.prepareStatement("select com_id from emp_login where emp_id='"+user+"' and password='"+pass+"'");
           
             db.rst= db.pstmt.executeQuery();
             if(db.rst.next())
             {
             String com_id=db.rst.getString(1);
          
              st.setAttribute("user2", user);
             st.setAttribute("pass2", pass);
             st.setAttribute("comp", com_id);
            
             // st.setAttribute("type2",type1);
             response.sendRedirect("empHome.jsp");
           
             }
             else
             {
             
              response.sendRedirect("support.jsp?msg=Invalid User id and password!!!");
           
             
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
