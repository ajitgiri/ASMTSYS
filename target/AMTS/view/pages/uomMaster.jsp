<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function addcontent(){
		document.getElementById("uom_code").value="";
		document.getElementById("uom_name").value="";
		return true;
	}
	function edituom(id){
		$.ajax({
 			type: "POST",
 			url: "<%=request.getContextPath()%>/uom/getuomdetail.html",
 			data: {"id": id,},
 			success: function(data){
 				var obj = $.parseJSON(data);
 			    $("#uomNameEdit").val(obj.uom_name);
 			    $("#uomidEdit").val(obj.id);
 			},
 			error: function(e){
 			}
 			}); 
		return true;
	}
	function callAction(id,action){
		var url="";
		if(action == 'DELETE')
			{
			url="<%=request.getContextPath()%>/uom/deleteuom.html";
			}
		else if(action == 'DISABLE')
			{
			url="<%=request.getContextPath()%>/uom/disableuom.html";
			}
		else if(action == 'ENABLE'){
			url="<%=request.getContextPath()%>/uom/enableuom.html";
		}
		var yes=confirm("Do You Want To Continue....");
		if(yes == true){
			$.ajax({
	 			type: "POST",
	 			url: url,
	 			data: {"id": id,},
	 			success: function(data){
					location.href="<%=request.getContextPath()%>/uom/getuomlist.html";
						},
						error : function(e) {
						}
					});
		} else {
			return false;
		}
	}
</script>

<div class="page-content" style="min-height: 244.233px;">
	<ul role="tablist" class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" role="tab" href="#add"><i
				class="fa fa-plus-square-o"></i>UOM</a></li>
		<li><a data-toggle="tab" role="tab" href="#edit"><i
				class="fa fa-edit"></i> Item</a></li>
	</ul>
	<div class="tab-content">
		<div id="add" class="tab-pane active">

			<div class="panel panel-default ">
				<div class="panel-heading">
					<h2>
						<strong>UOM Master</strong>&nbsp;&nbsp;&nbsp;&nbsp;
					</h2>
				</div>
				<div class="panel-body">
					<form class="form-horizontal " enctype="multipart/form-data"
						method="post" action="">
						<table class="table table-curved table-hover table-striped"
							style="width: 500px; margin-left: 200px;">
							<thead>
								<th>UOM Code</th>
								<th>UOM Name</th>
								<th style="text-align: right;"><button
										class="btn  btn-primary" type="reset" title="add"
										onclick="addcontent()" data-toggle="modal"
										data-target="#myModaladd">
										<i class="fa fa-thumbs-up"></i>Add
									</button></th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty uomdetails}">
										<c:forEach var="uomdetails" items="${uomdetails}"
											varStatus="status">
											<c:choose>
												<c:when test="${uomdetails.status == 0}">
													<%-- <c:if test="${status.index %2 == 0}">
		    <tr  role="row" class="even"> --%>
													<tr>
														<td>${uomdetails.uom_code}</td>
														<td id="uomname_<c:out value="${uomdetails.uom_name}"/>">${uomdetails.uom_name}</td>
														<td nowrap="nowrap">
															<button class="btn  btn-primary" type="reset"
																name="${uomdetails.id}" title="edit"
																onclick="edituom(this.name);" data-toggle="modal"
																data-target="#myModaledit">
																<i class="fa fa-thumbs-up"></i> Edit
															</button>
															<button class="btn  btn-primary" type="reset"
																name="${uomdetails.id}" title="delete"
																onclick="return callAction(this.name,'DELETE');">
																<i class="fa fa-thumbs-up"></i>Delete
															</button>
															<button class="btn  btn-primary" type="reset"
																name="${uomdetails.id}" title="disable"
																onclick="return callAction(this.name,'DISABLE');">
																<i class="fa fa-thumbs-up"></i>Disable
															</button>
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td>${uomdetails.uom_code}</td>
														<td id="uomname_<c:out value="${uomdetails.uom_name}"/>">${uomdetails.uom_name}</td>
														<td nowrap="nowrap">
															<button class="btn  btn-primary" type="reset"
																name="${uomdetails.id}" title="edit"
																onclick="edituom(this.name);" data-toggle="modal"
																data-target="#myModaledit" disabled="disabled">
																<i class="fa fa-thumbs-up"></i> Edit
															</button>
															<button class="btn  btn-primary" type="reset"
																name="${uomdetails.id}" title="delete"
																onclick="return callAction(this.name,'DELETE');"
																disabled="disabled">
																<i class="fa fa-thumbs-up"></i>Delete
															</button>
															<button class="btn  btn-primary" type="reset"
																name="${uomdetails.id}" title="enable"
																onclick="return callAction(this.name,'ENABLE')">
																<i class="fa fa-thumbs-up"></i>Enable
															</button>
														</td>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3">Data not Available</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="edit" class="tab-pane">ITEM Page</div>
	</div>
</div>
<!--Modal For Adding UOM  -->
<div class="modal fade" id="myModaladd" data-toggle="modal"
	data-target=".bs-example-modal-lg">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					&times;<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add UOM</h4>
			</div>
			<%--       <form:form action="${pageContext.request.contextPath}/uom/adduom.html" commandName="uombean" method="post" modelAttribute="uombean" onsubmit="return adduom();"> --%>
			<form:form action="uom/adduom.html" commandName="uombean"
				method="post" modelAttribute="uombean" onsubmit="return adduom();">
				<div class="modal-body">
					<table class="table table-curved table-hover table-striped">
						<tr>
							<th>Uom Code</th>
							<th>Uom Name</th>
							<th></th>
						</tr>
						<tr>
							<td><form:input path="uom_code" placeholder="UOM Code"
									class="form-control" name="text-input" id="uom_code" /></td>
							<td><form:input path="uom_name" placeholder="UOM Name"
									class="form-control" name="text-input" id="uom_name" /></td>
							<td><button type="submit" class="btn btn-primary btn-sm">Add</button></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary btn-sm">Add</button>
				</div>
			</form:form>
		</div>
	</div>
</div>


<!-- Modal for Editing UOM -->
<div class="modal fade" id="myModaledit" data-toggle="modal"
	data-target=".bs-example-modal-lg">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					&times;<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Edit UOM</h4>
			</div>
			<form:form action="uom/edituomdetail.html" commandName="uombean"
				method="post" modelAttribute="uombean"
				onsubmit="return edituomscript();">
				<div class="modal-body">
					<form:input type="hidden" id="uomidEdit" path="id" value="" />
					<table class="table table-curved table-hover table-striped">
						<td>Uom Name</td>
						<td><form:input path="uom_name" placeholder="Text"
								class="form-control" name="text-input" id="uomNameEdit" /></td>
						<td><button type="submit" class="btn btn-primary btn-sm">Edit</button></td>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary btn-sm">Edit</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
