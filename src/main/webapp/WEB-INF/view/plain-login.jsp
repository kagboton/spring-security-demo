<%--
  Created by IntelliJ IDEA.
  User: Kilian Agboton
  Date: 08/04/2021
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Custom Login Page</title>
</head>
<body>

    <h3>Custom Login Page</h3>

    <form:form action="${pageContext.request.contextPath}/authenticateUser" method="post">
        <p>User name: <input type="text" name="username" /></p>
        <p>Password: <input type="password" name="password" /></p>
        <input type="submit" value="Login" />
    </form:form>

</body>
</html>
