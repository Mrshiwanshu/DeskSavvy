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
    <title>DeskSavvy Home</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-social@1/bin/bulma-social.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    <style>
      td { padding: 10px; }
    </style>
  </head>
  <body>

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
      --shadow: rgba(13,15,26,.18);
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      background: var(--paper);
      color: var(--ink);
      font-family: 'DM Sans', sans-serif;
      font-weight: 300;
      overflow-x: hidden;
    }

    /* ─── Noise overlay ─────────────────────────────── */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='1'/%3E%3C/svg%3E");
      opacity: .035;
      pointer-events: none;
      z-index: 9999;
    }

    /* ─── Header ────────────────────────────────────── */
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

    nav a:hover {
      color: var(--gold);
      background: rgba(201,168,76,.08);
    }

    /* ─── Hero ──────────────────────────────────────── */
    .hero-section {
      min-height: 88vh;
      display: grid;
      grid-template-columns: 1fr 1fr;
      position: relative;
      overflow: hidden;
    }

    /* Left panel — editorial text */
    .hero-left {
      background: var(--ink);
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 80px 64px 80px 56px;
      position: relative;
      overflow: hidden;
    }

    .hero-left::after {
      content: '';
      position: absolute;
      right: -120px;
      top: 50%;
      transform: translateY(-50%);
      width: 260px;
      height: 260px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(201,168,76,.18) 0%, transparent 70%);
    }

    .hero-tag {
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
      margin-bottom: 36px;
      width: fit-content;
    }

    .hero-tag::before {
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

    .hero-left h1 {
      font-family: 'DM Serif Display', serif;
      font-size: clamp(38px, 4vw, 58px);
      line-height: 1.12;
      color: var(--white);
      margin-bottom: 24px;
    }

    .hero-left h1 em {
      font-style: italic;
      color: var(--gold);
    }

    .hero-left p {
      color: rgba(255,255,255,.55);
      font-size: 16px;
      line-height: 1.75;
      max-width: 380px;
      margin-bottom: 44px;
    }

    .hero-cta {
      display: inline-flex;
      align-items: center;
      gap: 12px;
      background: var(--gold);
      color: var(--ink);
      text-decoration: none;
      padding: 14px 32px;
      border-radius: 6px;
      font-weight: 600;
      font-size: 14px;
      letter-spacing: .4px;
      width: fit-content;
      transition: background .3s, transform .2s, box-shadow .3s;
      box-shadow: 0 6px 24px rgba(201,168,76,.35);
      border: none;
      cursor: pointer;
      font-family: 'DM Sans', sans-serif;
    }

    .hero-cta:hover {
      background: var(--gold-lt);
      transform: translateY(-2px);
      box-shadow: 0 10px 32px rgba(201,168,76,.45);
      color: var(--ink);
    }

    .hero-cta i { font-size: 12px; }

    /* Stats row */
    .stats-row {
      display: flex;
      gap: 36px;
      margin-top: 56px;
      padding-top: 40px;
      border-top: 1px solid rgba(255,255,255,.08);
    }

    .stat-item .num {
      font-family: 'DM Serif Display', serif;
      font-size: 32px;
      color: var(--gold);
    }

    .stat-item .lbl {
      font-size: 12px;
      color: rgba(255,255,255,.4);
      letter-spacing: 1px;
      text-transform: uppercase;
      margin-top: 2px;
    }

    /* Right panel — login */
    .hero-right {
      background: var(--cream);
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 60px 56px;
      position: relative;
    }

    /* Decorative circle */
    .hero-right::before {
      content: '';
      position: absolute;
      top: -80px;
      right: -80px;
      width: 320px;
      height: 320px;
      border-radius: 50%;
      border: 1.5px solid rgba(26,122,110,.15);
    }

    .hero-right::after {
      content: '';
      position: absolute;
      bottom: -60px;
      left: -60px;
      width: 200px;
      height: 200px;
      border-radius: 50%;
      border: 1px solid rgba(201,168,76,.2);
    }

    /* ─── Login Card ────────────────────────────────── */
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

    /* Gold accent bar */
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

    /* Input groups */
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
      transition: color .3s;
    }

    .field-inner input,
    .field-inner select {
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
      -webkit-appearance: none;
      appearance: none;
    }

    .field-inner input::placeholder { color: #ccc; }

    .field-inner input:focus,
    .field-inner select:focus {
      border-color: var(--teal);
      background: var(--white);
      box-shadow: 0 0 0 4px rgba(26,122,110,.1);
    }

    .field-inner input:focus ~ i,
    .field-inner select:focus ~ i { color: var(--teal); }

    /* Select arrow */
    .select-wrap::after {
      content: '\f078';
      font-family: 'Font Awesome 5 Free';
      font-weight: 900;
      position: absolute;
      right: 14px;
      top: 50%;
      transform: translateY(-50%);
      color: #bbb;
      font-size: 11px;
      pointer-events: none;
    }

    /* Submit button */
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

    .btn-submit i { font-size: 13px; }

    /* Divider line on card bottom */
    .card-footer-note {
      text-align: center;
      margin-top: 24px;
      font-size: 12px;
      color: #bbb;
    }

    /* ─── Features strip ────────────────────────────── */
    .features {
      background: var(--white);
      padding: 70px 56px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 40px;
      border-top: 1px solid var(--cream);
      border-bottom: 1px solid var(--cream);
    }

    .feature-item {
      display: flex;
      flex-direction: column;
      gap: 14px;
      animation: fadeUp .6s ease both;
    }

    .feature-item:nth-child(2) { animation-delay: .1s; }
    .feature-item:nth-child(3) { animation-delay: .2s; }

    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(16px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .feature-icon {
      width: 48px;
      height: 48px;
      border-radius: 12px;
      background: var(--cream);
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--teal);
      font-size: 18px;
      transition: background .3s;
    }

    .feature-item:hover .feature-icon {
      background: var(--teal);
      color: var(--white);
    }

    .feature-item h3 {
      font-family: 'DM Serif Display', serif;
      font-size: 20px;
      color: var(--ink);
    }

    .feature-item p {
      font-size: 14.5px;
      color: #888;
      line-height: 1.7;
    }

    /* ─── Footer ────────────────────────────────────── */
    footer {
      background: var(--ink);
      color: rgba(255,255,255,.4);
      text-align: center;
      padding: 28px 20px;
      font-size: 13px;
      letter-spacing: .5px;
    }

    footer span { color: var(--gold); opacity: .8; }

    /* ─── Responsive ────────────────────────────────── */
    @media (max-width: 900px) {
      header { padding: 0 24px; }

      .hero-section {
        grid-template-columns: 1fr;
        min-height: auto;
      }

      .hero-left {
        padding: 60px 28px;
      }

      .hero-right {
        padding: 48px 20px;
      }

      .features {
        grid-template-columns: 1fr;
        padding: 48px 28px;
      }

      nav { display: none; }
    }
  </style>

  <!-- ─── Header ──────────────────────────────────── -->
  <header>
    <div class="logo">
      DeskSavvy
      <span>Workspace OS</span>
    </div>
    <nav>
      <a href="index.jsp">Dashboard</a>
      <a href="support.jsp">Employees</a>
      <a href="about.jsp">About</a>
      <a href="blog.jsp">Blog</a>
      <a href="contact.jsp">Contact</a>
    </nav>
  </header>

  <!-- ─── Hero + Login Split ──────────────────────── -->
  <section class="hero-section" id="login">

    <!-- Left: Editorial -->
    <div class="hero-left">
      <div class="hero-tag">Now Live</div>

      <h1>Run your office<br>with <em>clarity.</em></h1>
      <p>DeskSavvy brings employees, tasks, and operations into one elegant workspace — built for teams that move fast.</p>

      <a href="#login" class="hero-cta">
        Get Started <i class="fas fa-arrow-right"></i>
      </a>

      <div class="stats-row">
        <div class="stat-item">
          <div class="num">12k+</div>
          <div class="lbl">Users</div>
        </div>
        <div class="stat-item">
          <div class="num">99%</div>
          <div class="lbl">Uptime</div>
        </div>
        <div class="stat-item">
          <div class="num">4.9★</div>
          <div class="lbl">Rating</div>
        </div>
      </div>
    </div>

    <!-- Right: Login Form — ALL form fields/names/action unchanged -->
    <div class="hero-right">
      <div class="login-card">
        <div class="card-eyebrow">Secure Access</div>
        <h2>Welcome back</h2>
        <p>Sign in to your DeskSavvy account</p>

        <form action="login" method="get">

          <!-- User ID — name="t2" preserved -->
          <div class="field-wrap">
            <label class="field-label">User ID</label>
            <div class="field-inner">
              <input type="text" name="t2" placeholder="Enter your user ID" required />
              <i class="fas fa-user"></i>
            </div>
          </div>

          <!-- Password — name="t3" preserved -->
          <div class="field-wrap">
            <label class="field-label">Password</label>
            <div class="field-inner">
              <input type="password" name="t3" placeholder="••••••••" required />
              <i class="fas fa-lock"></i>
            </div>
          </div>

          <!-- User Type — name="t1" preserved, values preserved -->
          <div class="field-wrap">
            <label class="field-label">User Type</label>
            <div class="field-inner select-wrap">
              <select name="t1" required>
                <option value="">Select User Type</option>
                <option value="company">Company</option>
              </select>
              <i class="fas fa-building"></i>
            </div>
          </div>

          <button type="submit" class="btn-submit">
            Sign In <i class="fas fa-sign-in-alt"></i>
          </button>

        </form>

        <div class="card-footer-note">
          Protected by DeskSavvy Security &mdash; &copy; 2025
        </div>
      </div>
    </div>
  </section>

  <!-- ─── Feature Strip ───────────────────────────── -->
  <section class="features">
    <div class="feature-item">
      <div class="feature-icon"><i class="fas fa-users"></i></div>
      <h3>Team Management</h3>
      <p>Oversee your entire workforce, assign roles, and track performance from a single unified dashboard.</p>
    </div>
    <div class="feature-item">
      <div class="feature-icon"><i class="fas fa-tasks"></i></div>
      <h3>Task Automation</h3>
      <p>Create, delegate, and monitor tasks with smart workflows that eliminate repetitive overhead.</p>
    </div>
    <div class="feature-item">
      <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
      <h3>Real-Time Reports</h3>
      <p>Make data-driven decisions with live analytics and exportable reports built right in.</p>
    </div>
  </section>

  <!-- ─── Footer ──────────────────────────────────── -->
  <footer>
    &copy; 2025 <span>DeskSavvy</span>. All rights reserved.
  </footer>

</body>
</html>
