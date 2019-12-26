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
					<strong>Basic Form</strong> Elements
				</h2>
			</div>
	<div class="panel-body">
		<form class="form-horizontal " enctype="multipart/form-data" method="post" action="">
			<div class="col-lg-6 col-md-6 col-sm-6 ">
				<div class="form-group">
					<label class="col-md-3 control-label">Date <span class="mendatory">*</span></label>
 					<div class="col-md-9">
					<div class="input-group">
						<input type="text" class="form-control date"> 
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i></span>
					</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">Static <span class="mendatory">*</span></label>
						<div class="col-md-9">
    						<p class="form-control-static">Username</p>
						</div>
				</div>
				<div class="form-group has-error">
					<label for="text-input1" class="col-md-3 control-label">Text Input 
						<span class="mendatory">*</span>
					</label>
					<div class="col-md-9">
						<input type="text" data-placement="left" data-toggle="tooltip"
							title="" rel="txtTooltip" placeholder="Text"
							class="form-control" name="text-input" id="text-input1"
							data-original-title="**Your Title**"> 
							<span class="label label-danger">Error text</span>
					</div>
				</div>
				<div class="form-group has-success">
					<label for="email-input1" class="col-md-3 control-label">Email Input 
						<span class="mendatory">*</span>
					</label>
					<div class="col-md-9">
						<input type="email" placeholder="Enter Email"
							class="form-control" name="email-input" id="email-input1">
							<span class="label label-success">Success text</span>
					</div>
				   </div>
					<div class="form-group has-warning">
						<label for="password-input1" class="col-md-3 control-label">Password
							<span class="mendatory">*</span>
						</label>
							<div class="col-md-9">
								<input type="password" placeholder="Password"
									class="form-control" name="password-input"
									id="password-input1"> <span
									class="label label-warning">Warning text</span>
							</div>
						</div>
						<div class="form-group">
							<label for="disabled-input1" class="col-md-3 control-label">Disabled Input <span class="mendatory">*</span>
							</label>
							<div class="col-md-9">
								<input type="text" disabled="" placeholder="Disabled"
									class="form-control" name="disabled-input"
									id="disabled-input1">
							</div>
						</div>
						<div class="form-group">
							<label for="textarea-input1" class="col-md-3 control-label">Textarea
								<span class="mendatory">*</span>
							</label>
							<div class="col-md-9">
								<textarea placeholder="Content.." class="form-control" rows="9"
									name="textarea-input" id="textarea-input1"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="select1" class="col-md-3 control-label">Select
								<span class="mendatory">*</span>
							</label>
							<div class="col-md-9">
								<select size="1" name="select" id="select1"
									style="display: none;">
								<option value="0">Please select</option>
								<option value="1">Option #1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="select1" class="col-md-3 control-label">Disabled
							Select <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<select disabled="" id="disabledSelect1" style="display: none;">
								<option value="0">Please select</option>
								<option value="1">Option #1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="multiple-select1" class="col-md-3 control-label">Multiple
							select <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<select multiple="" size="5" name="multiple-select"
									id="multiple-select1" style="display: none;">
								<option value="1">Option #1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
								<option value="4">Option #4</option>
								<option value="5">Option #5</option>
								<option value="6">Option #6</option>
								<option value="7">Option #7</option>
								<option value="8">Option #8</option>
								<option value="9">Option #9</option>
								<option value="10">Option #10</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Radios <span
							class="mendatory">*</span></label>
						<div class="col-md-9">
							<div class="radio">
								<label for="radio11"> <input type="radio"
									value="option1" name="radios" id="radio11"> Option 1
								</label>
							</div>
							<div class="radio">
								<label for="radio21"> <input type="radio"
									value="option2" name="radios" id="radio21"> Option 2
								</label>
							</div>
							<div class="radio">
								<label for="radio31"> <input type="radio"
									value="option3" name="radios" id="radio31"> Option 3
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Inline Radios</label>
						<div class="col-md-9">
							<label for="inline-radio11" class="radio-inline"> <input
								type="radio" value="option1" name="inline-radios"
								id="inline-radio11"> One
							</label> <label for="inline-radio21" class="radio-inline"> <input
								type="radio" value="option2" name="inline-radios"
								id="inline-radio21"> Two
							</label> <label for="inline-radio31" class="radio-inline"> <input
								type="radio" value="option3" name="inline-radios"
								id="inline-radio31"> Three
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Checkboxes</label>
						<div class="col-md-9">
							<div class="checkbox">
								<label for="checkbox11"> <input type="checkbox"
									value="option1" name="checkbox1" id="checkbox11">
									Option 1
								</label>
							</div>
							<div class="checkbox">
								<label for="checkbox21"> <input type="checkbox"
									value="option2" name="checkbox2" id="checkbox21">
									Option 2
								</label>
							</div>
							<div class="checkbox">
								<label for="checkbox31"> <input type="checkbox"
									value="option3" name="checkbox3" id="checkbox31">
									Option 3
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Inline Checkboxes</label>
						<div class="col-md-9">
							<label for="inline-checkbox11" class="checkbox-inline">
								<input type="checkbox" value="option1" name="inline-checkbox1"
								id="inline-checkbox11"> One
							</label> <label for="inline-checkbox21" class="checkbox-inline">
								<input type="checkbox" value="option2" name="inline-checkbox2"
								id="inline-checkbox21"> Two
							</label> <label for="inline-checkbox31" class="checkbox-inline">
								<input type="checkbox" value="option3" name="inline-checkbox3"
								id="inline-checkbox31"> Three
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="file-input1">File
							input</label>
						<div class="col-md-9">
							<input type="file" id="file-input1" name="file-input">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="file-multiple-input1">Multiple
							File input <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<input type="file" id="file-multiple-input1"
								name="file-multiple-input" multiple="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="form-group">


						<div class="label label-success">Success Message</div>

						<div class="label label-warning">Warning Message</div>
						<div class="label label-danger">Error Message</div>

						<label class="col-md-3 control-label">Static <span
							class="mendatory">*</span></label>
						<div class="col-md-9">
							<p class="form-control-static">Username</p>
						</div>
					</div>
					<div class="form-group">
						<label for="text-input" class="col-md-3 control-label">Text
							Input <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<input type="text" placeholder="Text" class="form-control"
								name="text-input" id="text-input"> <span
								class="label label-danger">Error text</span>
						</div>
					</div>
					<div class="form-group">
						<label for="email-input" class="col-md-3 control-label">Email
							Input <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<input type="email" placeholder="Enter Email"
								class="form-control" name="email-input" id="email-input">
							<span class="label label-success">Success text</span>
						</div>
					</div>
					<div class="form-group">
						<label for="password-input" class="col-md-3 control-label">Password
							<span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<input type="password" placeholder="Password"
								class="form-control" name="password-input" id="password-input">
							<span class="label label-warning">Warning text</span>
						</div>
					</div>
					<div class="form-group">
						<label for="disabled-input" class="col-md-3 control-label">Disabled
							Input <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<input type="text" disabled="" placeholder="Disabled"
								class="form-control" name="disabled-input" id="disabled-input">
						</div>
					</div>
					<div class="form-group">
						<label for="textarea-input" class="col-md-3 control-label">Textarea
							<span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<textarea placeholder="Content.." class="form-control" rows="9"
								name="textarea-input" id="textarea-input1"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="select" class="col-md-3 control-label">Select<span class="mendatory">*</span></label>
						<div class="col-md-9">
							<select size="1" name="select" id="select">
								<option value="0">Please select</option>
								<option value="1">Option #1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="select" class="col-md-3 control-label">Disabled
							Select <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<select disabled="" id="disabledSelect" style="display: none;">
								<option value="0">Please select</option>
								<option value="1">Option #1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="multiple-select" class="col-md-3 control-label">Multiple
							select <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<select multiple="" size="5" name="multiple-select"
								id="multiple-select" style="display: none;">
								<option value="1">Option #1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
								<option value="4">Option #4</option>
								<option value="5">Option #5</option>
								<option value="6">Option #6</option>
								<option value="7">Option #7</option>
								<option value="8">Option #8</option>
								<option value="9">Option #9</option>
								<option value="10">Option #10</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Radios</label>
						<div class="col-md-9">
							<div class="radio">
								<label for="radio1"> <input type="radio"
									value="option1" name="radios" id="radio1"> Option 1
								</label>
							</div>
							<div class="radio">
								<label for="radio2"> <input type="radio"
									value="option2" name="radios" id="radio2"> Option 2
								</label>
							</div>
							<div class="radio">
								<label for="radio3"> <input type="radio"
									value="option3" name="radios" id="radio3"> Option 3
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Inline Radios</label>
						<div class="col-md-9">
							<label for="inline-radio1" class="radio-inline"> <input
								type="radio" value="option1" name="inline-radios"
								id="inline-radio1"> One
							</label> <label for="inline-radio2" class="radio-inline"> <input
								type="radio" value="option2" name="inline-radios"
								id="inline-radio2"> Two
							</label> <label for="inline-radio3" class="radio-inline"> <input
								type="radio" value="option3" name="inline-radios"
								id="inline-radio3"> Three
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Checkboxes</label>
						<div class="col-md-9">
							<div class="checkbox">
								<label for="checkbox1"> <input type="checkbox"
									value="option1" name="checkbox1" id="checkbox1">
									Option 1
								</label>
							</div>
							<div class="checkbox">
								<label for="checkbox2"> <input type="checkbox"
									value="option2" name="checkbox2" id="checkbox2">
									Option 2
								</label>
							</div>
							<div class="checkbox">
								<label for="checkbox3"> <input type="checkbox"
									value="option3" name="checkbox3" id="checkbox3">
									Option 3
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Inline Checkboxes</label>
						<div class="col-md-9">
							<label for="inline-checkbox1" class="checkbox-inline">
								<input type="checkbox" value="option1" name="inline-checkbox1"
								id="inline-checkbox1"> One
							</label> <label for="inline-checkbox2" class="checkbox-inline">
								<input type="checkbox" value="option2" name="inline-checkbox2"
								id="inline-checkbox2"> Two
							</label> <label for="inline-checkbox3" class="checkbox-inline">
								<input type="checkbox" value="option3" name="inline-checkbox3"
								id="inline-checkbox3"> Three
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="file-input">File
							input <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<input type="file" id="file-input" name="file-input">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label" for="file-multiple-input">Multiple
							File input <span class="mendatory">*</span>
						</label>
						<div class="col-md-9">
							<input type="file" id="file-multiple-input"
								name="file-multiple-input" multiple="">
						</div>
					</div>
				</div>

			</form>
		</div>
		<div class="panel-footer text-center">
			<button class="btn  btn-primary" type="submit">
				<i class="fa fa-thumbs-up"></i> Approve
			</button>
			<button class="btn  btn-primary" type="submit">
				<i class="fa fa-thumbs-down"></i> Reject
			</button>
			<button class="btn  btn-primary" type="submit">
				<i class="fa fa-check-circle"></i> Enable
			</button>
			<button class="btn  btn-primary" type="submit">
				<i class="fa fa-ban"></i> Disable
			</button>
			<button class="btn  btn-primary" type="submit">
				<i class="fa fa-check"></i> Acknowledge
			</button>

			<button class="btn  btn-primary" type="submit">
				<i class="fa fa-save"></i> Save
			</button>
			<button class="btn  btn-default" type="reset">
				<i class="fa fa-ban"></i> Cancel
			</button>


			<button class="btn  btn-default pull-left" type="reset">
				<i class="fa fa-chevron-left"></i> Back
			</button>
			<button class="btn  btn-default pull-right" type="reset">
				Next <i class="fa fa-chevron-right"></i>
			</button>
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
	<!-- <div class="row"><div class="col-xs-6"><div class="dataTables_info" id="dataGrid_info" role="status" aria-live="polite">Showing 1 to 10 of 25 entries</div></div><div class="col-xs-6"><div class="dataTables_paginate paging_simple_numbers" id="dataGrid_paginate"><ul class="pagination"><li class="paginate_button previous disabled" aria-controls="dataGrid" tabindex="0" id="dataGrid_previous"><a href="#">Previous</a></li><li class="paginate_button active" aria-controls="dataGrid" tabindex="0"><a href="#">1</a></li><li class="paginate_button " aria-controls="dataGrid" tabindex="0"><a href="#">2</a></li><li class="paginate_button " aria-controls="dataGrid" tabindex="0"><a href="#">3</a></li><li class="paginate_button next" aria-controls="dataGrid" tabindex="0" id="dataGrid_next"><a href="#">Next</a></li></ul></div></div></div></div> -->

	<!--  </div>
</div> -->



</div>