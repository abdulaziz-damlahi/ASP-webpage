<html>
  <head>
    <meta charset="utf-8">
    <title>photos</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
	<%
	if Session("name")="" then
	response.redirect("login.asp?hata=login")
	end if	
	%>
  <div class="gallery2" style="width:800px;">
      <table style="width:100%" border="1" padding="10" background-color="#000000">
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Gender</th>
		<th>email</th>
		<th>country</th>
		<th>hobbies</th>
      </tr>
	  <%
		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
		qry="select * from users"
		set res=oConn.execute(qry)
		do while not res.eof
	  %>
      <tr>
        <td><%=res("fname")%></td>
        <td><%=res("lname")%></td>
        <td><%=res("gender")%></td>
		 <td><%=res("email")%></td>
		  <td><%=res("country")%></td>
		   <td><%=res("hobbies")%></td>
      </tr>
	  <% 
	  res.movenext
	  loop
	  %>
    </table>
</div>
  </body>
</html>
