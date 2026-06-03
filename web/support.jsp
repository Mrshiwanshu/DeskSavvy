<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="Aldi Duzha" />
    <meta name="description" content="Free Bulma Login Template, part of Awesome Bulma Templates" />
    <meta name="keywords" content="bulma, login, page, website, template, free, awesome" />
    <link rel="canonical" href="https://aldi.github.io/bulma-login-template/" />
    <title>Support</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-social@1/bin/bulma-social.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <style>
      td { padding: 10px; }

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

      body {
        background: var(--paper);
        color: var(--ink);
        font-family: 'DM Sans', sans-serif;
        font-weight: 300;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
      }

      /* Noise overlay */
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
        flex-shrink: 0;
      }

      header .logo {
        font-family: 'DM Serif Display', serif;
        font-size: 24px;
        color: var(--gold);
        letter-spacing: .5px;
        text-decoration: none;
      }

      header .logo span {
        color: var(--white);
        opacity: .6;
        font-size: 13px;
        display: block;
        font-family: 'DM Sans', sans-serif;
        font-weight: 300;
        letter-spacing: 3px;
        text-transform: uppercase;
        margin-top: -4px;
      }

      nav {
        display: flex;
        align-items: center;
        gap: 4px;
      }

      nav a {
        color: rgba(255,255,255,.65);
        text-decoration: none;
        font-size: 13.5px;
        font-weight: 400;
        letter-spacing: .5px;
        padding: 7px 16px;
        border-radius: 4px;
        transition: color .25s, background .25s;
      }

      nav a:hover,
      nav a.active {
        color: var(--gold);
        background: rgba(201,168,76,.08);
      }

      /* ─── Page body ──────────────────────────── */
      .page-body {
        flex: 1;
        display: grid;
        grid-template-columns: 1fr 1fr;
        min-height: calc(100vh - 68px - 60px);
      }

      /* Left decorative panel */
      .deco-panel {
        background: var(--ink);
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 80px 64px 80px 56px;
        position: relative;
        overflow: hidden;
      }

      .deco-panel::after {
        content: '';
        position: absolute;
        right: -120px;
        top: 50%;
        transform: translateY(-50%);
        width: 300px;
        height: 300px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(201,168,76,.15) 0%, transparent 70%);
      }

      /* Big decorative letter */
      .deco-panel .big-letter {
        font-family: 'DM Serif Display', serif;
        font-size: 180px;
        line-height: 1;
        color: rgba(255,255,255,.04);
        position: absolute;
        bottom: 20px;
        right: -10px;
        user-select: none;
      }

      .deco-tag {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: rgba(201,168,76,.12);
        border: 1px solid rgba(201,168,76,.3);
        border-radius: 100px;
        padding: 6px 16px;
        color: var(--gold);
        font-size: 11.5px;
        letter-spacing: 2px;
        text-transform: uppercase;
        font-weight: 500;
        margin-bottom: 32px;
        width: fit-content;
      }

      .deco-tag::before {
        content: '';
        width: 6px;
        height: 6px;
        border-radius: 50%;
        background: var(--gold);
        animation: pulse 2s ease infinite;
      }

      @keyframes pulse {
        0%,100% { opacity: 1; transform: scale(1); }
        50%      { opacity: .4; transform: scale(1.4); }
      }

      .deco-panel h2 {
        font-family: 'DM Serif Display', serif;
        font-size: clamp(32px, 3.5vw, 50px);
        line-height: 1.15;
        color: var(--white);
        margin-bottom: 20px;
      }

      .deco-panel h2 em {
        font-style: italic;
        color: var(--gold);
      }

      .deco-panel p {
        color: rgba(255,255,255,.5);
        font-size: 15.5px;
        line-height: 1.8;
        max-width: 360px;
      }

      /* Horizontal rule */
      .deco-divider {
        width: 48px;
        height: 2px;
        background: linear-gradient(90deg, var(--teal), var(--gold));
        border-radius: 2px;
        margin: 28px 0;
      }

      /* Benefit list */
      .benefit-list {
        list-style: none;
        display: flex;
        flex-direction: column;
        gap: 14px;
        margin-top: 8px;
      }

      .benefit-list li {
        display: flex;
        align-items: center;
        gap: 12px;
        color: rgba(255,255,255,.6);
        font-size: 14px;
      }

      .benefit-list li i {
        color: var(--teal);
        font-size: 13px;
        flex-shrink: 0;
      }

      /* ─── Right: Login panel ─────────────────── */
      .login-panel {
        background: var(--cream);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 60px 56px;
        position: relative;
      }

      .login-panel::before {
        content: '';
        position: absolute;
        top: -80px;
        right: -80px;
        width: 320px;
        height: 320px;
        border-radius: 50%;
        border: 1.5px solid rgba(26,122,110,.15);
      }

      .login-panel::after {
        content: '';
        position: absolute;
        bottom: -60px;
        left: -60px;
        width: 200px;
        height: 200px;
        border-radius: 50%;
        border: 1px solid rgba(201,168,76,.2);
      }

      /* Card */
      .login-card {
        background: var(--white);
        border-radius: 20px;
        padding: 52px 44px;
        width: 100%;
        max-width: 420px;
        position: relative;
        z-index: 1;
        box-shadow:
          0 2px 4px rgba(13,15,26,.04),
          0 8px 20px rgba(13,15,26,.08),
          0 24px 60px rgba(13,15,26,.1);
        animation: cardIn .7s cubic-bezier(.22,1,.36,1) both;
      }

      @keyframes cardIn {
        from { opacity: 0; transform: translateY(24px); }
        to   { opacity: 1; transform: translateY(0); }
      }

      .login-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 44px;
        right: 44px;
        height: 3px;
        background: linear-gradient(90deg, var(--teal), var(--gold));
        border-radius: 0 0 4px 4px;
      }

      .card-eyebrow {
        font-size: 10.5px;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--teal);
        font-weight: 600;
        margin-bottom: 10px;
      }

      .login-card h2 {
        font-family: 'DM Serif Display', serif;
        font-size: 28px;
        color: var(--ink);
        margin-bottom: 6px;
        line-height: 1.2;
      }

      .login-card > p {
        color: #888;
        font-size: 14px;
        margin-bottom: 36px;
      }

      /* Fields */
      .field-wrap {
        margin-bottom: 18px;
        position: relative;
      }

      .field-label {
        display: block;
        font-size: 11.5px;
        font-weight: 600;
        letter-spacing: 1px;
        text-transform: uppercase;
        color: #999;
        margin-bottom: 8px;
      }

      .field-inner {
        position: relative;
      }

      .field-inner i {
        position: absolute;
        left: 14px;
        top: 50%;
        transform: translateY(-50%);
        color: #bbb;
        font-size: 13px;
        pointer-events: none;
        transition: color .3s;
      }

      .field-inner input {
        width: 100%;
        padding: 13px 14px 13px 40px;
        border: 1.5px solid #e8e5df;
        border-radius: 10px;
        font-size: 14.5px;
        font-family: 'DM Sans', sans-serif;
        color: var(--ink);
        background: #fafaf8;
        outline: none;
        transition: border-color .25s, box-shadow .25s, background .25s;
      }

      .field-inner input::placeholder { color: #ccc; }

      .field-inner input:focus {
        border-color: var(--teal);
        background: var(--white);
        box-shadow: 0 0 0 4px rgba(26,122,110,.1);
      }

      /* Submit */
      .btn-submit {
        width: 100%;
        padding: 14px;
        background: var(--ink);
        color: var(--white);
        border: none;
        border-radius: 10px;
        font-family: 'DM Sans', sans-serif;
        font-size: 14.5px;
        font-weight: 600;
        letter-spacing: .5px;
        cursor: pointer;
        margin-top: 8px;
        transition: background .3s, transform .2s, box-shadow .3s;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
      }

      .btn-submit:hover {
        background: var(--teal-dk);
        transform: translateY(-2px);
        box-shadow: 0 8px 24px rgba(13,15,26,.25);
      }

      /* Error message */
      .error-msg {
        margin-top: 14px;
        background: #fff5f5;
        border: 1px solid #ffc5c5;
        border-radius: 8px;
        padding: 10px 14px;
        color: #c0392b;
        font-size: 13.5px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .card-footer-note {
        text-align: center;
        margin-top: 24px;
        font-size: 12px;
        color: #bbb;
      }

      /* ─── Footer ─────────────────────────────── */
      footer {
        background: var(--ink);
        color: rgba(255,255,255,.4);
        text-align: center;
        padding: 18px 20px;
        font-size: 13px;
        letter-spacing: .5px;
        flex-shrink: 0;
      }

      footer span { color: var(--gold); opacity: .8; }

      /* ─── Responsive ─────────────────────────── */
      @media (max-width: 900px) {
        header { padding: 0 20px; }
        nav { display: none; }

        .page-body { grid-template-columns: 1fr; }

        .deco-panel { padding: 48px 28px; }
        .deco-panel .big-letter { display: none; }

        .login-panel { padding: 40px 20px; }
      }
    </style>
  </head>
  <body>

    <!-- ─── Header ──────────────────────────────── -->
    <header>
      <a href="index.jsp" class="logo">
        DeskSavvy
        <span>Workspace OS</span>
      </a>
      <nav>
        <a href="index.jsp">Dashboard</a>
        <a href="support.jsp" class="active">Employees</a>
        <a href="about.jsp">About</a>
        <a href="blog.jsp">Blog</a>
        <a href="contact.jsp">Contact</a>
      </nav>
    </header>

    <!-- ─── Main ─────────────────────────────────── -->
    <div class="page-body">

      <!-- Left decorative panel -->
      <div class="deco-panel">
        <div class="deco-tag">Employee Portal</div>

        <h2>Your workspace,<br><em>one sign-in away.</em></h2>

        <div class="deco-divider"></div>

        <p>Access your tasks, schedule, and team tools securely through the DeskSavvy employee portal.</p>

        <ul class="benefit-list">
          <li><i class="fas fa-check-circle"></i> Secure, role-based access</li>
          <li><i class="fas fa-check-circle"></i> Real-time task visibility</li>
          <li><i class="fas fa-check-circle"></i> Instant team collaboration</li>
        </ul>

        <div class="big-letter">E</div>
      </div>

      <!-- Right login panel -->
      <div class="login-panel">
        <div class="login-card">
          <div class="card-eyebrow">Employee Access</div>
          <h2>Employee Login</h2>
          <p>Enter your credentials to sign in</p>

          <!-- action="emplogin" method="get" preserved; name="t1", name="t2" preserved -->
          <form action="emplogin" method="get">

            <!-- User ID — name="t1" preserved -->
            <div class="field-wrap">
              <label class="field-label">User ID</label>
              <div class="field-inner">
                <input type="text" name="t1" placeholder="Enter your user ID" />
                <i class="fas fa-envelope"></i>
              </div>
            </div>

            <!-- Password — name="t2" preserved -->
            <div class="field-wrap">
              <label class="field-label">Password</label>
              <div class="field-inner">
                <input type="password" name="t2" placeholder="••••••••" />
                <i class="fas fa-lock"></i>
              </div>
            </div>

            <button type="submit" class="btn-submit" value="LogIn">
              Sign In <i class="fas fa-sign-in-alt"></i>
            </button>

            <%
              String m = request.getParameter("msg");
              if (m != null)
                out.println("<div class='error-msg'><i class='fas fa-exclamation-circle'></i>" + m + "</div>");
            %>

          </form>

          <div class="card-footer-note">
            Protected by DeskSavvy Security &mdash; &copy; 2025
          </div>
        </div>
      </div>

    </div>

    <!-- ─── Footer ──────────────────────────────── -->
    <footer>
      &copy; 2025 <span>DeskSavvy</span>. All rights reserved.
    </footer>

  </body>
</html>
