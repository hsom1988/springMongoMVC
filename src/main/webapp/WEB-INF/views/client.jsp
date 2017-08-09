<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="demo" tagdir="/WEB-INF/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/clients/clientCreate" var="createUrl" />
<c:url value="/clients/clientRead" var="readUrl" />
<c:url value="/clients/clientUpdate" var="updateUrl" />
<c:url value="/clients/clientDestroy" var="destroyUrl" />

<demo:header/>
				<kendo:grid name="grid" pageable="true" sortable="true" height="550px" >
			    	<kendo:grid-editable mode="popup" confirmation="Are you sure you want to remove this client?"/>
			        <kendo:grid-toolbar>
			            <kendo:grid-toolbarItem name="create"/>
			        </kendo:grid-toolbar>
			        <kendo:grid-columns>
			            <kendo:grid-column field="contactName" title="Contact Name"/>
			            <kendo:grid-column field="cedula" title="Cedula"/>
			            <kendo:grid-column field="cellphone_number" title="Cell Phone Num"/>
			            <kendo:grid-column field="phone_number" title="Home Phone"/>
			            <kendo:grid-column field="address" title="Address" />
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
			                    	<kendo:dataSource-schema-model-field name="id" type="string" editable="false" nullable="false"/>                    	
			                        <kendo:dataSource-schema-model-field name="contactName" type="string">
			                        	<kendo:dataSource-schema-model-field-validation required="true" />
			                        </kendo:dataSource-schema-model-field>
			                        <kendo:dataSource-schema-model-field name="cedula" type="string">
				                        <kendo:dataSource-schema-model-field-validation required="true" />
			                        </kendo:dataSource-schema-model-field>
			                        <kendo:dataSource-schema-model-field name="cellphone_number" type="string" />
			                        <kendo:dataSource-schema-model-field name="phone_number" type="string" />
			                        <kendo:dataSource-schema-model-field name="address" type="string" >
			                        	<kendo:dataSource-schema-model-field-validation required="true" min="0"/>
			                        </kendo:dataSource-schema-model-field>
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
