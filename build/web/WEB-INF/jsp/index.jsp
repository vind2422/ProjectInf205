<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <c:set var="root" value="${pageContext.servletContext.contextPath}"/>  
        <link rel="stylesheet" type="text/css" href="${root}/resources/css/main2.css">
        <link rel="stylesheet" type="text/css" href="${root}/resources/css/AdminLTE.min.css">
    </head>
    <body>
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <section class="login-content">
            <div class="logo">
                <h1>Vali</h1>
            </div>
            <div class="login-box">

                <form class="login-form" action="index.htm" method="post">
                    <h2 class="login-head">SIGN IN</h2>
                    <div class="form-group has-error">
                        <span class="help-block">${ok}</span>
                    </div>
                    <div class="form-group">
                        <label class="control-label">USERNAME</label>
                        <input name="id" class="form-control" type="text" placeholder="Username" autofocus />
                    </div>
                    <div class="form-group">
                        <label class="control-label">PASSWORD</label>
                        <input name="password" class="form-control" type="password" placeholder="Password"/>
                    </div>
                    <div class="form-group">
                        <div class="utility">
                            <div class="animated-checkbox">
                                <label class="semibold-text">

                                </label>
                            </div>
                            <p class="semibold-text mb-0"><a data-toggle="flip">Forgot Password ?</a></p>

                        </div>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-info btn-block">SIGN IN</button>
                    </div>
                </form>
                <form class="forget-form" action="forgotpassword.htm" method="post">
                    <h2 class="login-head">
                        What's My Password?
                    </h2>
                    ${message}
                    <div class="form-group" style="text-align:center;">
                        <h5 >
                            If you have forgotten your password you can reset it here.
                        </h5>
                    </div>
                    <div class="form-group">

                        <label class="control-label">Username</label>
                        <input class="form-control" type="text" name="username1" placeholder="Username">
                        <div class="form-group has-error">
                            <div class="form-group has-error">
                                <span class="help-block">${usernameer}</span>
                            </div>
                            
                        </div>
                    </div>
                    <div class="form-group">

                        <label class="control-label">EMAIL</label>
                        <input class="form-control" type="text" name="email" placeholder="Email">
                        <div class="form-group has-error">
                            <div class="form-group has-error">
                                <span class="help-block">${emailer}</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-info btn-block">Send My Password</button>
                    </div>
                    <div class="form-group mt-20">
                        <p class="semibold-text mb-0"><a data-toggle="flip">Back to Login</a></p>
                    </div>
                </form>
            </div>
        </section>
    </body>
    <script src="${root}/resources/js/jquery-2.1.4.min.js"></script>
    <script src="${root}/resources/js/bootstrap.min.js"></script>
    <script src="${root}/resources/js/plugins/pace.min.js"></script>
    <script src="${root}/resources/js/main.js"></script>
</html>
