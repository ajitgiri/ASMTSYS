<%@ taglib prefix="spf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<script type="text/javascript">
/* function addcontent(){
	document.getElementById("unitCode").value="";
	document.getElementById("uom_name").value="";
	return true;
}
 */</script>
<script type="text/javascript">
 function addUnit(){

	 var unitType=document.getElementById("unitType").value;
	 if(unitType==0){
			alert("Please Select the Unit Type");
			document.getElementById("unitType").focus();
			return false;
	 }
	var unitCode=document.getElementById("unitCode").value;
	if(unitCode == null || unitCode == ""){
		alert("Please Enter the Unit Code");
		document.getElementById("unitCode").focus();
		return false;
	}
	var unitNo=document.getElementById("unitNo").value;
	if(unitNo == null || unitNo == ""){
		alert("Please Enter the Unit No");
		document.getElementById("unitNo").focus();
		return false;
	}
	var filtersfcode=/^[A-Za-z0-9-]+$/;
	if(!filtersfcode.test(unitCode))
    {
    alert("Please enter correct format for Unit Code  e.g. Unit-001");
    document.getElementById("unitCode").value="";
    document.getElementById("unitCode").focus();
    return false;
    }
	var filtersfname=/^[A-Za-z0-9 ]+$/;
	if(!filtersfname.test(unitNo))
    {
    alert("Please enter correct format for Unit No  e.g. Unit 1");
    document.getElementById("unitNo").value="";
    document.getElementById("unitNo").focus();
    return false;
    }
	
	return true;
}
  function addcontent(){
	var legalentityid=document.getElementById("legalEntityId").value;
	if(legalentityid == 0){
		alert("Please Select One of The Legal Entity");
		return;
	}else{
	 	$("#legalentityidvalue").val(legalentityid);
		$( "#dialog" ).dialog("open");
	} 
} 
function editUnit(id){
    	   $.ajax({
			type: "GET",
			url: "unitEdit.html",
			data: {"unitId": id,},
			success: function(data){         
				var obj = $.parseJSON(data);
				$("#unitCodeEdit").val(obj.unitCode);
			    $("#unitNoEdit").val(obj.unitNo);
				 $("#legalentityidvalueEdit").val(obj.legalentityMaster.id);
				 $("#ecoZoneMasterEdit").val(obj.ecozone.id);
			    $("#sfEdit").val(obj.id);  
			 },
			 error: function(e){
			}
			});   
}


function deleteUnit(id){
	var yes=confirm("Do You Want To Delete ");
	if(yes == true){
		$.ajax({
 			type: "POST",
 			url: "delete.html",
 			data: {"sfId": id,},
 			success: function(data){
				location.href="unit_master.html";
 			},
 			error: function(e){
 			}
 			});
	}else{
		return false;
	}
}
function disableUnit(id){
	var yes=confirm("Do You Want To Disable");
	if(yes == true){
		$.ajax({
 			type: "POST",
 			url: "disableSF.html",
 			data: {"sfId": id,},
 			success: function(data){
 				location.href="unit_master.html";
 			},
 			error: function(e){
 			}
 			});
	}else{
		return false;
	}
}
function enableUnit(id){
	var yes=confirm("Do You Want To Enable");
	if(yes == true){
		$.ajax({
 			type: "POST",
 			url: "enableSF.html",
 			data: {"sfId": id,},
 			success: function(data){
 				location.href="unit_master.html";
						},
						error : function(e) {
						}
					});
		} else {
			return false;
		}
	}
	
	 function selectLegalentity(){
		var leid=document.getElementById("legalEntityId").value;
		
		 $.ajax({
 			type: "GET",
 			url: "unit_master.html",
 			data: {"legalEntid": leid,},
 			success: function(data){
 			location.href="<%=request.getContextPath()%>/unit_master.html?id="+leid;
 				    	},
						error : function(e) {
						}
					}); 				
		}	 	
 </script>

	<div class="page-content" style="min-height: 244.233px;">
	 <ul role="tablist" class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" role="tab" href="#add"><i class="fa fa-plus-square-o"></i>Unit Master</a></li>
</ul>
	<div class="tab-content">
  <div id="add" class="tab-pane active">
  
  <div class="panel panel-default ">
   <div class="panel-heading">
   	<h2><strong>Unit Master</strong>&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   </div>

     <div class="panel-body">
	<form class="form-horizontal " enctype="multipart/form-data" method="post" action="">
      <table  class="table table-curved table-hover table-striped" style="width:500px;margin-left: 200px;">
        <thead>
        <th colspan="7">Select Legal Entity : <select name="select3" class="select2-choice" style="width: 150px" id="legalEntityId" onchange=selectLegalentity()>
		<option value="0" selected>All</option>
		<c:if test="${! empty legalentityList}">
		<c:forEach var="legalentityList" items="${legalentityList}">
		<option value="${legalentityList.id}"
		<c:if test="${legalentityList.id==sId}">selected="selected"</c:if>>${legalentityList.legalEntityName}</option>
		</c:forEach>
		</c:if>
		</select>
		</th>
		</thead>

		<thead>		
        <th>Legal Entity</th>
         <th>Unit Type</th>
          <th>Unit Code</th>
          <th>Unit No</th>
          <th style="text-align: right;"><button class="btn  btn-primary" type="reset"  title="add" onclick="return addcontent()" data-toggle="modal" data-target="#myModaladd"><i class="fa fa-thumbs-up"></i>Add</button></th>
        </thead>
         <tbody>
         		<c:choose>
			<c:when test="${! empty unitList}">
				<c:forEach var="unitList" items="${unitList}" varStatus="status">
					<c:choose>
						<c:when test="${unitList.status == 0}">
						
    <%--      <c:choose>
         <c:when test="${not empty uomdetails}">
         <c:forEach var="uomdetails" items="${uomdetails}" varStatus="status">
         <c:choose>
         <c:when test="${uomdetails.status == 0}"> --%>
         <%-- <c:if test="${status.index %2 == 0}">
		    <tr  role="row" class="even"> --%>
		    <tr>
							    <td>${unitList.legalentityMaster.legalEntityName}</td>
								<td >${unitList.ecozone.economicName}</td>
								<td id="unitCode_<c:out value="${unitList.unitCode}"/>">${unitList.unitCode}</td>
								<td id="unitNo_<c:out value="${unitList.unitNo}"/>">${unitList.unitNo}</td>
<%-- 
		      <td >${uomdetails.unitCode}</td>
		      <td id="uomname_<c:out value="${uomdetails.uom_name}"/>">${uomdetails.uom_name}</td>
 --%>		      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${unitList.id}" title="Edit" onclick="editUnit(this.name);" data-toggle="modal" data-target="#myModaledit"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${unitList.id}" title="Delete" onclick="deleteUnit(this.name);"><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${unitList.id}" title="Disable" onclick="disableUnit(this.name);"><i class="fa fa-thumbs-up"></i>Disable</button>
		      </td>
		    </tr>
		    </c:when>
		    <c:otherwise>
		      <tr>
							    <td>${unitList.legalentityMaster.legalEntityName}</td>
								<td >${unitList.ecozone.economicName}</td>
								<td id="unitCode_<c:out value="${unitList.unitCode}"/>">${unitList.unitCode}</td>
								<td id="unitNo_<c:out value="${unitList.unitNo}"/>">${unitList.unitNo}</td>
<%-- 
		      <td >${uomdetails.unitCode}</td>
		      <td  id="uomname_<c:out value="${uomdetails.uom_name}"/>">${uomdetails.uom_name}</td>
 --%>
 		      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${unitList.id}" title="Edit" onclick="editUnit(this.name);" disabled="disabled" data-toggle="modal" data-target="#myModaledit"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${unitList.id}" title="Delete" onclick="deleteUnit(this.name);" disabled="disabled"><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${unitList.id}" title="Enable" onclick="enableUnit(this.name);" ><i class="fa fa-thumbs-up"></i>Enable</button>
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
	
<div class="modal fade" id="myModaladd" data-toggle="modal" data-target=".bs-example-modal-lg">
 	<div class="modal-dialog">
     <div class="modal-content">
      <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
       <h4 class="modal-title" id="myModalLabel">Add Unit Type</h4>
</div>

 		<spf:form method="post" modelAttribute="mappedModel" action="add.html" onsubmit="return addUnit() ">
      	<div class="modal-body">
      					 <spf:input type="hidden" id="legalentityidvalue"  path="legalentityMaster.id"/> 
      	
			<table class="table table-curved table-hover table-striped">
				<tr>
				<th>Unit Type</th>
				<th>Unit Code</th>
				<th>Unit No</th>
				<th></th>
				</tr>
				<tr>
				<td>
				<spf:select name="select2" class="select2-choice" style="width: 150px" path="ecozone.id" id="unitType" >
				<option selected="selected" value="0">Select</option>
				<c:forEach var="empList"  items="${employeeList}">
				<option value="${empList.id}">${empList.economicName}</option>
				</c:forEach>
				</spf:select>
				<td><spf:input path="unitCode" placeholder="Unit Code" class="form-control" name="text-input" id="unitCode" /></td>
				<td><spf:input path="unitNo" placeholder="Unit No" class="form-control" name="text-input" id="unitNo"/></td>
				<td><button type="submit" class="btn btn-primary btn-sm" >Add</button></td>
				</tr>
			</table>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary btn-sm" >Add</button>
      </div>
      </spf:form>
    </div>
  </div>
</div>

   <!-- Modal for Editing UOM -->
 <div class="modal fade" id="myModaledit" data-toggle="modal" data-target=".bs-example-modal-lg">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Unit Type</h4>
      </div>
<%--       <spf:form action="${pageContext.request.contextPath}/uom/edituomdetail.html" commandName="uombean" method="post" modelAttribute="uombean" onsubmit="return edituomscript();">
 --%>		<spf:form method="post" modelAttribute="mappedModel"  action="edit.html">

      <div class="modal-body">
         		 <spf:input type="hidden" id="legalentityidvalueEdit"  path="legalentityMaster.id"/>
				<spf:input type="hidden" id="ecoZoneMasterEdit" path="ecozone.id"/>
				<spf:input type="hidden" id="sfEdit"  path="id" value=""/>
	
		   <table class="table table-curved table-hover table-striped">
			<td>Unit Code</td>
		   <td><spf:input path="unitCode" placeholder="Text" class="form-control" name="text-input" id="unitCodeEdit"/></td>
			<td>Unit No</td>
		   <td><spf:input path="unitNo" placeholder="Text" class="form-control" name="text-input" id="unitNoEdit"/></td>

		   <td><button type="submit" class="btn btn-primary btn-sm" >Edit</button></td>
		   </table>
     </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary btn-sm" >Edit</button>
      </div>
      </spf:form>
    </div>
  </div>
</div>
	
