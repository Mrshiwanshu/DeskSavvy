<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <% HttpSession st=request.getSession(); String user=(String)st.getAttribute("user2"); String
        pass=(String)st.getAttribute("pass2"); String com_id=(String)st.getAttribute("comp"); if(user==null ||
        pass==null || com_id==null) { response.sendRedirect("support.jsp?msg=Please login first!!!!"); return; } %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Change Password - DeskSavvy</title>
            <link
                href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
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
                    --red: #ff4757;
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
                    position: sticky;
                    top: 0;
                    z-index: 100;
                    border-bottom: 1px solid rgba(201, 168, 76, .25);
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

                .user-info {
                    text-align: right;
                }

                .user-info .name {
                    color: var(--white);
                    font-size: 14px;
                    font-weight: 500;
                }

                .user-info .role {
                    color: rgba(201, 168, 76, .8);
                    font-size: 12px;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }

                .logout-btn {
                    background: rgba(255, 255, 255, .05);
                    color: var(--white);
                    border: 1px solid rgba(255, 255, 255, .1);
                    padding: 8px 16px;
                    border-radius: 6px;
                    font-size: 13px;
                    text-decoration: none;
                    transition: all .2s;
                }

                .logout-btn:hover {
                    background: rgba(255, 50, 50, .1);
                    color: #ff6b6b;
                    border-color: rgba(255, 50, 50, .3);
                }

                /* ─── Main Content ───────────────────────── */
                .dashboard-container {
                    padding: 64px 56px;
                    margin: 0 auto;
                    width: 100%;
                    position: relative;
                    z-index: 10;
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                }

                /* ─── Animations ─────────────────────────── */
                @keyframes fadeInUp {
                    from {
                        opacity: 0;
                        transform: translateY(30px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                /* ─── Card ────────────────────────────── */
                .password-card {
                    background: var(--white);
                    border-radius: 24px;
                    padding: 48px;
                    box-shadow: 0 16px 40px rgba(13, 15, 26, .06);
                    width: 100%;
                    max-width: 480px;
                    border: 1px solid rgba(13, 15, 26, .05);
                    animation: fadeInUp 0.8s ease-out;
                }

                .card-header {
                    text-align: center;
                    margin-bottom: 32px;
                }

                .card-header i {
                    font-size: 40px;
                    color: var(--teal);
                    margin-bottom: 16px;
                    display: block;
                }

                .card-header h2 {
                    font-family: 'DM Serif Display', serif;
                    font-size: 32px;
                    color: var(--ink);
                    margin-bottom: 8px;
                }

                .card-header p {
                    color: #666;
                    font-size: 15px;
                }

                /* Form Elements */
                .form-group {
                    margin-bottom: 24px;
                    position: relative;
                }

                .form-group label {
                    display: block;
                    font-size: 13px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    color: var(--ink);
                    margin-bottom: 8px;
                }

                .input-wrapper {
                    position: relative;
                }

                .input-wrapper input {
                    width: 100%;
                    padding: 16px 20px;
                    background: var(--paper);
                    border: 1.5px solid rgba(13, 15, 26, .1);
                    border-radius: 12px;
                    font-family: 'DM Sans', sans-serif;
                    font-size: 16px;
                    color: var(--ink);
                    outline: none;
                    transition: all 0.3s ease;
                }

                .input-wrapper input:focus {
                    border-color: var(--teal);
                    background: var(--white);
                    box-shadow: 0 8px 24px rgba(26, 122, 110, .15);
                }

                .input-wrapper i {
                    position: absolute;
                    right: 20px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #aaa;
                    cursor: pointer;
                    transition: color 0.3s;
                }

                .input-wrapper i:hover {
                    color: var(--teal);
                }

                .btn-submit {
                    width: 100%;
                    padding: 16px;
                    background: var(--teal);
                    color: var(--white);
                    border: none;
                    border-radius: 12px;
                    font-size: 16px;
                    font-weight: 600;
                    font-family: 'DM Sans', sans-serif;
                    cursor: pointer;
                    transition: transform .2s, box-shadow .2s, background .2s;
                    margin-top: 8px;
                }

                .btn-submit:hover {
                    background: var(--teal-dk);
                    transform: translateY(-2px);
                    box-shadow: 0 8px 24px rgba(26, 122, 110, .2);
                }

                /* Alert Message */
                .alert-msg {
                    margin-top: 24px;
                    padding: 16px;
                    border-radius: 8px;
                    font-weight: 500;
                    font-size: 15px;
                    text-align: center;
                    background: rgba(46, 213, 115, 0.15);
                    color: var(--teal-dk);
                    border-left: 4px solid var(--teal);
                }

                .back-link {
                    margin-top: 40px;
                    display: inline-block;
                    color: var(--teal);
                    text-decoration: none;
                    font-weight: 500;
                    transition: color .2s;
                    text-align: center;
                }

                .back-link:hover {
                    color: var(--teal-dk);
                    text-decoration: underline;
                }
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
                        <div class="name">
                            <%= user !=null ? user : "Employee" %>
                        </div>
                        <div class="role">Employee</div>
                    </div>
                    <a href="emplogout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </div>
            </header>

            <div class="dashboard-container">

                <div class="password-card">

                    <div class="card-header">
                        <i class="fas fa-shield-alt"></i>
                        <h2>Change Password</h2>
                        <p>Keep your account secure by updating your password regularly.</p>
                    </div>

                    <form method="post" action="changepassword1">

                        <div class="form-group">
                            <label>Current Password</label>
                            <div class="input-wrapper">
                                <input type="password" name="t1" id="oldPass" placeholder="Enter current password"
                                    required>
                                <i class="fas fa-eye" onclick="togglePass('oldPass', this)"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>New Password</label>
                            <div class="input-wrapper">
                                <input type="password" name="t2" id="newPass" placeholder="Enter new password" required>
                                <i class="fas fa-eye" onclick="togglePass('newPass', this)"></i>
                            </div>
                        </div>

                        <button type="submit" class="btn-submit">Update Security Key</button>

                        <% String abc=request.getParameter("msg"); if(abc !=null && !abc.trim().isEmpty()) {
                            out.println("<div class='alert-msg'><i class='fas fa-info-circle'></i> " + abc + "
                </div>");
                }
                %>

                </form>

            </div>

            <a href="empHome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>

            </div>

            <!-- Password Toggle Script -->
            <script>
                function togglePass(inputId, icon) {
                    const input = document.getElementById(inputId);
                    if (input.type === "password") {
                        input.type = "text";
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");
                    } else {
                        input.type = "password";
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    }
                }
            </script>
        </body>

        </html>