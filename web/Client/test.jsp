
<input type="date" name="myDate">
<button onclick="window.location.href='test.jsp'">Click Me</button>
<%
    out.println(request.getParameter("myDate"));

%>