<%@ page contentType="text/html;charset=UTF-8"%>
<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Student</title>

<style>
body{
    margin:0;
    font-family:Segoe UI;
    height:100vh;
    background:linear-gradient(135deg,#43cea2,#185a9d);
    display:flex;
    justify-content:center;
    align-items:center;
}

/* Glass Card */
.card{
    width:420px;
    padding:35px;
    border-radius:18px;
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(10px);
    box-shadow:0 8px 25px rgba(0,0,0,0.3);
    color:white;
}

/* Header */
.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:15px;
}

.logout{
    background:#ff4b5c;
    padding:6px 12px;
    border-radius:6px;
    text-decoration:none;
    color:white;
    font-size:13px;
}

h2{
    text-align:center;
    margin-bottom:20px;
}

/* Inputs */
input{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:none;
    border-radius:8px;
    outline:none;
}

/* Buttons */
button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#28a745;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}
button:hover{ background:#1f8c38; }

.back{
    display:block;
    text-align:center;
    margin-top:15px;
    color:white;
    text-decoration:none;
    font-size:14px;
}
</style>
</head>

<body>

<div class="card">

    <div class="topbar">
        <div>👋<b><%= session.getAttribute("username") %></b></div>
        <a class="logout" href="LogoutServlet">Logout</a>
    </div>

    <h2>➕ Add New Student</h2>

    <form action="AddStudentServlet" method="post">
        <input type="text" name="name" placeholder="Student Name" required>
        <input type="email" name="email" placeholder="Student Email" required>
        <input type="text" name="course" placeholder="Course Name" required>
        <button type="submit">Save Student</button>
    </form>

    <a class="back" href="home.jsp">⬅ Back to Dashboard</a>

</div>

</body>
</html>