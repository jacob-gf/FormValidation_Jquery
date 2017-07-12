<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>  
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">




        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
    </head>

    <body>
        <form id="defaultForm" method="post" class="form-horizontal">
            <div class="form-group">
                <label class="col-lg-3 control-label">Username</label>
                <div class="col-lg-5">
                    <input type="text" class="form-control" name="username" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Email address</label>
                <div class="col-lg-5">
                    <input type="text" class="form-control" name="email" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Passwordxcsxczx<x</label>
                <div class="col-lg-5">
                    <input type="password" class="form-control" name="password" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Retype password</label>
                <div class="col-lg-5">
                    <input type="password" class="form-control" name="confirmPassword" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label" id="captchaOperation"></label>
                <div class="col-lg-2">
                    <input type="text" class="form-control" name="captcha" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <button type="submit" class="btn btn-primary">Sign up</button>
                </div>
            </div>
        </form>
    </body>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/validator/8.0.0/validator.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
// Generate a simple captcha
            function randomNumber(min, max) {
                return Math.floor(Math.random() * (max - min + 1) + min);
            }
            ;
            $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

            $('#defaultForm').bootstrapValidator({
                message: 'This value is not valid',
                fields: {
                    username: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: 'The username is required and can\'t be empty'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The username must be more than 6 and less than 30 characters long'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: 'The username can only consist of alphabetical, number, dot and underscore'
                            },
                            different: {
                                field: 'password',
                                message: 'The username and password can\'t be the same as each other'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: 'The email address is required and can\'t be emptysss'
                            },
                            regexp: {
                                regexp: /\w+@\w+\.+[a-z]/,
                                message: 'The username can only consist of alphabetical, number, dot and underscore'
                            },
                            emailAddress: {
                                message: 'The input is not a valid email address'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'The password is required and can\'t be empty'
                            },
                            identical: {
                                field: 'confirmPassword',
                                message: 'The password and its confirm are not the same'
                            },
                            different: {
                                field: 'username',
                                message: 'The password can\'t be the same as username'
                            }
                        }
                    },
                    confirmPassword: {
                        validators: {
                            notEmpty: {
                                message: 'The confirm password is required and can\'t be empty'
                            },
                            identical: {
                                field: 'password',
                                message: 'The password and its confirm are not the same'
                            },
                            different: {
                                field: 'username',
                                message: 'The password can\'t be the same as username'
                            }
                        }
                    },
                    captcha: {
                        validators: {
                            callback: {
                                message: 'Wrong answer',
                                callback: function (value, validator) {
                                    var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                                    return value == sum;
                                }
                            }
                        }
                    }
                }
            });
        });
    </script>

</html>
