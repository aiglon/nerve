<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*,defi.*,groupe.*"%>
<!DOCTYPE html>
<html>
        <% 
            if(request.getSession().getAttribute("pseudo")==null)
            {
                response.sendRedirect("index.jsp");
            }
            try
            {
                String iduser=request.getParameter("id");
                String type=request.getParameter("type");
                int total=5;
                Fonctiondefi fd=new Fonctiondefi();
                FonctGroupe fg=new FonctGroupe();
                int nombregroupe=fg.nombredegroupe(iduser);
                int defiattente=fd.nombredefiattente(iduser,type);
                int definonfini=fd.getnombredefinonfini(iduser,type);
                Defiajouer[] daj=fd.getdefienattente(iduser, type);
                BddLogin bdd=new BddLogin();
                int nombredemande=bdd.nombredemande();
                int taille=daj.length;
        %>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Accueil - Sah ve?</title>
        <link rel="shortcut icon" href="assets/img/favicon.ico" >
        <link rel="icon" type="image/gif" href="assets/img/animated_favicon1.gif" >
        <link href="assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <br><br>
        <div class="page row">
            <div class="col-md-3 side-menu">
            
                <h1 align="center"><%out.print(request.getSession().getAttribute("pseudo"));%></h1>
                <ul>
                    <li>
                        
                    </li>
                    <li>
                        <a href="acceuil.jsp?page=1" class="btnStyle"><i class="fa fa-home iconStyle"></i>Actus</a>
                    </li>
                    <li>
                        <a href="groupe.jsp?page=1" class="btnStyle"><i class="fa fa-group iconStyle"></i>Groupes(<%out.print(nombregroupe);%>)</a>
                    </li>
                    <li>
                        <a href="defi.jsp?id=<%out.print(iduser);%>&type=perso" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Defi en attente(<%out.print(defiattente);%>)</a>
                    </li>
                    <li>
                        <a href="listedemande.jsp" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Joueur(s) cherchant defi(<%out.print(nombredemande);%>)</a>
                    </li>
                    <li>
                        <a href="listenonfini.jsp?page=1" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Defi non fini(<%out.print(definonfini);%>)</a>
                    </li>
                    <li>
                        <a href="profile.jsp?page=1" class="btnStyle"><i class="fa fa-user iconStyle"></i>Profil</a>
                    </li>
                    <li>
                        <a href="parametre.jsp" class="btnStyle"><i class="fa fa-wrench iconStyle"></i>Param&egrave;tres</a>
                    </li>
                    <li>
                        <a href="verification/deconnecter.jsp" class="btnStyle"><i class="fa fa-power-off iconStyle"></i>Se d&eacute;connecter</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-1" style="max-width:1vw !important;">     
            </div>
            <div class="col-md-8">
                <% for(int i=0;i<taille;i++){ %>
                <div class="vidPane">
                    <div class="row">
                        <a class="col-md-12" href="detail.jsp?page=1&id=<%out.print(daj[i].getIduser());%>" > <h4><%out.print(daj[i].getPseudo()+" >");%></h4>  </a>
                    </div>             
                    <div class="row">
                        <div class="col-md-8">
                            <b style="font-size: 16px;"><%out.print(daj[i].getNomdefi());%></b>
                        </div>
                        <div class="col-md-4">
                            <a href="verification/accepter.jsp?id=<%out.print(daj[i].getIddefi());%>&type=accepter" class="btn btn-success " >Accepter</a>
                            <a href="verification/accepter.jsp?id=<%out.print(daj[i].getIddefi());%>&type=refuser" class="btn btn-danger pull-right" >Refuser</a>
                        </div>
                    </div>
                        <hr>
                    <div class="row">
                        <div class="col-md-2">
                            <b style="position: center"><%out.print(daj[i].getDatedemande());%></b>
                        </div>
                    </div>
                </div>
                <%}%>
                <% } catch(Exception e){out.print(e);}%>
            </div>
        </div>
    </body>
</html>
