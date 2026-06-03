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
    <title>About Us - DeskSavvy</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-social@1/bin/bulma-social.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <style>
      html {
        overflow-y: auto !important;
        background-image: none !important;
      }
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
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
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

      nav { display: flex; align-items: center; gap: 4px; }

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

      nav a:hover, nav a.active {
        color: var(--gold);
        background: rgba(201,168,76,.08);
      }

      /* ─── Page Body ──────────────────────────── */
      .page-body { flex: 1; display: flex; flex-direction: column; }

      /* ─── Hero Banner ────────────────────────── */
      .about-banner {
        background: var(--ink);
        padding: 140px 56px 80px;
        position: relative;
        overflow: hidden;
      }

      .about-banner::after {
        content: '';
        position: absolute;
        right: -80px; top: 50%;
        transform: translateY(-50%);
        width: 400px; height: 400px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(201,168,76,.12) 0%, transparent 70%);
        pointer-events: none;
      }

      .about-tag {
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
        margin-bottom: 24px;
        width: fit-content;
        position: relative;
        z-index: 1;
      }

      .about-tag::before {
        content: '';
        width: 6px; height: 6px;
        border-radius: 50%;
        background: var(--gold);
        animation: pulse 2s ease infinite;
      }

      @keyframes pulse {
        0%,100% { opacity: 1; transform: scale(1); }
        50%      { opacity: .4; transform: scale(1.4); }
      }

      .about-banner h1 {
        font-family: 'DM Serif Display', serif;
        font-size: clamp(32px, 4vw, 52px);
        color: var(--white);
        line-height: 1.15;
        margin-bottom: 16px;
        position: relative;
        z-index: 1;
      }

      .about-banner h1 em { font-style: italic; color: var(--gold); }

      .about-banner p {
        color: rgba(255,255,255,.5);
        font-size: 16px;
        line-height: 1.75;
        max-width: 560px;
        position: relative;
        z-index: 1;
      }

      /* ─── About DeskSavvy Section ────────────── */
      .about-desksavvy {
        background: var(--white);
        padding: 72px 56px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 64px;
        align-items: center;
        border-bottom: 1px solid var(--cream);
      }

      .about-text-block .section-eyebrow {
        font-size: 11px;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--teal);
        font-weight: 600;
        margin-bottom: 14px;
      }

      .about-text-block h2 {
        font-family: 'DM Serif Display', serif;
        font-size: clamp(28px, 3vw, 40px);
        color: var(--ink);
        line-height: 1.2;
        margin-bottom: 20px;
      }

      .about-text-block h2 em { font-style: italic; color: var(--teal); }

      .about-text-block p {
        font-size: 15px;
        color: #666;
        line-height: 1.8;
        margin-bottom: 16px;
      }

      .divider {
        width: 48px; height: 2px;
        background: linear-gradient(90deg, var(--teal), var(--gold));
        border-radius: 2px;
        margin-bottom: 24px;
      }

      /* Feature pills */
      .feature-pills {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 28px;
      }

      .pill {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: var(--cream);
        border: 1px solid rgba(26,122,110,.15);
        border-radius: 100px;
        padding: 8px 18px;
        font-size: 13px;
        color: var(--ink);
        font-weight: 500;
        transition: background .25s, border-color .25s;
      }

      .pill:hover { background: rgba(26,122,110,.1); border-color: var(--teal); }
      .pill i { color: var(--teal); font-size: 12px; }

      /* Visual block on right */
      .about-visual {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px;
      }

      .stat-card {
        background: var(--ink);
        border-radius: 16px;
        padding: 28px 24px;
        display: flex;
        flex-direction: column;
        gap: 8px;
        animation: fadeUp .5s ease both;
      }

      .stat-card:nth-child(2) { animation-delay: .1s; margin-top: 24px; }
      .stat-card:nth-child(3) { animation-delay: .2s; }
      .stat-card:nth-child(4) { animation-delay: .3s; margin-top: -24px; }

      @keyframes fadeUp {
        from { opacity: 0; transform: translateY(16px); }
        to   { opacity: 1; transform: translateY(0); }
      }

      .stat-card .stat-num {
        font-family: 'DM Serif Display', serif;
        font-size: 36px;
        color: var(--gold);
        line-height: 1;
      }

      .stat-card .stat-label {
        font-size: 12px;
        color: rgba(255,255,255,.45);
        letter-spacing: 1.5px;
        text-transform: uppercase;
      }

      .stat-card .stat-desc {
        font-size: 13px;
        color: rgba(255,255,255,.6);
        line-height: 1.6;
        margin-top: 4px;
      }

      /* ─── Developer Section ──────────────────── */
      .developer-section {
        background: var(--cream);
        padding: 80px 56px;
        position: relative;
        overflow: hidden;
      }

      .developer-section::before {
        content: '';
        position: absolute;
        top: -80px; right: -80px;
        width: 320px; height: 320px;
        border-radius: 50%;
        border: 1.5px solid rgba(26,122,110,.12);
        pointer-events: none;
      }

      .section-header {
        text-align: center;
        margin-bottom: 56px;
      }

      .section-header .eyebrow {
        font-size: 11px;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--teal);
        font-weight: 600;
        margin-bottom: 12px;
      }

      .section-header h2 {
        font-family: 'DM Serif Display', serif;
        font-size: clamp(28px, 3vw, 42px);
        color: var(--ink);
        line-height: 1.2;
      }

      .section-header h2 em { font-style: italic; color: var(--gold); }

      /* Developer Card */
      .dev-card {
        background: var(--white);
        border-radius: 24px;
        overflow: hidden;
        max-width: 860px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: 340px 1fr;
        box-shadow:
          0 2px 4px rgba(13,15,26,.04),
          0 8px 24px rgba(13,15,26,.1),
          0 32px 64px rgba(13,15,26,.1);
        animation: cardIn .7s cubic-bezier(.22,1,.36,1) both;
      }

      @keyframes cardIn {
        from { opacity: 0; transform: translateY(24px); }
        to   { opacity: 1; transform: translateY(0); }
      }

      /* Photo side */
      .dev-photo-wrap {
        background: var(--ink);
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-end;
        padding: 0;
        overflow: hidden;
        min-height: 440px;
      }

      .dev-photo-wrap::after {
        content: '';
        position: absolute;
        bottom: 0; left: 0; right: 0;
        height: 120px;
        background: linear-gradient(to top, rgba(13,15,26,.85), transparent);
        z-index: 1;
      }

      .dev-photo {
        width: 100%;
        height: 100%;
        object-fit: cover;
        object-position: center top;
        position: absolute;
        inset: 0;
        opacity: .92;
      }

      .dev-badge {
        position: relative;
        z-index: 2;
        margin: 0 20px 24px;
        background: rgba(201,168,76,.15);
        border: 1px solid rgba(201,168,76,.4);
        border-radius: 100px;
        padding: 6px 16px;
        color: var(--gold);
        font-size: 11px;
        letter-spacing: 2px;
        text-transform: uppercase;
        font-weight: 600;
      }

      /* Info side */
      .dev-info {
        padding: 48px 44px;
        display: flex;
        flex-direction: column;
        justify-content: center;
      }

      /* Gold bar */
      .dev-info::before {
        content: '';
        display: block;
        width: 48px; height: 3px;
        background: linear-gradient(90deg, var(--teal), var(--gold));
        border-radius: 2px;
        margin-bottom: 24px;
      }

      .dev-info .role-tag {
        font-size: 11px;
        letter-spacing: 3px;
        text-transform: uppercase;
        color: var(--teal);
        font-weight: 600;
        margin-bottom: 10px;
      }

      .dev-info h3 {
        font-family: 'DM Serif Display', serif;
        font-size: 34px;
        color: var(--ink);
        line-height: 1.1;
        margin-bottom: 6px;
      }

      .dev-info .company-tag {
        font-size: 13px;
        color: #aaa;
        letter-spacing: .5px;
        margin-bottom: 24px;
        display: flex;
        align-items: center;
        gap: 6px;
      }

      .dev-info .company-tag i { color: var(--gold); font-size: 12px; }

      .bio-divider {
        width: 100%; height: 1px;
        background: var(--cream);
        margin-bottom: 24px;
      }

      .dev-info p {
        font-size: 14.5px;
        color: #777;
        line-height: 1.8;
        margin-bottom: 16px;
      }

      /* Skill tags */
      .skill-tags {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 8px;
      }

      .skill-tag {
        background: var(--cream);
        border-radius: 6px;
        padding: 5px 12px;
        font-size: 12px;
        font-weight: 500;
        color: var(--ink);
        border: 1px solid rgba(13,15,26,.08);
        transition: background .25s;
      }

      .skill-tag:hover { background: rgba(26,122,110,.1); }

      /* ─── Mission Strip ──────────────────────── */
      .mission-strip {
        background: var(--ink);
        padding: 64px 56px;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 40px;
        border-top: 1px solid rgba(201,168,76,.15);
      }

      .mission-item {
        display: flex;
        flex-direction: column;
        gap: 14px;
        animation: fadeUp .5s ease both;
      }

      .mission-item:nth-child(2) { animation-delay: .1s; }
      .mission-item:nth-child(3) { animation-delay: .2s; }

      .mission-icon {
        width: 48px; height: 48px;
        border-radius: 12px;
        background: rgba(201,168,76,.1);
        border: 1px solid rgba(201,168,76,.2);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        color: var(--gold);
        transition: background .3s;
      }

      .mission-item:hover .mission-icon {
        background: rgba(201,168,76,.2);
      }

      .mission-item h3 {
        font-family: 'DM Serif Display', serif;
        font-size: 20px;
        color: var(--white);
      }

      .mission-item p {
        font-size: 14px;
        color: rgba(255,255,255,.45);
        line-height: 1.7;
      }

      /* ─── Footer ─────────────────────────────── */
      footer {
        background: var(--ink);
        color: rgba(255,255,255,.4);
        text-align: center;
        padding: 20px;
        font-size: 13px;
        letter-spacing: .5px;
        border-top: 1px solid rgba(255,255,255,.06);
        flex-shrink: 0;
      }

      footer span { color: var(--gold); opacity: .8; }

      /* ─── Responsive ─────────────────────────── */
      @media (max-width: 960px) {
        header { padding: 0 20px; }
        nav { display: none; }
        .about-desksavvy { grid-template-columns: 1fr; padding: 48px 24px; gap: 40px; }
        .about-visual { grid-template-columns: 1fr 1fr; }
        .dev-card { grid-template-columns: 1fr; }
        .dev-photo-wrap { min-height: 320px; }
        .mission-strip { grid-template-columns: 1fr; padding: 48px 24px; }
        .developer-section { padding: 56px 24px; }
        .about-banner { padding: 100px 24px 48px; }
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
        <a href="support.jsp">Employees</a>
        <a href="about.jsp" class="active">About</a>
        <a href="blog.jsp">Blog</a>
        <a href="contact.jsp">Contact</a>
      </nav>
    </header>

    <div class="page-body">

      <!-- ─── Banner ──────────────────────────────── -->
      <div class="about-banner">
        <div class="about-tag">About Us</div>
        <h1>Built for the <em>modern</em><br>office experience.</h1>
        <p>DeskSavvy is a complete office management system designed to bring clarity, efficiency, and control to how teams work together every day.</p>
      </div>

      <!-- ─── About DeskSavvy ──────────────────────── -->
      <section class="about-desksavvy">

        <!-- Left text -->
        <div class="about-text-block">
          <div class="section-eyebrow">Our Platform</div>
          <h2>What is <em>DeskSavvy?</em></h2>
          <div class="divider"></div>
          <p>DeskSavvy is a comprehensive office management system built to streamline every aspect of running a modern workplace. From employee management to task delegation and operational oversight, DeskSavvy brings everything under one roof.</p>
          <p>Whether you're a growing startup or an established enterprise, DeskSavvy adapts to your workflow — reducing friction, eliminating manual overhead, and giving managers real-time visibility into their teams.</p>

          <div class="feature-pills">
            <span class="pill"><i class="fas fa-users"></i> Employee Management</span>
            <span class="pill"><i class="fas fa-tasks"></i> Task Tracking</span>
            <span class="pill"><i class="fas fa-shield-alt"></i> Role-Based Access</span>
            <span class="pill"><i class="fas fa-chart-bar"></i> Analytics</span>
            <span class="pill"><i class="fas fa-bell"></i> Real-Time Alerts</span>
          </div>
        </div>

        <!-- Right visual -->
        <div class="about-visual">
          <div class="stat-card">
            <div class="stat-num">12k+</div>
            <div class="stat-label">Active Users</div>
            <div class="stat-desc">Trusted by teams across dozens of industries.</div>
          </div>
          <div class="stat-card">
            <div class="stat-num">99%</div>
            <div class="stat-label">Uptime SLA</div>
            <div class="stat-desc">Reliable infrastructure your team can count on.</div>
          </div>
          <div class="stat-card">
            <div class="stat-num">50+</div>
            <div class="stat-label">Features</div>
            <div class="stat-desc">Everything you need, nothing you don't.</div>
          </div>
          <div class="stat-card">
            <div class="stat-num">4.9★</div>
            <div class="stat-label">User Rating</div>
            <div class="stat-desc">Consistently loved by admins and employees alike.</div>
          </div>
        </div>

      </section>

      <!-- ─── Developer Section ────────────────────── -->
      <section class="developer-section">
        <div class="section-header">
          <div class="eyebrow">Meet the Developer</div>
          <h2>The mind <em>behind</em> DeskSavvy</h2>
        </div>

        <div class="dev-card">

          <!-- Photo -->
          <div class="dev-photo-wrap">
            <img
              class="dev-photo"
              src="images/userpic.gif"
              alt="Shiwanshu Chourasia - Software Developer"
            />
            <div class="dev-badge">Developer</div>
          </div>

          <!-- Info -->
          <div class="dev-info">
            <div class="role-tag">Software Developer</div>
            <h3>Shiwanshu<br>Chourasia</h3>
            <div class="company-tag">
              <i class="fas fa-building"></i>
              DeskSavvy &mdash; Office Management System
            </div>

            <div class="bio-divider"></div>

            <p>Shiwanshu Chourasia is the software developer behind DeskSavvy — a full-featured office management system built to simplify how organizations manage their people and processes.</p>

            <p>With a strong foundation in Java-based web technologies, Shiwanshu designed DeskSavvy from the ground up, combining intuitive UI design with robust backend architecture to deliver a platform that's both powerful and easy to use.</p>

            <div class="skill-tags">
              <span class="skill-tag">Java</span>
              <span class="skill-tag">JSP / Servlets</span>
              <span class="skill-tag">MySQL</span>
              <span class="skill-tag">HTML / CSS</span>
              <span class="skill-tag">JavaScript</span>
              <span class="skill-tag">System Design</span>
            </div>
          </div>

        </div>
      </section>

      <!-- ─── Mission Strip ────────────────────────── -->
      <div class="mission-strip">
        <div class="mission-item">
          <div class="mission-icon"><i class="fas fa-rocket"></i></div>
          <h3>Our Mission</h3>
          <p>To build tools that empower every team member — from frontline employees to senior administrators — to do their best work without friction.</p>
        </div>
        <div class="mission-item">
          <div class="mission-icon"><i class="fas fa-eye"></i></div>
          <h3>Our Vision</h3>
          <p>A world where office management is invisible — where smart systems quietly keep everything running so people can focus on what truly matters.</p>
        </div>
        <div class="mission-item">
          <div class="mission-icon"><i class="fas fa-heart"></i></div>
          <h3>Our Values</h3>
          <p>Simplicity over complexity. Transparency over ambiguity. People over processes. We build for humans first, features second.</p>
        </div>
      </div>

    </div>

    <!-- ─── Footer ──────────────────────────────── -->
    <footer>
      &copy; 2025 <span>DeskSavvy</span>. All rights reserved.
    </footer>

  </body>
</html>
