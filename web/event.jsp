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
    <title>Manage Events - DeskSavvy</title>
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
        display: flex;
        justify-content: center;
      }

      /* Animations */
      @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }

      /* ─── Event Form Card ────────────────────── */
      .form-container {
        width: 100%;
        max-width: 600px;
        animation: fadeInUp 0.5s ease-out;
      }

      .form-card {
        background: var(--white);
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 12px 32px rgba(13,15,26,.05);
        border: 1px solid rgba(13,15,26,.05);
      }

      .card-header {
        text-align: center;
        margin-bottom: 32px;
      }

      .card-header .icon {
        font-size: 36px;
        color: var(--gold);
        margin-bottom: 16px;
      }

      .card-header h2 {
        font-family: 'DM Serif Display', serif;
        font-size: 28px;
        color: var(--ink);
        margin-bottom: 8px;
      }

      .card-header p {
        color: #666;
        font-size: 14.5px;
      }

      .form-group {
        margin-bottom: 24px;
      }

      .form-group label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: var(--ink);
        margin-bottom: 8px;
      }

      .form-group input, .form-group textarea {
        width: 100%;
        padding: 16px;
        background: var(--paper);
        border: 1.5px solid #eaeaea;
        border-radius: 12px;
        font-family: 'DM Sans', sans-serif;
        font-size: 15px;
        color: var(--ink);
        outline: none;
        transition: all 0.3s ease;
      }

      .form-group textarea {
        resize: vertical;
        min-height: 120px;
      }

      .form-group input:focus, .form-group textarea:focus {
        border-color: var(--teal);
        background: var(--white);
        box-shadow: 0 4px 16px rgba(26,122,110,.1);
      }

      .btn-group {
        display: flex;
        gap: 16px;
        margin-top: 32px;
      }

      .btn {
        flex: 1;
        padding: 16px;
        border: none;
        border-radius: 12px;
        font-size: 15px;
        font-weight: 600;
        font-family: 'DM Sans', sans-serif;
        cursor: pointer;
        transition: all .2s;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
      }

      .btn-submit {
        background: var(--teal);
        color: var(--white);
      }

      .btn-submit:hover {
        background: var(--teal-dk);
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(26,122,110,.2);
      }

      .btn-reset {
        background: #f1f1f1;
        color: #555;
      }

      .btn-reset:hover {
        background: #e4e4e4;
        color: #333;
      }

      .alert-msg {
        margin-top: 24px;
        padding: 16px;
        border-radius: 8px;
        font-weight: 500;
        font-size: 14.5px;
        text-align: center;
        background: rgba(46, 213, 115, 0.15);
        color: var(--teal-dk);
        border-left: 4px solid var(--teal);
        animation: fadeInUp 0.4s ease-out;
      }

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
        <a href="emp.jsp" class="nav-item"><i class="fas fa-users"></i> Employee Roster</a>
        <a href="event.jsp" class="nav-item active"><i class="fas fa-calendar-alt"></i> Manage Events</a>
        
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
          <input type="text" placeholder="Search events..." disabled>
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
        
        <div class="form-container">
          <div class="form-card">
            
            <div class="card-header">
              <div class="icon"><i class="fas fa-bullhorn"></i></div>
              <h2>Broadcast Event</h2>
              <p>Publish a new announcement or schedule a company-wide event for all employees.</p>
            </div>

            <form method="post" action="event">
              
              <div class="form-group">
                <label>Event Subject / Title</label>
                <input type="text" name="t1" placeholder="e.g., Annual Tech Conference 2026" required>
              </div>

              <div class="form-group">
                <label>Event Details & Agenda</label>
                <textarea name="t2" placeholder="Provide complete details regarding the event..." required></textarea>
              </div>

              <div class="btn-group">
                <button type="reset" class="btn btn-reset"><i class="fas fa-undo"></i> Clear</button>
                <button type="submit" class="btn btn-submit"><i class="fas fa-paper-plane"></i> Publish Event</button>
              </div>

              <%
                String abc = request.getParameter("msg");
                if(abc != null && !abc.trim().isEmpty()) {
                    out.println("<div class='alert-msg'><i class='fas fa-check-circle'></i> " + abc + "</div>");
                }
              %>

            </form>

          </div>
        </div>

      </div>
    </main>

  </body>
</html>