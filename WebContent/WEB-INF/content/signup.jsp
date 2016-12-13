<%@ page language="java" contentType="text/html; charset=utf8"
pageEncoding="utf8"%>


<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>signup</title>
  <link rel="stylesheet" type="text/css" href="css/semantic.css">

  <script src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="js/semantic.min.js"></script>

  <style type="text/css">
    body {
      background-image: url("./images/9.jpg");
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>

  <script>
  $(document)
    .ready(function() {
      $('.ui.form')
        .form({
          fields: {
            username: {
              identifier  : 'username',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your username'
                }
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                }
              ]
            }
          }
        })
      ;
    })
  ;
  </script>
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <img src="images/logo.png" class="image">
      <div class="content">
        Sign-up to your account
      </div>
    </h2>
    <form class="ui large form" action="SignUp" method="get">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="login.username" placeholder="username">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="login.password" placeholder="Password">
          </div>
        </div>
        <div class="field">
          <div class="ui slider checkbox">
            <input type="checkbox" name="login.userclass" value="1">
            <label>signup as teacher</label>
          </div>
        </div>
        <button class="ui fluid large teal submit button" onclick="javascript:form.submit();">Signup</button>
      </div>

      <div class="ui error message"></div>

    </form>
    </div>
  </div>


</body>

</html>
