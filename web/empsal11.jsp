<%@page import="DB.DBconnection"%>
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
    <title>Salary Details - DeskSavvy</title>
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

      .user-profile { display: flex; align-items: center; gap: 16px; }
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
        max-width: 900px;
        margin: 0 auto;
        width: 100%;
        position: relative;
        z-index: 10;
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      /* ─── Animations ─────────────────────────── */
      @keyframes fadeInDown {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
      }

      @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
      }

      @keyframes scaleIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
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

      /* ─── Search Form ────────────────────────── */
      .search-card {
        background: var(--white);
        border-radius: 20px;
        padding: 32px;
        box-shadow: 0 12px 32px rgba(13,15,26,.05);
        width: 100%;
        max-width: 500px;
        animation: fadeInUp 0.8s ease-out;
        margin-bottom: 40px;
      }

      .search-form {
        display: flex;
        flex-direction: column;
        gap: 16px;
      }

      .search-form label {
        font-weight: 600;
        font-size: 14px;
        color: var(--ink);
      }

      .search-form input[type="number"] {
        padding: 14px 16px;
        border: 1px solid rgba(13,15,26,.1);
        border-radius: 8px;
        font-family: 'DM Sans', sans-serif;
        font-size: 15px;
        outline: none;
        transition: all 0.3s ease;
      }

      .search-form input[type="number"]:focus {
        border-color: var(--teal);
        box-shadow: 0 0 0 4px rgba(26,122,110,.1);
      }

      .btn-search {
        background: var(--teal);
        color: var(--white);
        border: none;
        padding: 14px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: transform .2s, box-shadow .2s, background .2s;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
      }

      .btn-search:hover {
        background: var(--teal-dk);
        transform: translateY(-2px);
        box-shadow: 0 8px 16px rgba(26,122,110,.2);
      }

      /* ─── Salary Results Card ────────────────── */
      .salary-results {
        background: var(--white);
        border-radius: 24px;
        padding: 40px;
        box-shadow: 0 16px 48px rgba(13,15,26,.08);
        width: 100%;
        animation: scaleIn 0.5s ease-out;
        position: relative;
        overflow: hidden;
      }

      .salary-results::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0;
        height: 6px;
        background: linear-gradient(90deg, var(--gold), var(--teal));
      }

      .result-header {
        text-align: center;
        margin-bottom: 32px;
        padding-bottom: 24px;
        border-bottom: 1px solid rgba(13,15,26,.08);
      }

      .result-header h2 {
        font-family: 'DM Serif Display', serif;
        font-size: 28px;
        color: var(--ink);
      }

      .salary-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 24px;
      }

      .data-box {
        background: var(--paper);
        padding: 20px;
        border-radius: 12px;
        border: 1px solid rgba(13,15,26,.05);
      }

      .data-box.highlight {
        background: rgba(26,122,110,.05);
        border-color: rgba(26,122,110,.2);
        grid-column: 1 / -1;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .data-label {
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: #888;
        margin-bottom: 8px;
        font-weight: 600;
      }

      .data-value {
        font-size: 18px;
        font-weight: 600;
        color: var(--ink);
      }

      .highlight .data-value {
        font-size: 36px;
        color: var(--teal);
        font-family: 'DM Serif Display', serif;
      }
      .highlight .data-label { margin-bottom: 0; font-size: 14px; }

      .no-data {
        text-align: center;
        color: var(--red);
        font-size: 18px;
        font-weight: 500;
        padding: 32px;
        background: rgba(255,71,87,.1);
        border-radius: 12px;
        animation: scaleIn 0.4s;
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
        <h1>Salary Details</h1>
        <p>Enter your Employee ID to securely view your payment records.</p>
      </div>

      <!-- Search Form -->
      <div class="search-card">
        <form action="" method="post" class="search-form">
          <label for="empid">Employee ID</label>
          <input type="number" id="empid" name="t1" min="1" placeholder="e.g., 1001" required>
          <button type="submit" class="btn-search">
            View Salary <i class="fas fa-search"></i>
          </button>
        </form>
      </div>

      <!-- Dynamic Data Display -->
      <%
        String ab = request.getParameter("t1");
        if (ab != null && !ab.trim().isEmpty()) {
            DBconnection db = new DBconnection();
            try {
                db.pstmt = db.con.prepareStatement("select * from salary where empid=?");
                db.pstmt.setString(1, ab);
                db.rst = db.pstmt.executeQuery();

                if (db.rst.next()) {
                    String empId = db.rst.getString(1);
                    String compId = db.rst.getString(2);
                    String empName = db.rst.getString(3);
                    String department = db.rst.getString(4);
                    String salary = db.rst.getString(5);
                    String updateDate = db.rst.getString(6);
      %>
      
      <div class="salary-results">
        <div class="result-header">
          <h2>Payment Record Found</h2>
        </div>
        
        <div class="salary-grid">
          
          <div class="data-box highlight">
            <div>
              <div class="data-label">Net Monthly Salary</div>
              <div style="font-size: 13px; color: #666;">Credited to account</div>
            </div>
            <div class="data-value">₹ <%= salary %></div>
          </div>

          <div class="data-box">
            <div class="data-label">Employee Name</div>
            <div class="data-value"><%= empName %></div>
          </div>

          <div class="data-box">
            <div class="data-label">Employee ID</div>
            <div class="data-value">#<%= empId %></div>
          </div>

          <div class="data-box">
            <div class="data-label">Department</div>
            <div class="data-value"><%= department %></div>
          </div>

          <div class="data-box">
            <div class="data-label">Last Updated</div>
            <div class="data-value"><%= updateDate %></div>
          </div>

        </div>
      </div>

      <%
                } else {
      %>
      <div class="no-data">
        <i class="fas fa-exclamation-triangle"></i> No salary records found for Employee ID: <%= ab %>.
      </div>
      <%
                }
            } catch (Exception e) {
                out.println("<div class='no-data'>Error retrieving data. Please try again.</div>");
            } finally {
                if (db.rst != null) try { db.rst.close(); } catch(Exception ignored) {}
                if (db.pstmt != null) try { db.pstmt.close(); } catch(Exception ignored) {}
                if (db.con != null) try { db.con.close(); } catch(Exception ignored) {}
            }
        }
      %>

      <a href="empHome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

    </div>

  </body>
</html>