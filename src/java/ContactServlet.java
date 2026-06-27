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
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        boolean dbSaved = false;
        boolean emailSent = false;
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
                errorMsg += "Database connection failed. ";
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMsg += "DB Error: " + e.getMessage() + ". ";
        }
        
        // 2. Send email via FormSubmit.co
        try {
            String formData = "name=" + URLEncoder.encode(name, "UTF-8")
                    + "&email=" + URLEncoder.encode(email, "UTF-8")
                    + "&subject=" + URLEncoder.encode(subject, "UTF-8")
                    + "&message=" + URLEncoder.encode(message, "UTF-8")
                    + "&_subject=" + URLEncoder.encode("New Contact Query from DeskSavvy", "UTF-8")
                    + "&_captcha=false";
            
            URL url = new URL("https://formsubmit.co/el/jomola");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36");
            
            // Set Referer and Origin headers to ensure FormSubmit knows where the query came from
            String referer = request.getHeader("Referer");
            if (referer == null) {
                referer = "https://desksavvy-rnp1.onrender.com/contact.jsp";
            }
            conn.setRequestProperty("Referer", referer);
            
            String origin = request.getHeader("Origin");
            if (origin == null) {
                origin = "https://desksavvy-rnp1.onrender.com";
            }
            conn.setRequestProperty("Origin", origin);
            
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(10000);
            
            OutputStream os = conn.getOutputStream();
            os.write(formData.getBytes("UTF-8"));
            os.flush();
            os.close();
            
            int responseCode = conn.getResponseCode();
            if (responseCode >= 200 && responseCode < 400) {
                emailSent = true;
            } else {
                errorMsg += "Email service returned code " + responseCode + ". ";
            }
            conn.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
            errorMsg += "Email Error: " + e.getMessage() + ". ";
        }
        
        // 3. Redirect with status
        if (dbSaved) {
            response.sendRedirect("contact.jsp?status=success");
        } else {
            response.sendRedirect("contact.jsp?status=error&msg=" + URLEncoder.encode(errorMsg, "UTF-8"));
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
