
<%
	String contextPath = request.getContextPath();
%>

<link href="<%=contextPath%>/view/css/global.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/formhelpers.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/theme.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/icons.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/app.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/select2.css" rel="stylesheet">
<link href="<%=contextPath%>/view/css/dataTables.css" rel="stylesheet">

<script type="text/javascript" src="/<%=contextPath%>/view/js/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/<%=contextPath%>/view/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/jquery.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/global.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/datepicker.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/select2.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/dataTables.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/dataTables.custom.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/file-input.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/formhelpers.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/html5shiv.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/view/js/respond.js"></script>

<footer>
	<p>&copy; Company 2014</p>
</footer>

<div class="utility">
	<button class="btn btn-default toggle-utility">
		<i class="fa fa-angle-double-left fa-lg"></i> <i
			class="fa fa-angle-double-right fa-lg" style="display: none"></i>
	</button>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Utility Title</h3>
		</div>
		<div class="panel-body">

			<div class="form-group">
				<label for="exampleInputFile">File input</label> <input type="file"
					id="exampleInputFile">
			</div>
			<div class="form-group">
				<label for="exampleInputFile">Select</label> <select>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>


			<div class="form-group">
				<label for="exampleInputFile">Comments</label>
				<textarea class="form-control"></textarea>
			</div>


		</div>
		<div class="panel-heading">
			<button class="btn btn-primary btn-sm">Button</button>
			<button class="btn btn-default btn-sm">Button</button>
		</div>
	</div>
</div>



<script>
	$(function() {
		$('.date').datepicker({
			daysOfWeekDisabled : "0,6",
			todayHighlight : true,
			autoclose : true
		});

		layout();
		$(window).resize(function() {
			layout();
		});

		$('.nav-toggle').on('click', function(e) {
			e.preventDefault();
			$("body").toggleClass('nav-off');

		});

		$('.toggle-utility').on('click', function(e) {
			$(this).parent().toggleClass('open');
		});

		$("select").select2();
		$('input[rel="txtTooltip"]').tooltip();
		$('input[type=file]').bootstrapFileInput();
		$('#dataGrid').dataTable({
			"scrollY" : 200,
			"scrollX" : true
		});

		function layout() {
			var vcontainer = $("body").height();
			var vheader = $("header").height();
			var vfooter = $("footer").height();
			var vpagetitle = $(".page-title").height();
			var vnav = $("nav").height();
			$("nav").css("top", vheader + vpagetitle + 22);
			//$("nav").height(vcontainer-vheader-vfooter-vpagetitle-10)
			$(".page-content").css("min-height",
					vcontainer - vheader - vfooter - vpagetitle);
			$("body").css("min-height", vnav + vheader + vfooter + vpagetitle)
			$(".utility .panel-body").css("max-height", vcontainer - 207)
		}

	});
</script>

<div class="modal fade" id="myModal" data-toggle="modal"
	data-target=".bs-example-modal-lg">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					&times;<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Title</h4>
			</div>
			<div class="modal-body">
				<p></p>
				<p>Modal Body</p>
				<p></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-sm">Save
					changes</button>
			</div>
		</div>
	</div>
</div>
