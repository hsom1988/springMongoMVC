<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Delivery Orders</title>
		<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/web/kendo.default.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/web/kendo.default.mobile.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/dataviz/kendo.dataviz.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/css/dataviz/kendo.dataviz.default.min.css'/>" rel="stylesheet" />
		<link href="<c:url value='/resources/shared/styles/examples-offline.css'/>" rel="stylesheet">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>
		<script src="<c:url value='/resources/js/kendo.web.min.js'/>"></script>
		<script src="<c:url value='/resources/js/kendo.timezones.min.js' />"></script>
		
		<style>
			.offline-button {
			    display: inline-block;
			    margin: 0px;
			    padding: 9px 23px;
			    background-color: #015991;
			    border-radius: 2px;
			    color: #fff;
			    text-decoration: none;
			    font-size: 13px;
			    font-weight: 700;
			    line-height: 1.2;
			    transition-duration: 0.2s;
			    transition-property: background-color;
			    transition-timing-function: ease;
			}
			table {
			    font-family: arial, sans-serif;
			    border-collapse: collapse;
			    width: 75%;
			    margin: 0 auto;
			    margin-top:25px;
			}
			table td > input[type='text']
			{
				width: 100%;
				border: 0px;
				display: block;   
			}
			td, th {
			    border: 1px solid #dddddd;
			    padding: 5px;
			}
		</style>
		<script>
		function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount-1);

			var colCount = table.rows[0].cells.length;

			for(var i=0; i<colCount; i++) {

				var newcell	= row.insertCell(i);

				newcell.innerHTML = table.rows[1].cells[i].innerHTML;
				//alert(newcell.childNodes);
				switch(newcell.childNodes[0].type) {
					case "text":
							newcell.childNodes[0].value = "";
							break;
					case "checkbox":
							newcell.childNodes[0].checked = false;
							break;
					case "select-one":
							newcell.childNodes[0].selectedIndex = 0;
							break;
				}
			}
		}
		function deleteRow(row) {
			try {
				var i = row.parentNode.parentNode.rowIndex;
			    var table = document.getElementById("dataTable");
			    if (table.rows.length > 3){
			    	table.deleteRow(i);
			    }
			}catch(e) {
				alert(e);
			}
		}
		
		  $( function() {
		    $( "#datepicker" ).datepicker();
		  } );
</script>
		
		
    </head>
    <body>
    	<div class="page">
    		<a class="offline-button" href="<c:url value='/' />">Back to all examples</a>
    		<div id="example" class="k-content">
    		
    		

