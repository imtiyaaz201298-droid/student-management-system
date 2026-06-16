<%@ page contentType="text/html;charset=UTF-8"%>
<%
    // Session protection
    if(session.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard - Student Management</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#667eea,#764ba2);
}

/* Header */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 40px;
    color:white;
    background:rgba(0,0,0,0.25);
    backdrop-filter:blur(8px);
}

.logout{
    background:#ff4b5c;
    padding:8px 16px;
    border-radius:8px;
    color:white;
    text-decoration:none;
}

/* Dashboard Cards */
.container{
    width:90%;
    margin:50px auto;
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:30px;
}

.card{
    background:rgba(255,255,255,0.15);
    padding:40px;
    border-radius:18px;
    backdrop-filter:blur(12px);
    text-align:center;
    color:white;
    box-shadow:0 8px 25px rgba(0,0,0,0.3);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-8px);
}

.card a{
    text-decoration:none;
    color:white;
    display:block;
}

.icon{
    font-size:50px;
    margin-bottom:15px;
}

h3{
    margin-top:10px;
}
</style>

</head>
<body>

<div class="header">
    <h2>🎓 Student Management System</h2>
    <div>
        Welcome <b><%=session.getAttribute("username")%></b>
        <a class="logout" href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">

    <div class="card">
        <a href="add-student.jsp">
            <div class="icon">➕</div>
            <h3>Add Student</h3>
            <p>Register new student in system</p>
        </a>
    </div>

    <div class="card">
        <a href="ListStudentServlet">
            <div class="icon">📋</div>
            <h3>View Students</h3>
            <p>See all student records</p>
        </a>
    </div>

    <div class="card">
        <a href="LogoutServlet">
            <div class="icon">🚪</div>
            <h3>Logout</h3>
            <p>Securely exit the system</p>
        </a>
    </div>

</div>

</body>
</html>