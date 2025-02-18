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
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


@WebServlet(name = "AccountantUserServlet", urlPatterns = {"/AccountantUserServlet"})
public class AccountantUserServlet extends HttpServlet {

    

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
        Connection connection = null;
        ResultSet resultSet = null;
        
          
        try {
        
        String selectedOption = request.getParameter("query");

            String filePath = "theaccountant.properties";
            connection = GetConnectionMYSQL.getConnection(getServletContext(), filePath);
            Statement statement = connection.createStatement();
           
        
    if ("q1".equals(selectedOption)) {
        resultSet = statement.executeQuery("CALL Get_The_Sum_Of_All_Parts_Weights();"); 
        resultSet = statement.getResultSet(); 
        request.setAttribute("resultSet", resultSet);
           
        
        
    } else if ("q2".equals(selectedOption)) {
        resultSet = statement.executeQuery("CALL Get_The_Maximum_Status_Of_All_Suppliers();"); 
        resultSet = statement.getResultSet(); 
        request.setAttribute("resultSet", resultSet);
        
   
    } else if ("q3".equals(selectedOption)) {
        resultSet = statement.executeQuery("CALL Get_The_Total_Number_Of_Shipments();"); 
        resultSet = statement.getResultSet(); 
        request.setAttribute("resultSet", resultSet);
        
    }
     else if ("q4".equals(selectedOption)) {
    
         resultSet = statement.executeQuery("CALL Get_The_Name_Of_The_Job_With_The_Most_Workers();"); 
        resultSet = statement.getResultSet(); 
        request.setAttribute("resultSet", resultSet);
        
         
     }
     
      else if ("q5".equals(selectedOption)) {
    
          resultSet = statement.executeQuery("CALL List_The_Name_And_Status_Of_All_Suppliers();"); 
        resultSet = statement.getResultSet(); 
        request.setAttribute("resultSet", resultSet);
        
          
      }
      
    else {
          
          
                request.setAttribute("error", "Please Select Any Statement ");

    }
        }
        catch(Exception ex)
        {
            
                request.setAttribute("error", ex.getMessage());

        
        }
        
        
        
        
        // Forward the request back to rootHome.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("accountantHome.jsp");

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
    }// </editor-fold>

}
