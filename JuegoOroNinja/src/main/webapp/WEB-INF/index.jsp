<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Oro Ninja</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-12 d-flex">
				<h2 class="m-3">Your Gold:</h2>
				<h2 class="m-3"><c:out value="${countToShow}"></c:out></h2>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-3">
				<div class="h-100 border border-dark d-flex flex-column justify-content-center align-items-center p-4 m-3">
					<h2 class="mb-3">Farm</h2>
					<h4 class="mb-3">(earn 10-20 gold)</h4>
					<form action="result" method="post">
				        <input type="hidden" name="option" value="farm">
				        <button type="submit" class="btn btn-primary">Find Gold!</button>
				    </form>
				</div>
			</div>
			<div class="col-3">
				<div class="h-100 border border-dark d-flex flex-column justify-content-center align-items-center p-4 m-3">
					<h2 class="mb-3">Cave</h2>
					<h4 class="mb-3">(earn 5-10 gold)</h4>
					<form action="result" method="post">
				        <input type="hidden" name="option" value="cave">
				        <button type="submit" class="btn btn-primary">Find Gold!</button>
				    </form>
				</div>
			</div>
			<div class="col-3">
				<div class="h-100 border border-dark d-flex flex-column justify-content-center align-items-center p-4 m-3">
					<h2 class="mb-3">House</h2>
					<h4 class="mb-3">(earn 2-5 gold)</h4>
					<form action="result" method="post">
				        <input type="hidden" name="option" value="house">
				        <button type="submit" class="btn btn-primary">Find Gold!</button>
				    </form>
				</div>
			</div>
			<div class="col-3">
				<div class="h-100 border border-dark d-flex flex-column justify-content-center align-items-center p-4 m-3">
					<h2 class="mb-3">Casino!</h2>
					<h4 class="mb-3">(earn/takes 0-50 gold)</h4>
					<form action="result" method="post">
				        <input type="hidden" name="option" value="casino">
				        <button type="submit" class="btn btn-primary">Find Gold!</button>
				    </form>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-12 mt-3">
				<h2>Activities:</h2>
			</div>
			<div class="col-12 mt-3">
				<div class="border border-dark p-3" style="height: 200px; overflow-y: scroll;">
					<c:forEach var="message" items="${ messagesToShow }" >
						<c:out value="${message}" escapeXml="false"/>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>