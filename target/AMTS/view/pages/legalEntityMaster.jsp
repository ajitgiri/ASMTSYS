<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Legal Entity Master</title>
<script type="text/javascript">
	$(function() {
		$("#hMenu").load("Home.html");
		$("#divid").hide();
		
		$("#LeSelect1").change(function(){
			alert("hiiiiii----");
			var leId = $("#LeSelect1").val();
			alert("id----"+leId);
			var imgUrl;
			$.ajax({
				type : "GET",
				url : "leDetails.html",
				data : {
					"selectLeId" : leId,
				},
				success : function(data) {
					var obj = $.parseJSON(data);
					$("#legalEntitycode").val(obj.legalEntityCode);
					$("#legalEntityname").val(obj.legalEntityName);
					 $("#addressLine1").val(obj.address1);
					$("#addressLine2").val(obj.address2);
					$("#addressLine3").val(obj.address3);
					$("#addressLine4").val(obj.address4); 
					$("#countryId").val(obj.country);
					$("#stateName").val(obj.state);
					$("#cityName").val(obj.city);
					$("#phoneNo").val(obj.phoneNo);
					$("#faxNo").val(obj.faxNo);
					$("#zipCode").val(obj.zipCode);
					$("#urlId").val(obj.url);
					$("#emailId").val(obj.emailId);
					$("#ipAddress").val(obj.ipAddress);
					$("#portNo").val(obj.portNo);
					$("#serviceAccount").val(obj.serviceAccount);
					$("#passwd").val(obj.password); 
					$("#legalEntityId").val(obj.id);
				<%-- 	imgUrl="<%=request.getContextPath()%>/Image.html?id="+ obj.id;
											//alert("----"+imgUrl);
											$("#currentLogo").attr('src','imgUrl'); --%>
					 $("#divid").show();
						},
						error : function(e) {
						}
					});
				});

	});
</script>
</head>
<body>
	<div class="page-content" style="min-height: 244.233px;">
		<!-- Tab panes -->
		<div class="tab-content">
			<div id="add" class="tab-pane active">
				<div class="panel panel-default ">
					<div class="panel-heading">
						<h2>
							<strong>Legal Entity Master</strong>
						</h2>
					</div>
					<div class="panel-body">
						<div class="col-lg-7 col-md-10 col-sm-6 ">
							<div class="form-group">
								<label for="select" class="col-md-5 control-label">Select Legal Entity<span class="mendatory">*</span>
								</label>
								<div class="col-md-7">
									<select size="1" id="LeSelect1" name="select">
										<option value="0">Please select</option>
										<c:forEach items="${legalEntityList}" var="legalEntityLST">
											<option value="${legalEntityLST.id}">${legalEntityLST.legalEntityName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div id="LEdetailsId">

						<div class="panel-heading">
							<h2>
								<strong>Legal Entity Details</strong>
							</h2>
						</div>
						<form:form class="form-horizontal " modelAttribute="mappedModel"
							method="post" action="update_legalentity_master.html"
							enctype="multipart/form-data">
							<div class="panel-body">
								<div class="col-lg-6 col-md-6 col-sm-6 ">
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Legal
											Entity Code <form:hidden path="id" id="legalEntityId" /> <span
											class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="legalEntityCode" placeholder="Text"
												class="form-control" name="text-input" id="legalEntitycode" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Address
											Line 1 <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="address1" placeholder="Text"
												class="form-control" name="text-input" id="addressLine1" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Address
											Line 3 <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="address3" placeholder="Text"
												class="form-control" name="text-input" id="addressLine3" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">City
											<span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="city" placeholder="Text"
												class="form-control" name="text-input" id="cityName" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="select1" class="col-md-3 control-label">Country<span
											class="mendatory">*</span></label>
										<div class="col-md-9">
											<form:select path="countryId.id" size="1" name="select"
												id="countryId">
												<option value="0">Please select</option>
												<c:forEach items="${countryList}" var="countryLST">
													<option value="${countryLST.id}">${countryLST.countryName}</option>
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Fax
											No. <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="faxNo" placeholder="Text"
												class="form-control" name="text-input" id="faxNo" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">URL
											<span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="url" placeholder="Text"
												class="form-control" name="text-input" id="url" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<c:if test="${mailReq ne 1}">
										<div class="form-group">
											<label for="text-input" class="col-md-3 control-label">IP
												Address <span class="mendatory">*</span>
											</label>
											<div class="col-md-9">
												<form:input path="ipAddress" class="form-control"
													name="text-input" id="ipAddress" />
												<!-- 										<span class="label label-danger">Error text</span> -->
											</div>
										</div>
									</c:if>
									<c:if test="${serverAccross eq 1}">
										<div class="form-group">
											<label for="text-input" class="col-md-3 control-label">Service
												Account <span class="mendatory">*</span>
											</label>
											<div class="col-md-9">
												<form:input path="serviceAccount" class="form-control"
													name="text-input" id="serviceAccount" />
												<!-- 										<span class="label label-danger">Error text</span> -->
											</div>
										</div>
									</c:if>
									<div class="form-group">
										<label class="col-md-3 control-label" for="file-input1">Upload
											Logo</label>
										<div class="col-md-9">
											<input type="file" name="profileLogo" id="prfileLogo">
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Legal
											Entity Name <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="legalEntityName" placeholder="Text"
												class="form-control" name="text-input" id="legalEntityname" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Address
											Line 2 <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="address2" placeholder="Text"
												class="form-control" name="text-input" id="addressLine2" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Address
											Line 4 <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="address4" placeholder="Text"
												class="form-control" name="text-input" id="addressLine4" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">State
											<span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="state" placeholder="Text"
												class="form-control" name="text-input" id="stateName" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Phone
											No <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="phoneNo" placeholder="Text"
												class="form-control" id="phoneNo" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">PIN/ZIP
											Code <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="zipCode" placeholder="Text"
												class="form-control" id="zipCode" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<div class="form-group">
										<label for="text-input" class="col-md-3 control-label">Email
											Id <span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<form:input path="emailId" placeholder="Text"
												class="form-control" name="text-input" id="emailId" />
											<!-- 										<span class="label label-danger">Error text</span> -->
										</div>
									</div>
									<c:if test="${mailReq ne 1}">
										<div class="form-group">
											<label for="text-input" class="col-md-3 control-label">Port
												No. <span class="mendatory">*</span>
											</label>
											<div class="col-md-9">
												<form:input path="portNo" placeholder="Text"
													class="form-control" name="text-input" id="portNo" />
												<!-- <span class="label label-danger">Error text</span> -->
											</div>
										</div>
									</c:if>
									<c:if test="${serverAccross eq 1}">
										<div class="form-group has-warning">
											<label for="password-input1" class="col-md-3 control-label">Password
												<span class="mendatory">*</span>
											</label>
											<div class="col-md-9">
												<form:input path="password" placeholder="Password"
													class="form-control" name="password-input" id="password" />
												<!-- <span class="label label-warning">Warning text</span> -->
											</div>
										</div>
									</c:if>
									<div class="form-group">
										<label class="col-md-3 control-label" for="file-input">Current Logo<span class="mendatory">*</span>
										</label>
										<div class="col-md-9">
											<img src="<%=request.getContextPath()%>/Image.html?id=1" width="100px" height="100px" />
										</div>
									</div>
								</div>
							</div>
							<div class="panel-footer text-center">
								<button class="btn  btn-primary" type="reset">
									<i class="fa fa-thumbs-up"></i> Back
								</button>
								<button class="btn  btn-primary" type="submit">
									<i class="fa fa-thumbs-up"></i> Update
								</button>
								<button class="btn  btn-primary" type="reset">
									<i class="fa fa-thumbs-up"></i> Cancel
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>