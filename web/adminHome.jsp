
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
         <%
        
       out.println("<h2 style='color:green;'>Welcome to <span>"+user+"</span></h2>");
        %>

    </body>
</html>
