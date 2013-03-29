<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Hello world!
</h1>

Show the list of people in the database:

<c:forEach items="${personList}" var="data">
    <div>${data.username}</div>
</c:forEach>

<br/>
<a href="./addPerson">Add a new person</a>
</body>
</html>
