<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body style="width:150%!important;">
<div class="page-content" style="min-height: 244.233px;">
 	<ul role="tablist" class="nav nav-tabs">
 		<li class="active"><a data-toggle="tab" role="tab" href="#add"><i class="fa fa-plus-square-o"></i>Organization Set Up Page</a></li>
	</ul>
<div class="tab-content" style="width:176%">
<div id="add" class="tab-pane active" >
  <div class="panel panel-default ">
   <div class="panel-heading" style="text-align: left;">
   	<h2><strong>Organization Hierarchy</strong>&nbsp;&nbsp;&nbsp;&nbsp;</h2>
   </div>
   <div class="panel-body">
   <c:if test="${! empty orgSetupServiceList}">
				<form:form action="organizational_hierarchy_setup_submit.html"
					modelAttribute="mappedModel" method="post">

					<table class="table table-curved table-hover table-striped" style="font-size: 9px; text-align: center;">
						<tr>
						<th>Sl No.</th>
						<th>Levels</th>
						<th>Ownership Tracking</th>
						<th>Usage Tracking</th>
						<th>Employee Mapping</th>
						<th>SF at Levels</th>
						<th>Head of Levels</th>
						<th>Many Head To 1 Level</th>
						<th>1 Head To Many Level</th>
						<th>SPOC Applicable</th>
						<th>Many Spoc To 1 Level</th>
						<th>1 Spoc To Many Level</th>
						<th>Asset Manager</th>
						<th>Many ASM To 1 Level</th>
						<th>1 ASM To Many Level</th>
						<th>Validity Period</th>
						<th>Depreciation Reporting</th>
						<th><input type="checkbox" id="selectAlls"
								class="select"></th>
						<tr>
						<c:forEach items="${mappedModel.organizationHierarchySetupLst}"
							varStatus="row" var="orgHierSetupLst">
							<tr>
								<td>${row.index+1}</td>
								<td><form:hidden path="organizationHierarchySetupLst[${row.index}].id" />
								    <form:input path="organizationHierarchySetupLst[${row.index}].levelNames" />
								</td>
								<c:choose>
								<c:when test="${orgHierSetupLst.ownerShipTracking eq  1}">
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].ownerShipTracking"
										name="rbtnShift" value="1" id="wnrshpId_${row.index}" class="wnrshpCls" checked="checked" onclick="show(this.id);"/></td>
								</c:when>
								<c:otherwise>
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].ownerShipTracking"
										name="rbtnShift" value="1" id="wnrshpId_${row.index}" class="wnrshpCls" onclick="show(this.id);"/></td>
								</c:otherwise>
								</c:choose>
								<c:choose>
								<c:when test="${orgHierSetupLst.usageTracking eq 1}">
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].usageTracking"
										name="rbtnShift" value="1" id="usageId_${row.index}" class="wnrshpCls" checked="checked" onclick="showusage(this.id);"/></td>
								</c:when>
								<c:otherwise>
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].usageTracking"
										name="rbtnShift" value="1" id="usageId_${row.index}" class="wnrshpCls" onclick="showusage(this.id);"/></td>
								</c:otherwise>
								</c:choose>
								<c:choose>
								<c:when test="${orgHierSetupLst.employeeMapping eq 1}">
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].employeeMapping"
										name="rbtnShift" value="1" id="empMp_${row.index}" class="wnrshpCls" checked="checked" onclick="showempMp(this.id);"/></td>
								</c:when>
								<c:otherwise>
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].employeeMapping"
										name="rbtnShift" value="1" id="empMp_${row.index}" class="wnrshpCls" onclick="showempMp(this.id);"/></td>
								</c:otherwise>
								</c:choose>
								<c:choose>
								<c:when test="${orgHierSetupLst.supportFunctionAtLevel eq 1}">
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].supportFunctionAtLevel"
										name="rbtnShift" value="1" id="sfal_${row.index}" class="wnrshpCls" checked="checked" onclick="showSFAL(this.id);"/></td>
								</c:when>
								<c:otherwise>
								<td><form:radiobutton path="organizationHierarchySetupLst[${row.index}].supportFunctionAtLevel"
										name="rbtnShift" value="1" id="sfal_${row.index}" class="wnrshpCls" onclick="showSFAL(this.id);"/></td>
								</c:otherwise>
								</c:choose>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].headOFLevelAppCable" class="cHLA" id="HLA${row.index}" value="1" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].manyHdToOneLevel" value="1" id="MHTOL${row.index}" class="cMHTOL" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].oneHdToManyLevel" value="1" id="OHTML${row.index}" class="cOHTML" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].spocAppCable" value="1" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].manySpocToOneLevel" value="1" id="" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].OneSpocToManyLevel" value="1" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].amsAppCable" value="1" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].manyAmsToOneLevel" value="1" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].OneAmsToManyLevel" value="1" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].validityPeriodAppCabl" value="1" /></td>
								<td><form:checkbox path="organizationHierarchySetupLst[${row.index}].depritiationRepAppCabl" value="1" /></td>
								<td><input type="checkbox" class="checkboxs" /></td>
							</tr>

						</c:forEach>
						<tr>
							<td></td>
							<td>Not Applicable</td>
							<td><input name="rbtnShift" value="1" type="radio"	id="ntAppcbl1" onclick="HideOwnShipTrack(this.id);"/></td>
							<td></td>
							<td></td>
							<td><input name="sfname" value="1" type="radio" id="ntWithHir1" onclick="HideSFAtLevel(this.id);"/></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<table border="0">
						<tr>
							<td colspan="10" style="height: 20px;"></td>
						</tr>
						<tr>
							<td width="160"></td>
							<td width="100"></td>
							<td align="right" width="100">&nbsp;</td>
							<td align="left" width="100">&nbsp;</td>
							<td width="100" align="right"><input name="submit2"
								type="submit" value="Back" class="btn  btn-primary" style="width: 100px;" /></td>
							<td width="0"></td>
							<td width="100"><input name="reset" type="submit"
								value="Submit" class="btn  btn-primary" style="width: 100px;" /></td>
							<td width="100"><input name="submit" type="submit"
								value="Cancel" class="btn  btn-primary"style="width: 100px;" /></td>
							<td width="63"></td>
						</tr>
					</table>

				</form:form>
			</c:if>
			</div>
			</div></div></div></div></body>
<script type="text/javascript">
            $(function() {
                $("#hMenu").load("Home.html");

        		$("#tableArea").hide();
        
        		
//****** Text Field Validation For Integer Only  ********// 
		$("#nolevel").keypress(function (e) {
		 var ss=$("#nolevel").val();
		//	alert("--"+ss);
			     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			//display error message
				$("#errmsg").html("Digits Only").show().fadeOut("slow");
				return false;
				}else  if ($("#nolevel").val().equals("0")) {
        		//display error message
        			$("#errmsg").html("Zero Not allowed").show().fadeOut("slow");
        			return false;
        			}else{
        				return true;
        			}
		});
		
			$("#ntAppcbl").change(function(){
				var clss=$("#wnrshpId").attr('class');
				alert("HIIIII---"+clss);
			//	$('input:radio[name="rbtnShift"]').removeAttr('checked');
				$(".clss").prop('checked', false)
				alert("HIIIII---"+clss);
			});
			
		$(".cHLA").change(function(){
			var ss =  $(this).attr('id');
			var rowNo=ss.substring(3,4);
			alert(''+rowNo);
			var smhtol=$(".cMHTOL").attr('id');
			var sohtml=$(".cOHTML").attr('id');
			var subSmhtol=smhtol.substring(0,5)
			var subOhtml=sohtml.substring(0,5)
			var test1=subSmhtol.concat(rowNo);
			var test2=subOhtml+rowNo;
			$("#MHTOL1").removeAttr("disabled");
			$("#test2").removeAttr("disabled");
			});
				
                $('#selectAlls').click(function(event) {  //on click
                    if (this.checked) { // check select status
                        $('.checkboxs').each(function() { //loop through each checkbox
                            this.checked = true;  //select all checkboxes with class "checkbox1"
                        });
                    } else {
                        $('.checkboxs').each(function() { //loop through each checkbox
                            this.checked = false; //deselect all checkboxes with class "checkbox1"
                        });
                    }
                });
                $('#tableArea addLevelsTable .yss').click(function(event) {
                    alert("yes");
                });
            });

        </script>
        <script type="text/javascript">
        function show(id){
        	var i;
        	for(i=0;i<10;i++){
        		if(id == "wnrshpId_"+i){
        			
        		}else{
        			$('#wnrshpId_'+i).prop('checked', false);
        		  }
        	}
        	if($('#ntAppcbl1').is(':checked')){
        		$('#ntAppcbl1').prop('checked', false);
        	}
        }
        function HideOwnShipTrack(id){
        	for(var i=0;i<10;i++){
        		$('#wnrshpId_'+i).prop('checked', false);
        	}
        }
        function showusage(id){
        	var i;
        	for(i=0;i<10;i++){
        		if(id == "usageId_"+i){
        			
        		}else{
        			$('#usageId_'+i).prop('checked', false);
        		  }
        	}
        }
        function showempMp(id){
        	var i;
        	for(i=0;i<10;i++){
        		if(id == "empMp_"+i){
        			
        		}else{
        			$('#empMp_'+i).prop('checked', false);
        		  }
        	}
        }
        function showSFAL(id){
        	var i;
        	for(i=0;i<10;i++){
        		if(id == "sfal_"+i){
        			
        		}else{
        			$('#sfal_'+i).prop('checked', false);
        		  }
        	}
        	if($('#ntWithHir1').is(':checked')){
        		$('#ntWithHir1').prop('checked', false);
        	}
        }
        function HideSFAtLevel(id){
        	for(var i=0;i<10;i++){
        		$('#sfal_'+i).prop('checked', false);
        	}
        }
        </script>