<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/LoyaltyFormHandler"/>
<HTML>
  <HEAD>
    <TITLE>Loyalty Managing</TITLE>
  </HEAD>
  <BODY>

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Loyalty Managing"/>
  </dsp:include>    
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <dsp:include page="common/sidebar.jsp"></dsp:include> 
    
        </td>
        <!-- Page Body -->

        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">

          <!-- *** Start page content *** -->
          <dsp:droplet name="/atg/dynamo/droplet/HasEffectivePrincipal">
          	<dsp:param name="type" value="role"/>
          	<dsp:param name="id" value="loyaltyAdministrator"/>
          	<dsp:oparam name="output">  
          		<dsp:form action="loyaltyManaging.jsp" method="post">
          			<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
          				<dsp:oparam name="outputStart">
          					<ul>
          				</dsp:oparam>
          				<dsp:oparam name="outputEnd">
          					</ul>
          				</dsp:oparam>
          				<dsp:oparam name="output">
          					<li><dsp:valueof param="message"/>
          				</dsp:oparam>
          			</dsp:droplet><br>
          			<br>
          			  
          			Select user<br>
          			<dsp:select bean="LoyaltyFormHandler.value.profileId">
         		 		<dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
          					<dsp:param name="repository" value="/atg/userprofiling/ProfileAdapterRepository"/>
          					<dsp:param name="itemDescriptor" value="user"/>
          					<dsp:param name="queryRQL" value="ALL"/>
          					<dsp:param name="sortProperties" value="+firstName"/>
          					<dsp:oparam name="output">
          						<dsp:option paramvalue="element.id"><dsp:valueof param="element.firstName"/></dsp:option>
          					</dsp:oparam>
          				</dsp:droplet>		
          			</dsp:select><br>
          			<br>
          			    	
          			Input loyalty amount (+ or -)<br>
          			<dsp:input type="text" bean="LoyaltyFormHandler.value.amount"/><br>
          			<br>
          			
          			Input description<br>
          			<dsp:textarea bean="LoyaltyFormHandler.value.description" rows="5" cols="40"/><br>
          			<br>
          			
         				<dsp:input type="submit" bean="LoyaltyFormHandler.create" value="Create transaction"/>
         				<dsp:input type="submit" bean="LoyaltyFormHandler.cancel" value="Cancel"/>
          		</dsp:form>        		
         	</dsp:oparam>
         	<dsp:oparam name="default">
         		You don't have access to this action.
         	</dsp:oparam>
         	<dsp:oparam name="unknown">
         		<a href="login.jsp">Please login</a>
         	</dsp:oparam>
         	</dsp:droplet>

          <!-- *** End content *** -->
          
          </font>
        </td>
    </table>
  </BODY>
</HTML>
</dsp:page>