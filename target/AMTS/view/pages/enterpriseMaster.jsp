<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
$(function() {
	//alert("hiiiiiiiiii");
});
</script>
<title>Enterprise Setup Page</title>
<body>
	<div class="page-content" style="min-height: 244.233px;">
		<!-- Tab panes -->
<div class="tab-content">
  <div id="add" class="tab-pane active">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<h2><strong>Enterprise Details</strong></h2>
		</div>
<c:if test="${! empty  status}">
	 
<form:form class="form-horizontal" action="enter_master_update.html" modelAttribute="mappedModel" method="post" >
	<div class="panel-body">
			<div class="col-lg-6 col-md-6 col-sm-6 ">
				<div class="form-group ">
					<label for="text-input1" class="col-md-5 control-label">Enterprise Name <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="enterpriseName" value="${enterpriseMasterList.enterpriseName}" data-placement="left" data-toggle="tooltip" title="" rel="txtTooltip" placeholder="Enterprise Name"
							class="form-control" id="text-input1" data-original-title="**Your Title**"/>
					</div>
				</div>
				<div class="form-group ">
					<label for="email-input1" class="col-md-5 control-label">Address Line 2 <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="addressLineSecond" value="${enterpriseMasterList.addressLineSecond}" placeholder="Address Line 2" class="form-control"  id="email-input1"/>
<!-- 						<span class="label label-success">Success text</span> -->
					</div>
				</div>
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Address Line 4 <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="addressLineFour" value="${enterpriseMasterList.addressLineFour}"  placeholder="Address Line 4" class="form-control"  id="password-input1"/>
<!-- 						 <span class="label label-warning">Warning text</span> -->
					</div>
				</div>
				<div class="form-group ">
					<label for="text-input1" class="col-md-5 control-label">State <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="stateName" value="${enterpriseMasterList.stateName}"  placeholder="State" class="form-control"  id="text-input1" />
					</div>
				</div>
				<div class="form-group ">
					<label for="email-input1" class="col-md-5 control-label">PIN/ZIP Code <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="pinZipCode" value="${enterpriseMasterList.pinZipCode}" placeholder="PIN/ZIP Code" class="form-control"  id="email-input1"/>
<!-- 						<span class="label label-success">Success text</span> -->
					</div>
				</div>
			<c:if test="${mailReq eq 1}">
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Email Server IP/Host Name <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="mailServer" value="${enterpriseMasterList.mailServer}" placeholder="IP/Host Name " class="form-control"  id="password-input1"/> 
<!-- 							<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			</c:if>
			<c:if test="${serverAccross eq 1}">
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Service Account <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="serviceAccount" value="${enterpriseMasterList.serviceAccount}" placeholder="Service Account" class="form-control"  id="password-input1"/> 
<!-- 						<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			</c:if>
			</div>
		
			<div class="col-lg-5 col-md-6 col-sm-6">
				<div class="form-group">
					<label for="text-input" class="col-md-5 control-label">Address Line 1 <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="addressLineFirst" value="${enterpriseMasterList.addressLineFirst}" placeholder="Address Line 1" class="form-control" name="text-input" id="text-input"/> 
<!-- 						<span class="label label-danger">Error text</span> -->
					</div>
				</div>
				<div class="form-group">
					<label for="email-input" class="col-md-5 control-label">Address Line 3<span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="addressLineThird" value="${enterpriseMasterList.addressLineThird}" placeholder="Address Line 3" class="form-control" name="email-input" id="email-input"/>
<!-- 						<span class="label label-success">Success text</span> -->
					</div>
				</div>
				<div class="form-group">
					<label for="password-input" class="col-md-5 control-label">City<span class="mendatory">*</span>	</label>
					<div class="col-md-7">
						<form:input path="cityName" value="${enterpriseMasterList.cityName}" placeholder="City" class="form-control" name="password-input" id="password-input"/>
<!-- 						<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
				
				<div class="form-group">
					<label for="select" class="col-md-5 control-label">Country
					<span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:select path="countryId.id" size="1" name="select" id="select" style="display: none;">
							<option value="0">Please select</option>
							<c:forEach items="${countryList}" var="countryLST">
							  <c:choose>
								<c:when test="${mappedModel.countryId.id == countryLST.id}">
										<form:option value="${countryLST.id}" selected="selected">${countryLST.countryName}</form:option>
									</c:when>
									<c:otherwise>
										<option value="${countryLST.id}">${countryLST.countryName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</form:select>
					</div>
				</div>
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label"> Port No. <span class="mendatory">*</span> </label>
					<div class="col-md-7">
						<form:input path="portNo" value="${enterpriseMasterList.portNo}" placeholder=" Port No." class="form-control" name="password-input" id="password-input1"/> 
<!-- 							<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			<c:if test="${serverAccross eq 1}">
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Password <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="serviceAccPassword" value="${enterpriseMasterList.serviceAccPassword}" placeholder="Password" class="form-control" name="password-input" id="password-input1"/>
<!-- 						 <span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			</c:if>
			</div>
		 </div>
		 <div class="panel-footer text-center">
			<button class="btn  btn-primary" type="submit"> Update <i class="fa fa-chevron-right"></i> </button>
		 </div>
		</form:form>
	</c:if>
<c:if test="${ empty  status}">
	<form:form class="form-horizontal"  action="enter_master_update.html" modelAttribute="mappedModel" method="post" >
       <div class="panel-body">
			<div class="col-lg-6 col-md-6 col-sm-6 ">
				<div class="form-group ">
					<label for="text-input1" class="col-md-5 control-label">Enterprise Name <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="enterpriseName" data-placement="left"  placeholder="Enterprise Name" class="form-control" id="text-input1"  />
					</div>
				</div>
				<div class="form-group ">
					<label for="email-input1" class="col-md-5 control-label">Address Line 2 <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="addressLineSecond" placeholder="Address Line 2" class="form-control" name="email-input" id="email-input1"/>
<!-- 						<span class="label label-success">Success text</span> -->
					</div>
				</div>
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Address Line 4 <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="addressLineFour" placeholder="Address Line 4"  class="form-control"  id="email-input1"/>
<!-- 						 <span class="label label-warning">Warning text</span> -->
					</div>
				</div>
				<div class="form-group ">
					<label for="text-input1" class="col-md-5 control-label">State <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="stateName" data-placement="left" data-toggle="tooltip" title="" rel="txtTooltip" placeholder="State"
							class="form-control" name="text-input" id="text-input1" data-original-title="**Your Title**" />
					</div>
				</div>
				<div class="form-group ">
					<label for="email-input1" class="col-md-5 control-label">PIN/ZIP Code <span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:input path="pinZipCode" placeholder="PIN/ZIP Code" class="form-control" name="email-input" id="email-input1"/>
<!-- 						<span class="label label-success">Success text</span> -->
					</div>
				</div>
			<c:if test="${mailReq eq 1}">
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Email Server IP/Host Name <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="mailServer" placeholder="IP/Host Name " class="form-control" name="password-input" id="password-input1"/> 
<!-- 							<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			</c:if>
			<c:if test="${serverAccross eq 1}">
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Service Account <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="serviceAccount" placeholder="Service Account" class="form-control" name="password-input" id="password-input1"/> 
<!-- 						<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			</c:if>
			</div>
			<div class="col-lg-5 col-md-6 col-sm-6">
				<div class="form-group">
					<label for="text-input" class="col-md-5 control-label">Address Line 1 <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="addressLineFirst" placeholder="Address Line 1" class="form-control" name="text-input" id="text-input"/> 
<!-- 						<span class="label label-danger">Error text</span> -->
					</div>
				</div>
				<div class="form-group">
					<label for="email-input" class="col-md-5 control-label">Address Line 3<span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="addressLineThird" placeholder="Address Line 3" class="form-control" name="email-input" id="email-input"/>
<!-- 						<span class="label label-success">Success text</span> -->
					</div>
				</div>
				<div class="form-group">
					<label for="password-input" class="col-md-5 control-label">City<span class="mendatory">*</span>	</label>
					<div class="col-md-7">
						<form:input path="cityName" placeholder="City" class="form-control" name="password-input" id="password-input"/>
<!-- 						<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
				
				<div class="form-group">
					<label for="select" class="col-md-5 control-label">Country
					<span class="mendatory">*</span>
					</label>
					<div class="col-md-7">
						<form:select path="countryId.id"  size="1" name="select" id="select" style="display: none;">
							<option value="0">Please select</option>
							<c:forEach items="${countryList}" var="countryLST">
								<option value="${countryLST.id}">${countryLST.countryName}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label"> Port No. <span class="mendatory">*</span> </label>
					<div class="col-md-7">
						<form:input path="portNo" placeholder=" Port No." class="form-control" name="password-input" id="password-input1"/> 
<!-- 							<span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			<c:if test="${serverAccross eq 1}">
				<div class="form-group ">
					<label for="password-input1" class="col-md-5 control-label">Password <span class="mendatory">*</span></label>
					<div class="col-md-7">
						<form:input path="serviceAccPassword" placeholder="Password" class="form-control" name="password-input" id="password-input1"/>
<!-- 						 <span class="label label-warning">Warning text</span> -->
					</div>
				</div>
			</c:if>
			</div>
			
		</div>
		<div class="panel-footer text-center">
			<button class="btn  btn-primary" type="submit"> Save <i class="fa fa-chevron-right"></i> </button>
		</div>
	</form:form>
	</c:if>
  </div>
</div>
		
</div>
</div>
</body>
