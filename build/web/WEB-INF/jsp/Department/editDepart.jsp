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
            <jsp:include page="../menuEmp.jsp"></jsp:include>
                <div class="main-panel">
                <jsp:include page="../header.jsp"></jsp:include>
                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                            <form:form action="${root}/Employee.htm" modelAttribute="emp" enctype="multipart/form-data" method="post">
                                <form:hidden path="id" />
                                <div class="col-md-4">
                                    <div class="card card-profile">
                                        <div class="card-avatar">
                                            <a href="">
                                                <form:input path="photo" type="hidden"/>
                                                <c:choose>          
                                                    <c:when test="${src.equals('') && emp.photo.equals('') }">
                                                        <img src="${root}/images/2.PNG" class="img" />
                                                    </c:when>
                                                    <c:when test="${src.equals('') eq false}">
                                                        <img src="${root}/upload/${src}" class="img" />
                                                    </c:when>
                                                    <c:when test="${src.equals('') && emp.photo.equals('') eq false}">
                                                        <img src="${root}/images/${emp.photo}" class="img" />
                                                    </c:when>
                                                </c:choose>
                                            </a>

                                        </div>

                                        <div class="content">
                                            <h6 class="category text-gray "></h6>
                                            <h4 class="card-title"></h4>
                                            <p class="card-content">
                                            </p>
                                            <div>
                                                <label for="file" id="fuck" class="btn btn-primary btn-round">Select Image</label>
                                                <input type="file" id="file" name="photo2" style="visibility:hidden;">
                                                <button id="img1" style="visibility:hidden;" name="btnUpHinh"></button>
                                            </div>
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
                                                            <label class="control-label">Username</label>
                                                            <form:input path="name" type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group label-floating">
                                                            <label class="control-label">Gender</label>
                                                            <form:select  path="gender" class="form-control form-control-line">
                                                                <form:option value="True" label="Nam"/>
                                                                <form:option value="False" label="Nữ"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                        <div class="form-group label-floating">
                                                            <label class="control-label">Birthday</label>
                                                            <fmt:formatDate value="${emp.birthday}" pattern="yyyy-MM-dd" var="DATE" />
                                                            <input name="birthday" value="${DATE}" type="text" class="form-control" id="datepicker" >                                                               
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group label-floating">
                                                            <label class="control-label">Phone</label>
                                                            <form:input path="phone" type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group label-floating">
                                                            <label class="control-label">Salary</label>
                                                            <form:input path="salary" type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group label-floating">
                                                            <label class="control-label">Email</label>
                                                            <form:input path="email" type="text" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>    
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>About Me</label>
                                                            <div class="form-group label-floating">
                                                                <label class="control-label"> Lamborghini Mercy, Your chick she so thirsty, I'm in that two seat Lambo.</label>
                                                                <form:textarea path="notes" class="form-control" rows="5"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Department</label>
                                                            <div class="form-group label-floating">

                                                                <div class="col-md-12">
                                                                    <form:select path="depart.id" class="form-control select2" multiple="multiple">
                                                                        <form:options items="${departs}" itemValue="id" itemLabel="name"/>
                                                                    </form:select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button name="btnUpdate" class="btn btn-primary pull-right">Update</button>
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
