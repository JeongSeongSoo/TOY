<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<tiles:insertAttribute name="head" />
</head>
<body>
	<tiles:insertAttribute name="header" />
	<hr />
	<tiles:insertAttribute name="body" />
	<hr />
	<tiles:insertAttribute name="footer" />
</body>
</html>