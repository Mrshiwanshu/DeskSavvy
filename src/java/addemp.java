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
public class addemp extends HttpServlet {

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
                         String user=(String)st.getAttribute("user1"); 
             String hname=request.getParameter("t1");
            String ownername=request.getParameter("t2");
            String city=request.getParameter("t3");
            String reg=request.getParameter("t4");
            String room=request.getParameter("t5");
            String pin=request.getParameter("t6");
           String phone=request.getParameter("t7");
              String fax=request.getParameter("t8");
           
              
           
               DBconnection db=new DBconnection();
               db.pstmt=db.con.prepareStatement("insert into addemp(cid,name,dep,city,state,address,pin,phone,email) values(?,?,?,?,?,?,?,?,?)");
               db.pstmt.setString(1, user);
               db.pstmt.setString(2, hname);
               db.pstmt.setString(3, ownername);
               db.pstmt.setString(4, city);
               db.pstmt.setString(5, reg);
               db.pstmt.setString(6 ,room);
               db.pstmt.setString(7, pin);
               db.pstmt.setString(8, phone);
               db.pstmt.setString(9, fax);
              
               int x=db.pstmt.executeUpdate();
               if(x>0)
               {
               
              db.pstmt=db.con.prepareStatement("insert into emp_login(emp_id,com_id,password) values(?,?,?)");
              db.pstmt.setString(1, fax);
              db.pstmt.setString(2, user);
              db.pstmt.setString(3, hname);
             
                   int y=db.pstmt.executeUpdate();
                   if(y>0)
                   {
                          response.sendRedirect("addEmp.jsp?msg=Employee Registration Complete!!!!!!!...!!");
                   }
               else
               {
               response.sendRedirect("addEmp.jsp?msg=User already Registred...!!...!!");
               
               
               }
               }
               else
               {
               response.sendRedirect("addEmp.jsp?msg=User already Registred...!!");
               
              
               }
        } catch(Exception e) {            
          
           response.sendRedirect("addEmp.jsp?msg=Please fill data proper way...!!");
               
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
