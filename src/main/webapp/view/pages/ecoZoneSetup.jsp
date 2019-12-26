<%@ page session="true"%>
<%@ include file="/view/pages/include.jsp" %>
<script type="text/javascript">
	  function addcontent(){
		document.getElementById("ecomnomic_code").value="";
		document.getElementById("ecomnomic_name").value="";
		return true;
	}   

	function editecozone(id){
		$.ajax({
 			type: "GET",
 			url: "<%=request.getContextPath()%>/eco_setupedit.html",
 			data: {"id": id},
 			success: function(data){
 				var obj = $.parseJSON(data);
 				$("#ecozoneNameEdit").val(obj.ecomnomic_name);
 				$("#ecozoneCodeEdit").val(obj.ecomnomic_code);
 			    $("#ecozoneidEdit").val(obj.id);
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
			url="<%=request.getContextPath()%>/delete_eco_setupe.html";
			}
		else if(action == 'DISABLE')
			{
			url="<%=request.getContextPath()%>/disable_eco_setupe.html";
			}
		else if(action == 'ENABLE'){
			url="<%=request.getContextPath()%>/enable_eco_setupe.html";
		} 
		 var yes=confirm("Do You Want To Continue....");
		if(yes == true){
			$.ajax({
	 			type: "POST",
	 			url: url,
	 			data: {"id": id,},
	 			success: function(data){
					location.href="<%=request.getContextPath()%>/eco_zone.html";
	 			},
	 			error: function(e){
	 			}
	 			});
		}else{
			return false;
		} 
 	}
</script> 
	<div class="page-content" style="min-height: 244.233px;">
	 <ul role="tablist" class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" role="tab" href="#add"><i class="fa fa-plus-square-o"></i>Economic Zone</a></li>
  <li><a data-toggle="tab" role="tab" href="#edit"><i class="fa fa-edit"></i> Item</a></li>
</ul>
	<div class="tab-content">
  <div id="add" class="tab-pane active">
  
  <div class="panel panel-default ">
   <div class="panel-heading">
   	<h2><strong>Economic Zone</strong>&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   </div>
   <div class="panel-body">
	<form class="form-horizontal " enctype="multipart/form-data" method="post" action="">
      <table  class="table table-curved table-hover table-striped" style="width:500px;margin-left: 200px;">
        <thead>
        <tr>
         <th>Economic Zone Code</th>
          <th>Economic Zone Name</th>
          <th style="text-align: right;"><button class="btn  btn-primary" type="reset"  title="add" onclick="addcontent()" data-toggle="modal" data-target="#myModaladd"><i class="fa fa-thumbs-up"></i>Add</button></th>
        </tr>
        </thead>
        <tbody>
         <c:choose>
         <c:when test="${not empty ecozoneList}">
         <c:forEach var="ecozoneList" items="${ecozoneList}" varStatus="status">
         <c:choose>
         <c:when test="${ecozoneList.status == 0}">
         <%-- <c:if test="${status.index %2 == 0}">
		    <tr  role="row" class="even"> --%>
		    <tr>
		      <td >${ecozoneList.ecomnomic_code}</td>
		      <td id="uomname_<c:out value="${ecozoneList.ecomnomic_name}"/>">${ecozoneList.ecomnomic_name}</td>
		      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${ecozoneList.id}" title="edit" onclick="editecozone(this.name);" data-toggle="modal" data-target="#myModaledit"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${ecozoneList.id}" title="delete" onclick="return callAction(this.name,'DELETE');" ><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${ecozoneList.id}" title="disable" onclick="return callAction(this.name,'DISABLE');" ><i class="fa fa-thumbs-up"></i>Disable</button>
		      </td>
		    </tr>
		    </c:when>
		    <c:otherwise>
		      <tr>
		      <td >${ecozoneList.ecomnomic_code}</td>
		      <td  id="uomname_<c:out value="${ecozoneList.ecomnomic_name}"/>">${ecozoneList.ecomnomic_name}</td>
		      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${ecozoneList.id}" title="edit" onclick="editecozone(this.name);" data-toggle="modal" data-target="#myModaledit" disabled="disabled"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${ecozoneList.id}" title="delete" onclick="return callAction(this.name,'DELETE');" disabled="disabled"><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${ecozoneList.id}" title="enable" onclick="return callAction(this.name,'ENABLE')" ><i class="fa fa-thumbs-up"></i>Enable</button>
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
	</div></div>
	<div id="edit" class="tab-pane">ITEM Page</div>
	</div>
	</div>
	<!--Modal For Adding UOM  -->
<div class="modal fade" id="myModaladd" data-toggle="modal" data-target=".bs-example-modal-lg">
  	<div class="modal-dialog">
      <div class="modal-content">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Economic Zone</h4>
      </div>
<%--       <form:form action="${pageContext.request.contextPath}/save_eco_zone.html" method="post" modelAttribute="mappedModel" onsubmit="return adduom();"> --%>
 <form:form action="save_eco_zone.html" method="post" modelAttribute="mappedModel" onsubmit="return adduom();">
      	<div class="modal-body">
			<table class="table table-curved table-hover table-striped">
				<tr>
				<th>Economic Zone Code</th>
				<th>Economic Zone Name</th>
				<th></th>
				</tr>
				<tr>
				<td><form:input path="ecomnomic_code" placeholder="Economic Zone Code" class="form-control" name="text-input" id="economicZoneCode" /></td>
				<td><form:input path="ecomnomic_name" placeholder="Economic Zone Name" class="form-control" name="text-input" id="economicZoneName"/></td>
				<td><button type="submit" class="btn btn-primary btn-sm" onclick="return addEcozone();">Add</button></td>
				</tr>
			</table>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary btn-sm"  onclick="return addEcozone();">Add</button>
      </div>
      </form:form>
    </div>
  </div>
</div>


   <!-- Modal for Editing UOM -->
 <div class="modal fade" id="myModaledit" data-toggle="modal" data-target=".bs-example-modal-lg">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Economic Zone</h4>
      </div>
<%--       <form:form action="${pageContext.request.contextPath}/save_eco_zone.html" method="post" modelAttribute="mappedModel" onsubmit="return edituomscript();"> --%>
 <form:form action="save_eco_zone.html" method="post" modelAttribute="mappedModel" onsubmit="return edituomscript();">
      <div class="modal-body">
         <form:input type="hidden" id="ecozoneidEdit"  path="id" value=""/> 
          <form:input type="hidden" id="ecozoneCodeEdit"  path="ecomnomic_code" value=""/> 
		   <table class="table table-curved table-hover table-striped">
		   <tr>
		   <td>Economic Zone Name</td>
		   <td><form:input path="ecomnomic_name"   class="form-control" id="ecozoneNameEdit"/></td>
		   <td><button type="submit" class="btn btn-primary btn-sm" >Edit</button></td>
		   </tr>
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
	