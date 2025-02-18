
<%@ page import="java.sql.*" %>
<%@ page import="logins.GetConnectionMYSQL" %>

<%
    String error = (String) request.getAttribute("error");
    String sucmesg = (String) request.getAttribute("sucmesg");

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>CNT 4714 – Project Three – Summer 2024</title>
    
        
        
        <style>
        
        body{ background:#000000; }       
/*         hr {
             color: white;
        border-top: 3px solid #ffffff;  Solid line with a color 
        margin: 10px 0;  Adjusting margin for space around the line 
    } 
        */
    
        
        .bordered-heading {
      border: 1px solid #000; /* Add a border */
      padding: 10px; /* Add some padding for spacing */
      display: inline-block; /* Make it inline block to fit the content */
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
.inputs{
    
    font-size:16px;
    background-color:  #666600;
    margin: 5px;
    color: yellow;
}
table {
border: 3px solid yellow;
border-collapse: collapse;
  width: 68%;
  color:white;
}

th, td {
  border: 1px solid yellow;
  padding: 2px;
}

.header {
  
  font-weight: bold;
}

.main-board {
  width: 80%;
  margin: 0 auto;
  border: 2px solid white;
  padding: 10px;
}

.main-board-title {
  margin-top:-20px;
  text-align: center;
  color:white;
  width:26%;
  background:black;
  font-size: 18px;
  font-weight: bold;
}    

    </style>

    </head>
    <body>
        
        
        <div class="row" style="text-align: center; margin-top: 10px"> <h1 style="color: red; font-weight: bold; font-size: 35px">Welcome to the Summer 2024 Project 3 Enterprise System</h1></div>        
        <div class="row" style="text-align: center; margin-top: 10px"> <h1 style="color: cyan; font-weight: bold; font-size: 42px">Data Entry Application</h1></div>        
        
        <hr>
        
        <div class="row" style="text-align: center;"> <p style="color:white; font-size:  18px;">You are connected to the Project 3 Enterprise System database as a <i style="color: red;">data-entry-level</i> user.</p></div>        
        <div class="row" style="text-align: center;"> <p style="color:white; font-size:  18px;">Enter the data values in a form below to add a new record to the corresponding database table.</p></div>        
        <hr>
    
       
        <div class="main-board" style=" margin-top: 40px">
  <h1 class="main-board-title">Suppliers Record Insert</h1>

  <form method="post" action="SuppliersInsertServlet"> 
  <table>
    <thead>
      <tr class="header">
        <th>snum</th>
        <th>sname</th>
        <th>status</th>
        <th>city</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="text" name="snum"  class="inputs"></td>
        <td><input type="text" name="sname"  class="inputs"></td>
        <td><input type="text" name="status" class="inputs"></td>
        <td><input type="text" name="city"  class="inputs"></td>
      </tr>
    </tbody>
  </table>

  <input type="submit" style="font-size:20px; font-weight:bold; color:green; margin-top:20px; background-color: #333300; margin-left: 20px;" value="Enter Supplier Record Into Database">
  
  <input type="button" onclick="clearFields()" style="font-size:20px; font-weight:bold; color:red; margin-top:20px; margin-left:170px;  background-color: #333300" value="Clear Data and Results">
</form>


        </div>


        
       
        
        
        
         
        
        
        
         <div class="main-board" style=" margin-top: 40px">
  <h1 class="main-board-title">Parts Record Insert</h1>
  <form  method="post" action="PartsInsertServlet">
  <table>
    <thead>
      <tr class="header">
        <th>pnum</th>
        <th>pname</th>
        <th>color</th>
        <th>weight</th>
        
        <th>city</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="text" name="pnum" class="inputs"></td>
        <td><input type="text" name="pname" class="inputs"></td>
        <td><input type="text" name="color" class="inputs"></td>
        <td><input type="text" name="weight" class="inputs"></td>
        <td><input type="text" name="city" class="inputs"></td>
      </tr>
    </tbody>
  </table>

  <input type="submit" style="font-size:20px; font-weight:bold; color:green; margin-top:20px; background-color: #333300; margin-left: 20px;" value="Enter Part Record Into Database">
  
  <input type="button" onclick="clearFields1()" style="font-size:20px; font-weight:bold; color:red; margin-top:20px; margin-left:170px;  background-color: #333300" value="Clear Data and Results">
</form>
  </div>

        
 <div class="main-board" style=" margin-top: 40px">
  <h1 class="main-board-title">Jobs Record Insert</h1>
  <form method="post" action="JobsInsertServlet">
  <table>
    <thead>
      <tr class="header">
        <th>jnum</th>
        <th>jname</th>
        <th>numworkers</th>
        <th>city</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="text" name="jnum" class="inputs"></td>
        <td><input type="text" name="jname" class="inputs"></td>
        <td><input type="text" name="numworkers" class="inputs"></td>
        <td><input type="text" name="city" class="inputs"></td>
      </tr>
    </tbody>
  </table>

  <input type="submit" style="font-size:20px; font-weight:bold; color:green; margin-top:20px; background-color: #333300; margin-left: 20px;" value="Enter Parts Record Into Database">
  
  <input type="button" onclick="clearFields2()" style="font-size:20px; font-weight:bold; color:red; margin-top:20px; margin-left:170px;  background-color: #333300" value="Clear Data and Results">
  </form>
</div>
        
        
        
        
        
  <div class="main-board" style=" margin-top: 40px">
  <h1 class="main-board-title">Shipments Record Insert</h1>
  <form method="post" action ="ShipmentsInsertServlet">
  <table>
    <thead>
      <tr class="header">
        <th>snum</th>
        <th>pnum</th>
        <th>jnum</th>
        <th>quantity</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><input type="text" name="snum" class="inputs"></td>
        <td><input type="text" name="pnum" class="inputs"></td>
        <td><input type="text" name="jnum" class="inputs"></td>
        <td><input type="text" name="quantity" class="inputs"></td>
      </tr>
    </tbody>
  </table>

  <input type="submit" style="font-size:20px; font-weight:bold; color:green; margin-top:20px; background-color: #333300; margin-left: 20px;" value="Enter Supplier Record Into Database">
  
  <input type="button" onclick="clearFields3()" style="font-size:20px; font-weight:bold; color:red; margin-top:20px; margin-left:170px;  background-color: #333300" value="Clear Data and Results">
</form>
  </div>
      
        
        
 <hr>       
        <div class="row" style="text-align: center;margin-top: 20px"> <p style="color:white; font-size:  24px; font-weight: bold">Execution Results: </p></div>        
             
        
        
        
        
        
        
        
        
           <div class="container">
      
        <%  if (sucmesg != null) { %>
        <div id="sucmesg" style="background: #0066ff; color: white; font-size: 20px; font-weight: bold; text-align: center">
            <%= sucmesg %>
        </div>
        
        <% } else if (error != null) { %>
        <div id ="error" style="background: red; color: white; font-size: 20px; font-weight: bold; text-align: center">
            <%= error %>
        </div>
        <% } %>
        
    </div>
        
        
        
        
        
        
        
  <script>
    function clearFields() {
      document.getElementsByName("snum")[0].value = "";
      document.getElementsByName("sname")[0].value = "";
      document.getElementsByName("status")[0].value = "";
      document.getElementsByName("city")[0].value = "";
    }
    
    
    function clearFields1() {
      document.getElementsByName("pnum")[0].value = "";
      document.getElementsByName("pname")[0].value = "";
      document.getElementsByName("color")[0].value = "";
      document.getElementsByName("weight")[0].value = "";
      document.getElementsByName("city")[1].value = "";
    }
    
    
    function clearFields2() {
      document.getElementsByName("jnum")[0].value = "";
      document.getElementsByName("jname")[0].value = "";
      document.getElementsByName("numworkers")[0].value = "";
      document.getElementsByName("city")[2].value = "";
    }
    
    
    
    function clearFields3() {
      document.getElementsByName("jnum")[1].value = "";
      document.getElementsByName("pnum")[1].value = "";
      document.getElementsByName("snum")[1].value = "";
      document.getElementsByName("quantity")[0].value = "";
    }
    
    
  </script>
        
    </body>
</html>
