<html>
  <head>
    <title>signup</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  </head>
<body>
  <center>
  <div class="container1">
    <img src="man.png">
    <form action="signup.asp" method="post">
      <div class="form-input">
<input type="text" name="fname" placeholder="first name">
      </div>
        <div class="form-input">
  <input type="text" name="lname" placeholder="last name">
        </div>
        <div class="form-input">
  <input type="text" name="email" placeholder="email address">
        </div>
        <div class="radiobutton">
        <br><b>gender</b><br>
    <input type="radio" name="gender" value="male"> Male
    <input type="radio" name="gender" value="female"> Female
    <input type="radio" name="gender" value="other"> Other
</div>
<div class="form-input">
  <br><b>hobbies</b><br>
<input type="checkbox" name="hobbies" value="drawing">drawing
<input type="checkbox" name="hobbies" value="swimming">swimming
<input type="checkbox" name="hobbies" value="acting">acting
</div>
  <b>choose your country<b>

 <br>
 <select name="country">
  <option value="syria">syria</option>
  <option value="turkey">turkey</option>
  <option value="usa">usa</option>
  <option value="uk">uk</option>
  </select>
  <br>
<input type="password" name="psw" placeholder="password"/>
<input type="submit" name="submit" value="SIGN UP" class="btn-login"/><br/>
    </form>
  </div>
</center>
</body>
</html>
<%
if request.form("submit")<>"" then
fname=request.form("fname")
lname=request.form("lname")
email=request.form("email")
psw=request.form("psw")
gender=request.form("gender")
country=request.form("country")
hobbies=request.form("hobbies")
Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open("DRIVER={Microsoft Access Driver (*.mdb)}; Dbq=" & Server.MapPath("db.mdb"))
qry="insert into users(fname,lname,email,psw,gender,country,hobbies)values('"&fname&"','"&lname&"','"&email&"','"&psw&"','"&gender&"','"&country&"','"&hobbies&"')"
oConn.execute(qry)
oConn.close
response.redirect("login.asp")
end if
%>
