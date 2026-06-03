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
    <title>Employee Management - DeskSavvy</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    
    <style>
      :root {
        --ink:    #0d0f1a;
        --ink-light: #161a2b;
        --paper:  #f4f6f8;
        --cream:  #ede9e0;
        --gold:   #c9a84c;
        --teal:   #1a7a6e;
        --teal-dk:#0f4f47;
        --white:  #ffffff;
        --red:    #ff4757;
        --gray:   #9fa2b4;
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

      body {
        background: var(--paper);
        color: var(--ink);
        font-family: 'DM Sans', sans-serif;
        font-weight: 400;
        min-height: 100vh;
        display: flex;
        overflow-x: hidden;
      }

      /* ─── Sidebar ─────────────────────────────── */
      .sidebar {
        width: 260px;
        background: var(--ink);
        color: var(--gray);
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
        display: flex;
        flex-direction: column;
        z-index: 100;
        border-right: 1px solid rgba(255,255,255,.05);
      }

      .sidebar-brand {
        height: 80px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 0 32px;
        font-family: 'DM Serif Display', serif;
        font-size: 24px;
        color: var(--gold);
        letter-spacing: .5px;
        border-bottom: 1px solid rgba(255,255,255,.05);
        margin-bottom: 24px;
      }

      .sidebar-brand span {
        font-family: 'DM Sans', sans-serif;
        font-size: 11px;
        color: var(--white);
        opacity: .5;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-top: -4px;
      }

      .nav-menu {
        flex: 1;
        padding: 0 16px;
      }

      .nav-label {
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        margin: 24px 0 12px 16px;
        color: rgba(255,255,255,.3);
        font-weight: 600;
      }

      .nav-item {
        display: flex;
        align-items: center;
        gap: 16px;
        padding: 14px 16px;
        color: var(--gray);
        text-decoration: none;
        border-radius: 8px;
        transition: all .2s;
        font-size: 14.5px;
        margin-bottom: 4px;
        font-weight: 500;
      }

      .nav-item i {
        font-size: 16px;
        width: 20px;
        text-align: center;
        transition: color .2s;
      }

      .nav-item:hover, .nav-item.active {
        background: rgba(201,168,76,.1);
        color: var(--white);
      }

      .nav-item.active {
        border-left: 3px solid var(--gold);
        border-radius: 0 8px 8px 0;
        background: linear-gradient(90deg, rgba(201,168,76,.15) 0%, transparent 100%);
      }

      .nav-item:hover i, .nav-item.active i {
        color: var(--gold);
      }

      .sidebar-footer {
        padding: 24px;
        border-top: 1px solid rgba(255,255,255,.05);
      }

      /* ─── Main Content ───────────────────────── */
      .main-content {
        flex: 1;
        margin-left: 260px;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
      }

      /* ─── Top Header ─────────────────────────── */
      .top-header {
        height: 80px;
        background: var(--white);
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 40px;
        box-shadow: 0 4px 20px rgba(13,15,26,.02);
        z-index: 10;
      }

      .header-search {
        position: relative;
        width: 300px;
      }

      .header-search i {
        position: absolute;
        left: 16px;
        top: 50%;
        transform: translateY(-50%);
        color: #bbb;
      }

      .header-search input {
        width: 100%;
        padding: 10px 16px 10px 42px;
        border-radius: 100px;
        border: 1px solid #eaeaea;
        background: #fcfcfc;
        outline: none;
        font-family: 'DM Sans', sans-serif;
        font-size: 14px;
        transition: all .2s;
      }

      .header-search input:focus {
        border-color: var(--teal);
        box-shadow: 0 0 0 3px rgba(26,122,110,.1);
      }

      .header-profile {
        display: flex;
        align-items: center;
        gap: 16px;
        border-left: 1px solid #eaeaea;
        padding-left: 24px;
      }

      .profile-info { text-align: right; }
      .profile-info .name { font-weight: 600; font-size: 14px; color: var(--ink); }
      .profile-info .role { font-size: 12px; color: #888; text-transform: uppercase; letter-spacing: .5px; }

      .avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: rgba(26,122,110,.1);
        color: var(--teal);
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 700;
        font-size: 16px;
      }

      /* ─── Dashboard Body ─────────────────────── */
      .dashboard-body {
        padding: 40px;
        flex: 1;
      }

      .page-title {
        font-family: 'DM Serif Display', serif;
        font-size: 28px;
        color: var(--ink);
        margin-bottom: 8px;
      }

      .page-subtitle {
        color: #666;
        font-size: 15px;
        margin-bottom: 32px;
      }

      /* ─── Admin Actions Grid ─────────────────── */
      .admin-actions {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
        gap: 24px;
        margin-top: 24px;
      }

      .action-panel {
        background: var(--white);
        border-radius: 16px;
        padding: 32px;
        text-decoration: none;
        color: var(--ink);
        border: 1px solid rgba(13,15,26,.05);
        transition: all .2s;
        display: flex;
        align-items: flex-start;
        gap: 20px;
        position: relative;
        overflow: hidden;
      }

      .action-panel:hover {
        border-color: var(--teal);
        box-shadow: 0 12px 32px rgba(26,122,110,.08);
        transform: translateY(-4px);
      }

      .action-panel .panel-icon {
        width: 56px;
        height: 56px;
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 22px;
        flex-shrink: 0;
        transition: all .2s;
      }

      /* Unique Colors for Modules */
      .mod-add .panel-icon { background: rgba(46, 213, 115, 0.1); color: #2ed573; }
      .mod-view .panel-icon { background: rgba(52,152,219,.1); color: #3498db; }
      .mod-sal .panel-icon { background: rgba(201,168,76,.15); color: var(--gold); }
      .mod-att .panel-icon { background: rgba(155, 89, 182, 0.1); color: #9b59b6; }
      .mod-leave .panel-icon { background: rgba(255,71,87,.1); color: var(--red); }

      .action-panel:hover .panel-icon { transform: scale(1.05); }

      .panel-content h3 {
        font-family: 'DM Serif Display', serif;
        font-size: 22px;
        margin-bottom: 6px;
      }

      .panel-content p {
        font-size: 14px;
        color: #666;
        line-height: 1.5;
        margin-bottom: 16px;
      }

      .panel-content .btn-text {
        font-size: 13px;
        font-weight: 600;
        color: var(--teal);
        display: flex;
        align-items: center;
        gap: 6px;
      }

      .action-panel:hover .btn-text { color: var(--teal-dk); }
      .action-panel:hover .btn-text i { transform: translateX(4px); transition: transform 0.2s;}

      /* Animations */
      @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
      .animate-1 { animation: fadeInUp 0.5s ease-out both; }
      .animate-2 { animation: fadeInUp 0.5s ease-out 0.1s both; }
      .animate-3 { animation: fadeInUp 0.5s ease-out 0.2s both; }
      .animate-4 { animation: fadeInUp 0.5s ease-out 0.3s both; }
      .animate-5 { animation: fadeInUp 0.5s ease-out 0.4s both; }

    </style>
  </head>
  <body>

    <!-- ─── Sidebar ──────────────────────────────────── -->
    <aside class="sidebar">
      <div class="sidebar-brand">
        DeskSavvy
        <span>Admin OS</span>
      </div>

      <nav class="nav-menu">
        <div class="nav-label">Core Operations</div>
        <a href="office_home.jsp" class="nav-item"><i class="fas fa-home"></i> Dashboard</a>
        <a href="emp.jsp" class="nav-item active"><i class="fas fa-users"></i> Employee Roster</a>
        <a href="event.jsp" class="nav-item"><i class="fas fa-calendar-alt"></i> Manage Events</a>
        
        <div class="nav-label">Settings</div>
        <a href="CompanyChanPass.jsp" class="nav-item"><i class="fas fa-shield-alt"></i> Security</a>
      </nav>

      <div class="sidebar-footer">
        <a href="logout" class="nav-item" style="color: var(--red);"><i class="fas fa-sign-out-alt"></i> Sign Out</a>
      </div>
    </aside>

    <!-- ─── Main Content ─────────────────────────────── -->
    <main class="main-content">
      
      <!-- Top Header -->
      <header class="top-header">
        <div class="header-search">
          <i class="fas fa-search"></i>
          <input type="text" placeholder="Search employees, records..." disabled>
        </div>

        <div class="header-profile">
          <div class="profile-info">
            <div class="name"><%= user %></div>
            <div class="role">System Admin</div>
          </div>
          <div class="avatar">
            <%= user != null && user.length() > 0 ? user.substring(0, 1).toUpperCase() : "A" %>
          </div>
        </div>
      </header>

      <!-- Dashboard Body -->
      <div class="dashboard-body">
        
        <h1 class="page-title animate-1">Workforce Directory</h1>
        <p class="page-subtitle animate-1">Manage employee profiles, track attendance, approve leaves, and calculate salaries.</p>

        <!-- HR Actions Grid -->
        <div class="admin-actions">
          
          <!-- Add Employee -->
          <a href="addEmp.jsp" class="action-panel animate-1 mod-add">
            <div class="panel-icon"><i class="fas fa-user-plus"></i></div>
            <div class="panel-content">
              <h3>Onboard Employee</h3>
              <p>Register a new staff member, generate credentials, and add them to the company database.</p>
              <div class="btn-text">Add Record <i class="fas fa-arrow-right"></i></div>
            </div>
          </a>

          <!-- View Employees -->
          <a href="viewemp.jsp" class="action-panel animate-2 mod-view">
            <div class="panel-icon"><i class="fas fa-address-book"></i></div>
            <div class="panel-content">
              <h3>Staff Directory</h3>
              <p>View complete list of all active and inactive employees across the organization.</p>
              <div class="btn-text">View Directory <i class="fas fa-arrow-right"></i></div>
            </div>
          </a>

          <!-- Salary -->
          <a href="empsal.jsp" class="action-panel animate-3 mod-sal">
            <div class="panel-icon"><i class="fas fa-money-check-alt"></i></div>
            <div class="panel-content">
              <h3>Salary & Payroll</h3>
              <p>Manage monthly salaries, deductions, and issue payment records to the workforce.</p>
              <div class="btn-text">Manage Payroll <i class="fas fa-arrow-right"></i></div>
            </div>
          </a>

          <!-- Attendance -->
          <a href="attendance_data.jsp" class="action-panel animate-4 mod-att">
            <div class="panel-icon"><i class="fas fa-clock"></i></div>
            <div class="panel-content">
              <h3>Attendance Logs</h3>
              <p>Monitor daily clock-in/out records and track employee working hours.</p>
              <div class="btn-text">View Logs <i class="fas fa-arrow-right"></i></div>
            </div>
          </a>

          <!-- Leave Data -->
          <a href="leave_data.jsp" class="action-panel animate-5 mod-leave">
            <div class="panel-icon"><i class="fas fa-plane-departure"></i></div>
            <div class="panel-content">
              <h3>Leave Applications</h3>
              <p>Review submitted time-off requests, sick leaves, and manage approvals.</p>
              <div class="btn-text">Manage Leaves <i class="fas fa-arrow-right"></i></div>
            </div>
          </a>

        </div>

      </div>
    </main>

  </body>
</html>
