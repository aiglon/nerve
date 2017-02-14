<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<title>Inscription - Sah ve?</title>
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
                    <form action="verification/inscription.jsp" method="POST">
                        <div class="row">
                            <div class="col-md-12"><h3>Inscription</h3></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="pseudo">Pseudo: </label>
                            <input type="text" id="pseudo" name="pseudo" class="form-control champ">
                        </div>
                        <div class="form-group">
                            <label for="mail">E-mail: </label>
                            <input type="email" id="mail" name="mail" class="form-control champ">
                        </div>
                        <div class="form-group">
                            <label for="pass">Mot de passe: </label>
                            <input type="password" id="pass" name="pass" class="form-control champ">
                        </div>
                        <br/>
                        <input type="submit" class="btn btn-primary" value="S'inscrire">			
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
