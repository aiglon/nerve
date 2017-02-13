<!DOCTYPE html>

<html>
        <% 
            if(request.getSession().getAttribute("pseudo")==null)
            {
                response.sendRedirect("../index.html");
            }
        %>
    <head>
        <meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<title>Configuration compte</title>
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
                    <form action="verification/changermdp.jsp" method="POST">
                        <div class="row">
                            <div class="col-md-12"><h3>Changer mot de passe</h3></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="pass">Mot de passe actuel: </label>
                            <input type="password" id="pass" name="passactuel" class="form-control champ">
                        </div>
                
                        <div class="form-group">
                            <label for="pass">Nouveau mot de passe: </label>
                            <input type="password" id="pass" name="passnouveau" class="form-control champ">
                        </div>
            
                        <div class="form-group">
                            <label for="pass">Confirmer mot de passe: </label>
                            <input type="password" id="pass" name="passconf" class="form-control champ">
                        </div>
                        <br/>
                        <input type="submit" class="btn btn-primary" value="Confirmer">			
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
