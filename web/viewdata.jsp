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
    <title>Employee Profile - DeskSavvy</title>
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

      /* Dashboard Body */
      .dashboard-body { padding: 40px; flex: 1; min-width: 0; display: flex; flex-direction: column; align-items: center;}

      @keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
      .animate-1 { animation: fadeInUp 0.5s ease-out both; }

      .profile-card {
        background: var(--white);
        border-radius: 20px;
        width: 100%;
        max-width: 600px;
        box-shadow: 0 12px 32px rgba(13,15,26,.04);
        border: 1px solid rgba(13,15,26,.05);
        overflow: hidden;
        margin-top: 24px;
      }

      .profile-header {
        background: linear-gradient(135deg, var(--teal) 0%, var(--teal-dk) 100%);
        padding: 40px;
        color: var(--white);
        text-align: center;
        position: relative;
      }

      .profile-header .icon-bg {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        background: rgba(255,255,255,.2);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 32px;
        margin: 0 auto 16px auto;
        box-shadow: 0 4px 12px rgba(0,0,0,.1);
      }

      .profile-header h2 {
        font-family: 'DM Serif Display', serif;
        font-size: 28px;
        margin-bottom: 4px;
      }
      .profile-header p {
        font-size: 14px;
        opacity: .8;
        letter-spacing: 1px;
        text-transform: uppercase;
      }

      .profile-body {
        padding: 40px;
      }

      .info-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 16px 0;
        border-bottom: 1px solid #f1f1f1;
      }

      .info-row:last-child {
        border-bottom: none;
      }

      .info-label {
        font-size: 12px;
        font-weight: 700;
        color: #888;
        text-transform: uppercase;
        letter-spacing: 1px;
        width: 35%;
      }

      .info-value {
        font-size: 15px;
        font-weight: 500;
        color: var(--ink);
        width: 65%;
        text-align: right;
      }

      .btn-print {
        position: absolute;
        top: 20px;
        right: 20px;
        background: rgba(255,255,255,.2);
        border: none;
        color: white;
        padding: 8px 16px;
        border-radius: 8px;
        font-family: 'DM Sans', sans-serif;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
        transition: all .2s;
        display: flex;
        align-items: center;
        gap: 6px;
      }

      .btn-print:hover {
        background: rgba(255,255,255,.3);
      }

      .back-link-wrapper { width: 100%; max-width: 600px; margin: 0 auto 16px auto; display: flex; }
      .back-link { display: inline-flex; align-items: center; gap: 8px; background: var(--white); color: var(--teal); border: 1px solid rgba(26,122,110,.2); text-decoration: none; font-size: 14px; font-weight: 600; padding: 10px 18px; border-radius: 8px; transition: all .2s; box-shadow: 0 2px 8px rgba(13,15,26,.04); }
      .back-link:hover { background: var(--teal); color: var(--white); transform: translateY(-2px); box-shadow: 0 4px 12px rgba(26,122,110,.15); }

      @media print {
        .sidebar, .top-header, .back-link, .btn-print { display: none !important; }
        .main-content { margin-left: 0 !important; }
        .dashboard-body { padding: 0 !important; }
        .profile-card { box-shadow: none !important; border: 1px solid #ccc !important; }
        body { background: white !important; }
      }

    </style>
  </head>
  <body>

    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="sidebar-brand">DeskSavvy<span>Admin OS</span></div>
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
        
        <div class="back-link-wrapper animate-1">
          <a href="viewemp.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Directory</a>
        </div>

        <div class="profile-card animate-1">
          <%
            DBconnection db=new DBconnection();
            String ab=request.getParameter("id");
            db.pstmt=db.con.prepareStatement("select * from addemp where empid='"+ab+"'");
            db.rst= db.pstmt.executeQuery();
            
            if(db.rst.next()) {
              String name = db.rst.getString(1);
              String cname = db.rst.getString(2);
              String id = db.rst.getString(3);
              String gender = db.rst.getString(4);
              String phone = db.rst.getString(5);
              String course = db.rst.getString(6);
              String room = db.rst.getString(7);
              String city = db.rst.getString(8);
              String email = db.rst.getString(9);
          %>
          
          <div class="profile-header">
            <button class="btn-print" onclick="window.print()"><i class="fas fa-print"></i> Print</button>
            <div class="icon-bg"><i class="fas fa-user-tie"></i></div>
            <h2><%= cname %></h2>
            <p><%= id %> &bull; <%= name %></p>
          </div>

          <div class="profile-body">
            
            <div class="info-row">
              <span class="info-label">Employee ID</span>
              <span class="info-value"><%= name %></span>
            </div>
            
            <div class="info-row">
              <span class="info-label">Full Name</span>
              <span class="info-value"><%= cname %></span>
            </div>

            <div class="info-row">
              <span class="info-label">Department</span>
              <span class="info-value"><%= id %></span>
            </div>

            <div class="info-row">
              <span class="info-label">City</span>
              <span class="info-value"><%= gender %></span>
            </div>

            <div class="info-row">
              <span class="info-label">State</span>
              <span class="info-value"><%= phone %></span>
            </div>

            <div class="info-row">
              <span class="info-label">Address</span>
              <span class="info-value"><%= course %></span>
            </div>

            <div class="info-row">
              <span class="info-label">PIN Code</span>
              <span class="info-value"><%= room %></span>
            </div>

            <div class="info-row">
              <span class="info-label">Phone No.</span>
              <span class="info-value"><%= city %></span>
            </div>

            <div class="info-row">
              <span class="info-label">Email Address</span>
              <span class="info-value"><%= email %></span>
            </div>

          </div>

          <% } else { %>
            <div class="profile-body" style="text-align:center; color: red;">
               <p>Employee record not found.</p>
            </div>
          <% } %>

        </div>
      </div>
    </main>

  </body>
</html>