
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<c:url value="/orders/clientlist" var="readClient" />
<c:url value="/clients/clientUpdate" var="updateUrl" />
<c:url value="/clients/clientDestroy" var="destroyUrl" />

<script type="text/javascript">
function doAjaxPost() {
	// get the form values
	var table = document.getElementById("dataTable");
    var type_combo = document.getElementById("type").options;
    var y;
    var packages  = []
    for(i = 1; i < table.rows.length-1; i++){
        var package1 = {}
        for(j = 0; j < table.rows[0].cells.length; j++){
            y = table.rows[i].cells;
            if (y[j].children[0].value != ''){
                if(j==0){
                    package1['description'] = y[j].children[0].value;
                } else if (j==1){
                    package1['weight'] = y[j].children[0].value;
                } else if (j==2){
                    package1['type'] = type_combo[type_combo.selectedIndex].text;
                }
            }
        }
        if(Object.keys(package1).length !== 0){
            packages.push(package1);
        }
    }
    
	var options = {'number': $('#number').val(),
	               'client_id': $('#client_id').val(),
                   'nameReceiver': $('#nameReceiver').val(),
                   'ciReceiver': $('#ciReceiver').val(),
                   'destiny': $('#destiny').val(),
                   'price': $('#price').val(),
                   'date': $('#date').val(),
                   'packages': packages,
    
	};
    
	$.ajax({
	    type: "POST",
	    url: "orderCreate",
	    data: JSON.stringify(options),
        dataType: 'json', 
        contentType: 'application/json',
        mimeType: 'application/json',
        
	    success: function(response){
	        // we have the response
	        if(response.status == "Por entregar"){
                window.location.href = "orderRead";
	        }else{
	            alert("Sorry, there is some thing wrong with the data provided.");
	        }
	    },
	    error: function(e){
	        alert('Error: ' + e);
	    }
	});
}
function onSelect(e) {
        var dataItem = this.dataItem(e.item);
        kendoConsole.log("event :: select (" + dataItem.text + " : " + dataItem.value + ")" );
    }

</script>


<demo:header />
<table>
	<tr>
		<td colspan="2"><input type="button" onclick="doAjaxPost()"
			id="submitButton" value="Register"></td>
	</tr>
	<tr>
		<td>Number Order :</td>
		<td><input type="text" id="number" /></td>
	</tr>
	<tr>
		<td>Date :</td>
		<td><input type="text" id="date" data-role="date"
			data-inline="true" /></td>
	</tr>
	<tr>
		<td>Client :</td>
		<td><input id="client_id" />
			<script>
				function dropdownlist_select(e) {
				  var item = e.item;
				  var text = item.text();
				  // Use the selected item or its text
				}
                jQuery("#client_id").kendoDropDownList({
                    "dataSource": {
                        "transport": {
                            "read": {
                                "contentType": "application/json",
                                "type": "POST",
                                "url": "/mvcTest/orders/clientlist"
                            }
                        }
                    },
                    "minLength": 3.0,
                    "value": "id",
                    "dataTextField": "contactName",
                    "filter": "contains"
                });
                var dropdownlist = $("#client_id").data("kendoDropDownList");
                dropdownlist.bind("select", dropdownlist_select);
			</script>		
		</td>
	</tr>
	<tr>
		<td>Receiver :</td>
		<td><input type="text" id="nameReceiver" /></td>
	</tr>
	<tr>
		<td>ID Receiver :</td>
		<td><input type="text" id="ciReceiver" /></td>
	</tr>

	<tr>
		<td>Destiny :</td>
		<td><input type="text" id="destiny" /></td>
	</tr>
	<tr>
		<td>Price :</td>
		<td><input type="text" id="price" /></td>
	</tr>
</table>

<div class="pane-content" style="position: center;">
	<table id="dataTable" style="width: 75%;" border="1">
		<thead>
			<tr>
				<th>Description</th>
				<th>Weight</th>
				<th>Type</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="description" /></td>
				<td><input type="text" name="weight" /></td>
				<td><select id="type" name="type">
						<option value="paq">Paquete</option>
						<option value="sob">Sobre</option>
						<option value="bu">Bulto</option>
				</select></td>
				<td><input type="button" value="Delete Row"
					onclick="deleteRow(this)" /></td>
			</tr>
		</tbody>
		<tr>
			<td colspan="4"><input type="button" value="Add Row"
				onclick="addRow('dataTable')" /></td>
		</tr>
	</table>
</div>

<demo:footer />
