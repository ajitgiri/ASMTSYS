<% String contextPath = request.getContextPath();%>

<link href="<%=contextPath%>/view/css/global.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/formhelpers.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/theme.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/icons.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/app.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/select2.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/dataTables.css" rel="stylesheet">


 <script type="text/javascript" src="/<%=contextPath%>/view/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/<%=contextPath%>/view/js/jquery/jquery-ui.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/jquery.js"></script>     
<script type="text/javascript"  src="<%=contextPath%>/view/js/global.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/datepicker.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/select2.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/dataTables.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/dataTables.custom.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/file-input.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/formhelpers.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/html5shiv.min.js"></script>
<script type="text/javascript"  src="<%=contextPath%>/view/js/respond.js"></script> 
 
<header>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h1 class="logo pull-left">Asset Master</h1>
	<div class="pull-right">
		<div class="btn-group ">
			<a class="btn btn-default" href=""><strong>Welcome</strong> <i
				class="fa fa-user"></i> George</a>
			<div class="btn-group dropdown ">
				<a data-toggle="dropdown" class="btn btn-default dropdown-toggle"
					href=""> <i class="fa fa-envelope"></i><span class="badge">4</span>
				</a>
				<ul role="menu" class="dropdown-menu">
					<li><a href="#">Nitification</a></li>
					<li><a href="#">Nitification</a></li>
					<li><a href="#">Nitification</a></li>
					<li><a href="#">Nitification</a></li>
					<li><a href="#">Nitification</a></li>
					<li><a href="#">Nitification</a></li>
				</ul>
			</div>

			<div class="btn-group dropdown">
				<a data-toggle="dropdown" class="btn btn-default dropdown-toggle"
					href=""> <i class="fa fa-bell"></i><span class="badge">4</span>
				</a>
				<ul role="menu" class="dropdown-menu">
					<li><a href="#">Alert</a></li>
					<li><a href="#">Alert</a></li>
					<li><a href="#">Alert</a></li>
					<li><a href="#">Alert</a></li>
					<li><a href="#">Alert</a></li>
					<li><a href="#">Alert</a></li>
				</ul>
			</div>
			<a class="btn btn-default" href="#"><i class="fa fa-book"></i>
				Help</a> <a class="btn btn-default" href="#"><i
				class="fa fa-sign-out"></i> Logout</a>
		</div>
	</div>

</header>

<div class="page-title">
	<a class="btn btn-primary nav-toggle pull-left" href=""><i
		class="fa fa-bars"></i></a>
	<ol class="breadcrumb pull-left">
		<li><a href="#"><i class="fa fa-home"></i> </a></li>
		<li><a href="#">Module Name</a></li>
		<li class="active">Form Name</li>
	</ol>
	<div class="dropdown pull-right">
		<a data-toggle="dropdown" id="dropdownMenu1" type="button"
			class="btn btn-primary dropdown-toggle quick-links" href="#">
			Quick Links <span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="#">Link</a></li>
			<li><a href="#">Link</a></li>
			<li><a href="#">Link</a></li>
			<li><a href="#">Link</a></li>
		</ul>
	</div>

</div>