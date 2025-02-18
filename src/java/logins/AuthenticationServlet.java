/* Name: Emanuel Botros
Course: CNT 4714 – Summer 2024 – Project Three
Assignment title: A Three-Tier Distributed Web-Based Application
Date: August 1, 2024
*/
package logins;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


@WebServlet(name = "AuthenticationServlet", urlPatterns = {"/AuthenticationServlet"})
public class AuthenticationServlet extends HttpServlet {

  
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        ArrayList<String> cList= new ArrayList<>();
        
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("username");
        String pass = request.getParameter("pass");
       
            String filePath = "system.properties";
        try {
            
            
            
            Connection connection = GetConnectionMYSQL.getConnection(getServletContext(), filePath);
       
            
            
            
            Statement   statement = connection.createStatement();

            // Define your SQL query to select data
            String sqlQuery = "SELECT * FROM usercredentials";

            // Execute the query
            ResultSet   resultSet = statement.executeQuery(sqlQuery);

            // Create an ArrayList to store the results
            ArrayList<String> resultList = new ArrayList<>();

            // Iterate through the result set and store data in the ArrayList
            while (resultSet.next()) {
                // Assuming each row contains one text field
                String cuser = resultSet.getString(1);
                
                String cpass = resultSet.getString(2);
                cList.add(user+","+pass);
            }

          
        
        
        } catch (SQLException ex) {
            Logger.getLogger(AuthenticationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
           
        
        
        
        


        System.out.println("Size = "+cList.size());


      
        boolean isFound=false;
        for(int i=0;i<cList.size();i++)
        {
            String un = cList.get(i).split(",")[0];
            String upass = cList.get(i).split(",")[1];
            
            
            System.out.println("["+user+"]["+un+"]==["+upass+"]["+pass+"]");
                 if(user.equals(un) && upass.equals(pass))
                 {
                            isFound=true;
                    if(un.charAt(0)=='r')
                    {
                      
                     request.setAttribute("mesg", user);
                     RequestDispatcher dispatcher = request.getRequestDispatcher("/rootHome.jsp");
                     dispatcher.forward(request, response);
                               
                    }
                    
                    else if(un.charAt(0)=='c')
                    {
                    
                     request.setAttribute("mesg", user);
                     request.setAttribute("pass", pass);
                     RequestDispatcher dispatcher = request.getRequestDispatcher("/clientHome.jsp");
                     dispatcher.forward(request, response);
                        
                    }
                    
                    else if(un.charAt(0)=='d')
                    {
                    request.setAttribute("mesg", user);
                     RequestDispatcher dispatcher = request.getRequestDispatcher("/dataEntryHome.jsp");
                     dispatcher.forward(request, response);
                        
                    
                    }
                    
                    else if(un.charAt(0)=='t')
                    {
                    
                        request.setAttribute("mesg", user);
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/accountantHome.jsp");
                        dispatcher.forward(request, response);
                    }
                    
                    
                 
                 }
                 
        
        }
        
        
        if(!isFound)
        {
        
            System.out.println("ERROR");
        System.out.println("User = "+user);
        System.out.println("Pass= "+pass);
        System.out.println(request.getParameter("mt"));
        request.setAttribute("mesg", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/errorpage.html");
        dispatcher.forward(request, response);


        }
        
        

        
        
        
        
        
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
