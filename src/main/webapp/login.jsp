<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Login - Student Management System</title>

<style>
body{
    margin:0;
    height:100vh;
    font-family:Segoe UI;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#4facfe,#00f2fe);
}

/* Glass Login Card */
.login-box{
    width:360px;
    padding:40px;
    border-radius:15px;
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(10px);
    box-shadow:0 8px 25px rgba(0,0,0,0.3);
    color:white;
}

h2{
    text-align:center;
    margin-bottom:25px;
}

label{
    display:block;
    margin-top:15px;
    font-weight:bold;
}

input[type=text],
input[type=password]{
    width:100%;
    padding:12px;
    margin-top:5px;
    border:none;
    border-radius:8px;
    outline:none;
}

input[type=submit]{
    width:100%;
    padding:12px;
    margin-top:25px;
    border:none;
    border-radius:8px;
    background:#28a745;
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}
input[type=submit]:hover{
    background:#1f8c38;
}

.error{
    text-align:center;
    color:#ffdddd;
    background:#ff4b5c;
    padding:8px;
    border-radius:6px;
    margin-bottom:10px;
}

.footer{
    text-align:center;
    margin-top:15px;
    font-size:12px;
}
</style>
</head>

<body>

<div class="login-box">
    <h2>🎓 Admin Login</h2>

    <%
        String error = request.getParameter("error");
        if ("1".equals(error)) {
    %>
        <div class="error">Invalid Username or Password</div>
    <%
        } else if ("server".equals(error)) {
    %>
        <div class="error">Server Error! Please try again.</div>
    <%
        }
    %>

    <form action="LoginServlet" method="post">
        <label>Username</label>
        <input type="text" name="username" placeholder="Enter username" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <input type="submit" value="Login">
    </form>

    <div class="footer">
        Student Management System © 2026
    </div>
</div>

</body>
</html>