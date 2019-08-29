<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Book Store</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>


<body>
  <%-- The navigation bar --%>
	<ul>
	  <li><a class="active" href="list">Book Listing</a></li>
    <li><a href="admin">Admin</a></li>
    <li><a href="/cart/">Cart</a></li>
	</ul>

    <%-- The table of Books --%>
    <div class="container">
	    <div class="booktable">
	        <table border="1" cellpadding="5">
	            <caption>List of Books</caption>
              <%-- Table Headings --%>
	            <tr>
	                <th>Title</th>
	                <th>Author</th>
	                <th>Price</th>
                  <th>Quantity</th>
                  <th></th>
	            </tr>
        <%-- A loop for each Book in a row --%>
	 			<c:forEach items="${books}" var="item">
	                <tr><form name="cart_form" action="/cart/addcart">
                      <input type="hidden" name="id" value="<c:out value='${item.getId()}' />" />
	                    <td> ${ item.getTitle() } </td>
	                    <td> ${ item.getAuthor() } </td>
	                    <td> <fmt:formatNumber value = "${ item.getPrice() }" type = "currency"/>  </td>
                      <td><input type="number" name="quantity" min="" max="50" value="1"></td>
                      <td><input type="submit" value="Add to Cart"></td>
	                </form></tr>
	            </c:forEach>
	        </table>
	    </div>
    </div>
</body>
</html>
