<%-- 
    Document   : dataEmp
    Created on : Jun 16, 2017, 7:03:09 PM
    Author     : np
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <c:set var="root" value="${pageContext.servletContext.contextPath}"/>
        <link rel="apple-touch-icon" sizes="76x76" href="${root}/resources/assets/img/apple-icon.png" />
        <link rel="icon" type="image/png" href="${root}/resources/assets/img/favicon.png" />
        <link href="${root}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${root}/resources/assets/css/material-dashboard.css" rel="stylesheet"/>
        <link href="${root}/resources/assets/css/demo.css" rel="stylesheet" />
        <link href="${root}/resources/plugins/select2/select2.min.css" rel="stylesheet">
        <link href="${root}/resources/plugins/datepicker/datepicker3.css"  rel="stylesheet" >
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
        <script src="${root}/resources/js/jquery-1.10.2.min.js"></script>
    </head>
    <body>
    <body>
        <div class="wrapper">
            <jsp:include page="../menuDep.jsp"></jsp:include>
                <div class="main-panel">
                <jsp:include page="../header.jsp"></jsp:include>
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">

                            <form:form action="${root}/Department.htm" modelAttribute="depart" enctype="multipart/form-data" method="post">
                                ${errors}
                                <div class="col-md-4">
                                    <div class="card card-profile">
                                        <div class="card-avatar">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="card-header" data-background-color="purple">
                                            <h4 class="title">Edit Profile</h4>
                                            <p class="category">Complete your profile</p>
                                        </div>
                                        <div class="card-content">
                                            <form>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group label-floating">
                                                            <label class="control-label">Department Name</label>
                                                            <form:input path="name" type="text" class="form-control" />
                                                            <form:errors path="name" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <button name="btnInsert1" class="btn btn-primary pull-right">Insert</button>
                                                <div class="clearfix"></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>   
                            </form:form>
                        </div>
                    </div>
                </div>




                <jsp:include page="../footer.jsp"></jsp:include>
                </div>
            </div>

        </body>
    </body>

    <script src="${root}/resources/assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="${root}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${root}/resources/assets/js/material.min.js" type="text/javascript"></script>
<script src="${root}/resources/assets/js/chartist.min.js"></script>
<script src="${root}/resources/assets/js/bootstrap-notify.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
<script src="${root}/resources/assets/js/material-dashboard.js"></script>
<script src="${root}/resources/assets/js/demo.js"></script>
<script src="${root}/resources/plugins/select2/select2.full.min.js"></script>

<!-- bootstrap datepicker -->
<script src="${root}/resources/plugins/datepicker/bootstrap-datepicker.js"></script>

<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        //Date picker
        $('#datepicker').datepicker({
            autoclose: true
        });
        $('#file').change(function () {
            $('#img1').click();
        });
    });
</script>
</html>
