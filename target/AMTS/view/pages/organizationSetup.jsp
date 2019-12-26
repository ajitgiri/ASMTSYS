<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Organization Setu</title>
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
				<h2>
					<strong>Organization Setup</strong> 
				</h2>
			</div>
	<div class="panel-body">
		<form class="form-horizontal " enctype="multipart/form-data" method="post" action="">
			<div class="col-lg-6 col-md-6 col-sm-6 ">
				<div class="form-group has-error">
					<label for="text-input1" class="col-md-3 control-label">Text Input 
						<span class="mendatory">*</span>
					</label>
					<div class="col-md-9">
						<input type="text" data-placement="left" data-toggle="tooltip"
							title=""  placeholder="Text"
							class="form-control" name="text-input" id="text-input1"
							data-original-title="**Your Title**"> 
							<span class="label label-danger"></span>
					</div>
				</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="form-group">
						<button class="btn  btn-primary" type="submit">
							<i class="fa fa-save"></i> Save
						</button>
					</div>
				</div>
			</form>
		</div>
		
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
						<th>#</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
						<th>Table heading</th>
					</tr>
				</thead>
				<tbody>


					<tr>
						<td class="sorting_1">00</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>

					</tr>
			
				</tbody>
			</table>
		</div>
	</div>
</div>