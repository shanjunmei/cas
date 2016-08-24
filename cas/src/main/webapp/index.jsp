<%@ page session="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>单点登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>

<link href="assets/css/login.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<div class="loginbody">
<!-- BEGIN LOGO -->
<div class="logo">
	<a href="index.html">
		<img src="assets/img/logo.png" alt=""/>
	</a>
	<p/>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form method="post" id="fm1" class="login-form" commandName="${commandName}" htmlEscape="true">
		<h3 class="form-title">单点登录认证系统</h3>
		<div id="msg_v" class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>
				 请输入用户名和密码.
			</span>
		</div>
		<%--<form:errors path="*" id="msg" cssClass="alert alert-danger" element="div" />--%>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<!-- <label class="control-label visible-ie8 visible-ie9">Username</label> -->
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<!--<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>-->
				<input cssClass="input1 form-control placeholder-no-fix" placeholder="Username" id="username" path="username" autocomplete="false" htmlEscape="true"/>
			</div>
		</div>
		<div class="form-group">
			<!-- <label class="control-label visible-ie8 visible-ie9">Password</label> -->
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input cssClass="input2 form-control placeholder-no-fix" placeholder="Password" id="password" path="password" autocomplete="off" htmlEscape="true"/>
			</div>
		</div>
		<div class="form-actions">
			<label class="checkbox">
			<input type="checkbox" id="rememberMe" name="rememberMe" value="true"/> 记住我一周 </label>
			<input type="hidden" name="lt" value="${loginTicket}" />
            <input type="hidden" name="execution" value="${flowExecutionKey}" />
            <input type="hidden" name="_eventId" value="submit" />
			<button type="submit" class="btn pull-right" name="submit">
			登录 </i>
			</button>
		</div>
	</form>
	<!-- END LOGIN FORM -->
</div>
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
<p>Copyright ©2016 粤ICP备15067190号-3 深圳市非凡之星网络科技有限公司版权所有</p>
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
	<script src="assets/plugins/respond.min.js"></script>
	<script src="assets/plugins/excanvas.min.js"></script> 
	<![endif]-->
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<!-- <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script> -->
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- <script src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script> -->
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<!-- <script src="assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script> -->
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- <script src="assets/scripts/core/app.js" type="text/javascript"></script> -->
<script src="assets/scripts/custom/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
	   jQuery(document).ready(function() {     
	      //App.init();
	      Login.init();
	      jQuery(".login").css("height",jQuery(window).height());
	   });
           if (top.location !== self.location) {
		var getCurIframeName=window.name;
		var curIframeObj = getCurIframeName.split(",");
		var curIframeID = curIframeObj[0];
		var getCurUrl = window.location.host;
		
		//if (typeof curIframeObj[1] != 'undefined') {
		
			if (curIframeObj[1].indexOf(getCurUrl) == -1) {
				parent.postMessage(curIframeID+',refload', curIframeObj[1]);
			} else {
				parent.window.location.reload();
			}
	    //}
	}

	</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
