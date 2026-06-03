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
    <title>Apply Leave - DeskSavvy</title>
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
        --red-dk: #d63031;
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
        max-width: 800px;
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
        animation: fadeInDown 0.6s ease-out;
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

      /* ─── Form Card & Animations ─────────────── */
      @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
      }
      
      @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
      }

      .leave-card {
        background: var(--white);
        border-radius: 24px;
        padding: 48px;
        box-shadow: 0 16px 40px rgba(13,15,26,.06);
        width: 100%;
        animation: fadeInUp 0.8s ease-out;
      }

      .form-group {
        margin-bottom: 24px;
        text-align: left;
      }

      .form-group label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: var(--ink);
        margin-bottom: 8px;
        letter-spacing: .5px;
      }

      .form-group input, .form-group textarea {
        width: 100%;
        padding: 14px 16px;
        background: var(--paper);
        border: 1px solid rgba(13,15,26,.1);
        border-radius: 8px;
        font-family: 'DM Sans', sans-serif;
        font-size: 15px;
        color: var(--ink);
        outline: none;
        transition: all 0.3s ease;
      }

      .form-group input:focus, .form-group textarea:focus {
        border-color: var(--teal);
        background: var(--white);
        box-shadow: 0 0 0 4px rgba(26,122,110,.1);
      }

      .form-group textarea {
        resize: vertical;
        min-height: 140px;
      }

      .btn-container {
        display: flex;
        gap: 16px;
        margin-top: 32px;
      }

      .btn {
        flex: 1;
        padding: 14px 24px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 600;
        font-family: 'DM Sans', sans-serif;
        cursor: pointer;
        transition: transform .2s, box-shadow .2s, background .2s;
        border: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
      }

      .btn:hover {
        transform: translateY(-2px);
      }

      .btn-submit {
        background: var(--teal);
        color: var(--white);
        box-shadow: 0 4px 12px rgba(26,122,110,.2);
      }

      .btn-submit:hover {
        background: var(--teal-dk);
        box-shadow: 0 8px 16px rgba(26,122,110,.3);
      }

      .btn-clear {
        background: rgba(255, 71, 87, 0.1);
        color: var(--red);
        border: 1px solid rgba(255, 71, 87, 0.2);
      }

      .btn-clear:hover {
        background: var(--red);
        color: var(--white);
        box-shadow: 0 4px 12px rgba(255, 71, 87, 0.2);
      }

      /* Alert Message */
      .alert-msg {
        margin-top: 24px;
        padding: 16px;
        border-radius: 8px;
        font-weight: 500;
        font-size: 15px;
        text-align: center;
        animation: fadeInDown 0.5s ease-out;
      }

      .alert-success {
        background: rgba(46, 213, 115, 0.15);
        color: #0f4f47;
        border-left: 4px solid #2ed573;
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
        <h1>Apply for Leave</h1>
        <p>Submit your leave request to management for approval.</p>
      </div>

      <div class="leave-card">
        
        <form method="post" action="leave">
          
          <div class="form-group">
            <label for="subject"><i class="fas fa-heading"></i> Subject / Reason</label>
            <input type="text" id="subject" name="t1" placeholder="e.g., Sick Leave for 2 days" required>
          </div>

          <div class="form-group">
            <label for="message"><i class="fas fa-align-left"></i> Detailed Message</label>
            <textarea id="message" name="t2" placeholder="Please provide additional details or dates..." required></textarea>
          </div>

          <div class="btn-container">
            <button type="submit" class="btn btn-submit">
              Submit Request <i class="fas fa-paper-plane"></i>
            </button>
            <button type="reset" class="btn btn-clear">
              Clear Form <i class="fas fa-undo"></i>
            </button>
          </div>

          <!-- Success/Error Message -->
          <%
            String abc = request.getParameter("msg");
            if(abc != null && !abc.isEmpty()) {
                out.println("<div class='alert-msg alert-success'><i class='fas fa-check-circle'></i> " + abc + "</div>");
            }
          %>

        </form>

      </div>

      <a href="empHome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

    </div>

  </body>
</html>