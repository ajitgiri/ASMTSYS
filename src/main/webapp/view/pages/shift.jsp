<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function addcontent(){
		document.getElementById("shiftCode").value="";
		document.getElementById("shiftName").value="";
		return true;
	}
	function editshift(id){
		$.ajax({
 			type: "POST",
 			url: "<%=request.getContextPath()%>/shift/getshiftdetail.html",
 			data: {"id": id,},
 			success: function(data){
 				var obj = $.parseJSON(data);
 			    $("#shiftNameEdit").val(obj.shiftName);
 			   $("#startTimeEdit").val(obj.startTime);
 			  $("#endTimeEdit").val(obj.endTime);
			    $("#shiftidEdit").val(obj.id);
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
			url="<%=request.getContextPath()%>/shift/deleteshift.html";
			}
		else if(action == 'DISABLE')
			{
			url="<%=request.getContextPath()%>/shift/disableshift.html";
			}
		else if(action == 'ENABLE'){
			url="<%=request.getContextPath()%>/shift/enableshift.html";
		}
		var yes=confirm("Do You Want To Continue....");
		if(yes == true){
			$.ajax({
	 			type: "POST",
	 			url: url,
	 			data: {"id": id,},
	 			success: function(data){
					location.href="<%=request.getContextPath()%>/shift/getshiftlist.html";
	 			},
	 			error: function(e){
	 			}
	 			});
		}else{
			return false;
		}
	}
</script>
 <script type="text/javascript">
function addshift(){
	var shiftcode=document.getElementById("shiftCode").value;
	var filtershiftcode=/^[a-zA-Z0-9-]+$/;
	var filtershiftname=/^[a-zA-Z ]+$/;
	if(shiftcode == null || shiftcode == ""){
		alert("Please Enter the shiftcode");
		document.getElementById("shiftCode").focus();
		return false;
	}
	if(!filtershiftcode.test(shiftcode))
    {
    alert("Please enter correct format only e.g. Shift-001");
    document.getElementById("shiftCode").value="";
    document.getElementById("shiftCode").focus();
    return false;
    }
	var shiftname=document.getElementById("shiftName").value;
	if(shiftname == null || shiftname == ""){
		alert("Please Enter the shiftName");
		document.getElementById("shiftName").focus();
		return false;
	}
	
	if(!filtershiftname.test(shiftname))
    {
    alert("Please enter correct format only e.g. India");
    document.getElementById("shiftName").value="";
    document.getElementById("shiftName").focus();
    return false;
    }
	return true; 
}  
 
 function editshiftscript(){
	var shiftname=document.getElementById("shiftNameEdit").value;
	var filtershiftname=/^[a-zA-Z ]+$/;
	if(shiftname == null || shiftname == ""){
		alert("Please Enter the shiftname");
		document.getElementById("shiftNameEdit").focus();
		return false;
	}
	
	if(!filtershiftname.test(shiftname))
    {
    alert("Please enter correct format only e.g. India");
    document.getElementById("shiftNameEdit").focus();
    return false;
    }
	return true;
}
</script> 
	<div class="page-content" style="min-height: 244.233px;">
	 <ul role="tablist" class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" role="tab" href="#add"><i class="fa fa-plus-square-o"></i>Shift Master</a></li>
<!--   <li><a data-toggle="tab" role="tab" href="#edit"><i class="fa fa-edit"></i>Unit Master</a></li>
  <li><a data-toggle="tab" role="tab" href="#edit"><i class="fa fa-edit"></i>Bond Reg Master</a></li>
 --></ul>
	<div class="tab-content">
  <div id="add" class="tab-pane active">
  
  <div class="panel panel-default ">
   <div class="panel-heading">
   	<h2><strong>Shift Master</strong>&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   </div>
   <div class="panel-body">
	<form class="form-horizontal " enctype="multipart/form-data" method="post" action="">
      <table  class="table table-curved table-hover table-striped" style="width:600px;margin-left: 200px;">
        <thead>
         <th>Shift Code</th>
          <th>Shift Name</th>
          <th>Start Time</th>
          <th>End Time</th>
          
          <th style="text-align: right;"><button class="btn  btn-primary" type="reset"  title="Add" onclick="addcontent()" data-toggle="modal" data-target="#myModaladd"><i class="fa fa-thumbs-up"></i>Add</button></th>
        </thead>
        <tbody>
         <c:choose>
         <c:when test="${not empty shiftdetails}">
         <c:forEach var="shiftdetails" items="${shiftdetails}" varStatus="status">
         <c:choose>
         <c:when test="${shiftdetails.status == 0}">
         <%-- <c:if test="${status.index %2 == 0}">
		    <tr  role="row" class="even"> --%>
		    <tr>
		      <td >${shiftdetails.shiftCode}</td>
		      <td id="shiftname_<c:out value="${shiftdetails.shiftName}"/>">${shiftdetails.shiftName}</td>
		      <td id="startTime_<c:out value="${shiftdetails.startTime}"/>">${shiftdetails.startTime} Hrs</td>
		      <td id="endtime_<c:out value="${shiftdetails.endTime}"/>">${shiftdetails.endTime} Hrs</td>
		      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${shiftdetails.id}" title="Edit" onclick="editshift(this.name);" data-toggle="modal" data-target="#myModaledit"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${shiftdetails.id}" title="Delete" onclick="return callAction(this.name,'DELETE');" ><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${shiftdetails.id}" title="Disable" onclick="return callAction(this.name,'DISABLE');" ><i class="fa fa-thumbs-up"></i>Disable</button>
		      </td>
		    </tr>
		    </c:when>
		    <c:otherwise>
		      <tr>
		      <td >${shiftdetails.shiftCode}</td>
		      <td  id="shiftname_<c:out value="${shiftdetails.shiftName}"/>">${shiftdetails.shiftName}</td>
		      <td id="startTime_<c:out value="${shiftdetails.startTime}"/>">${shiftdetails.startTime}</td>
		      <td id="endtime_<c:out value="${shiftdetails.endTime}"/>">${shiftdetails.endTime}</td>
		      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${shiftdetails.id}" title="Edit" onclick="editshift(this.name);" data-toggle="modal" data-target="#myModaledit" disabled="disabled"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${shiftdetails.id}" title="Delete" onclick="return callAction(this.name,'DELETE');" disabled="disabled"><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${shiftdetails.id}" title="Enable" onclick="return callAction(this.name,'ENABLE')" ><i class="fa fa-thumbs-up"></i>Enable</button>
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
	<!-- <div id="edit" class="tab-pane">ITEM Page</div> -->
	</div>
	</div>
	<!--Modal For Adding Shift  -->
<div class="modal fade" id="myModaladd" data-toggle="modal" data-target=".bs-example-modal-lg">
  	<div class="modal-dialog">
      <div class="modal-content">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Shift</h4>
      </div>
<%--       <form:form action="${pageContext.request.contextPath}/shift/addshift.html" commandName="shiftbean" method="post" modelAttribute="shiftbean" onsubmit="return addshift();"> --%>
<form:form action="shift/addshift.html" commandName="shiftbean" method="post" modelAttribute="shiftbean" onsubmit="return addshift();">
      	<div class="modal-body">
			<table class="table table-curved table-hover table-striped">
				<tr>
				<th>Shift Code</th>
				<th>Shift Name</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th></th>
				</tr>
				<tr>
				<td><form:input path="shiftCode" placeholder="Shift Code" class="form-control" name="text-input" id="shiftCode" /></td>
				<td><form:input path="shiftName" placeholder="Shift Name" class="form-control" name="text-input" id="shiftName"/></td>
				<td><form:input path="startTime" placeholder="HH:MM"      class="form-control" name="text-input" id="startTime"/></td>
				<td><form:input path="endTime"   placeholder="HH:MM"      class="form-control" name="text-input" id="endTime"/></td>

				<td><button type="submit" class="btn btn-primary btn-sm" title="Add" >Add</button></td>
				</tr>
			</table>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" title="Close">Close</button>
        <button type="submit" class="btn btn-primary btn-sm" title="Add">Add</button>
      </div>
      </form:form>
    </div>
  </div>
</div>


   <!-- Modal for Editing Shift -->
 <div class="modal fade" id="myModaledit" data-toggle="modal" data-target=".bs-example-modal-lg">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Shift</h4>
      </div>
<%--       <form:form action="${pageContext.request.contextPath}/shift/editshiftdetail.html" commandName="shiftbean" method="post" modelAttribute="shiftbean" onsubmit="return editshiftscript();"> --%>
      <form:form action="shift/editshiftdetail.html" commandName="shiftbean" method="post" modelAttribute="shiftbean" onsubmit="return editshiftscript();">
      <div class="modal-body">
         <form:input type="hidden" id="shiftidEdit"  path="id" value=""/> 
		   <table class="table table-curved table-hover table-striped">
				<tr>
				<th>Shift Name</th>
				<th>Start Time</th>
				<th>End Time</th>
				<th></th>
				</tr>
<tr>
   		    <td><form:input path="shiftName" placeholder="" class="form-control" name="text-input" id="shiftNameEdit"/></td>
			<td><form:input path="startTime" placeholder="" class="form-control" name="text-input" id="startTimeEdit"/></td>
			<td><form:input path="endTime"   placeholder="" class="form-control" name="text-input" id="endTimeEdit"/></td>

		   <td><button type="submit" class="btn btn-primary btn-sm" title="Edit">Edit</button></td>
</tr>	
		   </table>
     </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" title="Close">Close</button>
        <button type="submit" class="btn btn-primary btn-sm" title="Edit" >Edit</button>
      </div>
      </form:form>
    </div>
  </div>
</div>
