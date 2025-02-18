

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
    
    input[type="radio"] {
  width: 20px;
  height: 20px;
  margin-top: 13px;
  margin-left: 50px;
  border-radius: 50%;
  background-color: #ccc;
}

input[type="radio"]:checked {
  background-color: #007bff;
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
      
        
        
            <div class="row" style="text-align: center; margin-top: 10px"> <h1 style="color: yellow; font-weight: bold; font-size: 35px">Welcome to the Summer 2024 Project 3 Enterprise System</h1></div>        
        
        
        <div class="row" style="text-align: center; margin-top: 10px"> <h1 style="color: #00cc66; font-weight: bold;font-size: 30px">A Servlet/JSP-based Multi-tiered Enterprise Application Using A</h1></div>        
        <div class="row" style="text-align: center;"> <h1 style="color: #00cc66; font-weight: bold; font-size: 30px;">Tomcat Container</h1></div>        
        
        <hr>
        
        
        
        <div class="row" style="text-align: center;"> <p style="color:white; font-size:  18px;">You are connected to the Project 3 Enterprise System database as a <i style="color: red;">accountant-level</i> user.</p></div>        
        
        
        <div class="row" style="text-align: center;"> <p style="color:white; font-size:  18px;">Please enter any SQL query or update command in the box below.</p></div>        
    
        
        
        <div class="container" style="background: lightgray; border: 1px solid black">
            <form method="post" action="AccountantUserServlet">
                
                <div class="row"> 
                    <div class="col-sm-1">
                    <input type="radio" id="q1" name="query" value="q1">
                    </div>
                    <div class="col-sm-11">
                    
                        <label for="q1" style="color: black; font-size: 24px;">   <span style="color: blue;">Get The Maximum Status Value Of All Suppliers </span>(Returns a maximum value)</label>
                    </div>
               </div>
                
                
                <div class="row"> 
                    <div class="col-sm-1">
                    <input type="radio" id="q2" name="query" value="q2">
                    </div>
                    <div class="col-sm-11">
                    
                        <label for="q1" style="color: black; font-size: 24px;">   <span style="color: blue;">Get The Total Weight Of All Parts </span>(Returns a sum)</label>
                    </div>
               </div>
                
                
                <div class="row"> 
                    <div class="col-sm-1">
                    <input type="radio" id="q3" name="query" value="q3">
                    </div>
                    <div class="col-sm-11">
                    
                        <label for="q1" style="color: black; font-size: 24px;">   <span style="color: blue;"> Get The Total Number of Shipments </span> (Returns the current number of shipments in total)</label>
                    </div>
               </div>
                
                
                
                <div class="row"> 
                    <div class="col-sm-1">
                    <input type="radio" id="q4" name="query" value="q4">
                    </div>
                    <div class="col-sm-11">
                    
                        <label for="q1" style="color: black; font-size: 24px;">   <span style="color: blue;">
                                Get The Name And Number Of Workers Of The Job With The Most Workers </span> (Returns two values)</label>
                    </div>
               </div>
                
                
                
                <div class="row"> 
                    <div class="col-sm-1">
                    <input type="radio" id="q5" name="query" value="q5">
                    </div>
                    <div class="col-sm-11">
                    
                        <label for="q1" style="color: black; font-size: 24px;">   <span style="color: blue;">List The Name And Status Of Every Supplier </span>(Returns a list of supplier names with status)</label>
                    </div>
               </div>
                
                
                
                
                
                
                
                
                <input type="submit" value="Execute Command" style="margin-left: 300px;color:lawngreen; background-color: #006666; font-size: 22px; font-weight: bold; margin-top:  20px; margin-bottom: 20px; ">
                
                <input type="button" id="clearButton"  value="Clear Results" style="margin-left: 500px;color:red; background-color: #006666; font-size: 22px; font-weight: bold; margin-top:  20px; margin-bottom: 20px; ">
                
                
            </form>
            
            
        </div>.
        
        
        
        
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
    </script>
        
        
    </body>
</html>
