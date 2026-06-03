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
    <title>Salary Slip - DeskSavvy</title>
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

      .form-card { background: var(--white); border-radius: 20px; padding: 40px; box-shadow: 0 12px 32px rgba(13,15,26,.05); border: 1px solid rgba(13,15,26,.05); width: 100%; max-width: 600px; margin-bottom: 24px; position: relative; }
      
      .card-header { text-align: center; margin-bottom: 32px; }
      .card-header .icon { font-size: 36px; color: var(--teal); margin-bottom: 16px; }
      .card-header h2 { font-family: 'DM Serif Display', serif; font-size: 28px; color: var(--ink); margin-bottom: 8px; }
      .card-header p { color: #666; font-size: 14.5px; }

      .search-form { display: flex; gap: 16px; margin-bottom: 16px; }
      .search-form input { flex: 1; padding: 14px 16px; background: var(--paper); border: 1.5px solid #eaeaea; border-radius: 12px; font-family: 'DM Sans', sans-serif; font-size: 15px; color: var(--ink); outline: none; transition: all 0.3s ease; }
      .search-form input:focus { border-color: var(--teal); background: var(--white); box-shadow: 0 4px 16px rgba(26,122,110,.1); }
      .btn-submit { padding: 14px 24px; background: var(--teal); color: var(--white); border: none; border-radius: 12px; font-size: 15px; font-weight: 600; font-family: 'DM Sans', sans-serif; cursor: pointer; transition: all .2s; }
      .btn-submit:hover { background: var(--teal-dk); transform: translateY(-2px); box-shadow: 0 8px 20px rgba(26,122,110,.2); }

      .back-link-wrapper { width: 100%; max-width: 600px; margin: 0 auto 16px auto; display: flex; }
      .back-link { display: inline-flex; align-items: center; gap: 8px; background: var(--white); color: var(--teal); border: 1px solid rgba(26,122,110,.2); text-decoration: none; font-size: 14px; font-weight: 600; padding: 10px 18px; border-radius: 8px; transition: all .2s; box-shadow: 0 2px 8px rgba(13,15,26,.04); }
      .back-link:hover { background: var(--teal); color: var(--white); transform: translateY(-2px); box-shadow: 0 4px 12px rgba(26,122,110,.15); }

      /* Slip Styles */
      .slip-header { border-bottom: 2px solid var(--paper); padding-bottom: 20px; margin-bottom: 30px; text-align: center; }
      .slip-header h1 { font-family: 'DM Serif Display', serif; font-size: 24px; color: var(--ink); margin-bottom: 5px; }
      .slip-header p { font-size: 13px; color: var(--gray); text-transform: uppercase; letter-spacing: 2px; }

      .slip-details { margin-bottom: 30px; }
      .detail-item { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid var(--paper); }
      .detail-label { font-size: 13px; font-weight: 700; color: var(--gray); text-transform: uppercase; }
      .detail-value { font-size: 15px; font-weight: 500; color: var(--ink); }

      .earning-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
      .earning-table th { text-align: left; background: var(--paper); padding: 12px 15px; font-size: 12px; text-transform: uppercase; letter-spacing: 1px; color: var(--gray); }
      .earning-table td { padding: 15px; border-bottom: 1px solid var(--paper); font-size: 15px; }
      .total-row { background: rgba(26,122,110,.05); font-weight: 700; color: var(--teal); }

      .slip-footer { margin-top: 50px; display: flex; justify-content: space-between; }
      .signature-box { width: 150px; border-top: 1px solid var(--ink); padding-top: 10px; text-align: center; font-size: 12px; font-weight: 600; }

      .btn-print { position: absolute; top: 30px; right: 30px; padding: 10px 20px; background: var(--teal); color: var(--white); border: none; border-radius: 8px; font-size: 13px; font-weight: 600; cursor: pointer; transition: all .2s; }
      .btn-print:hover { background: var(--teal-dk); }

      @media print {
        .sidebar, .top-header, .back-link-wrapper, .btn-print { display: none !important; }
        .main-content { margin-left: 0 !important; }
        .dashboard-body { padding: 0 !important; }
        .form-card { box-shadow: none !important; border: 1px solid #eee !important; margin: 0 auto !important; }
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
        
        <div class="back-link-wrapper animate-1">
          <a href="empsal.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Salary Portal</a>
        </div>

        <div class="form-card animate-1">
          <div class="card-header">
            <div class="icon"><i class="fas fa-file-invoice-dollar"></i></div>
            <h2>Generate Salary Slip</h2>
            <p>Enter Employee ID to fetch current salary data and generate a printable slip.</p>
          </div>

          <form action="" method="post">
            <div class="search-form">
              <input type="number" name="t1" placeholder="Enter Employee ID" min="1" required />
              <button type="submit" class="btn-submit">Generate</button>
            </div>
          </form>
        </div>

        <%
          DBconnection db = new DBconnection();
          String ab = request.getParameter("t1");
          if(ab != null && !ab.trim().isEmpty()) {
              db.pstmt = db.con.prepareStatement("select sal,name from salary where empid='"+ab+"'");
              db.rst = db.pstmt.executeQuery();
              if(db.rst.next()) {
                  int baseSal = Integer.parseInt(db.rst.getString(1));
                  String empName = db.rst.getString(2);
                  int pf = (baseSal * 5) / 100;
                  int hra = (baseSal * 10) / 100;
                  int total_adj = pf - hra; 
                  int finalSal = baseSal - total_adj;
        %>

        <div class="form-card animate-1" style="animation-delay: 0.1s; padding: 60px;">
          <button class="btn-print" onclick="window.print()"><i class="fas fa-print"></i> Print Slip</button>
          
          <div class="slip-header">
            <h1><%= user %></h1>
            <p>Monthly Salary Statement</p>
          </div>

          <div class="slip-details">
            <div class="detail-item">
              <span class="detail-label">Employee Name</span>
              <span class="detail-value"><%= empName %></span>
            </div>
            <div class="detail-item">
              <span class="detail-label">Employee ID</span>
              <span class="detail-value"><%= ab %></span>
            </div>
            <div class="detail-item">
              <span class="detail-label">Statement For</span>
              <span class="detail-value"><%= new java.text.SimpleDateFormat("MMMM yyyy").format(new java.util.Date()) %></span>
            </div>
          </div>

          <table class="earning-table">
            <thead>
              <tr>
                <th>Description</th>
                <th style="text-align: right;">Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Basic Salary</td>
                <td style="text-align: right;"><%= baseSal %></td>
              </tr>
              <tr>
                <td>Provident Fund (PF) 5%</td>
                <td style="text-align: right;">-<%= pf %></td>
              </tr>
              <tr>
                <td>HRA Allowance 10%</td>
                <td style="text-align: right;">+<%= hra %></td>
              </tr>
              <tr class="total-row">
                <td>Net Payable Salary</td>
                <td style="text-align: right;">₹<%= finalSal %></td>
              </tr>
            </tbody>
          </table>

          <div class="slip-footer">
            <div class="signature-box">Employee Signature</div>
            <div class="signature-box">Director</div>
          </div>
        </div>

        <% 
              } else {
        %>
          <div class="form-card animate-1" style="text-align: center; color: var(--red);">
             <i class="fas fa-exclamation-triangle" style="font-size: 32px; margin-bottom: 16px;"></i>
             <h3>No Salary Data</h3>
             <p>No salary record found for ID: <%= ab %></p>
          </div>
        <%
              }
          }
        %>

      </div>
    </main>

  </body>
</html>