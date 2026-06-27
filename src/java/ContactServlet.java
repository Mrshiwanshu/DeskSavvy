import DB.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        boolean dbSaved = false;
        String errorMsg = "";
        
        // 1. Save to database
        try {
            DBconnection db = new DBconnection();
            if (db.con != null) {
                db.pstmt = db.con.prepareStatement(
                    "INSERT INTO contact_queries (name, email, subject, message) VALUES (?, ?, ?, ?)");
                db.pstmt.setString(1, name);
                db.pstmt.setString(2, email);
                db.pstmt.setString(3, subject);
                db.pstmt.setString(4, message);
                db.pstmt.executeUpdate();
                db.con.close();
                dbSaved = true;
            } else {
                errorMsg = "Database connection failed.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMsg = "DB Error: " + e.getMessage();
        }
        
        // 2. If saved successfully, output auto-submitting HTML form to send mail via user browser
        if (dbSaved) {
            // Build absolute redirect URL dynamically for the _next parameter
            String scheme = request.getScheme();
            String serverName = request.getServerName();
            int serverPort = request.getServerPort();
            String contextPath = request.getContextPath();
            
            String baseUrl = scheme + "://" + serverName;
            if (serverPort != 80 && serverPort != 443) {
                baseUrl += ":" + serverPort;
            }
            baseUrl += contextPath;
            String nextUrl = baseUrl + "/contact.jsp?status=success";

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><title>Sending Message...</title></head>");
            out.println("<body style='background:#f7f5f0; font-family:sans-serif; text-align:center; padding-top:100px;'>");
            out.println("  <div style='display:inline-block; padding:30px; background:#fff; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,0.05);'>");
            out.println("    <p style='color:#1a7a6e; font-size:18px; font-weight:bold;'>Sending your message...</p>");
            out.println("    <p style='color:#666;'>Please do not close this window.</p>");
            out.println("  </div>");
            out.println("  <form id='fsForm' action='https://formsubmit.co/el/jomola' method='POST'>");
            out.println("    <input type='hidden' name='name' value='" + name.replace("'", "&#39;").replace("\"", "&quot;") + "'>");
            out.println("    <input type='hidden' name='email' value='" + email.replace("'", "&#39;").replace("\"", "&quot;") + "'>");
            out.println("    <input type='hidden' name='subject' value='" + subject.replace("'", "&#39;").replace("\"", "&quot;") + "'>");
            out.println("    <input type='hidden' name='message' value='" + message.replace("'", "&#39;").replace("\"", "&quot;") + "'>");
            out.println("    <input type='hidden' name='_subject' value='New Contact Query from DeskSavvy'>");
            out.println("    <input type='hidden' name='_captcha' value='false'>");
            out.println("    <input type='hidden' name='_next' value='" + nextUrl + "'>");
            out.println("  </form>");
            out.println("  <script>");
            out.println("    document.getElementById('fsForm').submit();");
            out.println("  </script>");
            out.println("</body>");
            out.println("</html>");
        } else {
            response.sendRedirect("contact.jsp?status=error&msg=" + java.net.URLEncoder.encode(errorMsg, "UTF-8"));
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Contact form handler servlet";
    }
}
