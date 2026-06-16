<%@ page contentType="text/html;charset=UTF-8"%>

<%
    if(session.getAttribute("username") == null){
        response.sendRedirect(request.getContextPath()+"/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Student</title>

<style>
body{
    margin:0;
    font-family:Segoe UI;
    height:100vh;
    background:linear-gradient(135deg,#ff9966,#ff5e62);
    display:flex;
    justify-content:center;
    align-items:center;
}
.card{
    width:420px;
    padding:35px;
    border-radius:18px;
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(10px);
    box-shadow:0 8px 25px rgba(0,0,0,0.3);
    color:white;
}
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
h2{text-align:center;margin-bottom:20px;}
label{font-size:14px;}
input{
    width:100%;
    padding:12px;
    margin:10px 0;
    border:none;
    border-radius:8px;
    outline:none;
}
button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#007bff;
    color:white;
    font-size:16px;
    cursor:pointer;
}
button:hover{ background:#0062cc; }
.back{
    display:block;
    text-align:center;
    margin-top:15px;
    color:white;
    text-decoration:none;
}
</style>
</head>

<body>

<div class="card">

    <div class="topbar">
        <div>👋 <b><%= session.getAttribute("username") %></b></div>
        <a class="logout" href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
    </div>

    <h2>✏ Edit Student</h2>

    
    <form action="<%=request.getContextPath()%>/UpdateStudentServlet" method="post">
    
        <input type="hidden" name="id" value="<%=request.getAttribute("id")%>">

        <label>Name</label>
        <input type="text" name="name"
               value="<%=request.getAttribute("name")%>" required>

        <label>Email</label>
        <input type="email" name="email"
               value="<%=request.getAttribute("email")%>" required>

        <label>Course</label>
        <input type="text" name="course"
               value="<%=request.getAttribute("course")%>" required>

        <button type="submit">Update Student</button>
    </form>

    <a class="back" href="<%=request.getContextPath()%>/ListStudentServlet">
        ⬅ Back to Student List
    </a>

</div>

</body>
</html>