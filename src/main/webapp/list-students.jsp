<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sms.model.Student"%>

<%
    // Session protection
    if(session.getAttribute("username") == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Student> students = (List<Student>) request.getAttribute("studentList");

    // If page opened directly without servlet → redirect
    if(students == null){
        response.sendRedirect(request.getContextPath() + "/ListStudentServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>All Students</title>

<style>
body{
    margin:0;
    font-family:Segoe UI;
    background:linear-gradient(135deg,#36d1dc,#5b86e5);
    min-height:100vh;
}
.header{
    background:rgba(0,0,0,0.3);
    padding:15px 40px;
    color:white;
    display:flex;
    justify-content:space-between;
    align-items:center;
}
.logout{
    background:#ff4b5c;
    padding:6px 14px;
    border-radius:6px;
    text-decoration:none;
    color:white;
}
.card{
    width:85%;
    margin:40px auto;
    padding:30px;
    border-radius:18px;
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(12px);
    box-shadow:0 8px 25px rgba(0,0,0,0.3);
    color:white;
}
table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}
th{
    background:rgba(0,0,0,0.5);
    padding:14px;
}
td{
    padding:12px;
    text-align:center;
}
tr:nth-child(even){
    background:rgba(255,255,255,0.1);
}
.btn{
    padding:6px 12px;
    border-radius:6px;
    text-decoration:none;
    color:white;
    font-size:13px;
}
.edit{ background:#ffc107; }
.delete{ background:#dc3545; }
.add{ background:#28a745; }
.top-actions{
    display:flex;
    justify-content:space-between;
    margin-bottom:10px;
}
.empty{
    text-align:center;
    padding:20px;
    font-size:18px;
}
</style>
</head>

<body>

<div class="header">
    <h2>📚 Student Management System</h2>
    <div>
        Welcome <b><%=session.getAttribute("username")%></b>
        <a class="logout" href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
    </div>
</div>

<div class="card">

    <div class="top-actions">
        <h2>All Students</h2>
        <a class="btn add" href="<%=request.getContextPath()%>/add-student.jsp">+ Add Student</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Action</th>
        </tr>

        <%
        if(students.isEmpty()){
        %>
            <tr>
                <td colspan="5" class="empty">No Students Found</td>
            </tr>
        <%
        } else {
            for(Student s : students){
        %>
        <tr>
            <td><%=s.getId()%></td>
            <td><%=s.getName()%></td>
            <td><%=s.getEmail()%></td>
            <td><%=s.getCourse()%></td>
            <td>
                <a class="btn edit" href="<%=request.getContextPath()%>/EditStudentServlet?id=<%=s.getId()%>">Edit</a>
                <a class="btn delete" 
                   href="<%=request.getContextPath()%>/DeleteStudentServlet?id=<%=s.getId()%>"
                   onclick="return confirm('Delete this student?')">Delete</a>
            </td>
        </tr>
        <%
            }
        }
        %>

    </table>

</div>

</body>
</html>