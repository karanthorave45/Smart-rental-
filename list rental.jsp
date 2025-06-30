<%@ page import="java.sql.*" %>
<html>
  <body>
    <h2>Rental List</h2>
    <a href="addRental.jsp">Add New Rental</a>
    <table border="1">
      <tr><th>From</th><th>To</th><th>Amount</th></tr>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental","root","password");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM rentals");
    while (rs.next()) {
%>
      <tr>
        <td><%= rs.getString("from") %></td>
        <td><%= rs.getString("to") %></td>
        <td><%= rs.getDouble("amount") %></td>
      </tr>
<% } %>
    </table>
  </body>
</html>
