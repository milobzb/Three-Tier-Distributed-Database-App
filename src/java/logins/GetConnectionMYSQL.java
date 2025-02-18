/* Name: Emanuel Botros
Course: CNT 4714 – Summer 2024 – Project Three
Assignment title: A Three-Tier Distributed Web-Based Application
Date: August 1, 2024
*/
package logins;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.swing.JLabel;

public class GetConnectionMYSQL extends HttpServlet{

    public GetConnectionMYSQL() {
    }

   
    
  public static Connection getConnection(ServletContext context, String fileName) throws SQLException {
        Properties properties = new Properties();
        String filePath = context.getRealPath("/WEB-INF/" + fileName);
        
        try (FileInputStream fis = new FileInputStream(filePath)) {
            properties.load(fis);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        
        String dbDriver = properties.getProperty("DB_DRIVER");
        String dbUrl = properties.getProperty("DB_URL");
        String dbUsername = properties.getProperty("DB_USERNAME");
        String dbPassword = properties.getProperty("DB_PASSWORD");
        
        try {
            Class.forName(dbDriver);
            return DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException(e.getMessage()+"Failed to establish database connection.");
        }
    }

    
    
    
        public  Connection getCredentialConnection() {
        try {
            String connURL = "jdbc:mysql://localhost:3306/credentialsDB";
           
            String hostName="root";
            String hostPass = "Milo12345";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(connURL, hostName, hostPass);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            
            return null; 
        }
    }

    
    
    
     public  Connection connectionDataEntry() {
        try {
            String connURL = "jdbc:mysql://localhost:3306/project3";
           
            String hostName="dataentryuser";
            String hostPass = "dataentryuser";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(connURL, hostName, hostPass);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            
            return null; 
        }
    }

     
     
     public  Connection connectionAccountant() {
        try {
            String connURL = "jdbc:mysql://localhost:3306/project3";
           
            String hostName="theaccountant";
            String hostPass = "theaccountant";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(connURL, hostName, hostPass);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            
            return null; 
        }
    }
   
    
     public  Connection connectionRoot() {
        try {
            String connURL = "jdbc:mysql://localhost:3306/project3";
           
            String hostName="root";
            String hostPass = "12345";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(connURL, hostName, hostPass);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            
            return null; 
        }
    }

    
    
    
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

