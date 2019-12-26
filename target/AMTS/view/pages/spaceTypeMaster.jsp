<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Enterprise Setup Page</title>
<script type="text/javascript">
$(function() {
	//alert("hiiiiiiiiii");
	$("#AddSTMID").hide();
	$("#EditSTMID").hide();
	$("#addButtonID").click(function(){
		alert("hello");
		$("#recordSTMID").hide();
		$("#AddSTMID").show();
	});
	/*  $("#editButtonID").click(function(){
		var stId=$("#editButtonID").val();
		alert("----"+stId);
		$("#recordSTMID").hide();
		$("#AddSTMID").hide();
		$("#EditSTMID").show();
	});  */
	

	
});

function editSpaceType(id){
	alert("----");
	 $.ajax({
			type: "GET",
			url: "space_type_masterdit.html",
			data: {"spTypMsId": id,},
			success: function(data){
				var obj = $.parseJSON(data);
				$("#countrycodeEdit").val(obj.spaceCode);
			    $("#countryNameEdit").val(obj.spaceName);
			    $("#countryEdit").val(obj.id);
			},
			error: function(e){
			}
			}); 
}
</script>
<body>
<div class="page-content" style="min-height: 244.233px;">
	<!-- Tab panes -->
	<div class="tab-content">
		<div id="add" class="tab-pane active">

			<div class="panel panel-default ">
				<div class="panel-heading">
					<h2>
						<strong>Space Type Master</strong>
					</h2>
				</div>
<div class="panel-body" id="recordSTMID">
<%-- 	<form:form class="form-horizontal"  modelAttribute="mappedModel" method="POST"> --%>
		<div class="panel-body">
			<table  class="table table-curved table-hover table-striped">
				<thead>
					<tr>
						<th>Sl No.</th>
						<th>Space Type Code</th>
						<th>Space Type Name</th>
						<th>Action &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn  btn-primary" type="submit" id="addButtonID"> ADD <i class="fa fa-chevron-right"></i> </button>
						</th>
					</tr>
				</thead>
 <tbody>
	<c:choose>
		<c:when test="${! empty spaceTypMsServList}">
		<c:forEach var="spaceTypMsServLST" items="${spaceTypMsServList}">
		<c:choose>
		<c:when test="${spaceTypMsServLST.status == 0}">
			
					<tr>
						<td class="sorting_1">${spaceTypMsServLST.id}</td>
						<td class="sorting_1">${spaceTypMsServLST.spaceCode}</td>
						<td class="sorting_1">${spaceTypMsServLST.spaceName}</td>
						<td class="sorting_1">
							<div class="panel-footer text-center">
								<button class="btn  btn-primary" type="submit" value="${spaceTypMsServLST.id}" id="editButtonID" data-toggle="modal" data-target="#myModaledit" onclick="editSpaceType(this.name);"> Edit<i class="fa fa-chevron-right"></i> </button>
								<button class="btn  btn-primary" type="submit"> Delete <i class="fa fa-chevron-right"></i> </button>
								<button class="btn  btn-primary" type="submit"> Disable <i class="fa fa-chevron-right"></i> </button>
							</div>
						</td>
					</tr>
			</c:when>
			<c:otherwise>
					<tr>
						<td class="sorting_1">${spaceTypMsServLST.id}</td>
						<td class="sorting_1">${spaceTypMsServLST.spaceCode}</td>
						<td class="sorting_1">${spaceTypMsServLST.spaceName}</td>
						<td class="sorting_1">
						<div class="panel-footer text-center">
								<button class="btn  btn-primary" type="submit" name="${spaceTypMsServLST.id}" id="editButtonID" data-toggle="modal" data-target="#myModaledit" onclick="return editSpaceType(this.name);"> Edit<i class="fa fa-chevron-right"></i> </button>
								<button class="btn  btn-primary" type="submit"> Delete <i class="fa fa-chevron-right"></i> </button>
								<button class="btn  btn-primary" type="submit"> Disable <i class="fa fa-chevron-right"></i> </button>
							</div>
						</td>
					</tr>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="3">Records Not Available</td>
			</tr>
		</c:otherwise>
		</c:choose>
	</tbody>
	</table>
</div>
<%-- </form:form> --%>
 	</div>
				

<div class="panel-body" id="AddSTMID">
	<form:form class="form-horizontal"  method="post" modelAttribute="mappedModel" action="save_space_type_master.html">
		<div class="panel-body">
			<table  class="table table-curved table-hover table-striped">
				<thead>
					<tr>
						<th colspan="4">All form fields are required</th>
					</tr>
				</thead>
 				<tbody>
					<tr>
						<td class="sorting_1">Space Type Code</td>
						<td class="sorting_1">Space Type Name</td>
						<td class="sorting_1"></td>
					</tr>
					<tr>
						<td class="sorting_1"><form:input  path="spaceCode" id="countryCode" /></td>
						<td class="sorting_1"><form:input  path="spaceName"  id="countryName" /></td>
						<td class="sorting_1">
							<div class="panel-footer text-center">
								<button class="btn  btn-primary" type="submit"> ADD <i class="fa fa-chevron-right"></i> </button>
							</div>
					   </td>
					</tr>
			</tbody>
	</table>
</div>
</form:form>
</div>				
	
	<!-- 		EDIT STM -->
 <div class="modal fade" id="myModaledit" data-toggle="modal" data-target=".bs-example-modal-lg">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">Edit Space Type</h4>
		      </div>
   <form:form method="post" modelAttribute="mappedModel" action="save_space_type_master.html" >
		      <div class="modal-body">
				   <table class="table table-curved table-hover table-striped">
				   	<tbody>
					<tr>
				   		<td>Space Type Name</td>
				   		<td></td>
				   </tr>
				   <tr>
				   	<td>
				   	<form:input type="hidden" id="countryEdit"  path="id"/>
				   		<form:input  path="spaceName"  id="countryNameEdit"/>
				   	</td>
				   	<td>
				   	<button type="submit" class="btn btn-primary btn-sm" >Update</button></td>
				  </tr>
				   </tbody>
				  </table>
		     </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary btn-sm" >Edit</button>
		      </div>
		      </form:form>
		    </div>
		  </div>
	
			
</div>	

</div>
</div>
	</div>
</div>
</body>