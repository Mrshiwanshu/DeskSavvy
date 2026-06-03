/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
public class registration extends HttpServlet {

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
           
            
            String hname=request.getParameter("t1");
            String ownername=request.getParameter("t2");
            String city=request.getParameter("t3");
            String reg=request.getParameter("t4");
            String room=request.getParameter("t5");
            String pin=request.getParameter("t6");
           String phone=request.getParameter("t7");
              String fax=request.getParameter("t8");
           String website=request.getParameter("t9");
           String pass=request.getParameter("t10");       
           String u_typ="company";
               DBconnection db=new DBconnection();
               db.pstmt=db.con.prepareStatement("insert into registration(cname,city,state,address,pin,phone,fax,email,website) values(?,?,?,?,?,?,?,?,?)");
               db.pstmt.setString(1, hname);
               db.pstmt.setString(2, ownername);
               db.pstmt.setString(3, city);
               db.pstmt.setString(4, reg);
               db.pstmt.setString(5, room);
               db.pstmt.setString(6, pin);
               db.pstmt.setString(7, phone);
               db.pstmt.setString(8, fax);
               db.pstmt.setString(9, website);
               int x=db.pstmt.executeUpdate();
               if(x>0)
               {
               
              db.pstmt=db.con.prepareStatement("insert into company_login(id,pass,u_type) values(?,?,?)");
              db.pstmt.setString(1, fax);
              db.pstmt.setString(2, pass);
              db.pstmt.setString(3, u_typ);
             
                   int y=db.pstmt.executeUpdate();
                   if(y>0)
                   {
                          response.sendRedirect("registration.jsp?msg=Registration Complete!!!!!!!...!!");
                   }
               else
               {
               response.sendRedirect("registration.jsp?msg=User already Registred...!!...!!");
               
               
               }
               }
               else
               {
               response.sendRedirect("registration.jsp?msg=User already Registred...!!");
               
              
               }
        } catch(Exception e) {            
          
           response.sendRedirect("registration.jsp?msg=Please fill data proper way...!!");
               
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
