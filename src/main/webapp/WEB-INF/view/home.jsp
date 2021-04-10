<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
    <head><title>Home Page</title></head>

    <body>
        <h2>Home Page</h2>
        <hr>
        <p>Welcome to the company home page!</p>

        <p>
            User: <security:authentication property="principal.username"/>
            <br><br>
            Role (s): <security:authentication property="principal.authorities"/>
        </p>

        <!-- Add logout button -->
        <form:form action="${pageContext.request.contextPath}/logout" method="post">
            <input type="submit" value="Logout" />
        </form:form>
    </body>
</html>