<!DOCTYPE html>

<html>
    <head>
        <% 
            if(request.getSession().getAttribute("pseudo")!=null)
            {
                response.sendRedirect("acceuil.jsp?page=1");
            }
        %>
        <meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<title>Login - Sah ve?</title>
                <link rel="shortcut icon" href="assets/img/favicon.ico" >
                <link rel="icon" type="image/gif" href="assets/img/animated_favicon1.gif" >
		<link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
		<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
		<link href="assets/css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container centre">
            <div class="row">
                <div class="margin col-md-3 col-xs-0"></div>
                <div class="col-md-5 col-xs-12 panelStyle login">
                    <form action="verification/login.jsp" method="POST">
                        <div class="row">
                            <div class="col-md-12"><h3>Connexion</h3></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="login">Login: </label>
                            <input type="text" id="login" name="login" class="form-control champ">
                        </div>
                        <div class="form-group">
                            <label for="pass">Mot de passe: </label>
                            <input type="password" id="pass" name="pass" class="form-control champ">
                        </div>
                        <i>Pas encore de compte? </i><a href="inscription.jsp">Inscrivez-vous!</a>
                        <br/>
                        <br/>
                        <input type="submit" class="btn btn-primary" value="Se connecter">			
                    </form>
                </div>
            </div>  
        </div>
    </body>
</html>
