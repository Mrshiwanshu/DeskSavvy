<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.net.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Database Connection Diagnostics</title>
</head>
<body style="font-family: monospace; padding: 20px; background: #1e1e1e; color: #d4d4d4;">
    <h2>Database Connection Diagnostics</h2>
    <hr/>
    <h3>1. Environment Variables</h3>
    <pre>
DB_URL: <%= System.getenv("DB_URL") %>
DB_USER: <%= System.getenv("DB_USER") %>
DB_PASSWORD is set: <%= System.getenv("DB_PASSWORD") != null && !System.getenv("DB_PASSWORD").isEmpty() %>
    </pre>

    <h3>2. Driver Class Loading</h3>
    <pre>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        out.println("SUCCESS: com.mysql.cj.jdbc.Driver loaded successfully!");
    } catch (ClassNotFoundException e) {
        out.println("FAILED: ClassNotFoundException: " + e.getMessage());
    }
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        out.println("SUCCESS: com.mysql.jdbc.Driver (old name) loaded successfully!");
    } catch (ClassNotFoundException e) {
        out.println("FAILED: ClassNotFoundException for old driver: " + e.getMessage());
    }
%>
    </pre>

    <h3>3. Registered Drivers</h3>
    <pre>
<%
    Enumeration<Driver> drivers = DriverManager.getDrivers();
    if (!drivers.hasMoreElements()) {
        out.println("No drivers registered with DriverManager.");
    } else {
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            out.println("Registered Driver: " + driver.getClass().getName() + " (Version " + driver.getMajorVersion() + "." + driver.getMinorVersion() + ")");
        }
    }
%>
    </pre>

    <h3>4. Connection Attempt</h3>
    <pre>
<%
    String dbUrl = System.getenv("DB_URL") != null ? System.getenv("DB_URL").trim().replaceAll("\\r|\\n", "") : null;
    String dbUser = System.getenv("DB_USER") != null ? System.getenv("DB_USER").trim().replaceAll("\\r|\\n", "") : null;
    String dbPassword = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD").trim().replaceAll("\\r|\\n", "") : null;
    if (dbUrl == null || dbUrl.isEmpty()) {
        out.println("Skipping connection: DB_URL is not set.");
    } else {
        try {
            out.println("Attempting connection to: " + dbUrl);
            Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            out.println("SUCCESS: Connection established!");
            con.close();
        } catch (SQLException e) {
            out.println("FAILED: SQLException: " + e.getMessage());
            out.println("Error Code: " + e.getErrorCode());
            out.println("SQL State: " + e.getSQLState());
            e.printStackTrace();
        }
    }
%>
    </pre>

    <h3>5. Webapp Classpath / lib Contents</h3>
    <pre>
<%
    try {
        ServletContext context = getServletContext();
        Set<String> resourcePaths = context.getResourcePaths("/WEB-INF/lib/");
        if (resourcePaths == null || resourcePaths.isEmpty()) {
            out.println("/WEB-INF/lib/ is empty or not found.");
        } else {
            for (String path : resourcePaths) {
                out.println("Found in /WEB-INF/lib/: " + path);
            }
        }
    } catch (Exception e) {
        out.println("Error listing WEB-INF/lib: " + e.toString());
    }
%>
    </pre>
</body>
</html>
