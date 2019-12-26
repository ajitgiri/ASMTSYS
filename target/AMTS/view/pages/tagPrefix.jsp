<%@ taglib prefix="spf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<script type="text/javascript">
 function addTagPrefix(){
	 var major=document.getElementById("major").value;
	 if(major == 0){
			alert("Please Select the Asset Major Category");
			document.getElementById("major").focus();
			return false;
	 }
	 var minor=document.getElementById("minor").value;
	 if(minor == 0){
			alert("Please Select the Asset Minor Category");
			document.getElementById("minor").focus();
			return false;
	 }
	 
	 
	var assetPrefix=document.getElementById("assetPrefix").value;
	if(assetPrefix == null || assetPrefix == ""){
		alert("Please Enter the Asset Prefix");
		document.getElementById("assetPrefix").focus();
		return false;
	}
	var accessoryPrefix=document.getElementById("accessoryPrefix").value;
	if(accessoryPrefix == null || accessoryPrefix == ""){
		alert("Please Enter the Accessory Prefix ");
		document.getElementById("accessoryPrefix").focus();
		return false;
	}
	var filtersfcode=/^[A-Z]+$/;
	if(!filtersfcode.test(assetPrefix))
    {
    alert("Please enter correct format for Asset Prefix Code e.g. DSK for Desktop");
    document.getElementById("assetPrefix").value="";
    document.getElementById("assetPrefix").focus();
    return false;
    }
	var filtersfname=/^[A-Z]+$/;
	if(!filtersfname.test(accessoryPrefix))
    {
    alert("Please enter correct format for Accessory Prefix e.g. DSKA for Desktop");
    document.getElementById("accessoryPrefix").value="";
    document.getElementById("accessoryPrefix").focus();
    return false;
    }
	
	return true;
}
  function addcontent(){
/* 	var legalentityid=document.getElementById("legalEntityId").value;
	if(legalentityid == 0){
		alert("Please Select One of The Legal Entity");
	}else{
	 $("#legalentityidvalue").val(legalentityid);
 */	$( "#dialog" ).dialog("open");
} 

function editTagPrefix(id){
    	   $.ajax({
			type: "GET",
			url: "tagPrefixEdit.html",
			data: {"tagPrefixId": id,},
			success: function(data){         
				var obj = $.parseJSON(data);
				$("#AssetEdit").val(obj.assetPrefix);
			    $("#AccessoryEdit").val(obj.accessoryPrefix);
			    $("#assetMajorCategoryEdit").val(obj.assetMajorCategory.id);
			    $("#assetMinorCategoryEdit").val(obj.assetMinorCategory.id);
			    $("#tagPrefixEdit").val(obj.id);  
			  },
			 error: function(e){
			}
			});   
}


function deleteTagPrefix(id){
	var yes=confirm("Do You Want To Deleted ");
	if(yes == true){
		$.ajax({
 			type: "POST",
 			url: "deleteTag.html",
 			data: {"sfId": id,},
 			success: function(data){
				location.href="tag_prefix.html";
 			},
 			error: function(e){
 			}
 			});
	}else{
		return false;
	}
}
function disableTagPrefix(id){
	var yes=confirm("Do You Want To Disable");
	if(yes == true){
		$.ajax({
 			type: "POST",
 			url: "disable.html",
 			data: {"sfId": id,},
 			success: function(data){
 				location.href="tag_prefix.html";
 			},
 			error: function(e){
 			}
 			});
	}else{
		return false;
	}
}
function enableTagPrefix(id){
	var yes=confirm("Do You Want To Enable");
	if(yes == true){
		$.ajax({
 			type: "POST",
 			url: "enable.html",
 			data: {"sfId": id,},
 			success: function(data){
 				location.href="tag_prefix.html";
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
 			url: "tag_prefix.html",
 			data: {"legalEntid": leid,},
 			success: function(data){
 			location.href="<%=request.getContextPath()%>/tag_prefix.html.html?id="+leid;
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
   	<h2><strong>TagPrefix Master</strong>&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   </div>

     <div class="panel-body">
	<form class="form-horizontal " enctype="multipart/form-data" method="post" action="">
      <table  class="table table-curved table-hover table-striped" style="width:500px;margin-left: 200px;">
		<thead>		
         <th>Asset Major Category</th>
         <th>Asset Minor Category</th>
         <th>Asset Prefix</th>
         <th>Accessory Prefix</th>
         <th style="text-align: right;"><button class="btn  btn-primary" type="reset"  title="add" onclick="addcontent()" data-toggle="modal" data-target="#myModaladd"><i class="fa fa-thumbs-up"></i>Add</button></th>
        </thead>
         <tbody>
 		<c:choose>
			<c:when test="${! empty tagPrefixList}">
				<c:forEach var="tagPrefixList" items="${tagPrefixList}">
					<c:choose>
						<c:when test="${tagPrefixList.status == 0}">
			<tr>
		      <td>${tagPrefixList.assetMajorCategory.assetMajorCategory}</td>
			    <td>${tagPrefixList.assetMinorCategory.assetMinorCategory}</td>
					<td id="assetPrefix_<c:out value="${tagPrefixList.assetPrefix}"/>">${tagPrefixList.assetPrefix}</td>
					   <td id="accessoryPrefix_<c:out value="${tagPrefixList.accessoryPrefix}"/>">${tagPrefixList.accessoryPrefix}</td>
 			      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${tagPrefixList.id}" title="Edit" onclick="editTagPrefix(this.name);" data-toggle="modal" data-target="#myModaledit"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${tagPrefixList.id}" title="Delete" onclick="deleteTagPrefix(this.name);"><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${tagPrefixList.id}" title="Disable" onclick="disableTagPrefix(this.name);"><i class="fa fa-thumbs-up"></i>Disable</button>
		      </td>
		    </tr>
		    </c:when>
		    <c:otherwise>
		      <tr>
				 <td>${tagPrefixList.assetMajorCategory.assetMajorCategory}</td>
				    <td>${tagPrefixList.assetMinorCategory.assetMinorCategory}</td>
						<td id="assetPrefix_<c:out value="${tagPrefixList.assetPrefix}"/>">${tagPrefixList.assetPrefix}</td>
						   <td id="accessoryPrefix_<c:out value="${tagPrefixList.accessoryPrefix}"/>">${tagPrefixList.accessoryPrefix}</td>
 		      <td  nowrap="nowrap">
		          <button class="btn  btn-primary" type="reset" name="${tagPrefixList.id}" title="Edit" onclick="editTagPrefix(this.name);" disabled="disabled" data-toggle="modal" data-target="#myModaledit"><i class="fa fa-thumbs-up"></i> Edit</button>
		          <button class="btn  btn-primary" type="reset" name="${tagPrefixList.id}" title="Delete" onclick="deleteTagPrefix(this.name);" disabled="disabled"><i class="fa fa-thumbs-up"></i>Delete</button>
		          <button class="btn  btn-primary" type="reset" name="${tagPrefixList.id}" title="Enable" onclick="enableTagPrefix(this.name);" ><i class="fa fa-thumbs-up"></i>Enable</button>
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
	
	<div class="modal fade" id="myModaladd" data-toggle="modal" data-target=".bs-example-modal-lg">
  	<div class="modal-dialog">
      <div class="modal-content">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Tag Prefix</h4>
      </div>

 		<spf:form method="post" modelAttribute="mappedModel" action="addTag.html" onsubmit="return addTagPrefix() ">
      	<div class="modal-body" style="width:500px;">
			<table class="table table-curved table-hover table-striped">
				<tr>
				<th>Asset Major Category</th>
				<th>Asset Minor Category</th>
				<th></th>
				</tr>
				<tr>
						<td>
						
						<spf:select name="select2" class="select2-choice" style="width:150px;" path="assetMajorCategory.id" id="major">
						<option selected="selected" value="0">Select</option>
						<c:forEach var="legalentityList"  items="${majorList}">
						<option value="${legalentityList.id}">${legalentityList.assetMajorCategory}</option>
						</c:forEach>
						</spf:select>
						</td>
						<td>
						<spf:select name="select2" class="select2-choice" style="width:150px;" path="assetMinorCategory.id" id="minor">
						<option selected="selected" value="0">Select</option>
						<c:forEach var="empList"  items="${minorList}">
						<option value="${empList.id}">${empList.assetMinorCategory}</option>
						</c:forEach>
						</spf:select>
						</td>
			<td>
				</td>
			
</tr>
<tr>
				<th>Asset Prefix</th>
				<th>Accessory Prefix</th>
				<th></th>
</tr>
<tr>
				<td>
				<spf:input path="assetPrefix" id="assetPrefix" placeholder="Asset Prefix" name="text-input" class="form-control" /> 
				<spf:errors path="assetPrefix"></spf:errors>
				</td>
				<td>
				<spf:input path="accessoryPrefix" id="accessoryPrefix" placeholder="Accessory Prefix" name="text-input" class="form-control" />
				<spf:errors path="accessoryPrefix"></spf:errors>
				</td>
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
 		<spf:form method="post" modelAttribute="mappedModel"  action="editTag.html">

      <div class="modal-body" >
	 				<spf:input type="hidden" id="assetMajorCategoryEdit"  path="assetMajorCategory.id"/> 
					<spf:input type="hidden" id="assetMinorCategoryEdit" path="assetMinorCategory.id"/>
				    <spf:input type="hidden" id="tagPrefixEdit"  path="id" value=""/>
		   <table class="table table-curved table-hover table-striped">
						<th>Asset Prefix</th>
						<th>Accessory Prefix</th>
						
				 <tr>
						<td>
						<spf:input path="assetPrefix" placeholder="Text" class="form-control" name="text-input" id="AssetEdit" />
						<spf:errors path="assetPrefix"></spf:errors>
						</td>
						<td>
						<spf:input path="accessoryPrefix" placeholder="Text" class="form-control" name="text-input" id="AccessoryEdit" />
						<spf:errors path="accessoryPrefix"></spf:errors>
						</td>
		   				<td>
		   				<button type="submit" class="btn btn-primary btn-sm" >Edit</button>
		   				</td>
		 		 </tr>
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
