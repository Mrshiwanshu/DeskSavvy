import DB.DBconnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/changepassword1")
public class changepassword1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get existing session only
            HttpSession st = request.getSession(false);

            if (st == null) {
                response.sendRedirect(
                    "support.jsp?msg=Please Login First"
                );
                return;
            }

            // Get form values
            String oldPass = request.getParameter("t1");
            String newPass = request.getParameter("t2");

            // Get logged-in employee id from session
            String user = (String) st.getAttribute("user2");

            if (user == null) {
                response.sendRedirect(
                    "support.jsp?msg=Session Expired"
                );
                return;
            }

            // Database connection
            DBconnection db = new DBconnection();

            if (db.con == null) {
                response.sendRedirect(
                    "empchangePass.jsp?msg=Database Connection Failed"
                );
                return;
            }

            // Check current password
            db.pstmt = db.con.prepareStatement(
                "SELECT password FROM emp_login WHERE emp_id=?"
            );

            db.pstmt.setString(1, user);

            db.rst = db.pstmt.executeQuery();

            if (db.rst.next()) {

                String dbPassword =
                        db.rst.getString("password");

                if (dbPassword.equals(oldPass)) {

                    // Update password
                    db.pstmt = db.con.prepareStatement(
                        "UPDATE emp_login SET password=? WHERE emp_id=?"
                    );

                    db.pstmt.setString(1, newPass);
                    db.pstmt.setString(2, user);

                    int i = db.pstmt.executeUpdate();

                    if (i > 0) {

                        response.sendRedirect(
                            "empchangePass.jsp?msg=Password Changed Successfully"
                        );

                    } else {

                        response.sendRedirect(
                            "empchangePass.jsp?msg=Password Not Updated"
                        );
                    }

                } else {

                    response.sendRedirect(
                        "empchangePass.jsp?msg=Old Password Not Match"
                    );
                }

            } else {

                response.sendRedirect(
                    "empchangePass.jsp?msg=User Not Found"
                );
            }

            // Close resources
            if (db.rst != null)
                db.rst.close();

            if (db.pstmt != null)
                db.pstmt.close();

            if (db.con != null)
                db.con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "empchangePass.jsp?msg=Error Occurred"
            );
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Change Password Servlet";
    }
}
