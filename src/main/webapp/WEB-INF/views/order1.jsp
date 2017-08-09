<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/orders/clientlist" var="readClient" />
<c:url value="/clients/clientUpdate" var="updateUrl" />
<c:url value="/clients/clientDestroy" var="destroyUrl" />

<demo:header />
<form:form action="/orders/orderCreate" method="post">
		<kendo:toolBar name="toolbar">
			<kendo:toolBar-items>
				<kendo:toolBar-item type="button" text="Save"></kendo:toolBar-item>
				<kendo:toolBar-item type="button" text="Cancel"></kendo:toolBar-item>
			</kendo:toolBar-items>
		</kendo:toolBar>
<kendo:splitter name="vertical" orientation="vertical">
    <kendo:splitter-panes>
		<kendo:splitter-pane id="middle_pane bottom_pane"  resizable="false" >
            <kendo:splitter-pane-content>
                <kendo:splitter name="horizontal" style="height: 100%; width: 100%;">
				    <kendo:splitter-panes>
				        <kendo:splitter-pane id="left-pane" collapsible="false" resizable="false" size="200px" >
				            <kendo:splitter-pane-content>
				                <div class="pane-content">
								      <fieldset class="k-block">
								        Number Order:<input type="textbox" name="number" id="number" class="k-textbox customClass"/>
								        <%
								        String template = "<span class=\"k-state-default\"><h3>#: data.contactName #</h3></span>";
								
								        String valueTemplate = "<span class=\"selected-value\">#:data.contactName#</span>";
								        %>
							            <h4>Customers</h4>
							            <kendo:dropDownList name="clientList" dataTextField="contactName" 
							            					dataValueField="id" filter="contains"
        													minLength="3" style="width:100%">
							                <kendo:dataSource>
							                    <kendo:dataSource-transport>
							                       <kendo:dataSource-transport-read url="${readClient}" type="POST" contentType="application/json"/>
							                    </kendo:dataSource-transport>
							                </kendo:dataSource>
							            </kendo:dropDownList>
								        Date Order:<kendo:datePicker name="datepicker" weekNumber="true" value="${date}" style="width:100%"></kendo:datePicker>
								        Name Receiver:<input type="textbox" name="nameReceiver" id="nameReceiver" class="k-textbox customClass"/>
								      	ID Receiver:<input type="textbox" name="ciReceiver" id="ciReceiver" class="k-textbox customClass"/>
								      	Price:<input type="textbox" name="price" id="price" class="k-textbox customClass"/>
								      </fieldset>
								    
                                </div>
				            </kendo:splitter-pane-content>
				        </kendo:splitter-pane>
				        <kendo:splitter-pane id="center-pane" collapsible="false">
				            <kendo:splitter-pane-content>
				                <div class="pane-content" style="position: center;">
					                <table id="dataTable" style="width:75%;" border="1">
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
											<td><input type="text" name="description"/></td>
											<td><input type="text" name="weight"/></td>
											<td>
												<select name="type">
													<option value="paq">Paquete</option>
													<option value="sob">Sobre</option>
													<option value="bu">Bulto</option>
												</select>
											</td>
											<td>
												<input type="button" value="Delete Row" onclick="deleteRow(this)" />
											</td>
										</tr>
										</tbody>
										<tfooter><tr><td colspan="4"><input type="button" value="Add Row" onclick="addRow('dataTable')" /></td></tr></tfooter> 
									</table>
                                </div>
				            </kendo:splitter-pane-content>
				        </kendo:splitter-pane>
				    </kendo:splitter-panes>
				</kendo:splitter>
            </kendo:splitter-pane-content>
        </kendo:splitter-pane>
	</kendo:splitter-panes>
</kendo:splitter>
</form:form>
<demo:footer />