<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%  String reportUrl = (String) session.getAttribute("reportUrl");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
			#frame
			{
				width: 100%;
				height: 1200px;
				border: 1px solid black;
				zoom: 1.00;
				-moz-transform: scale(1.00);
				-moz-transform-origin: 0 0;
			}
		</style>
    </head>
    <body>
        <iframe id="frame" src="/birt-viewer/run?__report=<%=reportUrl%>"></iframe>
    </body>
</html>