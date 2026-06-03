

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>
        <style>
            /* Basic styles for demo purposes */
            body {

                font-family: Arial, sans-serif;
                line-height: 1.6;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 20px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"], input[type="email"], input[type="password"] {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            button {
                background-color: #4CAF50;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            button:hover {
                background-color: #45a049;
            }
            @media screen and (max-width: 768px) {
                .container {
                    width: 90%;
                    margin: 10px auto;
                }
            }
        </style>
    </head>
     <%
        HttpSession st=request.getSession();
        String user=(String)st.getAttribute("user1");
        String pass=(String)st.getAttribute("pass1");
        if(user==null||pass==null)
          response.sendRedirect("index.jsp?msg=Please login first!!!!");  
        %>

    <body style=" background-color: pink ">

        <div class="container">
            <h2>Change Password</h2>
             <form method="post" action="Com_changepassword12">


                <div class="form-group">
                    <label for="srno">Old Password</label>
                    <input type="text" name="t1"   required>
                </div>
                <div class="form-group">
                    <label for="email">New Password</label>
                    <input type="text"  name="t2" required>
                </div>
                
                
                
                
                



                <button type="submit" value="Change">Change Password</button>

 
                   
                            <%
                            String abc=request.getParameter("msg");
                            if(abc!=null)
                            out.println("<h4 style='color:green;'>"+abc+"</h4>");
                            
                            %>

            </form>

        </div>

    </body>
</html>