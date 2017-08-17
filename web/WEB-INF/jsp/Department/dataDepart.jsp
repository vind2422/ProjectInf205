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
        <link rel="stylesheet" href="${root}/resources/plugins/datatables/dataTables.bootstrap.css">
        <link href="${root}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${root}/resources/assets/css/material-dashboard.css" rel="stylesheet"/>
        <link href="${root}/resources/assets/css/demo.css" rel="stylesheet" />
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
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header" data-background-color="purple">
                                            <h4 class="title">Employee List</h4>
                                            <p class="category"></p>
                                        </div>
                                        <div style="margin: 15px;">
                                            <a href="${pageContext.servletContext.contextPath}/Department/new.htm">
                                            <button class="btn btn-info" >Add new Department</button>
                                        </a>
                                        
                                    </div>
                                            <span style="font-size: 15px; color: Red;">${errors}</span>
                                    <div class="card-content table-responsive">
                                        <table class="table" id="example1">
                                            <thead class="text-primary">
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Employee by Department</th>
                                            <th>Action</th>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="rows" items="${listDepart}">
                                                    <tr>                                               
                                                        <td>${rows[0]}</td>
                                                        <td>${rows[1]}</td>
                                                        <td>${rows[2]}</td>
                                                        <td class="td-actions text-right">
                                                            <a href="${root}/Department/details/${rows[0]}.htm">
                                                                <button type="button" rel="tooltip" title="Details Task" class="btn btn-primary btn-simple btn-xs">
                                                                    <i class="material-icons">search</i>
                                                                </button>
                                                            </a>
                                                            <a href="${root}/Department/edit/${rows[0]}.htm">
                                                                <button type="button" rel="tooltip" title="Edit Task" class="btn btn-primary btn-simple btn-xs">
                                                                    <i class="material-icons">edit</i>
                                                                </button>
                                                            </a>
                                                            <a href="${root}/Department/delete/${rows[0]}.htm">
                                                                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                                                                    <i class="material-icons">close</i>
                                                                </button>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>                                          
                                        </table>

                                    </div>
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
<script src="${root}/resources/assets/js/bootstrap.min.js"></script>
<script src="${root}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${root}/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $(function () {
        $("#example1").DataTable();

    });
</script>
</html>
