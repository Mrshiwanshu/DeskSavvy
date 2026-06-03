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
    <title>My Attendance - DeskSavvy</title>
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
        --red:    #ff4757;
        --green:  #2ed573;
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

      html { overflow-y: auto !important; background-image: none !important; }

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

      .user-info { text-align: right; }
      .user-info .name { color: var(--white); font-size: 14px; font-weight: 500; }
      .user-info .role { color: rgba(201,168,76,.8); font-size: 12px; text-transform: uppercase; letter-spacing: 1px; }

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

      .logout-btn:hover { background: rgba(255,50,50,.1); color: #ff6b6b; border-color: rgba(255,50,50,.3); }

      /* ─── Main Content ───────────────────────── */
      .dashboard-container {
        padding: 48px 56px;
        max-width: 1000px;
        margin: 0 auto;
        width: 100%;
        position: relative;
        z-index: 10;
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .page-header {
        text-align: center;
        margin-bottom: 40px;
      }

      .page-header h1 {
        font-family: 'DM Serif Display', serif;
        font-size: 40px;
        color: var(--ink);
        margin-bottom: 8px;
      }

      .page-header p {
        color: #666;
        font-size: 16px;
      }

      /* ─── Attendance Card ────────────────────── */
      .attendance-card {
        background: var(--white);
        border-radius: 24px;
        padding: 48px;
        box-shadow: 0 16px 40px rgba(13,15,26,.06);
        width: 100%;
        max-width: 700px;
        text-align: center;
      }

      .realtime-clock {
        font-family: 'DM Sans', sans-serif;
        font-size: 48px;
        font-weight: 700;
        color: var(--ink);
        margin-bottom: 8px;
        letter-spacing: -1px;
      }

      .realtime-date {
        color: #888;
        font-size: 18px;
        font-weight: 500;
        margin-bottom: 40px;
        text-transform: uppercase;
        letter-spacing: 1px;
      }

      .action-buttons {
        display: flex;
        gap: 24px;
        justify-content: center;
        margin-bottom: 24px;
      }

      .clock-btn {
        flex: 1;
        max-width: 240px;
        padding: 24px 16px;
        border-radius: 16px;
        text-decoration: none;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 12px;
        transition: transform .3s, box-shadow .3s;
      }

      .clock-btn i { font-size: 32px; }
      .clock-btn span { font-size: 18px; font-weight: 600; font-family: 'DM Sans', sans-serif; }

      .btn-in {
        background: rgba(46, 213, 115, 0.1);
        color: var(--green);
        border: 2px solid rgba(46, 213, 115, 0.2);
      }

      .btn-in:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 24px rgba(46, 213, 115, 0.2);
        background: var(--green);
        color: white;
      }

      .btn-out {
        background: rgba(255, 71, 87, 0.1);
        color: var(--red);
        border: 2px solid rgba(255, 71, 87, 0.2);
      }

      .btn-out:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 24px rgba(255, 71, 87, 0.2);
        background: var(--red);
        color: white;
      }

      /* Alert Message */
      .alert-msg {
        margin-top: 24px;
        padding: 16px;
        border-radius: 8px;
        font-weight: 500;
        font-size: 15px;
      }

      .alert-success {
        background: rgba(46, 213, 115, 0.15);
        color: var(--teal-dk);
        border-left: 4px solid var(--green);
      }
      
      .back-link {
        margin-top: 32px;
        display: inline-block;
        color: var(--teal);
        text-decoration: none;
        font-weight: 500;
        transition: color .2s;
      }

      .back-link:hover { color: var(--teal-dk); text-decoration: underline; }

    </style>
  </head>
  <body>

    <!-- Header -->
    <header>
      <a href="empHome.jsp" class="logo">
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
      
      <div class="page-header">
        <h1>Daily Attendance</h1>
        <p>Record your entry and exit times accurately.</p>
      </div>

      <div class="attendance-card">
        
        <!-- Live Clock -->
        <div class="realtime-clock" id="clock">00:00:00 AM</div>
        <div class="realtime-date" id="date">Loading date...</div>

        <!-- Clock Action Buttons -->
        <div class="action-buttons">
          <a href="clockin" class="clock-btn btn-in">
            <i class="fas fa-sign-in-alt"></i>
            <span>Clock In</span>
          </a>

          <a href="clockout" class="clock-btn btn-out">
            <i class="fas fa-sign-out-alt"></i>
            <span>Clock Out</span>
          </a>
        </div>

        <!-- Success/Error Message -->
        <%
          String abc = request.getParameter("msg");
          if(abc != null && !abc.isEmpty()) {
              out.println("<div class='alert-msg alert-success'><i class='fas fa-check-circle'></i> " + abc + "</div>");
          }
        %>

      </div>

      <a href="empHome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

    </div>

    <!-- Live Clock Script -->
    <script>
      function updateClock() {
        const now = new Date();
        
        // Time Formatting
        let hours = now.getHours();
        let minutes = now.getMinutes();
        let seconds = now.getSeconds();
        const ampm = hours >= 12 ? 'PM' : 'AM';
        
        hours = hours % 12;
        hours = hours ? hours : 12; 
        minutes = minutes < 10 ? '0' + minutes : minutes;
        seconds = seconds < 10 ? '0' + seconds : seconds;
        
        const timeString = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
        document.getElementById('clock').textContent = timeString;

        // Date Formatting
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        document.getElementById('date').textContent = now.toLocaleDateString('en-US', options);
      }
      
      setInterval(updateClock, 1000);
      updateClock(); // Initial call
    </script>
  </body>
</html>