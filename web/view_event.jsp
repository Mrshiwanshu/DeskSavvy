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
    <title>Company Events - DeskSavvy</title>
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
        max-width: 1100px;
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
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
      }

      .page-header {
        text-align: center;
        margin-bottom: 48px;
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

      /* ─── Modern Table ───────────────────────── */
      .table-wrapper {
        width: 100%;
        background: var(--white);
        border-radius: 16px;
        box-shadow: 0 8px 32px rgba(13,15,26,.06);
        overflow: hidden; /* Ensures rounded corners clip the table */
        animation: fadeInUp 0.6s ease-out forwards;
        border: 1px solid rgba(13,15,26,.05);
      }

      .events-table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
      }

      .events-table th {
        background: rgba(26,122,110,.05);
        color: var(--teal-dk);
        font-weight: 600;
        padding: 20px 24px;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-bottom: 2px solid rgba(26,122,110,.1);
      }

      .events-table td {
        padding: 24px;
        border-bottom: 1px solid rgba(13,15,26,.05);
        color: var(--ink);
        font-size: 15px;
        line-height: 1.5;
        vertical-align: top;
      }

      /* Animated Rows */
      .events-table tbody tr {
        opacity: 0;
        animation: fadeInUp 0.5s ease-out forwards;
        transition: background-color 0.2s;
      }

      .events-table tbody tr:hover {
        background-color: rgba(201,168,76,.05);
      }

      .events-table tbody tr:last-child td {
        border-bottom: none;
      }

      .td-subject {
        font-family: 'DM Serif Display', serif;
        font-size: 20px;
        color: var(--ink);
        width: 25%;
      }

      .td-events {
        width: 55%;
        color: #555;
      }

      .td-date {
        width: 20%;
        font-weight: 600;
        color: var(--teal);
        white-space: nowrap;
      }

      .td-date i {
        margin-right: 6px;
      }

      /* ─── Empty State ────────────────────────── */
      .no-events {
        text-align: center;
        width: 100%;
        padding: 48px;
        background: rgba(255,255,255,.5);
        border-radius: 16px;
        border: 2px dashed rgba(13,15,26,.1);
        color: #888;
        font-size: 18px;
        animation: scaleIn 0.5s ease-out;
      }

      .no-events i {
        font-size: 48px;
        color: #ccc;
        margin-bottom: 16px;
        display: block;
      }

      .back-link {
        margin-top: 48px;
        display: inline-block;
        color: var(--teal);
        text-decoration: none;
        font-weight: 500;
        transition: color .2s;
        animation: fadeInUp 0.8s ease-out 0.5s both;
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
        <h1>Company Events & Announcements</h1>
        <p>Stay up to date with the latest news, holidays, and meetings.</p>
      </div>

      <%
        DBconnection db = new DBconnection();
        try {
            db.pstmt = db.con.prepareStatement("select * from event where com_id=?");
            db.pstmt.setString(1, com_id);
            db.rst = db.pstmt.executeQuery();
            
            // Check if there's any data first (using a list to store data or just running the loop)
            // A simple way is to use a flag, but since resultset is forward only, we can just print the table header and if no rows, close it and show empty state.
            
            boolean hasHeaderPrinted = false;
            boolean hasEvents = false;
            int count = 0;

            while(db.rst.next()) {
                if (!hasHeaderPrinted) {
                    hasHeaderPrinted = true;
                    // Start Table
      %>
                    <div class="table-wrapper">
                      <table class="events-table">
                        <thead>
                          <tr>
                            <th>Subject</th>
                            <th>Events</th>
                            <th>Date</th>
                          </tr>
                        </thead>
                        <tbody>
      <%
                }
                
                hasEvents = true;
                count++;
                
                // Extract columns 3, 4, 5
                String subject = db.rst.getString(3);
                String eventDesc = db.rst.getString(4);
                String eventDate = db.rst.getString(5);
                
                // Calculate staggered animation delay
                double delay = 0.1 * count;
      %>
                          <tr style="animation-delay: <%= delay %>s">
                            <td class="td-subject"><%= subject %></td>
                            <td class="td-events"><%= eventDesc %></td>
                            <td class="td-date"><i class="far fa-calendar-alt"></i> <%= eventDate %></td>
                          </tr>
      <%
            }
            
            if(hasEvents) {
                // Close table
      %>
                        </tbody>
                      </table>
                    </div>
      <%
            } else {
                // Empty state
      %>
                <div class="no-events">
                  <i class="fas fa-calendar-times"></i>
                  No upcoming events or announcements found.
                </div>
      <%
            }
            
        } catch (Exception e) {
            out.println("<div class='no-events'><i class='fas fa-exclamation-circle'></i> Error loading events. Please try again later.</div>");
        } finally {
            if (db.rst != null) try { db.rst.close(); } catch(Exception ignored) {}
            if (db.pstmt != null) try { db.pstmt.close(); } catch(Exception ignored) {}
            if (db.con != null) try { db.con.close(); } catch(Exception ignored) {}
        }
      %>

      <a href="empHome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

    </div>

  </body>
</html>
