<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blog - DeskSavvy</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
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
      }

      *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

      html {
        overflow-y: auto !important;
        background-image: none !important;
      }

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
      .blog-banner {
        background: var(--ink);
        padding: 140px 56px 80px;
        position: relative;
        overflow: hidden;
        text-align: center;
      }

      .blog-banner::after {
        content: '';
        position: absolute;
        left: 50%; top: 50%;
        transform: translate(-50%, -50%);
        width: 600px; height: 600px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(26,122,110,.15) 0%, transparent 70%);
        pointer-events: none;
      }

      .blog-tag {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: rgba(26,122,110,.15);
        border: 1px solid rgba(26,122,110,.3);
        border-radius: 100px;
        padding: 6px 16px;
        color: #4cd4c3;
        font-size: 11.5px;
        letter-spacing: 2px;
        text-transform: uppercase;
        font-weight: 500;
        margin-bottom: 24px;
        position: relative;
        z-index: 1;
      }

      .blog-banner h1 {
        font-family: 'DM Serif Display', serif;
        font-size: clamp(32px, 4vw, 52px);
        color: var(--white);
        line-height: 1.15;
        margin-bottom: 16px;
        position: relative;
        z-index: 1;
      }

      .blog-banner h1 em { font-style: italic; color: var(--gold); }

      .blog-banner p {
        color: rgba(255,255,255,.5);
        font-size: 16px;
        line-height: 1.75;
        max-width: 600px;
        margin: 0 auto;
        position: relative;
        z-index: 1;
      }

      /* ─── Blog Grid ─────────────────────────── */
      .blog-section {
        padding: 80px 56px;
        background: var(--paper);
      }

      .blog-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
        gap: 40px;
        max-width: 1200px;
        margin: 0 auto;
      }

      /* Blog Card */
      .blog-card {
        background: var(--white);
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(13,15,26,.05);
        transition: transform .3s ease, box-shadow .3s ease;
        display: flex;
        flex-direction: column;
        text-decoration: none;
        color: inherit;
        border: 1px solid rgba(13,15,26,.05);
        opacity: 0;
        animation: fadeUp .6s ease forwards;
      }

      .blog-card:nth-child(1) { animation-delay: 0.1s; }
      .blog-card:nth-child(2) { animation-delay: 0.2s; }
      .blog-card:nth-child(3) { animation-delay: 0.3s; }
      .blog-card:nth-child(4) { animation-delay: 0.4s; }

      @keyframes fadeUp {
        from { opacity: 0; transform: translateY(24px); }
        to   { opacity: 1; transform: translateY(0); }
      }

      .blog-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 40px rgba(13,15,26,.1);
        border-color: rgba(201,168,76,.3);
      }

      .card-image {
        height: 220px;
        background: var(--ink);
        position: relative;
        overflow: hidden;
      }

      .card-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform .5s ease;
        opacity: 0.9;
      }

      .blog-card:hover .card-image img {
        transform: scale(1.05);
      }

      .card-category {
        position: absolute;
        top: 16px;
        left: 16px;
        background: var(--gold);
        color: var(--ink);
        padding: 6px 12px;
        border-radius: 8px;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: 1px;
        text-transform: uppercase;
        box-shadow: 0 4px 12px rgba(0,0,0,.15);
      }

      .card-content {
        padding: 32px 28px;
        flex: 1;
        display: flex;
        flex-direction: column;
      }

      .card-meta {
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 13px;
        color: #888;
        margin-bottom: 12px;
      }

      .card-meta i {
        color: var(--teal);
        font-size: 14px;
      }

      .card-title {
        font-family: 'DM Serif Display', serif;
        font-size: 24px;
        color: var(--ink);
        line-height: 1.25;
        margin-bottom: 16px;
        transition: color .2s;
      }

      .blog-card:hover .card-title {
        color: var(--teal);
      }

      .card-excerpt {
        font-size: 14.5px;
        color: #666;
        line-height: 1.7;
        margin-bottom: 24px;
        flex: 1;
      }

      .card-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding-top: 20px;
        border-top: 1px solid var(--cream);
      }

      .read-more {
        font-size: 13.5px;
        font-weight: 600;
        color: var(--ink);
        text-transform: uppercase;
        letter-spacing: 1px;
        display: flex;
        align-items: center;
        gap: 6px;
        transition: color .2s;
      }

      .read-more i {
        font-size: 12px;
        transition: transform .2s;
      }

      .blog-card:hover .read-more {
        color: var(--gold);
      }

      .blog-card:hover .read-more i {
        transform: translateX(4px);
      }

      .author {
        font-size: 13px;
        font-weight: 500;
        color: #555;
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
        .blog-banner { padding: 100px 24px 60px; }
        .blog-section { padding: 56px 24px; }

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
        <a href="about.jsp">About</a>
        <a href="blog.jsp" class="active">Blog</a>
        <a href="contact.jsp">Contact</a>
      </nav>
    </header>

    <div class="page-body">

      <!-- ─── Banner ──────────────────────────────── -->
      <div class="blog-banner">
        <div class="blog-tag">Our Journal</div>
        <h1>Insights, updates, and <em>ideas</em></h1>
        <p>Stay up to date with the latest news from DeskSavvy, tips for managing your office, and insights into the future of work.</p>
      </div>

      <!-- ─── Blog Grid ────────────────────────────── -->
      <section class="blog-section">
        <div class="blog-grid">

          <!-- Card 1 -->
          <a href="#" class="blog-card">
            <div class="card-image">
              <div class="card-category">Management</div>
              <img src="images/slide1.jpg" alt="Office Image">
            </div>
            <div class="card-content">
              <div class="card-meta">
                <span><i class="far fa-calendar-alt"></i> Oct 12, 2025</span>
                <span><i class="far fa-clock"></i> 5 min read</span>
              </div>
              <h2 class="card-title">How DeskSavvy is transforming remote work</h2>
              <p class="card-excerpt">Discover how our new features are helping distributed teams stay connected, accountable, and productive from anywhere in the world.</p>
              <div class="card-footer">
                <span class="read-more">Read Article <i class="fas fa-arrow-right"></i></span>
                <span class="author">By Admin</span>
              </div>
            </div>
          </a>

          <!-- Card 2 -->
          <a href="#" class="blog-card">
            <div class="card-image">
              <div class="card-category">Productivity</div>
              <img src="images/slide2.jpg" alt="Productivity Image">
            </div>
            <div class="card-content">
              <div class="card-meta">
                <span><i class="far fa-calendar-alt"></i> Sep 28, 2025</span>
                <span><i class="far fa-clock"></i> 3 min read</span>
              </div>
              <h2 class="card-title">Top 5 tips for better task delegation</h2>
              <p class="card-excerpt">Delegating tasks effectively is an art. Learn the five crucial steps to ensure your team understands their responsibilities.</p>
              <div class="card-footer">
                <span class="read-more">Read Article <i class="fas fa-arrow-right"></i></span>
                <span class="author">By Shiwanshu</span>
              </div>
            </div>
          </a>

          <!-- Card 3 -->
          <a href="#" class="blog-card">
            <div class="card-image">
              <div class="card-category">Security</div>
              <img src="images/slide3.jpg" alt="Security Image">
            </div>
            <div class="card-content">
              <div class="card-meta">
                <span><i class="far fa-calendar-alt"></i> Sep 15, 2025</span>
                <span><i class="far fa-clock"></i> 6 min read</span>
              </div>
              <h2 class="card-title">Understanding Role-Based Access Control</h2>
              <p class="card-excerpt">Security is paramount. We break down how DeskSavvy's RBAC system keeps your sensitive company data safe and secure.</p>
              <div class="card-footer">
                <span class="read-more">Read Article <i class="fas fa-arrow-right"></i></span>
                <span class="author">By Admin</span>
              </div>
            </div>
          </a>

          <!-- Card 4 -->
          <a href="#" class="blog-card">
            <div class="card-image">
              <div class="card-category">Future</div>
              <img src="images/main1.jpeg" alt="Future Image">
            </div>
            <div class="card-content">
              <div class="card-meta">
                <span><i class="far fa-calendar-alt"></i> Aug 04, 2025</span>
                <span><i class="far fa-clock"></i> 4 min read</span>
              </div>
              <h2 class="card-title">The future of office management in 2026</h2>
              <p class="card-excerpt">What does the next year hold for workspace OS platforms? We explore the upcoming trends in automation, AI, and employee wellbeing.</p>
              <div class="card-footer">
                <span class="read-more">Read Article <i class="fas fa-arrow-right"></i></span>
                <span class="author">By DeskSavvy</span>
              </div>
            </div>
          </a>

        </div>
      </section>



    </div>

    <!-- ─── Footer ──────────────────────────────── -->
    <footer>
      &copy; 2025 <span>DeskSavvy</span>. All rights reserved.
    </footer>

  </body>
</html>
