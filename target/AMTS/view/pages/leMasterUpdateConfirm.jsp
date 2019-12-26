<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Confirm Page</title>
<body>
<div class="page-content" style="min-height: 244.233px;">
	<!-- Tab panes -->
	<div class="tab-content">
		<div id="add" class="tab-pane active">

			<div class="panel panel-default ">
			
				<div class="panel-heading">
					<h2>
						<strong>Legal Entity Records are Updated Successfully</strong>
					</h2>
				</div>
 		</div>
 		<div class="panel-footer text-center">
			<button class="btn  btn-primary" type="submit"> Next <i class="fa fa-chevron-right"></i> </button>
			<button class="btn  btn-primary" id="confirmId" type="submit"> Confirm <i class="fa fa-chevron-right" onclick="window.open('/<%=request.getContextPath()%>/home.html','_self')"></i> </button>
		</div>
</div>	
</div>
</div>
</body>
<script type="text/javascript">
$(function() {
	$("#noOfLeId").hide();
	$("#confirmId").click(function(){
		location.href="<%=request.getContextPath()%>/home.html";
	});
	
});
</script>