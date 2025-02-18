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


@WebServlet(name = "SuppliersInsertServlet", urlPatterns = {"/SuppliersInsertServlet"})
public class SuppliersInsertServlet extends HttpServlet {


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
        
        
        
        
        String snum = request.getParameter("snum");
        
        String sname = request.getParameter("sname");
        
        String status = request.getParameter("status");
        
        String city = request.getParameter("city");
        
        
        String query = "insert into suppliers values('"+snum+"','"+sname+"',"+status+",'"+city+"')";
        
        
        Connection connection = null;
        ResultSet resultSet = null;

        try {
             String filePath = "theaccountant.properties";
            connection = GetConnectionMYSQL.getConnection(getServletContext(), filePath);
               Statement statement = connection.createStatement();
           
              
               
            int rowsInserted = statement.executeUpdate(query);

            
            if (rowsInserted > 0) 
            {
                 request.setAttribute("sucmesg", "Insert successful! " + rowsInserted + " row(s) inserted.");

            
            } else {
                
                 request.setAttribute("error", "Error In Insertion ! ");

            }

                        
               
           
      
        } catch (SQLException e) {
            
               request.setAttribute("error",  e.getMessage());

                
        } 
        

        // Forward the request back to rootHome.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("dataEntryHome.jsp");

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
