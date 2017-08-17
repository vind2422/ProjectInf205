<%-- 
    Document   : menu
    Created on : Jun 16, 2017, 6:51:47 PM
    Author     : np
--%>
<%
    if (session.getAttribute("USER") == null) {
        String path = request.getContextPath();
        String url = path + "/index.htm";
        response.sendRedirect(url);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <c:set var="root" value="${pageContext.servletContext.contextPath}"/> 
    </head>
    <body>
        <div class="sidebar" data-color="purple" data-image="${root}/resources/assets/img/sidebar-1.jpg">
            <!--
            Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

            Tip 2: you can also add an image using data-image tag
            -->

            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    Creative Tim
                </a>
            </div>

            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li>
                        <a href="${root}/Home/Dashboard.htm">
                            <i class="material-icons">dashboard</i>
                            <p><s:message code="global.menu.dashboard"/></p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${root}/Employee/dataEmp.htm">
                            <i class="material-icons">person</i>
                            <p><s:message code="global.menu.employee"/></p>
                        </a>
                    </li>
                    <li>
                        <a href="${root}/Department/dataDepart.htm">
                            <i class="material-icons">content_paste</i>
                            <p><s:message code="global.menu.department"/></p>
                        </a>
                    </li>
                    <li >
                        <a href="${root}/Record/dataRecord.htm">
                            <i class="material-icons">library_books</i>
                            <p><s:message code="global.menu.recordemployee"/></p>
                        </a>
                    </li>
                    <li>
                        <a href="${root}/Record/dataRecordDepart.htm">
                            <i class="material-icons">bubble_chart</i>
                            <p><s:message code="global.menu.recorddepartment"/></p>
                        </a>
                    </li>
                    <li>
                        <a href="#" data-lang="en">
                            <i class="material-icons">location_on</i>
                            <p><s:message code="global.menu.English"/></p>
                        </a>
                    </li>
                    <li>
                        <a href="#" data-lang="vi">
                            <i class="material-icons text-gray">notifications</i>
                            <p><s:message code="global.menu.Vietnamese"/></p>
                        </a>
                    </li>
                    <li class="active-pro">
                        <a href="${root}/index.htm">
                            <i class="material-icons">unarchive</i>
                            <p><s:message code="global.menu.logout"/></p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </body>
    <script>
        $(function () {
            $("a[data-lang]").click(function () {
                var lang = $(this).attr("data-lang");
                $.get("dataEmp.htm?language=" + lang, function () {
                    location.reload();
                });
                return false;
            });
        });
        $(function () {
            $("a[data-lang]").click(function () {
                var lang = $(this).attr("data-lang");
                $.get("detailsEmp.htm?language=" + lang, function () {
                    location.reload();
                });
                return false;
            });
        });
        $(function () {
            $("a[data-lang]").click(function () {
                var lang = $(this).attr("data-lang");
                $.get("editEmp.htm?language=" + lang, function () {
                    location.reload();
                });
                return false;
            });
        });
        $(function () {
            $("a[data-lang]").click(function () {
                var lang = $(this).attr("data-lang");
                $.get("newEmp.htm?language=" + lang, function () {
                    location.reload();
                });
                return false;
            });
        });
        
    </script>
</html>
