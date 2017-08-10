<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/orders/orderCreate" var="createUrl" />
<c:url value="/orders/orderUpdate" var="updateUrl" />
<c:url value="/orders/orderDestroy" var="destroyUrl" />
<script>
							    function handle_click(e) {
							    	window.location.href = "order";
							    }
								</script>
<demo:header/>
				<kendo:toolBar name="createButtons">
					<kendo:toolBar-items>
						<kendo:toolBar-item type="button" text="Create" click="handle_click"/>
								
					</kendo:toolBar-items>
				</kendo:toolBar>
				<kendo:grid name="grid" pageable="true" sortable="true" height="550px" >
			    	<kendo:grid-editable mode="popup" confirmation="Are you sure you want to remove this client?"/>
						
			        <kendo:grid-columns>
			            <kendo:grid-column field="number" title="Order Number"/>
			            <kendo:grid-column field="nameReceiver" title="Name Receiver"/>
			            <kendo:grid-column field="destiny" title="Destination"/>
			            <kendo:grid-column field="status" title="Status"/>
			            <kendo:grid-column title="&nbsp;" width="250px" >
			            	<kendo:grid-column-command>
			            		<kendo:grid-column-commandItem name="edit" />
			            		<kendo:grid-column-commandItem name="destroy" />
			            	</kendo:grid-column-command>
			            </kendo:grid-column>
			        </kendo:grid-columns>
			        <kendo:dataSource pageSize="20">
			            <kendo:dataSource-transport>
			                <kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json" />
			                <kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/>
			                <kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json" />
			                <kendo:dataSource-transport-destroy url="${destroyUrl}" dataType="json" type="POST" contentType="application/json" />
			                <kendo:dataSource-transport-parameterMap>
			                	<script>
				                	function parameterMap(options,type) { 	                		
				                		return JSON.stringify(options);	                		
				                	}
			                	</script>
			                </kendo:dataSource-transport-parameterMap>
			            </kendo:dataSource-transport>
			            <kendo:dataSource-schema>
			                <kendo:dataSource-schema-model id="id">
			                    <kendo:dataSource-schema-model-fields>
			                        <kendo:dataSource-schema-model-field name="number" type="string"/>
			                        <kendo:dataSource-schema-model-field name="nameReceiver" type="string" />
			                        <kendo:dataSource-schema-model-field name="destiny" type="string" />
			                        <kendo:dataSource-schema-model-field name="status" type="string" />
			                    </kendo:dataSource-schema-model-fields>
			                </kendo:dataSource-schema-model>
						</kendo:dataSource-schema>
			        </kendo:dataSource>
			    </kendo:grid> 
			    
			    <script>   
			            //register custom validation rules
			            /* (function ($, kendo) {
			                $.extend(true, kendo.ui.validator, {
			                     rules: { // custom rules
			                         productnamevalidation: function (input, params) {
			                             //check for the name attribute 
			                             //if (input.filter("[name='productName']").length && input.val()) {
			                                 return /^[A-Z]/.test(input.val());
			                             }
			                             return true;
			                         }
			                     },
			                     messages: { //custom rules messages
			                         productnamevalidation: "Product Name should start with capital letter"
			                     }
			                });
			            })(jQuery, kendo); */
			    </script>
<demo:footer />
