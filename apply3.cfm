﻿<cftry>
<cfparam default="" name="url.email">	
<cfparam default="#urldecode(url.email)#" name="form.email" />

<cfparam default="0" name="form.noofvisits">

<cfset title="Registered For Newsletters and Cash Back" />
<CFINCLUDE TEMPLATE="/header#session.country#.cfm">  
<div id="container2" style="margin-top:30px">
<table   cellspacing="0" cellpadding="0" border="0" >
  <tr  align="center">
    <!---<td valign="top"  align="center" style="width:147px;" ><!--- BEGIN LEFT SIDE STUFF --->
      <CFINCLUDE TEMPLATE="leftmenus.cfm">
      <!--- END LEFT SIDE STUFF --->
    </td>--->
    <td align="center" valign="top" style="padding:2px;"><div align="center">

<cfset form.email = trim(form.email)>
<CFQUERY DATASOURCE="gemssql" NAME="login">
    SELECT 
    phonenumber,nlstatus
    FROM memberinfo WHERE email='#form.email#' 
    </CFQUERY>

<CFQUERY  DATASOURCE="gemssql" NAME="login2">
    SELECT email 
    FROM bulkbuyers WHERE email='#form.email#' 
    </CFQUERY>

<!--- Account already exists --->
<CFIF login.recordcount  or login2.recordcount >
<div class="error">  
            <p>
                An account already exists in the system for (<cfoutput>#form.email#</cfoutput>). Either 
                you have already signed up with us or you need to check the email address. 
        </p>
      <a href="apply.cfm"  >Click here to try again</a>  
  </div>
  <!--- New account --->
  <CFELSE> 
                      <cfset country_name= "na" />
				<cfif isdefined("form.country") >
  						<cfinvoke component="countryresolver" method="get_country_name" returnvariable="country_name" >
  							<cfinvokeargument name="code" value="#form.country#">
  						</cfinvoke>  
				  </cfif>
				  <cfset form.country = lcase(country_name) />
				<cfif form.country is "india" and session.country is "india">
				    <cfset initial_credit = 200/value_convert(1) />
				<cfelse>
				    <cfset initial_credit = 10 />
				
				</cfif>
<!--- got an error when trying to sign up people when got input from paypal. Seems form.zip was missing in our invocation page --->
<cfparam name="form.zip" default="paypal miss" />
<cfparam name="form.phonenumber" default="paypal miss" />
<cfset signedup  = "false">
<cftry>

	<cfinvoke component="invitationandcredit" method="SIGNUP" returnvariable="signedup" >
  			<CFINVOKEARGUMENT VALUE="#FORM.ZIP#" name="buyer_zip"   />
			<CFINVOKEARGUMENT VALUE="#FORM.phonenumber#" name="phonenumber"   />
			<CFINVOKEARGUMENT  Value="#FORM.address1#" name="buyer_street_address"   />
			<CFINVOKEARGUMENT  Value="#FORM.address2#" name="buyer_street_address2"   />
			<CFINVOKEARGUMENT  value="#form.city#" name="buyer_city"   />
			<CFINVOKEARGUMENT  value="#form.state#" name="buyer_state"   />
			<CFINVOKEARGUMENT  value="#form.country#" name="buyer_country"    />
			<CFINVOKEARGUMENT value="#form.email#" name="buyer_email"    />
			<CFINVOKEARGUMENT value="#form.firstname#" name="buyer_first_name"  />
			<CFINVOKEARGUMENT value="#form.lastname#" name="buyer_last_name"    />
                <CFINVOKEARGUMENT value="#initial_credit#" name="initial_credit"    />
	</cfinvoke>
<cfcatch type="any">
</cfcatch>
</cftry>
<cfif signedup>
	<CFQUERY DATASOURCE="gemssql">
		update memberinfo set moa = '#form.moa#', mob = '#form.mob#', doa = #form.doa#, dob = #form.dob# where memberinfo.email = '#form.email#'
	</CFQUERY> 
    
	   <cfif len(form.friend1) and find('@',form.friend1)>
	  <cfinvoke component="invitationandcredit" method="invite" returnvariable="f" >
		<cfinvokeargument name="byemail" value="#form.email#"  >
		<cfinvokeargument name="email" value="#form.friend1#"  >
		<cfinvokeargument name="creditpart" value="#Application.friendcredit#"   >
		<cfinvokeargument name="sendmail" value="1"  >
		</cfinvoke>
	</cfif>
	<cfif len(form.friend2) and find('@',form.friend2)>
	  <cfinvoke component="invitationandcredit" method="invite" returnvariable="f" >
		    <cfinvokeargument name="byemail" value="#form.email#"  >
		<cfinvokeargument name="email" value="#form.friend2#"  >
		<cfinvokeargument name="creditpart" value="#Application.friendcredit#"   >
		<cfinvokeargument name="sendmail" value="1"  >
	</cfinvoke>
    </cfif>

  
<br>
<div  align="center">  <h2>Congratulations! Your sign up completed. 
  </h2><br><br>
     </div> 
  <cfelse>
  <div  align="center">  <h2>Some Error in recording information. Please write to us and we will fix it.</h2><br><br>
     </div> 
 
   
   </cfif>


<!---
  <cfsilent>
  <cfset mailto = form.email>
  <cftry>
    <cfinclude template="newsletters/cfmailnewsletters.cfm">
    <cfcatch type="any">
      Newsletter could not be mailed immediately....will be mailed a while later. 
    </cfcatch>
  </cftry>
</cfsilent>--->
<!---   <cfinclude template="newsletters/newsletters.cfm"> --->

</CFIF>
		
</div>
<div style="width:420px" class=" _box">
					  <div class="grayplacard" style="margin-bottom: 20px; text-align: left;font-weight: bold">Signin </div>
		    <form onsubmit="return _CF_checkCFForm_1(this)" method="POST" action="/login.cfm" id="form1">
					<div class="form_label">  Email Id: <input type="text" class="form_input" size="30"   id="email" name="email"></div> 
		 <input type="submit" value="Login" class="action_button" name="submit"> 
		    </form>

		</div>
</tr>
</table>
</div>


    <div id="mainfooter">
    <cfinclude template="mainfooter.cfm">
    </div>
</div>
	<cfif len(form.email)>
<script language="javascript" type="text/javascript">
	<!-- 
	
	document.getElementById('form1').submit();
		
	// -->
		</script>
</cfif>

</div>
</body>
</html>
<cfcatch type="any">
<div class="component_box"><a class="login_link" href="/simpleloginform.cfm">You are signed up now! Click here to login</a>
</div>
         <cfmail cc="nitish@semiprecious.com" to="anup@semiprecious.com"  subject="Error at confirmation" from="cs@semiprecious.com"> --->
 not completed login.   
<cfdump var="#cfcatch.TagContext#"><cfoutput>       #cfcatch.Detail#, #cfcatch.Type#,,#cfcatch.Message# [#form.email#]</cfoutput>
 </cfmail>
</cfcatch>
</cftry>