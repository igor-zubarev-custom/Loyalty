<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/dynamusic/LoyaltyNumberFormhandler"/>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  UPDATE PROFILE
  
  Allows updating of an existing user profile
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Edit Profile</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Update Profile"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
            <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->

          <dsp:form action="updateProfile.jsp" method="post" formid="1">
          
            <!-- Default form error handling support -->
            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
              <dsp:oparam name="output">
                <b><dsp:valueof param="message"/></b><br>
              </dsp:oparam>
              <dsp:oparam name="outputStart">
                <LI>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </LI>
              </dsp:oparam>
            </dsp:droplet>

            <h3>Login:   
            <dsp:valueof bean="ProfileFormHandler.value.login"/>
            </h3>

            First name:<br>
            <dsp:input bean="ProfileFormHandler.value.firstName" name="firstName" size="24" type="text"/><br>
          
            Last name:<br>
            <dsp:input bean="ProfileFormHandler.value.lastName" name="lastName" size="24" type="text"/><br>
            <br>
            State:<br>
            <dsp:input bean="ProfileFormHandler.value.homeAddress.state" name="state" size="2" type="text"/><br>
            <br>

            Your favorite genres:<br>
            <dsp:input bean="ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="pop"/>Pop<br>
            <dsp:input bean="ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="jazz"/>Jazz<br>
            <dsp:input bean="ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="classical"/>Classical<br>
            <dsp:input bean="ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="blues"/>Blues<br>
            <dsp:input bean="ProfileFormHandler.value.prefGenres" name="prefGenres" type="checkbox" value="country"/>Country<br>
            <br>
            Make your profile viewable by others?<br>
            <dsp:input bean="ProfileFormHandler.value.shareProfile" name="shareProfile" type="radio" value="true"/>yes<br>
            <dsp:input bean="ProfileFormHandler.value.shareProfile" name="shareProfile" type="radio" value="false"/>no<br>
            <br>
            Personal info:<br>
            <dsp:textarea bean="ProfileFormHandler.value.info" name="info" rows="5" cols="40"/><br>
            <br>
          
            <!-- defines the URL to go to on success (relative to 'action')-->
            <dsp:input bean="ProfileFormHandler.updateSuccessURL" type="hidden" value="home.jsp"/>
            <dsp:input bean="ProfileFormHandler.update" type="Submit" value="Update"/>
            <dsp:input bean="ProfileFormHandler.cancelURL" type="hidden" value="home.jsp"/>
            <dsp:input bean="ProfileFormHandler.cancel" type="Submit" value="Cancel"/>
          
          </dsp:form><br>
          <br>
          
          Total loyalty points: <dsp:valueof bean="ProfileFormHandler.value.loyaltyAmount"/><br>
          <br>
          
          How many transactions display?:
          <dsp:form action="updateProfile.jsp" method="post" formid="2">
          	<dsp:input type="number" bean="LoyaltyNumberFormhandler.number"/>
          	<dsp:input type="submit" bean="/dynamusic/LoyaltyNumberFormHandler.Set" value="Set"/>
          </dsp:form>
          
          
          <dsp:droplet name="/atg/dynamo/droplet/Range">
          	<dsp:param name="array" bean="ProfileFormHandler.value.loyaltyTransactions"/>          	
          	<dsp:param name="howMany" bean="/dynamusic/LoyaltyNumberFormhandler.number"/>
          	<dsp:param name="sortProperties" value="-date"/>
          	<dsp:oparam name="outputStart">
          		Last added loyalty transactions:<br>
          		<table border="2">
          			<tr>
          				<th>Loyalty points</th><th>Date</th><th>Description</th>
          			</tr>          		
          	</dsp:oparam>  
          	<dsp:oparam name="output">
          		<tr>
          			<td><dsp:valueof param="element.amount"/></td><td><dsp:valueof param="element.date"/></td><td><dsp:valueof param="element.description"/></td>
          		</tr>          		
          	</dsp:oparam>  
          	<dsp:oparam name="outputEnd">
          		</table>
          	</dsp:oparam> 
          </dsp:droplet>                   
          
                        
          <!-- *** End real content *** -->
          
          </font>
        </td>         
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>
