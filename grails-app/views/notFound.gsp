<!doctype html>
<html>
<head>
    <title>Page Not Found</title>
    <meta name="layout" content="page" />
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
<ul class="error">
    <li>Error: Page Not Found (404)</li>
    <li>Path: ${request.forwardURI}</li>
</ul>
</body>
</html>