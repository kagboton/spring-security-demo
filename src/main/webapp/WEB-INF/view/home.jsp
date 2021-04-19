<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
    <head><title>Home Page</title></head>

    <body>
        <h2>Home Page</h2>
        <hr>
        <p>Welcome to the company home page!</p>

        <!-- display user name and roles-->
        <p>
            User: <security:authentication property="principal.username"/>
            <br><br>
            Role (s): <security:authentication property="principal.authorities"/>
        </p>

        <hr>

        <security:authorize access="hasRole('MANAGER')">
            <!-- add link to point to /leader -->
            <p>
                <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
                (Only for managers)
            </p>
        </security:authorize>


        <security:authorize access="hasRole('ADMIN')">
            <!-- add link to point to /systems -->
            <p>
                <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
                (Only for admins)
            </p>
        </security:authorize>

        <hr>




        <!-- Add logout button -->
        <form:form action="${pageContext.request.contextPath}/logout" method="post">
            <input type="submit" value="Logout" />
        </form:form>
    </body>
</html>