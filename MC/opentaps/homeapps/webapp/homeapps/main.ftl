<#if !userLogin?exists>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
		<link rel="shortcut icon" href="<@ofbizContentUrl>/opentaps_images/favicon.ico</@ofbizContentUrl>">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta name="viewport" content="width=device-witdh, initial-scale=1.0"/>
			 <#-- TODO: find the way to import CSS from css component folder For now we are getting CSS from the opentaps_css directory inside opentaps-common. -->
		    <!--<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />-->
	            <!--<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">-->
		    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
		    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">-->
			<!---Repositorio local --->
			<link rel="stylesheet" href="/opentaps_images/resources/bootstrap/bootstrap.min.css">
			<link rel="stylesheet" href="/opentaps_images/resources/fonts/font-awesome.css">	
			<link rel="stylesheet"  href="${request.contextPath}/partymgr/static/css/main.css">	
		</head>
		<body class="bodyLogin">
		      <div class="container text-center">
		      	<div class="card">
				  <div class="card-body">
				    <div id="logo">
				    	<img id="logo_inicio" src="<@ofbizContentUrl>${configProperties.get("opentaps.logoLogin")}</@ofbizContentUrl>" align="center"/>
				    </div>
				    <h2 class="inicioSesion">${uiLabelMap.OpentapsLoginGreeting}</h2>
				    <p class="texto" style="">Ingresa tus credenciales para acceder al sistema</p>
				    <#-- handles service error messages -->
					      <#if requestAttributes.errorMessageList?has_content><#assign errorMessageList=requestAttributes.errorMessageList></#if>
					      <#if requestAttributes.eventMessageList?has_content><#assign eventMessageList=requestAttributes.eventMessageList></#if>
					      <#if requestAttributes.serviceValidationException?exists><#assign serviceValidationException = requestAttributes.serviceValidationException></#if>
					      <#if requestAttributes.uiLabelMap?has_content><#assign uiLabelMap = requestAttributes.uiLabelMap></#if>
					
					      <#if !errorMessage?has_content>
					        <#assign errorMessage = requestAttributes._ERROR_MESSAGE_?if_exists/>
					      </#if>
					      <#if !errorMessageList?has_content>
					        <#assign errorMessageList = requestAttributes._ERROR_MESSAGE_LIST_?if_exists/>
					      </#if>
						  
					      <#if !eventMessage?has_content>
					        <#assign eventMessage = requestAttributes._EVENT_MESSAGE_?if_exists/>
					      </#if>
					      <#if !eventMessageList?has_content>
					        <#assign eventMessageList = requestAttributes._EVENT_MESSAGE_LIST_?if_exists/>
					      </#if>
					
					      <#-- display the error messages Este error -->
					      <#if (errorMessage?has_content || errorMessageList?has_content)>
					        <div id="errorDiv" class="serviceError alert alert-danger">
					          <p>${uiLabelMap.CommonFollowingErrorsOccurred}:</p>
							  
					          <#if errorMessage?has_content && errorMessage != "null">
					            <p>${errorMessage}</p>
					          </#if>
					          <#if errorMessageList?has_content>
					            <#list errorMessageList as errorMsg>
					              <#if errorMsg?exists && errorMsg != "null">
					                <p>${errorMsg}</p>
					              </#if>
					            </#list>
					          </#if>
					        </div>
					      </#if>
			
					      <#-- display the event messages -->
						  
						
					      <#if (eventMessage?has_content || eventMessageList?has_content)>
					        
							<div id="errorDivv" class="serviceError alert alert-danger" style="background-color:#87b89d !important; border-color:#235B4E !important;">
							
					          <p style= "color:black; !important">${uiLabelMap.CommonFollowingOccurred}</p>
							
					          <#if eventMessage?has_content && eventMessage != "null">
					            <p>${eventMessage}</p>
					          </#if>
					          <#if eventMessageList?has_content && eventMessageList != "null">
					            <#list eventMessageList as eventMsg>
					              <#if errorMsg?exists && errorMsg != "null">
					                <p>${eventMsg}</p>
					              </#if>
					            </#list>
					          </#if>
					        </div>
					      </#if>
				    <#-- Error end -->
				      
				    <#-- form -->
				   <!-- <form id="login" method="post" action="<@ofbizUrl>login${previousParams?if_exists}</@ofbizUrl>">
					  <div class="row">
					  	<div class="col-12">
					  		<label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
							  <div class="input-group mb-2 mr-sm-2">
							    <div class="input-group-prepend">
							    	<div class="input-group-text key-icon">						
									<img src="/opentaps_images/incUser.png" width="45px" heigth="45px">
  								</div>
							    </div>
							    <input class="form-control" type="text" id="username" placeholder="Nombre de usuario" name="USERNAME" size="50"/>
							  </div>
					  	</div>
					  </div>
					  <div class="row">
					  	<div class="col-12">
					  		<label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
							  <div class="input-group mb-2 mr-sm-2">
							    <div class="input-group-prepend">
							      <div class="input-group-text key-icon">
							      	<img src="/opentaps_images/key.png" width="45px" heigth="45px">
							      </div>
							    </div>
							    <input class="form-control" type="password" id="password" placeholder="Password" name="PASSWORD" size="50"/>
							  </div>
					  	</div>
					  </div>
					  <div class="row">
					  	<div class="col-12 mt-4">
					  		<button style="background-color:#155E29; color:white; border:none; padding: 10px 20px; border-radius: 2px;" type="submit">
						  		${uiLabelMap.CommonLogin} 

                                                               <img src="/opentaps_images/sign.png" width="45px" heigth="45px">
					  		</button>
					  	</div>
					  </div>
					</form>-->


<form id="login" method="post" action="<@ofbizUrl>login${previousParams?if_exists}</@ofbizUrl>">
  <div class="row">
    <div class="col-12">
      <label class="sr-only" for="username">Username</label>
      <div class="input-group mb-2 mr-sm-2">
        <div class="input-group-prepend">
          <div class="input-group-text key-icon">
            <img src="/opentaps_images/incUser.png" width="45px" height="45px">
          </div>
        </div>
        <input class="form-control" type="text" id="username" placeholder="Nombre de usuario" name="USERNAME" size="50"/>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-12">
      <label class="sr-only" for="password">Password</label>
      <div class="input-group mb-2 mr-sm-2">
        <div class="input-group-prepend">
          <div class="input-group-text key-icon">
            <img src="/opentaps_images/key.png" width="45px" height="45px">
          </div>
        </div>
        <input class="form-control" type="password" id="password" placeholder="Password" name="PASSWORD" size="50"/>
      </div>
    </div>
  </div>

  <div id="passwordExpiredMessage" style="display:none;">
    <div class="row">
      <div class="col-12">
        <div class="alert alert-warning" role="alert">
          Tu password ha expirado. Por favor, c&aacute;mbialo para continuar.
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-12 mt-4">
      <button style="background-color:#155E29; color:white; border:none; padding: 10px 20px; border-radius: 2px;" type="submit">
        ${uiLabelMap.CommonLogin}
        <img src="/opentaps_images/sign.png" width="45px" height="45px">
      </button>
    </div>
  </div>
</form>

<!-- New Password Form -->
<form id="updatePassword" name="updatePassword" style="display:none;">
  <div class="row">
    <div class="col-12">
      <label for="updatePassword_newPassword">Nueva contraseña</label>
      <input type="password" id="updatePassword_newPassword" name="newPassword" placeholder="Nueva contraseña" />
    </div>
  </div>

  <div class="row">
    <div class="col-12">
      <label for="updatePassword_newPasswordVerify">Verifica la nueva contraseña</label>
      <input type="password" id="updatePassword_newPasswordVerify" name="newPasswordVerify" placeholder="Verificar nueva contraseña" />
    </div>
  </div>

  <div class="row">
    <div class="col-12 mt-4">
      <button style="background-color:#155E29; color:white; border:none; padding: 10px 20px; border-radius: 2px;" type="submit" onclick="updatePassword();">
        Guardar
      </button>
    </div>
  </div>
</form>





					<div class="row mt-3">
						<div class="col-12">
							<h6 class="enlace"><a href="javascript:forgotPasswd()">${uiLabelMap.CommonForgotYourPassword}?</a></h6>
						</div>
					</div>
					<form id="forgotpasswd" method="post" action="<@ofbizUrl>forgotpassword${previousParams?if_exists}</@ofbizUrl>">
					  <hr>
					  <h6 class="texto2">${uiLabelMap.CommonForgotPassword}</h6>
			          <div class="row">
			          	<div class="col-12">
					        <input type="text" class="form-control" id="username" name="USERNAME" placeholder="${uiLabelMap.CommonUsername}" size="50" />
			          	</div>
			          </div>
			          <div class="row mt-4">
			          	<div class="col-12">
			          		<input type="submit" class="btn btn-primary" name="EMAIL_PASSWORD" value="${uiLabelMap.CommonEmailPassword}"/>
			          	</div>
			          </div>
				    </form>
				  </div>
				</div>
			</div>
			
		</body>
	</html>
</#if>
<#-- if login -->

<#-- if user is authenticated -->
<#if userLogin?exists>
	<div id="container">
		<div id="form">
	      	<h2 id="Bienvenida">${uiLabelMap.CommonWelcome} <br />${firstName} ${lastName}</h2>
	      	<hr>
	      	<form id="logout" method="post" action="<@ofbizUrl>logout${previousParams?if_exists}</@ofbizUrl>">
	        	<input class="decorativeSubmit" type="submit" value="${uiLabelMap.CommonLogout}" />
	      	</form>
	    	<!-- <@include location="component://opentaps-common/webapp/common/includes/latestnews.ftl"/> -->
		</div>
		<div class="modulos">
			<div id="row">
		    	<#assign appIndex = 0 />
		      	<#list apps as app>
		      		<#if (app.applicationId != "warehouse" && app.applicationId != "controlPatrimonial" && app.applicationId != "purchasing" && app.applicationId != "viaticos"
		      			&& app.applicationId != "gastosReserva" && app.applicationId != "obras" && app.applicationId != "crmsfa" && app.applicationId != "" && app.applicationId != "proyectos")>
						<#if (!app.hide?exists || app.hide != "Y") && app.linkUrl?has_content>
					    	<#assign appIndex = appIndex + 1 />
				        	<div id="button" class="${app.applicationId}" onmouseover="javascript:writeAppDetails('${app.shortName!app.applicationId}','${app.applicationName!app.applicationId}','${app.description!app.applicationId}')">
					        	<#if app.imageUrl?has_content>
					              <a id="Titulos" href="${app.linkUrl}<#if externalKeyParam?exists>?${externalKeyParam}</#if>">
					                <img class="imagen" src="${app.imageUrl}" onmouseover="this.src='${app.imageHoverUrl!app.imageUrl}'" onmouseout="this.src='${app.imageUrl}'" />
					              </a>
					            </#if>
					            <div id="texto" for="${app.applicationId}">
					            	<a style="color: black;" href="${app.linkUrl}<#if externalKeyParam?exists>?${externalKeyParam}</#if>" >
					                	${app.shortName!app.applicationId}
					              	</a>
					            </div>
				          	</div>
					        <#if !app_has_next>
				          		</div>
				          	<#elseif appIndex % 1 == 0>
				            	</div><div id="row"> 
					        </#if>
						</#if>
					</#if>
		      	</#list>
		    </div>
    	</div>
    </div>
</#if>
<scrip src="../party/wepapp/partymgr/js_main/main.js">
