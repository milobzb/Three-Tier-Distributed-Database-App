



<%@ page import="java.sql.*" %>
<%@ page import="logins.GetConnectionMYSQL" %>

<%
    ResultSet result = (ResultSet) request.getAttribute("resultSet");
    String error = (String) request.getAttribute("error");
    String sucmesg = (String) request.getAttribute("sucmesg");

%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>CNT 4714 – Project Three – Summer 2024</title>
        
        
        
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        
    <style>
        
      body{ background:#000000; }       
         hr {
             color: white;
        border-top: 3px solid #ffffff; /* Solid line with a color */
        margin: 10px 0; /* Adjusting margin for space around the line */
    } 
        
    
    #myInput {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 300px;
    font-size: 18px;
    background: #999900;
    color: #333;
}
    
    

table {
  width: 50%;
    margin-left: auto;
  margin-right: auto;
  border-collapse: collapse;
}

th, td {
  border: 5px solid black;
  padding: 10px;
  text-align: left;
}

tr:nth-child(even) {
    background-color:#ffffff;
}


tr:nth-child(odd) {
    background-color:#ccc;
}

th {
  background-color: red;
  color: white;
}

    
    
    </style>

    
    
    
    
    </head>
    <body>
   
    
      
        <div class="row" style="text-align: center; margin-top: 10px"> <h1 style="color: red; font-weight: bold; font-size: 35px">Welcome to the Summer 2024 Project 3 Enterprise System</h1></div>        
        
        
        <div class="row" style="text-align: center; margin-top: 10px"> <h1 style="color: cyan; font-weight: bold;font-size: 30px">A Servlet/JSP-based Multi-tiered Enterprise Application Using A</h1></div>        
        <div class="row" style="text-align: center;"> <h1 style="color: cyan; font-weight: bold; font-size: 30px;">Tomcat Container</h1></div>        
        
        <hr>
        
        
        
        <div class="row" style="text-align: center;"> <p style="color:white; font-size:  18px;">You are connected to the Project 3 Enterprise System database as a <i style="color: red;">client-level</i> user.</p></div>        
        
        
        <div class="row" style="text-align: center;"> <p style="color:white; font-size:  18px;">Please enter any SQL query or update command in the box below.</p></div>        
        
         <div class="container">
        
                <form action="ClientUserServlet" method="post">
                   <div class="row ">
                       <div class="col-sm-3"></div>
                       <div class="col-sm-6">  <textarea id="multilineInput" style=" background-color: #0033ff;color: yellow" name="multilineInput"  rows="10" cols="80" >
                           

      <%
            String userInput = (String) request.getAttribute("ups");
            if (userInput != null) {
                out.println(userInput);
            }
        %>


                           </textarea>
                     </div>
                       
                      </div>
                    
                    
                    
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-2">
                    <input type="submit" value="Execute Command" class="btn btn-primary"  style=" font-size: 22px; font-weight: bold; background:  #666600;color: #00cc33">
          </div>
                        <div class="col-sm-2">
                            
                                      <input id="clearForm" type="button" value="Reset Form" class="btn btn-primary"  style=" font-size: 22px; font-weight: bold; background:  #666600;color: red;margin-left: 20px">
          
                            
                        </div>
                        <div class="col-sm-2">
                              <input type="button" id="clearButton" value="Clear Results" class="btn btn-primary" style=" font-size: 22px; font-weight: bold; background:  #666600;color:yellow">
                  
                            
                        </div>
                        
                        
          
                    </div>
                    
                </form>
          
    </div>
        
        
        
        
        <div class="row" style="text-align: center;margin-top: 20px"> <p style="color:white; font-size:  20px;">All execution results will appear below this line.</p></div>        
        
        <hr>
        <div class="row" style="text-align: center;margin-top: 20px"> <p style="color:white; font-size:  24px; font-weight: bold">Execution Results: </p></div>        
        
        
         <div class="container">
        <% if (result != null) { %>
        <table id="myTable">
            <% 
                ResultSetMetaData metaData = result.getMetaData();
                int columnCount = metaData.getColumnCount();
            %>
            <tr>
                <% for (int i = 1; i <= columnCount; i++) { %>
                    <th><%= metaData.getColumnName(i) %></th>
                <% } %>
            </tr>
            <% while (result.next()) { %>
                <tr>
                    <% for (int i = 1; i <= columnCount; i++) { %>
                        <td><%= result.getString(i) %></td>
                    <% } %>
                </tr>
            <% } %>
        </table>
        <% } else if (sucmesg != null) { %>
        <div id="sucmesg" style="background: forestgreen; color: white; font-size: 20px; font-weight: bold; text-align: center">
            <%= sucmesg %>
        </div>
        
        <% } else if (error != null) { %>
        <div id ="error" style="background: red; color: white; font-size: 20px; font-weight: bold; text-align: center">
            <%= error %>
        </div>
        <% } %>
        
    </div>
        
        
        
    </body>
    
    <script>
  const clearButton = document.getElementById('clearButton');
  clearButton.addEventListener('click', () => {
    const table = document.getElementById('myTable');
    const err = document.getElementById('error');
    const mesg = document.getElementById('sucmesg');
    table.innerHTML = '';
    err.innerHTML = '';
    
    mesg.innerHTML = '';
  });
  
  
  const clearForm = document.getElementById('clearForm');
  clearForm.addEventListener('click', () => {
    const dataInput = document.getElementById('multilineInput');
    dataInput.value = '';
  });
  
  
  
</script>
    
</html>
