<cfset this.enablerobustexception = true />
<cftry>
<cftry>
 <cfif cgi.server_name does not contain "www." and cgi.server_name does not contain "ale.">
   <cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#">
  <cfheader statuscode="301" statustext="Moved permanently">
  <cfheader name="Location" value="#newurl#">
</cfif> 
<CFPARAM NAME="sortorder" DEFAULT="" >
<CFPARAM NAME="start" DEFAULT= "">
<CFPARAM NAME="category" DEFAULT="">
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="url.ringsize" default="">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="pendantsdone" default="no">
<cfparam name="DESCRIPTIon" default="WHEREFROM">

<cfparam name="earringsdone" default="no">
<cfparam name="braceletsdone" default="no">
<cfparam name="subcat2" default="">
<cfparam name="birthstone" default="MAY">
<cfparam name="subcat" default="citrine">

<cfif start neq "" or category neq "" or sortorder neq "">
<cfheader statuscode='301' statustext='Moved permanently'>
<cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#.cfm'> 
<cfabort>
</cfif>
<cfset start=1>
<cfparam name="pagedescription" default="">
<cfparam name="screensize" default="big">
<cfparam name="style" default="">
<cfparam name="url.style" default="">
<cfif style neq "" and url.style eq ""><cfset url.style=style></cfif>
<cfparam name="silverjewelry" default="">
<cfset sj = "">
 <cfparam name="invstatus" default=-3	>
 <cfif session.mail eq 'acemat@vsnl.com'>
         <cfset url.edit =  'mamamia'>
         <cfset invstatus= -5>
 </cfif>

 <cfparam default="662222" name="l">
<cfset  top = 114 /> <!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
<cfif cgi.server_name contains "wholesale">
 <cfparam name="displayrows" default="5">
 <cfelse>
 <cfparam name="displayrows" default="5">
 </cfif>
 
<CFPARAM NAME="displaycolumns" DEFAULT="4">

<CFPARAM NAME="numpages" DEFAULT="0"> 
 <cfparam name="jewelrysize" default="">
 
<cfparam default="106" name="stonelistht" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is 'beads' and session.mail neq application.admin_email><cfset invstatus=0></cfif>
<cfif category is "bracelets" or category is 'beads'><cfset displayrows=3><cfset displaycolumns="5"></cfif>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="subcat" DEFAULT= "PERIDOT">
<CFPARAM NAME="subcat2" DEFAULT= "">
<CFPARAM NAME="priceless" DEFAULT="">
	<cfif priceless is "">
		<cfif subcat is "" and category neq "beads">
			<cfset priceless = "">
		</cfif>	
	</cfif>
<cfset price_array  = arraynew(1)>
<cfset status_array  = arraynew(1)>
<cfset item_array  = arraynew(1)>
<cfset descr_array  = arraynew(1)>
 <Cfif style EQ "silver" or style EQ "silverbeaded">
	<cfset url.silverjewelry=silverjewelry>
</Cfif>

<CFINCLUDE TEMPLATE="setup.cfm">

 		<cfif cgi.server_name contains "wholesale">
			<CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
		<cfelse>
			<cfif dateformat(now(),"dddd") eq "Sunday"> 
				<CFPARAM NAME="url.sortorder" DEFAULT="lastbought">
				<cfelseif dateformat(now(),"dddd") eq "Monday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
				<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
				<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="lastbought">
				<cfelseif dateformat(now(),"dddd") eq "Thursday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
				<cfelseif dateformat(now(),"dddd") eq "Friday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="newitem desc" >
				<cfelse>
				<CFPARAM NAME="url.sortorder" DEFAULT="datetaken desc" >
			</cfif>
		</cfif>
<cfparam name="sortorder" default="">
<cfif sortorder neq ""><cfset url.sortorder =sortorder>	</cfif>
		<!---<cfif category is 'beads'><cfset url.sortorder = 'pricedesc'></cfif>--->
<!--- <CFIF url.sortorder is 'price'>
<CFSET url.sortorder='orderprice'>
 </cfif>
<CFPARAM NAME="PicWidth" DEFAULT= "120"> 
<cfoutput>url.sortorder is #url.sortorder#</cfoutput>
need to figure out from where sort order is coming as datetakendesc --->

<cfif url.sortorder eq 'datetakendesc' or url.sortorder eq 'newitemdesc' or url.sortorder eq 'datetaken'>
<cfset url.sortorder = 'datetaken desc'>
</cfif>
<cfif url.sortorder is 'pricedesc'>
<cfset url.sortorder = 'price desc' />
</cfif>
<cfif url.sortorder is 'lastbought'>
<cfset url.sortorder = 'lastbought desc' />
</cfif>
<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->

<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="newtstart" DEFAULT= "1">
<CFPARAM NAME="url.subcat" DEFAULT= subcat>
<cfparam name="url.category" default=category />
<CFPARAM NAME="advancedsearch" DEFAULT= "">
 <CFPARAM NAME="advancedsearch1" DEFAULT= "">
<CFPARAM NAME="advancedsearch2" DEFAULT= ""> 
<CFPARAM NAME="advancedsearch3" DEFAULT= "">
<CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bcolor" DEFAULT= "white">
<CFPARAM NAME="salestatus" DEFAULT="">
 <CFPARAM NAME="newcart" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT=""> 
<CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="pricegreater" DEFAULT="">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/"> 
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">

<cfif isnumeric(advancedsearch)> <cflocation url="jewelry_item.cfm?newitem=#advancedsearch#"></cfif>
<cfinclude template="checkinjection.cfm">

<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring; 
 } 

  session.gallery = 'birthstones.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping 
IF (advancedsearch is not "") {
 category ="" ;
 subcat = "";
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark =''; 
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors ='Red,Blue,Gray,Orange,Green,Maroon,Black,Pink,White,Maroon,Purple';
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=21;
   displaycolumns = 5;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
<cfset categ=category><cfif category is "All"><cfset categ="jewelry"></cfif>
<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">


	<cfquery name="contentbypage" datasource="gemssql">
	        Select * from contentbypage where pagename='#REPLACE(replace(Trim(CGI.path_info),"/",""),"TEST","")#'
	</cfquery>
	<cfif contentbypage.recordcount GT 0>
		<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> 
			<cfset metatitle="Wholesale #subcat# #categ#">
			<cfset metadescription="Wholesale #contentbypage.metadescription#">
			<cfset metakeywords="Wholesale #contentbypage.keywords#">
			<cfset pagedescription="Wholesale #contentbypage.description#">
			
       <cfelseif session.country is "india">
			<cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
			<cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
			<cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
			<cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">

			<cfelse>
			<cfset metatitle="#contentbypage.title#">
			<cfset metadescription="#contentbypage.metadescription#">
			<cfset metakeywords="#contentbypage.keywords#">
			<cfset pagedescription="#contentbypage.description#">
		</cfif>
	</cfif>


<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(CGI.path_info)#'>

<cfcatch type="any">
<cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
<!--- speed up things  --->
<cftry>
  <cfquery DATASOURCE="gemssql"  name="getlist">
	  Select distinct subcat, cat, style, inventory from qryCatSubcatBeadedAndSilverInventory where (subcat='#subcat#' ) and  cat <>'beads' and inventory >0 order by cat desc, inventory desc
  </cfquery>
<cfcatch type="database">
<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
</cfcatch>
</cftry>

  
 <cfcache action="servercache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
<cfif getlist.recordcount is 0>
<CFINCLUDE TEMPLATE="/header#session.country#.cfm"> 
			<br>
			<span class="error">No  item found. PLEASE TRY AGAIN.</span>
			<cfif subcat is 'amber'>
				<cfinclude template="pippinindex.htm">
			</cfif>
			<cfinclude template="footer.htm">
			<CFSET enddisplay= start + display -1 >
<cfelse>

<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1>

<CFOUTPUT>
<cfif category is "ALL" or category is "">
			<cfset p = "Jewelry">
		<cfelse>
			<cfset p = category>
		</cfif> 
	<TITLE style="text-transform:capitalize;">
	<cfif metatitle neq "">#metatitle#<cfelse><cfif cgi.server_name contains 'wholesale'> Wholesale</cfif>
			#color# #subcat# #style#  #p# gem stone  </cfif>
	</TITLE>
	
	<meta name="author" content="Anup Pandey" />
	<cfsavecontent variable="md"  >
	<cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif> #subcat# #style# #p# gem stone jewelry, retail and wholesale. 
	<CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#description#. </cfloop>' </cfif>
		</cfsavecontent>
	<cfsavecontent variable="md2"   > 
        <cfif metakeywords neq "">"#metakeywords#"<cfelse>"
	<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>
	Affordable #color# #subcat#, Gem stone,  #p#"</cfif>
	</cfsavecontent>
	<cfsavecontent variable="inheader"   >
        <meta name="description" content=#md# >
	
	<meta name="keywords" content=#md2# />
	<META content="20 days" name=revisit-after>
   	</cfsavecontent>

<script language="JavaScript" src="/js/imageswap.js"></script>

</cfoutput>



<CFINCLUDE TEMPLATE="/header#session.country#.cfm"> 
<cfoutput>
    

	
	<cfset display = displaycolumns*displayrows>
	<CFIF GetList.cat is not "">
		<input type='hidden' name='category' value='#GetList.cat#'>
	<CFELSE>
		<input type='hidden' name='category' value='#category#'>
	</cfif>
	<input type='hidden' name='url.sortorder' value='#url.sortorder#'>
	
	
</cfoutput>	

<CFSET columns=1> 
<CFSET rows=1> 
<CFSET enddisplay= start + display-1>
<CFSET currentrow= start>

  <cfif  subcat neq "chain-silver"   and subcat neq "quartz">
                                 <div style="width:760px;height:20px;" class=" reg_price <cfoutput>#replace(subcat," ","_")#</cfoutput>_header">
                 <span class="reg_price"> <cfoutput>#metatitle#</cfoutput> </span>
                            </div>
     </cfif> 
	<div style="width:960px" id="container2">
		<div style="width:180px;float:left" align="left">
		<!--- BEGIN LEFT SIDE STUFF --->
				<cfset leftbirthstonedisplay="inline" />

			<CFINCLUDE TEMPLATE="leftmenus.cfm">
          <!--- END LEFT SIDE STUFF --->
				

			</div>
			<div style="background:white;padding-left:10px;border:1px ##DDDDDD ridge;">
			<cfset rowsdisplayed = 0>
			
   
					<cfset itemlist = 0 />
<div id="wrapper">
<div ID="bottomTiles">
					<CFLOOP QUERY="Getlist">
					<cfif getlist.cat is 'necklaces' or getlist.cat is 'healing' or getlist.cat is 'beads' or getlist.cat is 'rings' or (getlist.cat is 'pendants' and pendantsdone is "no") or (getlist.cat is "bracelets" and braceletsdone is "no")  or (getlist.cat is "earrings" and earringsdone is "no") >
					<cfif getlist.cat is 'pendants'>
						<cfset pendantsdone="yes">
						<cfset getlist.style="">
					</cfif>
					<cfif getlist.cat is 'bracelets'>
						<cfset braceletsdone="yes">
						<cfset getlist.style="">
					</cfif>
					<cfif getlist.cat is 'earrings'>
						<cfset earringsdone="yes">
						<cfset getlist.style="">
					</cfif>
					<cfif getlist.cat is 'rings'>
					<cfset ringsdone="yes">
						  	<cfset getlist.style="">
					</cfif>
						<cfquery datasource="gemssql" name="getfirstitem">
							Select top 1 newitem from items where cat='#cat#' and style like '%#getlist.style#%' and (subcat='#subcat#' or subcat2='#subcat#')  and  inventory>0 order by disporder, lastbought
						</cfquery>
					<cfoutput>
			<div class="sub1">
        	<div class="subTop"><span></span></div>
           <div class="sub-content">
            	<div CLASS="bottomBarTitle" >
       					<a href='#replace(subcat," ","")#_#cat#.cfm<cfif style neq "">?style=#getlist.Style#</cfif>'><img src=images/#cat#/thumb/#getfirstitem.newitem#.jpg border=0 <cfif cat is "beads" or cat is "necklaces" or cat is "bracelets">width=120</cfif>></a>
    					
						<br> <a CLASS="SIDE_LINK" href='#replace(subcat," ","")#_#cat#.cfm<cfif style neq ""><cfif style contains "silver">?style=silver<cfelse>?style=#getlist.Style#</cfif></cfif>'><cfif cat neq "beads" and cat neq "healing"> <cfif getlist.style is 'beaded'>#subcat# beaded #cat#<cfelseif getlist.style is "">#subcat# #cat#<cfelse>#subcat# #cat# in sterling silver</cfif><cfelse>#subcat# #cat#</cfif></a> <br>

   					</cfoutput>
		            </div>
          </div>
         <div class="subBottom"><span></span></div> 
	</div>

						
					</cfif>						
					</CFLOOP>
 </div>
 </div>
<cfoutput>
<div class="wrapper" style="margin-top:20px;" align="left">
				<a href='gemstone-jewelry.cfm?subcat=#subcat#'><b>All #subcat# Jewelry Together</b></a>
<cfif birthstone neq "">
<a class="reg_link" href='#birthstone#-birthstone-information.cfm'>#birthstone# birthstone information</a>
                    </cfif>
					</div>
	
						</cfoutput>
	    
	<cfquery datasource="gemssql" name="getdesigner">
	Select top 6 newitem, cat from items where supplier='Angela' and inventory>0 and subcat='#subcat#' order by lastbought
	</cfquery>
<cftry>
		<cfif getdesigner.recordcount GT 0>
<CFOUTPUT>		
	<div style="clear:both;float:none;" CLASS="FORM_HEADING">Designer #subcat# jewelry</div>
			
			<table border=1 bordercolor="##66CCCC"><tr>
			<cfloop query="getdesigner">
			<td valign="top" align="center">
		<a href='designer_jewelry_angela.cfm?subcat=#subcat#&amp;category=#getdesigner.cat#'><img src=images/#getdesigner.cat#/thumb/#getdesigner.newitem#.jpg border=0></a>
			</td>
			</cfloop>
		</cfoutput>	</tr></table>
		
		
		</cfif>
<cfcatch type="any">
<cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
</div>
<cfif pagedescription neq "" or session.mail is application.admin_email>
							<div style="clear:both;color:#666600;width:94%;" class="rowb" > 
									<b><font color=gray size="-2"><i><cfoutput>#pagedescription#</cfoutput></i></font></b><br>
								<cfif session.mail is application.admin_email>	<a href="http://www.semiprecious.com/admintools/contentadder.cfm?pagename=<cfoutput>#right(currentfile, len(currentfile)-1)#</cfoutput>">Content Edit</a></cfif>
					</div>			 
							</cfif>

		<cfset subcat3 = replace(trim(subcat),"_","")>
		<cfset subcat3 = replace(trim(subcat3)," ","")>
				<CFOUTPUT>	<div  align="left" height=30  ><a href=#subcat3#.cfm><br>SEE RANDOM #subcat# JEWELRY</cfoutput></a>
				</div>
					<!--- End Matt Bayuk - SGM --->
				<!---<cfinclude  template="statsrecord.cfm">--->
					<div>
				<cfinclude template="includes/linkexchangebystone.cfm"></div>
                <cfoutput>

				   <div   align=CENTER style="clear:both;float:none;">
				   <a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>
				     <cfinclude template="googleadsforlist.htm"></div>

</cfoutput> 
</div>
    
<div align="center" style="clear:left">
<cfif subcat neq ""> <cfinclude template="marketing/stonelinks.cfm"></cfif>
         <!--- Footer --->
             <cfinclude template="/mainfooter.cfm">
         <!--- End footer --->
</div>

                 

<cfoutput>
	<script language="JavaScript1.1">
		function showDetails(itemNum) {
			hideAll(); 
			document.getElementById('div' + itemNum).style.display = 'block';
		}
		function displayZoom(zoomImg,imageWidth) {
			$.blockUI.defaults.css = {};
			$.blockUI( {
				message: "<<<<<<<<<<<<<input type='button' id='closeZoom' value='Close' /><br><img src='" + zoomImg + "' />",
				css: {  
					width:			imageWidth + 'px',
					padding:        0,
					margin:         0,
					top:  (jQuery(window).height() - 500) /2 + 'px', 
					left: (jQuery(window).width() - imageWidth) /2 + 'px', 
					textAlign:      'center', 
					color:          '##000', 
					border:         '3px solid ##aaa',
					backgroundColor:'##fff'			
				}  
			});      

			$('##closeZoom').click(function() { 
				$.unblockUI(); 
			}); 
 //		    setTimeout(jQuery.unblockUI, 2000); 			
		}
		
		function zoomImage(zoomImg) {

			imgZoom = new Image();
			imgZoom.src = zoomImg;
			if (imgZoom.width > 0) {
				displayZoom(zoomImg, imgZoom.width);
			}
			else {
				imgZoom.onload = function(){
					imgZoom.onload = null;
					displayZoom(zoomImg,imgZoom.width);
				}
			}
		}
	

		function hidex() {
			divx.style.display='none';
				}
	<cfif start eq 1>		/*
ShowHide('jumpstart');

ShowHide('jumpstartblinder');

*/
</cfif>			
	</script>		</cfoutput> 
	<!--- <cfset balance = session.screenwidth - 760>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:760px;height:900px;width=#balance#px;">&nbsp;</div>
 --->
<cftry>
<Cfif len(cgi.QUERY_STRING)>
<cfset session.filter=CGI.QUERY_STRING >
<cfelse>
<cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&birthstone=#birthstone#" >
</Cfif>

<cfcatch type="application"> 
<CFOUTPUT>#CFCATCH.DETAIL#, #CFCATcH.MESSAGe#</CFOUTPUT>
</cfcatch>
</cftry>


           <cfif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
	</cfif>

	</cfif>

</div>
<CFCACHE TIMEOUT="#DateAdd("h", "-24", Now() )#">
<cfcatch type="any"> 
<CFOUTPUT>#CFCATCH.DETAIL#, #CFCATcH.MESSAGe#</CFOUTPUT>
</cfcatch>
</cftry>
 </BODY>
</HTML>