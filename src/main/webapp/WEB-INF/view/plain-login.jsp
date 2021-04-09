<%--
  Created by IntelliJ IDEA.
  User: Kilian Agboton
  Date: 08/04/2021
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Custom Login Page</title>

    <style>
        .failed{
            color: red;
        }
    </style>
</head>
<body>

    <h3>Custom Login Page</h3>

    <c:if test="${param.error != null}">
        <i class="failed">Sorry! You entered invalid username/password</i>
    </c:if>

    <form:form action="${pageContext.request.contextPath}/authenticateUser" method="post">
        <p>User name: <input type="text" name="username" /></p>
        <p>Password: <input type="password" name="password" /></p>
        <input type="submit" value="Login" />
    </form:form>

</body>
</html>
