<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Enterprise Setup Page</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#noOfLeId").hide();
	$("#MSAEID").hide();
	$("#SAFERID").hide();
	
	$("#inline-radio5").click(function(){
		$("#noOfLeId").show();
		$("#MSAEID").show();
		$("#SAFERID").show();
	});
	$("#inline-radio6").click(function(){
		$("#noOfLeId").hide();
		$("#MSAEID").hide();
		$("#SAFERID").show();
	});
	
	$("#nolevel").keypress(function (e) {
	    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			$("#errMG").html("Digits Only").show().fadeOut("slow");
			return false;
	    }
		});
});
</script>

<body>
<div class="page-content" style="min-height: 244.233px;">
	<div class="tab-content">
		<div id="add" class="tab-pane active">

			<div class="panel panel-default ">
			
				<div class="panel-heading">
					<h2>
						<strong>Enterprise Setup</strong>
					</h2>
				</div>
				<form:form class="form-horizontal"  modelAttribute="mappedModel" action="enterprise_setup_succes.html" method="post">
				<div class="panel-body">
						<c:if test="${! empty mtplLe }">
							<c:choose>
							<c:when test="${mtplLe eq 1}">
							<div class="form-group">
								<label class="col-md-4 control-label">Multiple Legal Entities <span class="mendatory">*</span></label>
								<div class="col-md-8">
									<label for="inline-radio1" class="radio-inline"> 
										<form:radiobutton path="multipleLegalEntitys" value="1"  id="inline-radio5" checked="checked"/> Yes
									</label> 
									<label for="inline-radio2" class="radio-inline"> 
										<form:radiobutton path="multipleLegalEntitys" value="0"  id="inline-radio6"/> No
									</label> 
								</div>
							</div>
							</c:when>
							<c:otherwise>
							<div class="form-group">
								<label class="col-md-4 control-label">Multiple Legal Entities <span class="mendatory">*</span></label>
								<div class="col-md-8">
									<label for="inline-radio3" class="radio-inline"> 
										<form:radiobutton path="multipleLegalEntitys"  value="1"  id="inline-radio5"/> Yes
									</label> 
									<label for="inline-radio4" class="radio-inline"> 
										<form:radiobutton path="multipleLegalEntitys"  value="0" id="inline-radio6" checked="checked" /> No
									</label> 
								</div>
							</div>
						</c:otherwise>
						</c:choose>
						</c:if>
						<c:if test="${mtplLe eq null }">
						 <div class="form-group">
							  <label class="col-md-4 control-label">Multiple Legal Entities <span class="mendatory">*</span></label>
									<div class="col-md-8">
										<label for="inline-radio5" class="radio-inline"> 
											<form:radiobutton path="multipleLegalEntitys"  value="1"  id="inline-radio5" /> Yes
										</label> 
										<label for="inline-radio6" class="radio-inline"> 
											<form:radiobutton path="multipleLegalEntitys"  value="0"  id="inline-radio6" /> No
										</label> 
								</div>
							</div>
						</c:if>
						
						<c:if test="${! empty enterpriseSetupSericeList}">
							 <div class="form-group">
							 		<label class="col-md-4 control-label">No. of Legal Entities Exist: <span class="mendatory">*</span></label>
							 <div class="col-md-8">
									<label for="inline-radio11" class="radio-inline"> ${noLe}</label> 
							 </div>
							</div>
					</c:if>
						
						<div class="form-group" id="noOfLeId">
								<label for="text-input1" class="col-md-4 control-label">No of Legal Entities<span class="mendatory">*</span></label>
						<div class="col-md-8">
						<c:choose>
							<c:when test="${! empty enterpriseSetupSericeList}">
							<c:forEach items="${enterpriseSetupSericeList}" var="enterpriseSetupSericeLst">
								<form:input	path="noOfLegalEntitys" data-placement="left" data-toggle="tooltip"
										title="" rel="txtTooltip" placeholder="Text" class="form-control"  id="nolevel"
										data-original-title="**Your Title**" /> 
 										<span class="label label-danger"></span> 
								</c:forEach>
							</c:when>
							<c:otherwise>
								<form:input path="noOfLegalEntitys" data-placement="left" data-toggle="tooltip"
										title="" rel="txtTooltip" placeholder="Text" class="form-control"  id="nolevel"
										data-original-title="**Your Title**" /> 
										<span class="label label-danger" id="errMG"></span>
							</c:otherwise>
						</c:choose>
						</div>
						</div>
						
						<c:if test="${! empty emailServerAc }">
							<c:choose>
								<c:when test="${emailServerAc eq 1}">
								<div class="form-group" id="MSAEID">
									<label class="col-md-4 control-label">Email Server Across Enterprise <span class="mendatory">*</span></label>
								<div class="col-md-8">
									<label for="inline-radio7" class="radio-inline"> 
										<form:radiobutton path="emailAccross" value="1" id="inline-radio7" checked="checked"/> Yes
									</label> 
									<label for="inline-radio8" class="radio-inline"> 
										<form:radiobutton path="emailAccross" value="0" id="inline-radio8" /> No
									</label> 
								</div>
							</div>
								</c:when>
								<c:otherwise>
								<div class="form-group" id="MSAEID">
									<label class="col-md-4 control-label">Email Server Across Enterprise <span class="mendatory">*</span></label>
								<div class="col-md-8">
									<label for="inline-radio9" class="radio-inline"> 
										<form:radiobutton path="emailAccross" value="1" id="inline-radio9" /> Yes
									</label> 
									<label for="inline-radio10" class="radio-inline"> 
										<form:radiobutton path="emailAccross" value="0" id="inline-radio10" checked="checked" /> No
									</label> 
								</div>
							</div>
							</c:otherwise>
						</c:choose>
							
						</c:if>
						<c:if test="${emailServerAc eq null }">
						<div class="form-group" id="MSAEID">
									<label class="col-md-4 control-label">Email Server Across Enterprise <span class="mendatory">*</span></label>
								<div class="col-md-8">
									<label for="inline-radio11" class="radio-inline"> 
										<form:radiobutton path="emailAccross" value="1" id="inline-radio11" /> Yes
									</label> 
									<label for="inline-radio12" class="radio-inline"> 
										<form:radiobutton path="emailAccross" value="0" id="inline-radio12" /> No
									</label> 
								</div>
							</div>
					</c:if>
					
					<c:if test="${! empty serviceAc }">
						<c:choose>
							<c:when test="${serviceAc eq 1}">
								<div class="form-group" id="MSAEID">
									<label class="col-md-4 control-label">Service Account For Email Required <span class="mendatory">*</span></label>
								<div class="col-md-8">
									<label for="inline-radio13" class="radio-inline"> 
										<form:radiobutton path="serverAccross" value="1" id="inline-radio13" checked="checked"/> Yes
									</label> 
									<label for="inline-radio14" class="radio-inline"> 
										<form:radiobutton path="serverAccross" value="0" id="inline-radio14"/> No
									</label> 
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group" id="MSAEID">
									<label class="col-md-4 control-label">Service Account For Email Required <span class="mendatory">*</span></label>
								<div class="col-md-8">
									<label for="inline-radio15" class="radio-inline"> 
										<form:radiobutton path="serverAccross" value="1" id="inline-radio15"/> Yes
									</label> 
									<label for="inline-radio16" class="radio-inline"> 
										<form:radiobutton path="serverAccross" value="0" id="inline-radio16" checked="checked"/> No
									</label> 
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					</c:if>
					<c:if test="${serviceAc eq null }">
						<div class="form-group" id="MSAEID">
								<label class="col-md-4 control-label">Service Account For Email Required <span class="mendatory">*</span></label>
						<div class="col-md-8">
								<label for="inline-radio17" class="radio-inline"> 
									<form:radiobutton path="serverAccross" value="1" id="inline-radio17"/> Yes
								</label> 
								<label for="inline-radio18" class="radio-inline"> 
									<form:radiobutton path="serverAccross" value="0" id="inline-radio18"/> No
								</label> 
						</div>
						</div>
					 </c:if>
						<div class="form-group">
							<label class="col-md-4 control-label">Module Applicable</label>
						<div class="col-md-8">
						</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"> Tracking </label>
							<div class="col-md-8">
								<div class="checkbox">
									<label for="checkbox11"> <form:checkbox path="tracking" value="1" name="checkbox1" id="checkbox11" disabled = "true" /></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">  Depreciation</label>
							<div class="col-md-8">
								<div class="checkbox">
									<label for="checkbox11"> <form:checkbox path="depreciation" value="1" name="checkbox1" id="checkbox11"/></label>
								</div>
							</div>
						</div>
						<c:if test="${! empty validStatus}">
							<div class="form-group">
								<label class="col-md-3 control-label">${validStatus}</label>
							</div>
				  	</c:if>
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
