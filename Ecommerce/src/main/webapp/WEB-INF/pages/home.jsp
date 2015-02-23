<%@page contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 
    prefix="fn" %>
<%@page session="true"%>
 <c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 1, fn:length(req.requestURI)+1), req.contextPath)}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<html>
<head>
    <title>Page title</title>
</head>
</head>
  <script type="text/javascript">
  $(function(){
 
	  $( "#search" ).on( "click", function(e) {
		  
		 
		  var postData = $(this).serializeArray();
		    var formURL = $(this).attr("action");
		    
		    
		   $.ajax(
		    {
		        url :"/Ecommerce/searchKeyword",
		        type: "GET",
		        beforeSend: function ( xhr ) {
		            xhr.setRequestHeader( 'X-CSRF-Token', $('#csrfToken').val() );
		          },
		        data : $('#loginFormCsrf').serialize(),
		        success:function(data, textStatus, jqXHR){
		        	 
		        	var dataArray = jQuery.parseJSON(data);
		        	for(i=0;i<dataArray.length;i++){
		        	   alert( data[i].productColor );
		        	}
		        	
		        	$('.showWelcome').hide();
		        	$('.showSearchBox').show();
		        	 
		        },
		        error: function(jqXHR, textStatus, errorThrown){
		        	alert('Error'); 
		        }
		    }); 
		   
		});
	  
	  $('#doSearch').keypress(function (e) {
		  var key = e.which;
		  if(key == 13){ // the enter key code
		   var keyword = $('#doSearch').val();
			  /***/
			     $.ajax({
		        url :"/Ecommerce/rest/doSearch/"+keyword,
		        type: "GET",
		        beforeSend: function ( xhr ) {
		            xhr.setRequestHeader( 'X-CSRF-Token', $('#csrfToken').val() );
		          },
		        data : $('#loginFormCsrf').serialize(),
		        success:function(data, textStatus, jqXHR){
		        	 		alert(data);   
		        	 		$('##hiddenProdTab').show();
		        	 
		        },
		        error: function(jqXHR, textStatus, errorThrown){
		        	alert('Error'); 
		        }
		    });
			  /**/
		     
		   }
		 }); 
  });
</script>
<style>/* Makeshift CSS Reset */
{
    margin: 0;
    padding: 0;
}

 
/* Tell the browser to render HTML 5 elements as block */
header, footer, aside, nav, article {
    display: block;
}
 
body {
    margin: 0 auto;
    width: 940px;
    font: 13px/22px Helvetica, Arial, sans-serif;
    background: #f0f0f0;
}
 
h2 {
    font-size: 28px;
    line-height: 44px;
    padding: 22px 0;
}
 
h3 {
    font-size: 18px;
    line-height: 22px;
    padding: 11px 0;
}
 
p {
    padding-bottom: 22px;
}
nav {
    position: absolute;
    left: 0;
    width: 100%;
    background: url("nav_background");
}
nav ul {
    margin: 0 auto;
    width: 940px;
    list-style: none;
}
nav ul li {
    float: left;
}
 
    nav ul li a {
        display: block;
        margin-right: 20px;
        width: 140px;
        font-size: 14px;
        line-height: 44px;
        text-align: center;
        text-decoration: none;
        color: #FFECEC;
    }
 
        nav ul li a:hover {
            color: #fff;
        }
 
        nav ul li.selected a {
            color: #fff;
        }
 
        nav ul li.subscribe a {
            margin-left: 22px;
            padding-left: 33px;
            text-align: left;
            background: url("rss.png") left center no-repeat;
        }#intro {
    margin-top: 66px;
    padding: 44px;
    background: #467612 url("intro_background.png") repeat-x;
    background-size: 100%;
    border-radius: 22px;
}
#intro h2, #intro p¬†{
    width: 336px;
}
 
#intro h2 {
    padding: 0 0 22px 0;
    font-weight: normal
    color: #fff;
}
 
#intro p {
    padding: 0;
    color: #d9f499;
}
#content {
    display: table;
}
 
    #mainContent {
        display: table-cell;
        width: 620px;
        padding-right: 22px;
    }
 
    aside {
        display: table-cell;
        width: 300px;
    }
    .showSearchBox{
    display:none;
    }
    #hiddenProdTab{
     display:none;
    }
</style>
<body>
    <header>
        <h1> </h1>
    </header>
    <nav>
        <!-- Navigation -->
    </nav>
    <section id="intro">
    
      <nav>
			<ul>
				<li><a href="#" data-ajax="false" id="search" tabindex="3" style="float: left">Search</a></li>
				<li><a href="#">Cart</a></li>
				<li><a href="#">Checkout</a></li>
				<li><a href="#">Receipt</a></li>
				<li><a href="#">Logout</a></li>
			</ul>
		</nav>
    </section>
    <section id="main">
      <section>
    <article class="blogPost">
				<div id="flowMain">
					<header>
						<div class="showWelcome">
							<h2>Hello, Welcome to Ecommerce POC</h2>

						</div>
						<div class="showSearchBox">
							<tr>
								<td>
									<input type="text" id = "doSearch" name='username' tabindex="1" placeholder="Avoid Special Characters" required>
								</td>
								
							</tr>
						</div>
						
						<!--  -->
						<div id = "hiddenProdTab">
						<CENTER>
							<FONT SIZE="4">Please select the products</FONT><BR>
							<BR>

							<TABLE CELLSPACING="15">
								<TR ALIGN="CENTER" VALIGN="CENTER">
									<TD WIDTH="20%"><IMG SRC=" " WIDTH="109" HEIGHT="109"
										ALT=" "><BR> <B><I> </I></B></TD>
									<TD WIDTH="20%"><IMG SRC=" " WIDTH="110" HEIGHT="73"
										ALT=" "><BR> <B><I> </I></B></TD>
									<TD WIDTH="20%"><IMG SRC=" " WIDTH="110" HEIGHT="82"
										ALT=" "><BR> <B><I> </I></B></TD>
									<TD WIDTH="20%"><IMG SRC=" " WIDTH="110" HEIGHT="58"
										ALT=" "><BR> <B><I></I></B></TD>
									<TD WIDTH="20%"><IMG SRC=" " WIDTH="109" HEIGHT="96"
										ALT=" "> <BR>
									<B><I> </I></B></TD>
								</TR>
							</TABLE>
						</CENTER>
						</div>
						<!--  -->
					</header>
				</div>


			</article>
</section>
    </section>
    <aside>
        <!-- Sidebar -->
    </aside>
    <footer>
        <!-- Footer -->
    </footer>
 
</body>
</html>