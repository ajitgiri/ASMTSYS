<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Legal Entity Master Setup Page</title>
<body>
<div class="page-content" style="min-height: 244.233px;">

	<!-- Nav tabs
	<ul role="tablist" class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" role="tab" href="#add"><i class="fa fa-plus-square-o"></i> Add</a></li>
		<li><a data-toggle="tab" role="tab" href="#edit"><i class="fa fa-edit"></i> Edit</a></li>
		<li><a data-toggle="tab" role="tab" href="#cancel"><i class="fa fa-ban"></i> Cancel</a></li>
		<li><a data-toggle="tab" role="tab" href="#delete"><i class="glyphicon glyphicon-trash"></i> Delete</a></li>
		<li><a data-toggle="tab" role="tab" href="#report"><i class="fa fa-file-text-o"></i> Report</a></li>
	</ul>
 -->
	<!-- Tab panes -->
	<div class="tab-content">
		<div id="add" class="tab-pane active">

			<div class="panel panel-default ">
			
				<div class="panel-heading">
					<h2>
						<strong>Legal Entity Master Setup</strong>
					</h2>
				</div>
	<form:form class="form-horizontal"  modelAttribute="mappedModel" method="POST">
		<div class="panel-body">
			<table  class="table table-curved table-hover table-striped">
				<thead>
					<tr>
						<th>Sl No.</th>
						<th>LegalEntity Name</th>
						<th>LegalEntity Code</th>
						<th>Action</th>
					</tr>
				</thead>
				<%int i=1; %>
				<tbody>
				<c:forEach items="${mappedModel.legalEntitySMList}" var="caseDetail" varStatus="row">
					<tr>
						<td class="sorting_1"><%=i%>
							<form:hidden path="legalEntitySMList[${row.index}].id" />
						</td>
						<td><form:input	path="legalEntitySMList[${row.index}].legalEntityName" /></td>
						<td><form:input path="legalEntitySMList[${row.index}].legalEntityCode" /></td>
						<td><a href="deleteLe.html?id=${caseDetail.id}">Delete</a></td>
					</tr>
					<%
					i++;
					%>
				</c:forEach>
				</tbody>
				</table>
		</div>
		<div class="panel-footer text-center">
			<button class="btn  btn-primary" type="submit"> Next <i class="fa fa-chevron-right"></i> </button>
		</div>
	</form:form>
 	</div>
</div>	
</div>
</div>
</body>
<script type="text/javascript">
$(function() {
	$("#noOfLeId").hide();
	
	$("#nolevel").keypress(function (e) {
		alert("hiiiii");
	    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	//display error message
		$(".label label-danger").html("Digits Only").show().fadeOut("slow");
		return false;
		}
	});
});
</script>