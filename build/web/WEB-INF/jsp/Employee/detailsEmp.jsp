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
                                <div class="col-md-12">
                                    <div class="card card-nav-tabs">
                                        <div class="card-header" data-background-color="purple">
                                            <div class="nav-tabs-navigation">
                                                <div class="nav-tabs-wrapper">
                                                    <ul class="nav nav-tabs" data-tabs="tabs">
                                                        <li class="active">
                                                            <a href="#profile" data-toggle="tab">
                                                                <i class="material-icons">info</i>
                                                                Employee Profile
                                                                <div class="ripple-container"></div></a>
                                                        </li>
                                                        <li class="">
                                                            <a href="#messages" data-toggle="tab">
                                                                <i class="material-icons">report</i>
                                                                Record Employee
                                                                <div class="ripple-container"></div></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <form:form action="${root}/Employee.htm" modelAttribute="record" >
                                        <div class="card-content">
                                            <div class="tab-content">

                                                <div class="tab-pane active" id="profile" style="margin-top:5%;">	
                                                    <div class="col-md-8">

                                                        <div class="content" style="float:left;">
                                                            <h6 class="category text-gray ">CEO / Co-Founder</h6>
                                                            <h4 class="card-title">${emp.name}</h4>
                                                            <br>
                                                            <h6 class="category text-gray ">Ngày sinh</h6>
                                                            <h4 class="card-title">${emp.birthday}</h4>
                                                            <br>
                                                            <h6 class="category text-gray ">Gender</h6>
                                                            <h4 class="card-title">${emp.gender?'Nam':'Nữ'}</h4>
                                                            <br>
                                                            <h6 class="category text-gray ">Phone</h6>
                                                            <h4 class="card-title">${emp.phone}</h4>
                                                        </div>
                                                        <div class="content" style="float:left;">
                                                            <p class="card-content">

                                                            </p>
                                                        </div>
                                                        <div class="content" style="float:left;">
                                                            <p class="card-content">

                                                            </p>
                                                        </div>
                                                        <div class="content" style="float:left;">
                                                            <h6 class="category text-gray ">Email</h6>
                                                            <h4 class="card-title">${emp.email}</h4>
                                                            <br>
                                                            <h6 class="category text-gray ">Department</h6>
                                                            <h4 class="card-title">${emp.depart.name}</h4>
                                                            <br>
                                                            <h6 class="category text-gray ">Salary</h6>
                                                            <h4 class="card-title">${emp.salary}</h4>
                                                            <br>
                                                            <h6 class="category text-gray ">Notes</h6>
                                                            <h4 class="card-title">${emp.notes}</h4>
                                                            <br>
                                                            <br>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="card card-profile">
                                                            <div class="card-avatar">
                                                                <a href="#pablo">
                                                                    <img class="img" src="${root}/images/${emp.photo}" />
                                                                </a>
                                                            </div>
                                                            <div class="content">
                                                                <br>
                                                                <h6 class="category text-gray ">CEO / Co-Founder</h6>
                                                                <h4 class="card-title">${emp.name}</h4>
                                                                <p class="card-content">
                                                                    ${emp.phone}
                                                                </p>
                                                                <div>
                                                                    <label for="file" id="fuck" class="btn btn-primary btn-round">Select Image</label>
                                                                    <input type="file" id="file" name="photo2" style="visibility:hidden;">
                                                                    <button id="img1" style="visibility:hidden;" name="btnUpHinh"></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane" id="messages">
                                                    <form>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group label-floating">
                                                                    <label class="control-label" ></label>
                                                                    <form:input path="Emp.id" value="${emp.id}" type="hidden" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group label-floating">
                                                                    <label class="control-label">Type</label>
                                                                    <form:select  path="type" class="form-control">
                                                                        <form:option value="True" label="Khen thưỡng"/>
                                                                        <form:option value="False" label="Kỹ luật"/>
                                                                    </form:select> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group label-floating">
                                                                    <label class="control-label">Date</label>
                                                                    <fmt:formatDate value="${record.date}" pattern="yyyy-MM-dd" var="DATE" />
                                                                    <input name="birthday" value="${DATE}" type="text" class="form-control" id="datepicker" >
                                                                    <form:errors path="date"/>
                                                                </div>
                                                            </div>
                                                        </div>    
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label>Reason</label>
                                                                    <div class="form-group label-floating">
                                                                        <label class="control-label"> Lamborghini Mercy, Your chick she so thirsty, I'm in that two seat Lambo.</label>
                                                                        <form:textarea path="reason" class="form-control" rows="5"/>
                                                                        <form:errors path="reason" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button name="btnAdd" class="btn btn-primary pull-right">Update Profile</button>
                                                        <div class="clearfix"></div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

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
