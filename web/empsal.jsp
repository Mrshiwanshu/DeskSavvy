<%@page import="DB.DBconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession st=request.getSession();
    String user=(String)st.getAttribute("user1");
    String pass=(String)st.getAttribute("pass1");
    if(user==null||pass==null) {
        response.sendRedirect("index.jsp?msg=Please login first!!!!");  
        return;
    }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Salary - DeskSavvy</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    
    <style>
      :root {
        --ink:    #0d0f1a;
        --paper:  #f4f6f8;
        --gold:   #c9a84c;
        --teal:   #1a7a6e;
        --teal-dk:#0f4f47;
        --white:  #ffffff;
        --red:    #ff4757;
        --gray:   #9fa2b4;
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
      body { background: var(--paper); color: var(--ink); font-family: 'DM Sans', sans-serif; font-weight: 400; min-height: 100vh; display: flex; overflow-x: hidden; }

      /* Sidebar & Header */
      .sidebar { width: 260px; background: var(--ink); color: var(--gray); height: 100vh; position: fixed; left: 0; top: 0; display: flex; flex-direction: column; z-index: 100; border-right: 1px solid rgba(255,255,255,.05); }
      .sidebar-brand { height: 80px; display: flex; flex-direction: column; justify-content: center; padding: 0 32px; font-family: 'DM Serif Display', serif; font-size: 24px; color: var(--gold); border-bottom: 1px solid rgba(255,255,255,.05); margin-bottom: 24px; }
      .sidebar-brand span { font-family: 'DM Sans', sans-serif; font-size: 11px; color: var(--white); opacity: .5; text-transform: uppercase; letter-spacing: 2px; margin-top: -4px; }
      .nav-menu { flex: 1; padding: 0 16px; }
      .nav-label { font-size: 11px; text-transform: uppercase; letter-spacing: 1.5px; margin: 24px 0 12px 16px; color: rgba(255,255,255,.3); font-weight: 600; }
      .nav-item { display: flex; align-items: center; gap: 16px; padding: 14px 16px; color: var(--gray); text-decoration: none; border-radius: 8px; transition: all .2s; font-size: 14.5px; margin-bottom: 4px; font-weight: 500; }
      .nav-item i { font-size: 16px; width: 20px; text-align: center; }
      .nav-item:hover, .nav-item.active { background: rgba(201,168,76,.1); color: var(--white); }
      .nav-item.active { border-left: 3px solid var(--gold); border-radius: 0 8px 8px 0; background: linear-gradient(90deg, rgba(201,168,76,.15) 0%, transparent 100%); }
      .nav-item:hover i, .nav-item.active i { color: var(--gold); }
      .sidebar-footer { padding: 24px; border-top: 1px solid rgba(255,255,255,.05); }

      .main-content { flex: 1; margin-left: 260px; display: flex; flex-direction: column; min-height: 100vh; min-width: 0; }
      .top-header { height: 80px; background: var(--white); display: flex; align-items: center; justify-content: flex-end; padding: 0 40px; box-shadow: 0 4px 20px rgba(13,15,26,.02); z-index: 10; }
      .header-profile { display: flex; align-items: center; gap: 16px; }
      .profile-info { text-align: right; }
      .profile-info .name { font-weight: 600; font-size: 14px; color: var(--ink); }
      .profile-info .role { font-size: 12px; color: #888; text-transform: uppercase; letter-spacing: .5px; }
      .avatar { width: 40px; height: 40px; border-radius: 50%; background: rgba(26,122,110,.1); color: var(--teal); display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 16px; }

      .dashboard-body { padding: 40px; flex: 1; min-width: 0; display: flex; flex-direction: column; align-items: center; }

      @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
      .animate-1 { animation: fadeInUp 0.5s ease-out both; }

      .form-card { background: var(--white); border-radius: 20px; padding: 40px; box-shadow: 0 12px 32px rgba(13,15,26,.05); border: 1px solid rgba(13,15,26,.05); width: 100%; max-width: 600px; margin-bottom: 24px; }
      
      .card-header { text-align: center; margin-bottom: 32px; }
      .card-header .icon { font-size: 36px; color: var(--teal); margin-bottom: 16px; }
      .card-header h2 { font-family: 'DM Serif Display', serif; font-size: 28px; color: var(--ink); margin-bottom: 8px; }
      .card-header p { color: #666; font-size: 14.5px; }

      .search-form { display: flex; gap: 16px; margin-bottom: 16px; }
      .search-form input { flex: 1; padding: 14px 16px; background: var(--paper); border: 1.5px solid #eaeaea; border-radius: 12px; font-family: 'DM Sans', sans-serif; font-size: 15px; color: var(--ink); outline: none; transition: all 0.3s ease; }
      .search-form input:focus { border-color: var(--teal); background: var(--white); box-shadow: 0 4px 16px rgba(26,122,110,.1); }
      .btn-submit { padding: 14px 24px; background: var(--teal); color: var(--white); border: none; border-radius: 12px; font-size: 15px; font-weight: 600; font-family: 'DM Sans', sans-serif; cursor: pointer; transition: all .2s; }
      .btn-submit:hover { background: var(--teal-dk); transform: translateY(-2px); box-shadow: 0 8px 20px rgba(26,122,110,.2); }

      .action-link-alt { text-align: center; display: block; color: var(--teal); font-weight: 600; text-decoration: none; font-size: 14.5px; margin-top: 16px; transition: color .2s; }
      .action-link-alt:hover { color: var(--teal-dk); text-decoration: underline; }

      /* Details Grid */
      .details-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 24px; }
      .form-group label { display: block; font-size: 12px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; color: #888; margin-bottom: 8px; }
      .form-group input { width: 100%; padding: 12px 16px; background: var(--paper); border: 1.5px solid #eaeaea; border-radius: 8px; font-family: 'DM Sans', sans-serif; font-size: 14.5px; color: var(--ink); outline: none; }
      .form-group input[readonly] { background: #f9fafb; color: #666; border-color: transparent; }

      .salary-highlight { background: rgba(201,168,76,.1); padding: 16px; border-radius: 12px; margin-bottom: 24px; border: 1px solid rgba(201,168,76,.2); display: flex; justify-content: space-between; align-items: center; }
      .salary-highlight span { font-weight: 600; color: var(--gold); font-size: 14px; text-transform: uppercase; letter-spacing: 1px; }
      .salary-highlight strong { font-size: 24px; color: var(--ink); }

      .alert-msg { padding: 16px; border-radius: 8px; font-weight: 500; font-size: 14.5px; text-align: center; background: rgba(46, 213, 115, 0.15); color: var(--teal-dk); border-left: 4px solid var(--teal); margin-bottom: 24px; }
    </style>
  </head>
  <body>

    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="sidebar-brand">DeskSavvy<span>Admin OS</span></div>
      <nav class="nav-menu">
        <div class="nav-label">Core Operations</div>
        <a href="office_home.jsp" class="nav-item"><i class="fas fa-home"></i> Dashboard</a>
        <a href="emp.jsp" class="nav-item"><i class="fas fa-users"></i> Employee Roster</a>
        <a href="event.jsp" class="nav-item"><i class="fas fa-calendar-alt"></i> Manage Events</a>
        
        <div class="nav-label">Finance & HR</div>
        <a href="empsal.jsp" class="nav-item active"><i class="fas fa-money-check-alt"></i> Emp Salary</a>
        <a href="attendance_data.jsp" class="nav-item"><i class="fas fa-clock"></i> Attendance Data</a>
        <a href="leave_data.jsp" class="nav-item"><i class="fas fa-calendar-minus"></i> View Leave</a>

        <div class="nav-label">Settings</div>
        <a href="CompanyChanPass.jsp" class="nav-item"><i class="fas fa-shield-alt"></i> Security</a>
      </nav>
      <div class="sidebar-footer">
        <a href="logout" class="nav-item" style="color: var(--red);"><i class="fas fa-sign-out-alt"></i> Sign Out</a>
      </div>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <header class="top-header">
        <div class="header-profile">
          <div class="profile-info">
            <div class="name"><%= user %></div>
            <div class="role">System Admin</div>
          </div>
          <div class="avatar"><%= user != null && user.length() > 0 ? user.substring(0, 1).toUpperCase() : "A" %></div>
        </div>
      </header>

      <div class="dashboard-body">
        
        <% 
          String m = request.getParameter("msg");
          if(m != null && !m.trim().isEmpty()) {
              out.println("<div class='form-card animate-1 alert-msg' style='margin-bottom:24px; padding:16px;'><i class='fas fa-info-circle'></i> " + m + "</div>");
          }
        %>

        <div class="form-card animate-1">
          <div class="card-header">
            <div class="icon"><i class="fas fa-search-dollar"></i></div>
            <h2>Update Salary</h2>
            <p>Enter an Employee ID to view or update their current salary.</p>
          </div>

          <form action="" method="post">
            <div class="search-form">
              <input type="number" name="t1" placeholder="Enter Employee ID" min="1" required />
              <button type="submit" class="btn-submit">Search</button>
            </div>
          </form>
          
          <a href="empsal13.jsp" class="action-link-alt"><i class="fas fa-file-invoice-dollar"></i> Calculate & Print Salary Slip</a>
        </div>

        <%
          DBconnection db = new DBconnection();
          String ab = request.getParameter("t1");
          
          if(ab != null && !ab.trim().isEmpty()) {
              
              String currentSal = "No salary Updated";
              db.pstmt = db.con.prepareStatement("select sal from salary where empid='"+ab+"'");
              db.rst = db.pstmt.executeQuery();
              if(db.rst.next()) {
                  currentSal = db.rst.getString(1);
              }
              
              db.pstmt = db.con.prepareStatement("select * from addemp where empid='"+ab+"'");
              db.rst = db.pstmt.executeQuery();
              
              if(db.rst.next()) {
                  String name=db.rst.getString(1);
                  String cname=db.rst.getString(2);
                  String id=db.rst.getString(3);
                  String gender=db.rst.getString(4);
                  String phone=db.rst.getString(5);
                  String course=db.rst.getString(6);
                  String room=db.rst.getString(7);
                  String city=db.rst.getString(8);
                  String email=db.rst.getString(9);
                  String web=db.rst.getString(10);
        %>
        
        <div class="form-card animate-1" style="animation-delay: 0.1s;">
          <h3 style="font-family: 'DM Serif Display', serif; font-size: 22px; margin-bottom: 24px; padding-bottom: 16px; border-bottom: 1px solid #eee;">Employee Details: <%= id %></h3>
          
          <div class="salary-highlight">
            <span>Current Salary</span>
            <strong><%= currentSal %></strong>
          </div>

          <form action="salary" method="post">
            <div class="details-grid">
              <div class="form-group"><label>Emp ID</label><input type="text" value="<%= name %>" name="t1" readonly/></div>
              <div class="form-group"><label>Company ID</label><input type="text" value="<%= cname %>" readonly/></div>
              <div class="form-group"><label>Name</label><input type="text" value="<%= id %>" name="t2" readonly/></div>
              <div class="form-group"><label>Department</label><input type="text" value="<%= gender %>" name="t3" readonly/></div>
              <div class="form-group"><label>City</label><input type="text" value="<%= phone %>" readonly/></div>
              <div class="form-group"><label>State</label><input type="text" value="<%= course %>" readonly/></div>
              <div class="form-group"><label>Address</label><input type="text" value="<%= room %>" readonly/></div>
              <div class="form-group"><label>PIN Code</label><input type="text" value="<%= city %>" readonly/></div>
              <div class="form-group"><label>Phone No.</label><input type="text" value="<%= email %>" readonly/></div>
              <div class="form-group"><label>Email Address</label><input type="text" value="<%= web %>" readonly/></div>
            </div>
            
            <div class="form-group" style="margin-bottom: 24px;">
              <label>Update Salary Amount</label>
              <input type="number" name="t4" min="1" placeholder="Enter new salary..." required style="border-color: var(--teal); background: white;"/>
            </div>
            
            <button type="submit" class="btn-submit" style="width: 100%;"><i class="fas fa-save"></i> Save Salary Update</button>
          </form>
        </div>

        <% 
              } else { 
        %>
          <div class="form-card animate-1" style="text-align: center; color: var(--red);">
             <i class="fas fa-exclamation-triangle" style="font-size: 32px; margin-bottom: 16px;"></i>
             <h3>No Data Found</h3>
             <p>No employee exists with ID: <%= ab %></p>
          </div>
        <% 
              }
          } 
        %>

      </div>
    </main>

  </body>
</html>