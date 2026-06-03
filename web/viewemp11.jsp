
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DBconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="author" content="Aldi Duzha" />
        <meta name="description" content="Free Bulma Login Template, part of Awesome Bulma Templates" />
        <meta name="keywords" content="bulma, login, page, website, template, free, awesome" />
        <link rel="canonical" href="https://aldi.github.io/bulma-login-template/" />
        <title>Desksavvy</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-social@1/bin/bulma-social.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <style>
            td{
                padding: 10px;
            }
        </style>
    </head>
    <body>

        
        
        <%
        HttpSession st=request.getSession();
        String user=(String)st.getAttribute("user3");
        String pass=(String)st.getAttribute("pass3");
        if(user==null||pass==null)
          response.sendRedirect("index.jsp?msg=Please login first!!!!");  
        %>

        
        
        <table>
            <tr>
                <td  >  <a href="index.jsp">  <button class="button is-block is-info is-large is-fullwidth">Home Page</button></a>


                </td>

                <td>  <a href="adminHome.jsp">  <button class="button is-block is-info is-large is-fullwidth">Home</button></a>
                </td>
                <td >  <a href="viewemp11.jsp">  <button class="button is-block is-info is-large is-fullwidth">View Company Date</button></a>
                </td>
                <td >  <a href="empsal12.jsp">  <button class="button is-block is-info is-large is-fullwidth">Employee Details</button></a>
                </td>
                <td >  <a href="CompanyChanPass11.jsp">  <button class="button is-block is-info is-large is-fullwidth">Change Password</button></a>
                </td>
                 <td >  <a href="index.jsp">  <button class="button is-block is-info is-large is-fullwidth">Logout</button></a>
                </td>


            </tr>
        </table>
           <center>
            
         
         
            <h1 style="color:darkmagenta; font-size: 50px; background: graytext">Current Company data</h1>            
            <%
           
           
            DBconnection db=new DBconnection();
            
            db.pstmt=db.con.prepareStatement("select * from registration ");
             db.rst= db.pstmt.executeQuery();
             out.println("<table width=1200   bgcolor=#B9E1F5>");

out.println("<tr height=10 bgcolor=#5DD0CF>");
out.println("<td align=center><p style=color:#F66755;>Id</p></td><td align=center><p style=color:#F66755;> Name</p></td><td align=center><p style=color:#F66755;>City</p></td><td align=center><p style=color:#F66755;>State</p></td><td align=center><p style=color:#F66755;>Address</p></td><td align=center><p style=color:#F66755;>Pin</p></td><td align=center><p style=color:#F66755;>Phone</p></td><td align=center><p style=color:#F66755;>Fax Number</p></td><td align=center><p style=color:#F66755;>Email</p></td><td align=center><p style=color:#F66755;>Website</p></td><td align=center><p style=color:#F66755;>Delete</p></td><td align=center><p style=color:#F66755;>View Data</p></td><td align=center><p style=color:#F66755;>Total </p></td> ");
out.println("</tr>");
             
             while(db.rst.next())
             {
           String name=db.rst.getString(1);
            String cname=db.rst.getString(2);
             String id=db.rst.getString(3);
             String gender=db.rst.getString(4);
             String phone=db.rst.getString(5);
             String course=db.rst.getString(6);
             String room=db.rst.getString(7);
             String city=db.rst.getString(8);
             String pin=db.rst.getString(9);
             String web=db.rst.getString(10);
              PreparedStatement ps=db.con.prepareStatement("SELECT COUNT(empid) FROM addemp WHERE cid='"+cname+"'");
              db.rst1= ps.executeQuery();
             db.rst1.next();
             String count=db.rst1.getString(1);
            
   out.println("<tr bgcolor=#DFF5E1 height=30px><td align=center>"+name+"</td><td>"+cname+"</td><td>"+id+"</td><td>"+gender+"</td><td>"+phone+"</td><td>"+course+"</td><td>"+room+"</td><td>"+city+"</td><td>"+pin+"</td><td>"+web+"</td><td><a href=delete11?id="+name+">Delete</a></td><td><a href=viewdata11.jsp?id="+name+">View Data</a></td><td>"+count+"</td>");
out.println("</tr>");          
            
           }
             
            out.println("</table>");
         
                    %>
               
                
        </center>
 
        <section class="hero is-fullheight">
            <div class="hero-body">
                
             

                <div class="container has-text-centered">
                    
      
                  
                </div>
            </div>
            <div class="hero-foot">
                <div class="container has-text-centered">

                </div>
            </div>
        </section>
        

    </body>
</html>
