<!DOCTYPE html>
<html>
  <head>
    <title>login</title>
  <link rel="stylesheet" type="text/css" href="style.css">
	  <%
	if request.form("submit")<>"" then
	fname=request.form("fname")
	psw=request.form("psw")
	  Set oConn = Server.CreateObject("ADODB.Connection")
	  oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
	  qry="select * from users where fname='"&fname&"' and psw='"&psw&"'"
	  set res=oConn.execute(qry)
	  if res.eof then
	  msg="<h1 class='erorr' style='color:red;'>wrong name or password</h1>"
	  else
	  msg="<h1 class='ok' style='color:green;'>You loggid in</h1>"
	  Session("name")=fname
	  end if
	  end if
	  if request.form("logout")<>"" then
	  Session.contents.removeall()
	  end if
	  %>

<body>
<div class="container">
    <img src="man.png">
    <form action="login.asp" method="post">
      <div class="form-input">
<input type="text" name="fname" placeholder="enter first name">
      </div>
      <div class="form-input">
        <input type="password" name="psw" placeholder="enter password">
<% if Session("name")="" then%>
<input type="submit" name="submit" value="LOGIN" class="btn-login"><br>
<% else%>
<input type="submit" name="logout" value="LOGOUT" class="btn-login"><br>
<% end if %>
<a href="#">forget password?</a><br>
<a href="signup.asp">sign up</a>
      </div>
	<%=msg%>
    </form>
  </div>
</body>
</html>
