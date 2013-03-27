<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<form:form method="post" action="addPerson.html">
    <table>
        <tr>
            <td> <form:label path="username">Username</form:label></td>
            <td><form:input path="username"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="save"></td>
        </tr>
    </table>
</form:form>

</body>
</html>
