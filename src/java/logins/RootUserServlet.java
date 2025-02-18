/* Name: Emanuel Botros
Course: CNT 4714 – Summer 2024 – Project Three
Assignment title: A Three-Tier Distributed Web-Based Application
Date: August 1, 2024
*/
package logins;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import jdk.nashorn.internal.parser.TokenType;
import sun.font.EAttribute;


@WebServlet(name = "RootUserServlet", urlPatterns = {"/RootUserServlet"})
public class RootUserServlet extends HttpServlet {


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        String query = request.getParameter("multilineInput"); // Get the SQL query from the form
        Connection connection = null;
        ResultSet resultSet = null;

        try {
             String filePath = "root.properties";
             connection = GetConnectionMYSQL.getConnection(getServletContext(), filePath);
           
            Statement statement = connection.createStatement();
             
            
            
            
             request.setAttribute("ups",query.trim());
             QueryTypeChecker queryTypeChecker = new QueryTypeChecker();
           
           if(queryTypeChecker.getQueryType(query).equals("INSERT"))
           {
              
               
            int rowsInserted = statement.executeUpdate(query);

            
            if (rowsInserted > 0) 
            {
                 request.setAttribute("sucmesg", "Insert successful! " + rowsInserted + " row(s) inserted.");

            
            } else {
                
                 request.setAttribute("error", "Error In Insertion ! ");

            }

                        
               
               
           }
           else if(queryTypeChecker.getQueryType(query).equals("UPDATE"))
           {
           
               
               
               int rowsInserted = statement.executeUpdate(query);

            
            if (rowsInserted > 0) 
            {
                 request.setAttribute("sucmesg", "Updated Successful! " + rowsInserted + " row(s) Updated.");

            
            } else {
                
                 request.setAttribute("error", "Error In Updateion  ! ");

            }

            
               
               
               
               
           }
           
           else if(queryTypeChecker.getQueryType(query).equals("DELETE"))
           {
           
               int rowsInserted = statement.executeUpdate(query);

            
            if (rowsInserted > 0) 
            {
                 request.setAttribute("sucmesg", "Delete successful! " + rowsInserted + " row(s) deleted.");

            
            } else {
                
                 request.setAttribute("error", "Error In Delete ! ");

            }

            
               
               
           }
           
           else if(queryTypeChecker.getQueryType(query).equals("REPLACE"))
           {
           
               int rowsInserted = statement.executeUpdate(query);

            
            if (rowsInserted > 0) 
            {
                 request.setAttribute("sucmesg", "Replace successful! " + rowsInserted + " row(s) Replaced.");

            
            } else {
                
                 request.setAttribute("error", "Error In Replace ! ");

            }
               
               
           }
           
           else if(queryTypeChecker.getQueryType(query).equals("SELECT"))
           {
               resultSet = statement.executeQuery(query); 
               resultSet = statement.getResultSet(); 
               request.setAttribute("resultSet", resultSet);
           
           }
           else 
           {
                request.setAttribute("error", "Invalid Query Error ! ");

           
           }
           
      
        } catch (SQLException e) {
            
               request.setAttribute("error",  e.getMessage());

                
        } 
        

        // Forward the request back to rootHome.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("rootHome.jsp");

        dispatcher.forward(request, response);




        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
