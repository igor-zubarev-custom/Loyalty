<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  Sidebar
  
  Page fragment displaying the sidebar, common to all pages.
  
  ------------------------------------------------------------->
  <%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
    <b>
      <a href="home.jsp">Home</a><br>
      &nbsp;<br>
      <a href="artists.jsp">Artists</a> <br>
      <a href="venues.jsp">Venues</a> <br>
      <a href="search.jsp">Search</a> <br>      
      <a href="search.jsp">Search</a> <br>      
      &nbsp;<br>
      <dsp:droplet name="/atg/dynamo/droplet/Switch">
      	<dsp:param name="value" bean="/atg/userprofiling/Profile.transient"/>
      	<dsp:oparam name="true">
      		<a href="login.jsp">Login</a> <br>
      	</dsp:oparam>
      	<dsp:oparam name="false">
      		<a href="updateProfile.jsp">Profile</a> <br>
      		<a href="logout.jsp">Log Out</a> <br>
      		<a href="playlists.jsp">Playlists</a> <br>
      	</dsp:oparam>
      </dsp:droplet>
      &nbsp;<br>
      <dsp:droplet name="/atg/dynamo/droplet/HasEffectivePrincipal">
        <dsp:param name="type" value="role"/>
        <dsp:param name="id" value="loyaltyAdministrator"/>
        <dsp:oparam name="output">
      		<a href="loyaltyManaging.jsp">Manage Loyalty</a> <br>
      	</dsp:oparam>
      </dsp:droplet>
    </b>
  </font>
</dsp:page> 

