<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<c:url value="/orders/clientlist" var="readClient" />
<c:url value="/clients/clientUpdate" var="updateUrl" />
<c:url value="/clients/clientDestroy" var="destroyUrl" />

<!-- <link rel="stylesheet" type="text/css" href="http://www.prepbootstrap.com/Content/shieldui-lite/dist/css/light/all.min.css" />
<script type="text/javascript" src="http://www.prepbootstrap.com/Content/shieldui-lite/dist/js/shieldui-lite-all.min.js"></script>

<script type="text/javascript" src="http://www.prepbootstrap.com/Content/data/shortGridData.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#grid").shieldGrid({
            dataSource: {
                data: gridData,
                schema: {
                    fields: {
                        id: { path: "id", type: Number },
                        age: { path: "age", type: Number },
                        name: { path: "name", type: String },
                        company: { path: "company", type: String },
                        month: { path: "month", type: Date },
                        isActive: { path: "isActive", type: Boolean },
                        email: { path: "email", type: String },
                        transport: { path: "transport", type: String }
                    }
                }
            },
            sorting: {
                multiple: true
            },
            rowHover: false,
            columns: [
                { field: "name", title: "Person Name", width: "120px" },
                { field: "age", title: "Age", width: "80px" },
                { field: "company", title: "Company Name" },
                { field: "month", title: "Date of Birth", format: "{0:MM/dd/yyyy}", width: "120px" },
                { field: "isActive", title: "Active" },
                { field: "email", title: "Email Address", width: "250px" },
                { field: "transport", title: "Custom Editor", width: "120px", editor: myCustomEditor },
                {
                    width: "104px",
                    title: "Delete Column",
                    buttons: [
                        { cls: "deleteButton", commandName: "delete", caption: "<img src='http://www.prepbootstrap.com/Content/images/template/BootstrapEditableGrid/delete.png' /><span>Delete</span>" }
                    ]
                }
            ],
            editing: {
                enabled: true,
                event: "click",
                type: "cell",
                confirmation: {
                    "delete": {
                        enabled: true,
                        template: function (item) {
                            return "Delete row with ID = " + item.id
                        }
                    }
                }
            },
            events:
            {
                getCustomEditorValue: function (e) {
                    e.value = $("#dropdown").swidget().value();
                    $("#dropdown").swidget().destroy();
                }
            }
        });

        function myCustomEditor(cell, item) {
            $('<div id="dropdown"/>')
                .appendTo(cell)
                .shieldDropDown({
                    dataSource: {
                        data: ["motorbike", "car", "truck"]
                    },
                    value: !item["transport"] ? null : item["transport"].toString()
                }).swidget().focus();
        }
    });
</script>

<style type="text/css">
    .sui-button-cell
    {
        text-align: center;
    }

    .sui-checkbox
    {
        font-size: 17px !important;
        padding-bottom: 4px !important;
    }

    .deleteButton img
    {
        margin-right: 3px;
        vertical-align: bottom;
    }

    .bigicon
    {
        color: #5CB85C;
        font-size: 20px;
    }
</style> -->


<demo:header />
<form:form action="orders/orderCreate" method="post" >
	<!-- <div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="text-center">Bootstrap Editable jQuery Grid <span class="fa fa-edit pull-right bigicon"></span></h4>
        </div>
        <div class="panel-body text-center">
            <div id="grid"></div>
        </div>
    </div>
</div> -->
	<table>
		<tr>
			<td>Number Order:</td>
			<td><form:input path="number" /></td>
		</tr>
		<tr>
			<td>Receiver :</td>
			<td><form:input path="nameReceiver" /></td>
		</tr>
		<tr>
			<td>ID Receiver :</td>
			<td><form:input path="ciReceiver"/></td>
		</tr>
		
		<tr>
			<td>Destiny</td>
			<td><form:input path="destiny" /></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><form:input path="price"/></td>
		</tr>
		<tr>
			<td>Date</td>
			<td><form:input path="date" id="datepicker" data-role="date" data-inline="true"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" id="submitButton" value="Register"></td>
		</tr>
	</table>

       
                               
</form:form>
<script type="text/javascript">
$(document).ready(function(){
    $("#submitButton").click(function(e){
         var formData = getFormData();
         $.ajax({
            type: 'POST', 
            'url': 'http://localhost:8080/Test_ReportingUI/addDb.htm',
            data: {jsonData: JSON.stringify(formData)},
            dataType: 'json',
            success: function(response){ 
                try{
                    var strResponse=jQuery.parseJSON(response);
                }catch(err){}
                if(response.status=='ok')
                {
                    alert("details added");
                }
                else
                {
                    alert("error happened");
                }

            },
            timeout: 10000,
            error: function(xhr, status, err){ 
                if(status=='timeout')
                {   
                    alert('Request time has been out','');
                }
                console.log(status,err); 
            }
        }); 
     });
});
</script>
<demo:footer />