<!DOCTYPE html>

<html>
    <head>
        <% 
            if(request.getSession().getAttribute("pseudo")==null)
            {
                response.sendRedirect("acceuil.jsp?page=1");
            }
        %>
        <meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<title>Demande defi</title>
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
                    <form action="verification/demander.jsp" method="POST">
                        <div class="form-group">
                            <label for="demande" style="font-size: 20px;">Difficult&eacute;: </label>
                            <br/>
                            <label><input type="radio" name="checker"  value="Difficile">Difficile</label>
                            <br/>
                            <label><input type="radio" name="checker"  value="Moyen" checked>Moyen</label>
                            <br/>
                            <label><input type="radio" name="checker"  value="Facile">Facile</label>
                        </div>
                        <br/>
                        <br/>
                        <input type="submit" class="btn btn-primary" value="Envoyer">			
                    </form>
                </div>
            </div>  
        </div>
    </body>
</html>
