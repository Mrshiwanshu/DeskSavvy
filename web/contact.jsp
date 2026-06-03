<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us - DeskSavvy</title>
    <link
      href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600&display=swap"
      rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    <style>
      :root {
        --ink: #0d0f1a;
        --paper: #f7f5f0;
        --cream: #ede9e0;
        --gold: #c9a84c;
        --gold-lt: #f0d98a;
        --teal: #1a7a6e;
        --teal-dk: #0f4f47;
        --white: #ffffff;
      }

      *,
      *::before,
      *::after {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
      }

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
        border-bottom: 1px solid rgba(201, 168, 76, .25);
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
        color: rgba(255, 255, 255, .65);
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
        background: rgba(201, 168, 76, .08);
      }

      /* ─── Page Body ──────────────────────────── */
      .page-body {
        flex: 1;
        display: flex;
        flex-direction: column;
      }

      /* ─── Hero Banner ────────────────────────── */
      .contact-banner {
        background: var(--ink);
        padding: 140px 56px 80px;
        position: relative;
        overflow: hidden;
        text-align: center;
      }

      .contact-banner::after {
        content: '';
        position: absolute;
        right: -100px;
        top: -100px;
        width: 500px;
        height: 500px;
        border-radius: 50%;
        background: radial-gradient(circle, rgba(201, 168, 76, .1) 0%, transparent 70%);
        pointer-events: none;
      }

      .contact-tag {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: rgba(201, 168, 76, .12);
        border: 1px solid rgba(201, 168, 76, .3);
        border-radius: 100px;
        padding: 6px 16px;
        color: var(--gold);
        font-size: 11.5px;
        letter-spacing: 2px;
        text-transform: uppercase;
        font-weight: 500;
        margin-bottom: 24px;
        position: relative;
        z-index: 1;
      }

      .contact-banner h1 {
        font-family: 'DM Serif Display', serif;
        font-size: clamp(32px, 4vw, 52px);
        color: var(--white);
        line-height: 1.15;
        margin-bottom: 16px;
        position: relative;
        z-index: 1;
      }

      .contact-banner h1 em {
        font-style: italic;
        color: var(--gold);
      }

      .contact-banner p {
        color: rgba(255, 255, 255, .5);
        font-size: 16px;
        line-height: 1.75;
        max-width: 600px;
        margin: 0 auto;
        position: relative;
        z-index: 1;
      }

      /* ─── Contact Section ────────────────────── */
      .contact-section {
        padding: 80px 56px;
        background: var(--white);
        display: flex;
        justify-content: center;
      }

      .contact-container {
        display: grid;
        grid-template-columns: 1fr 1.5fr;
        gap: 64px;
        max-width: 1100px;
        width: 100%;
        background: var(--paper);
        border-radius: 24px;
        padding: 48px;
        box-shadow: 0 16px 48px rgba(13, 15, 26, .06);
        position: relative;
      }

      /* Left: Contact Info */
      .contact-info {
        display: flex;
        flex-direction: column;
        gap: 32px;
      }

      .info-header h2 {
        font-family: 'DM Serif Display', serif;
        font-size: 28px;
        color: var(--ink);
        margin-bottom: 8px;
      }

      .info-header p {
        font-size: 15px;
        color: #666;
        line-height: 1.6;
      }

      .info-blocks {
        display: flex;
        flex-direction: column;
        gap: 24px;
        margin-top: 16px;
      }

      .info-block {
        display: flex;
        align-items: flex-start;
        gap: 16px;
      }

      .info-icon {
        width: 48px;
        height: 48px;
        border-radius: 12px;
        background: rgba(26, 122, 110, .1);
        color: var(--teal);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        flex-shrink: 0;
      }

      .info-text h3 {
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: #888;
        font-weight: 600;
        margin-bottom: 4px;
      }

      .info-text p,
      .info-text a {
        font-size: 16px;
        color: var(--ink);
        font-weight: 500;
        text-decoration: none;
      }

      .info-text a:hover {
        color: var(--teal);
      }

      /* Right: Form */
      .contact-form-wrapper {
        background: var(--white);
        padding: 40px;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(13, 15, 26, .04);
      }

      .form-group {
        margin-bottom: 24px;
      }

      .form-group label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: var(--ink);
        margin-bottom: 8px;
        letter-spacing: .5px;
      }

      .form-group input,
      .form-group textarea {
        width: 100%;
        padding: 14px 16px;
        background: var(--paper);
        border: 1px solid rgba(13, 15, 26, .1);
        border-radius: 8px;
        font-family: 'DM Sans', sans-serif;
        font-size: 15px;
        color: var(--ink);
        outline: none;
        transition: border-color .25s, background .25s;
      }

      .form-group input:focus,
      .form-group textarea:focus {
        border-color: var(--teal);
        background: var(--white);
      }

      .form-group textarea {
        resize: vertical;
        min-height: 120px;
      }

      .submit-btn {
        background: var(--teal);
        color: var(--white);
        border: none;
        padding: 14px 32px;
        border-radius: 100px;
        font-size: 15px;
        font-weight: 600;
        font-family: 'DM Sans', sans-serif;
        cursor: pointer;
        transition: background .2s, transform .2s;
        display: inline-flex;
        align-items: center;
        gap: 8px;
      }

      .submit-btn:hover {
        background: var(--teal-dk);
        transform: translateY(-2px);
      }

      /* ─── Footer ─────────────────────────────── */
      footer {
        background: var(--ink);
        color: rgba(255, 255, 255, .4);
        text-align: center;
        padding: 20px;
        font-size: 13px;
        letter-spacing: .5px;
        border-top: 1px solid rgba(255, 255, 255, .06);
        flex-shrink: 0;
      }

      footer span {
        color: var(--gold);
        opacity: .8;
      }

      /* ─── Responsive ─────────────────────────── */
      @media (max-width: 960px) {
        header {
          padding: 0 20px;
        }

        nav {
          display: none;
        }

        .contact-banner {
          padding: 100px 24px 60px;
        }

        .contact-section {
          padding: 48px 24px;
        }

        .contact-container {
          grid-template-columns: 1fr;
          padding: 32px 24px;
          gap: 48px;
        }

        .contact-form-wrapper {
          padding: 32px 24px;
        }
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
        <a href="blog.jsp">Blog</a>
        <a href="contact.jsp" class="active">Contact</a>
      </nav>
    </header>

    <div class="page-body">

      <!-- ─── Banner ──────────────────────────────── -->
      <div class="contact-banner">
        <div class="contact-tag">Get in touch</div>
        <h1>We'd love to <em>hear</em> from you</h1>
        <p>Whether you have a question about features, pricing, need a demo, or anything else, our team is ready to
          answer all your questions.</p>
      </div>

      <!-- ─── Contact Section ────────────────────── -->
      <section class="contact-section">
        <div class="contact-container">

          <!-- Left: Contact Details -->
          <div class="contact-info">
            <div class="info-header">
              <h2>Contact Details</h2>
              <p>Reach out to us directly through any of these channels.</p>
            </div>

            <div class="info-blocks">
              <div class="info-block">
                <div class="info-icon"><i class="fas fa-envelope"></i></div>
                <div class="info-text">
                  <h3>Email Address</h3>
                  <a href="mailto:support@desksavvy.com">support@desksavvy.com</a>
                </div>
              </div>

              <div class="info-block">
                <div class="info-icon"><i class="fas fa-phone-alt"></i></div>
                <div class="info-text">
                  <h3>Phone Number</h3>
                  <a href="tel:+919876543210">+91 98765 43210</a>
                </div>
              </div>

              <div class="info-block">
                <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                <div class="info-text">
                  <h3>Office Location</h3>
                  <p>123 Innovation Drive,<br>Tech City, TC 45678</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Right: Contact Form -->
          <div class="contact-form-wrapper">
            <script>let submitted = false;</script>
            <iframe name="hidden_iframe" id="hidden_iframe" style="display:none;" onload="if(submitted) { alert('Message sent successfully!'); submitted = false; document.getElementById('contactForm').reset(); }"></iframe>
            <form id="contactForm" action="https://formsubmit.co/el/jomola" method="POST" target="hidden_iframe" onsubmit="submitted=true;">
              <!-- Hidden fields for FormSubmit configuration -->
              <input type="hidden" name="_subject" value="New Contact Query from DeskSavvy">
              <input type="hidden" name="_captcha" value="false">

              <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="John Doe" required>
              </div>

              <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="john@example.com" required>
              </div>

              <div class="form-group">
                <label for="subject">Subject</label>
                <input type="text" id="subject" name="subject" placeholder="How can we help?" required>
              </div>

              <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" placeholder="Write your message here..." required></textarea>
              </div>

              <button type="submit" class="submit-btn">
                Send Message <i class="fas fa-paper-plane"></i>
              </button>
            </form>
          </div>

        </div>
      </section>

    </div>

    <!-- ─── Footer ──────────────────────────────── -->
    <footer>
      &copy; 2025 <span>DeskSavvy</span>. All rights reserved.
    </footer>

  </body>

  </html>