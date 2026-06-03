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
public class login extends HttpServlet {

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
           HttpSession st=request.getSession();
            String type=request.getParameter("t1");
            String user=request.getParameter("t2");
            String pass=request.getParameter("t3");
            out.println(type);
            out.println(user);
            DBconnection db=new DBconnection();
           
            db.pstmt=db.con.prepareStatement("select u_type from company_login where id='"+user+"' and pass='"+pass+"'");
           
             db.rst= db.pstmt.executeQuery();
             if(db.rst.next())
             {
           
             String type1=db.rst.getString(1);
          
                  if(type1.equals(type)&&type1.equals("company"))
                      {
          
                 st.setAttribute("user1", user);
               st.setAttribute("pass1", pass);
              //st.setAttribute("type1",type1);
              response.sendRedirect("office_home.jsp");
             
             }
              else           
                 if(type1.equals(type)&&type1.equals("emp"))
                 {
                    st.setAttribute("user2", user);
             st.setAttribute("pass2", pass);
             // st.setAttribute("type2",type1);
                 response.sendRedirect("empHome.jsp");
                 }
                 else           
                 if(type1.equals(type)&&type1.equals("admin"))
                 {
                    st.setAttribute("user3", user);
             st.setAttribute("pass3", pass);
             // st.setAttribute("type2",type1);
                 response.sendRedirect("adminHome.jsp");
                 }
   
                 else{
                     response.sendRedirect("index.jsp?msg=Invalid User TYPE!!!");
             
                 }
             } 
                  else{
                     response.sendRedirect("index.jsp?msg=Invalid User id and password!!!");
             
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
