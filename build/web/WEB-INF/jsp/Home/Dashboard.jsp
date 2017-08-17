<%
            if (session.getAttribute("USER") == null) {
                String path = request.getContextPath();
                String url = path + "/index.htm";                
                response.sendRedirect(url);
            }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <c:set var="root" value="${pageContext.servletContext.contextPath}"/>      
        <link rel="apple-touch-icon" sizes="76x76" href="${root}/resources/assets/img/apple-icon.png" />
        <link rel="icon" type="image/png" href="${root}/resources/assets/img/favicon.png" />
        <link href="${root}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
        
        <link href="${root}/resources/assets/css/material-dashboard.css" rel="stylesheet"/>
        <link href="${root}/resources/assets/css/demo.css" rel="stylesheet" />
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
        <script src="${root}/resources/js/jquery-1.10.2.min.js"></script>
    </head>

    <body>
        <div class="wrapper">
            <jsp:include page="../menu.jsp"></jsp:include>
            <div class="main-panel">
                <jsp:include page="../header.jsp"></jsp:include>
                <jsp:include page="../contentDB.jsp"></jsp:include>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </div>

    </body>
    
    <script src="${root}/resources/assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
    <script src="${root}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${root}/resources/assets/js/material.min.js" type="text/javascript"></script>
    <script src="${root}/resources/assets/js/chartist.min.js"></script>
    <script src="${root}/resources/assets/js/bootstrap-notify.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${root}/resources/assets/js/material-dashboard.js"></script>
    <script src="${root}/resources/assets/js/demo.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            // Javascript method's body can be found in assets/js/demos.js
            demo.initDashboardPageCharts();

        });
        
    </script>
</html>
