<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession st = request.getSession();
    String user = (String)st.getAttribute("user2");
    String pass = (String)st.getAttribute("pass2");
    String com_id = (String)st.getAttribute("comp");
    if(user == null || pass == null || com_id == null) {
        response.sendRedirect("support.jsp?msg=Please login first!!!!");
        return;
    }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Dashboard - DeskSavvy</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    <style>
      :root {
        --ink:    #0d0f1a;
        --paper:  #f7f5f0;
        --cream:  #ede9e0;
        --gold:   #c9a84c;
        --gold-lt:#f0d98a;
        --teal:   #1a7a6e;
        --teal-dk:#0f4f47;
        --white:  #ffffff;
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

      html {
        overflow-y: auto !important;
        background-image: none !important;
      }

      body {
        background: var(--paper);
        color: var(--ink);
        font-family: 'DM Sans', sans-serif;
        font-weight: 300;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
      }

      body::before {
        content: '';
        position: fixed;
        inset: 0;
        background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='1'/%3E%3C/svg%3E");
        opacity: .035;
        pointer-events: none;
        z-index: 9999;
      }

      /* ─── Header ─────────────────────────────── */
      header {
        background: var(--ink);
        padding: 0 56px;
        height: 68px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: sticky;
        top: 0;
        z-index: 100;
        border-bottom: 1px solid rgba(201,168,76,.25);
      }

      header .logo {
        font-family: 'DM Serif Display', serif;
        font-size: 24px;
        color: var(--gold);
        letter-spacing: .5px;
        text-decoration: none;
        display: flex;
        flex-direction: column;
      }

      header .logo span {
        color: var(--white);
        opacity: .6;
        font-size: 13px;
        font-family: 'DM Sans', sans-serif;
        letter-spacing: 3px;
        text-transform: uppercase;
        margin-top: -4px;
      }

      .user-profile {
        display: flex;
        align-items: center;
        gap: 16px;
      }

      .user-info {
        text-align: right;
      }

      .user-info .name {
        color: var(--white);
        font-size: 14px;
        font-weight: 500;
      }

      .user-info .role {
        color: rgba(201,168,76,.8);
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1px;
      }

      .logout-btn {
        background: rgba(255,255,255,.05);
        color: var(--white);
        border: 1px solid rgba(255,255,255,.1);
        padding: 8px 16px;
        border-radius: 6px;
        font-size: 13px;
        text-decoration: none;
        transition: all .2s;
      }

      .logout-btn:hover {
        background: rgba(255,50,50,.1);
        color: #ff6b6b;
        border-color: rgba(255,50,50,.3);
      }

      /* ─── Dashboard Content ──────────────────── */
      .dashboard-container {
        padding: 48px 56px;
        max-width: 1200px;
        margin: 0 auto;
        width: 100%;
        position: relative;
        z-index: 10;
        flex: 1;
      }

      .welcome-banner {
        background: var(--ink);
        border-radius: 20px;
        padding: 48px;
        color: var(--white);
        position: relative;
        overflow: hidden;
        margin-bottom: 40px;
        box-shadow: 0 20px 40px rgba(13,15,26,.15);
      }

      .welcome-banner::after {
        content: '';
        position: absolute;
        right: -50px; top: -50px;
        width: 300px; height: 300px;
        background: radial-gradient(circle, rgba(201,168,76,.15) 0%, transparent 70%);
        border-radius: 50%;
      }

      .welcome-banner h1 {
        font-family: 'DM Serif Display', serif;
        font-size: 40px;
        margin-bottom: 8px;
        position: relative;
        z-index: 2;
      }

      .welcome-banner p {
        color: rgba(255,255,255,.7);
        font-size: 16px;
        max-width: 500px;
        position: relative;
        z-index: 2;
      }

      /* ─── Grid Cards ─────────────────────────── */
      .action-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 24px;
      }

      .action-card {
        background: var(--white);
        border-radius: 16px;
        padding: 32px;
        text-decoration: none;
        color: var(--ink);
        box-shadow: 0 4px 12px rgba(13,15,26,.03);
        border: 1px solid rgba(13,15,26,.05);
        transition: transform .3s, box-shadow .3s, border-color .3s;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
      }

      .action-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 24px rgba(13,15,26,.08);
        border-color: var(--gold);
      }

      .card-icon {
        width: 56px;
        height: 56px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
        margin-bottom: 24px;
      }

      .icon-teal { background: rgba(26,122,110,.1); color: var(--teal); }
      .icon-gold { background: rgba(201,168,76,.1); color: var(--gold); }
      .icon-blue { background: rgba(50,115,220,.1); color: #3273dc; }
      .icon-purple { background: rgba(142,68,173,.1); color: #8e44ad; }
      .icon-red { background: rgba(255,56,96,.1); color: #ff3860; }

      .action-card h3 {
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 8px;
      }

      .action-card p {
        font-size: 14px;
        color: #666;
        line-height: 1.5;
        flex: 1;
      }

      /* ─── Responsive ─────────────────────────── */
      @media (max-width: 768px) {
        header { padding: 0 24px; }
        .dashboard-container { padding: 24px; }
        .welcome-banner { padding: 32px 24px; }
        .welcome-banner h1 { font-size: 32px; }
        .user-info { display: none; }
      }
    </style>
  </head>
  <body>

    <!-- Header -->
    <header>
      <a href="index.jsp" class="logo">
        DeskSavvy
        <span>Workspace OS</span>
      </a>
      
      <div class="user-profile">
        <div class="user-info">
          <div class="name"><%= user != null ? user : "Employee" %></div>
          <div class="role">Employee</div>
        </div>
        <a href="emplogout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </div>
    </header>

    <div class="dashboard-container">
      
      <!-- Welcome Banner -->
      <div class="welcome-banner">
        <h1>Welcome back, <%= user != null ? user : "Employee" %>!</h1>
        <p>Here is your daily overview. Manage your attendance, view salaries, and stay updated with company events all in one place.</p>
      </div>

      <!-- Quick Actions Grid -->
      <div class="action-grid">
        
        <!-- Attendance -->
        <a href="attendance.jsp" class="action-card">
          <div class="card-icon icon-blue">
            <i class="fas fa-user-clock"></i>
          </div>
          <h3>My Attendance</h3>
          <p>Mark your daily presence and view your monthly attendance records.</p>
        </a>

        <!-- Leave -->
        <a href="leave.jsp" class="action-card">
          <div class="card-icon icon-red">
            <i class="fas fa-calendar-times"></i>
          </div>
          <h3>Apply Leave</h3>
          <p>Submit a new leave request and track the status of pending approvals.</p>
        </a>

        <!-- Salary -->
        <a href="empsal11.jsp" class="action-card">
          <div class="card-icon icon-teal">
            <i class="fas fa-file-invoice-dollar"></i>
          </div>
          <h3>Salary Details</h3>
          <p>View your monthly salary slips, deductions, and payment history.</p>
        </a>

        <!-- Events -->
        <a href="view_event.jsp" class="action-card">
          <div class="card-icon icon-purple">
            <i class="fas fa-bullhorn"></i>
          </div>
          <h3>Company Events</h3>
          <p>Stay informed about upcoming meetings, holidays, and announcements.</p>
        </a>

        <!-- Settings -->
        <a href="empchangePass.jsp" class="action-card">
          <div class="card-icon icon-gold">
            <i class="fas fa-key"></i>
          </div>
          <h3>Change Password</h3>
          <p>Update your account security credentials and manage profile access.</p>
        </a>

      </div>

    </div>

  </body>
</html>
