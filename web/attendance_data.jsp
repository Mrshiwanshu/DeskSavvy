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
    <title>Attendance Logs - DeskSavvy</title>
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

      .dashboard-body { padding: 40px; flex: 1; min-width: 0; }

      @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
      .animate-1 { animation: fadeInUp 0.5s ease-out both; }

      .page-title { font-family: 'DM Serif Display', serif; font-size: 28px; color: var(--ink); margin-bottom: 8px; }
      .page-subtitle { color: #666; font-size: 15px; margin-bottom: 32px; }

      /* Table Styles */
      .table-wrapper {
        background: var(--white);
        border-radius: 16px;
        box-shadow: 0 12px 32px rgba(13,15,26,.04);
        border: 1px solid rgba(13,15,26,.05);
        overflow-x: auto;
      }

      .modern-table { width: 100%; border-collapse: collapse; text-align: left; }
      .modern-table th { background: #fafbfa; color: #888; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; padding: 20px 24px; border-bottom: 1px solid #eaeaea; }
      .modern-table td { padding: 18px 24px; font-size: 14.5px; color: var(--ink); border-bottom: 1px solid #f5f5f5; }
      .modern-table tr:hover td { background: #fafbfa; }

      .status-pill { padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; display: inline-flex; align-items: center; gap: 6px; }
      .status-pill.in { background: rgba(46, 213, 115, 0.1); color: #2ed573; }
      .status-pill.out { background: rgba(255, 71, 87, 0.1); color: #ff4757; }

      .back-link { display: inline-flex; align-items: center; gap: 8px; background: var(--white); color: var(--teal); border: 1px solid rgba(26,122,110,.2); text-decoration: none; font-size: 14px; font-weight: 600; padding: 10px 18px; border-radius: 8px; margin-bottom: 24px; transition: all .2s; box-shadow: 0 2px 8px rgba(13,15,26,.04); }
      .back-link:hover { background: var(--teal); color: var(--white); transform: translateY(-2px); box-shadow: 0 4px 12px rgba(26,122,110,.15); }
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
        <a href="empsal.jsp" class="nav-item"><i class="fas fa-money-check-alt"></i> Emp Salary</a>
        <a href="attendance_data.jsp" class="nav-item active"><i class="fas fa-clock"></i> Attendance Data</a>
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
        
        <a href="office_home.jsp" class="back-link animate-1"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

        <h1 class="page-title animate-1">Attendance Logs</h1>
        <p class="page-subtitle animate-1">Track employee check-in and check-out activity across your organization.</p>

        <div class="table-wrapper animate-1">
          <table class="modern-table">
            <thead>
              <tr>
                <th>Employee ID</th>
                <th>Clock-In Date</th>
                <th>Clock-In Time</th>
                <th>Clock-Out Date</th>
                <th>Clock-Out Time</th>
              </tr>
            </thead>
            <tbody>
              <%
                DBconnection db = new DBconnection();
                db.pstmt = db.con.prepareStatement("select * from attendance where com_id='"+user+"'");
                db.rst = db.pstmt.executeQuery();
                
                while(db.rst.next()) {
                  String empId = db.rst.getString(2);
                  String inDate = db.rst.getString(4);
                  String inTime = db.rst.getString(5);
                  String outDate = db.rst.getString(6);
                  String outTime = db.rst.getString(7);
              %>
              <tr>
                <td><strong><%= empId %></strong></td>
                <td><span class="status-pill in"><i class="fas fa-sign-in-alt"></i> <%= inDate %></span></td>
                <td><%= inTime %></td>
                <td><span class="status-pill out"><i class="fas fa-sign-out-alt"></i> <%= outDate != null ? outDate : "---" %></span></td>
                <td><%= outTime != null ? outTime : "---" %></td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>

      </div>
    </main>

  </body>
</html>