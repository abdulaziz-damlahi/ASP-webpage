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
	<%
	comm=request.form("comment")
	if request.form("send")<>"" and trim(comm)<>"" then	
	Set oConn = Server.CreateObject("ADODB.Connection")
	oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))	
	qry="insert into comment(fname,comment,comm_date,user_id)values('"&Session("name")&"','"&comm&"','"&now&"',0)"
	oConn.execute(qry)
	oConn.close
	end if
	%>
  <div class="gallery2">
<h2>enter your comment</h2>
<form action="forum.asp" method="post">
<input type="text" name="comment" placeholder="comment">
<br><input type="submit" name="send" value="send" class="btn-login"></br>
</form>
      <table style="width:100%" border="1" padding="10" background-color="#000000">
      <tr>
        <th>Firstname</th>
        <th>comment</th>
        <th>Date</th>
      </tr>
	  <%
		Set oConn = Server.CreateObject("ADODB.Connection")
		oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
		qry="select * from comment where user_id=0 order by comm_date desc"
		set res=oConn.execute(qry)
		do while not res.eof
	  %>
      <tr>
        <td><%=res("fname")%></td>
        <td><%=res("comment")%></td>
        <td><%=res("comm_date")%></td>
      </tr>
	  <% 
	  res.movenext
	  loop
	  %>
    </table>
</div>
  </body>
</html>
