package DB;
import java.sql.*;
public class DBconnection {
  public Connection con=null;  
  public Statement stmt=null;
  public PreparedStatement pstmt=null;
  public ResultSet rst=null;
  public ResultSet rst1=null;
  public String connectionError=null;
  public DBconnection()
  {
  try
  {
  Class.forName("com.mysql.jdbc.Driver");
  String dbUrl = System.getenv("DB_URL") != null ? System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/virtual_office";
  String dbUser = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
  String dbPassword = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "root";
  con=DriverManager.getConnection(dbUrl, dbUser, dbPassword);
  }
  catch(Exception e)
  {
  e.printStackTrace();
  connectionError = e.getMessage() != null ? e.getMessage() : e.toString();
  }
  }
  }
