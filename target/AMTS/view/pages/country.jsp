<%@ page session="true"%>
<%@ include file="/view/pages/include.jsp" %>

<div class="page-content" style="min-height: 244.233px;">

  <!-- Nav tabs -->
	<ul role="tablist" class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" role="tab" href="#add"><i class="fa fa-plus-square-o"></i> Add</a></li>
		<li><a data-toggle="tab" role="tab" href="#edit"><i class="fa fa-edit"></i> Edit</a></li>
		<li><a data-toggle="tab" role="tab" href="#cancel"><i class="fa fa-ban"></i> Cancel</a></li>
		<li><a data-toggle="tab" role="tab" href="#delete"><i class="glyphicon glyphicon-trash"></i> Delete</a></li>
		<li><a data-toggle="tab" role="tab" href="#report"><i class="fa fa-file-text-o"></i> Report</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="add" class="tab-pane active">
			<div class="panel panel-default ">
				<div class="panel-heading">
					<h2><strong>Country Registration</strong></h2>
				</div>
	<form:form modelAttribute="mappedModel" enctype="multipart/form-data" method="post" >
		<div class="panel-body">
				<div class="col-lg-6 col-md-6 col-sm-6 ">

					<div class="form-group ">
						<label for="text-input1" class="col-md-4 control-label">
							Country Code <span class="mendatory">*</span>
						</label>
						<div class="col-md-8">
							<form:input path="countryCode" data-placement="left" data-toggle="tooltip"
								title="" rel="txtTooltip" placeholder="Text"
								class="form-control" name="text-input" id="text-input1"
								data-original-title="**Enter Country Code**"/>
						</div>
						<div class="col-md-8">
							<form:errors path="countryCode" data-placement="left" data-toggle="tooltip"
								title="" rel="txtTooltip" placeholder="Text"
								class="form-control" name="text-input" id="text-input1"
								data-original-title="**Enter Country Code**"/>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="form-group">
						<label for="text-input" class="col-md-4 control-label">
							Country Name <span class="mendatory">*</span>
						</label>
						<div class="col-md-8">
							<form:input path="countryName" placeholder="Text" 
										class="form-control" name="text-input" id="text-input" 
										data-original-title="**Enter Country Name**"/>
						</div>
						<div class="col-md-8">
							<form:errors path="countryName" placeholder="Text" 
										class="form-control" name="text-input" id="text-input" 
										data-original-title="**Enter Country Name**"/>
						</div>
					</div>
				</div>
			
		</div>
	<div class="panel-footer text-center">
		<!-- <button class="btn  btn-primary" type="submit">
			<i class="fa fa-check-circle"></i> Enable
		</button>
		<button class="btn  btn-primary" type="submit">
			<i class="fa fa-ban"></i> Disable
		</button> -->
		<button class="btn  btn-primary" type="submit">
			<i class="fa fa-save"></i> Save
		</button>
		<button class="btn  btn-default" type="reset">
			<i class="fa fa-ban"></i> Cancel
		</button>
	</div>
		</form:form>
	</div>

		</div>
		<div id="edit" class="tab-pane">Edit Page</div>
		<div id="cancel" class="tab-pane">Cancel Page</div>
		<div id="delete" class="tab-pane">Delete Page</div>
		<div id="report" class="tab-pane">
			<table id="dataGrid"
				class="table table-curved table-hover table-striped">
				<thead>
					<tr>
						<th>Sl no.</th>
						<th>Country Code</th>
						<th>Country Name</th>
						<th>Actions</th>
					</tr>
				</thead>
				<c:if test="${! empty countryLST}">
				<tbody>
				<c:forEach items="${countryLST}" var="CountryLST">
					<tr>
						<td class="sorting_1">00</td>
						<td>${CountryLST.countryCode}</td>
						<td>${CountryLST.countryName}</td>
						<td>Table cell</td>
					</tr>
				</c:forEach>
					

				</tbody>
				
				</c:if>
				
			</table>
		</div>
	</div>
	<!-- <div class="row"><div class="col-xs-6"><div class="dataTables_info" id="dataGrid_info" role="status" aria-live="polite">Showing 1 to 10 of 25 entries</div></div><div class="col-xs-6"><div class="dataTables_paginate paging_simple_numbers" id="dataGrid_paginate"><ul class="pagination"><li class="paginate_button previous disabled" aria-controls="dataGrid" tabindex="0" id="dataGrid_previous"><a href="#">Previous</a></li><li class="paginate_button active" aria-controls="dataGrid" tabindex="0"><a href="#">1</a></li><li class="paginate_button " aria-controls="dataGrid" tabindex="0"><a href="#">2</a></li><li class="paginate_button " aria-controls="dataGrid" tabindex="0"><a href="#">3</a></li><li class="paginate_button next" aria-controls="dataGrid" tabindex="0" id="dataGrid_next"><a href="#">Next</a></li></ul></div></div></div></div> -->

	<!--  </div>
</div> -->



</div>