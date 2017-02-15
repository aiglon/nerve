<%@page import="groupe.FonctGroupe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*,defi.*"%>
<!DOCTYPE html>
<html>
        <% 
            if(request.getSession().getAttribute("pseudo")==null)
            {
                response.sendRedirect("index.jsp");
            }
            try
            {
                int debut=Integer.parseInt(request.getParameter("page"));
                int total=5;
                Fonctiondefi fd=new Fonctiondefi();
                Defi[] d=fd.getdefiprofile(debut, total, Integer.parseInt((String)request.getSession().getAttribute("iduser")));
                int taille=d.length;
                String iduser=(String)request.getSession().getAttribute("iduser");
                int definonfini=fd.getnombredefinonfini(iduser,"perso");
                FonctGroupe fg=new FonctGroupe();
                BddLogin bdd=new BddLogin();
                int nombredemande=bdd.nombredemande();
                int nombregroupe=fg.nombredegroupe(iduser);
                int defiattente=fd.nombredefiattente(iduser,"perso");
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
               
                <% for(int i=0;i<taille;i++){%>
                    <% if(d[i]!=null){
                    User u=d[i].getConcerne();%>
                <div class="vidPane">                    
                    <div class="row">
                        <a class="col-md-12" href="detail.jsp?id=<%out.print(u.getIduser());%>&page=1"><%out.print(u.getPseudo());%></a>
                    </div>
                    <div class="row">
                        <p><%out.print(d[i].getNomdefi());%></p>
                    </div>
                    <video class="row vidStyle" src="<%out.print("upload/"+d[i].getUrlvideo());%>" controls="controls"></video>
                </div>
                <%}}%>
                <div class="vidPane">
                    <div class="row">
                        <div class="col-md-8">
                            <a href="profile.jsp?page=<%out.print(debut+total-1);%>" class="btn btn-primary" >Plus de video</a>
                        </div>
                        <div class="col-md-4">
                            <a href="demandedefi.jsp" class="btn btn-primary pull-right"  >Demander un defi</a>
                        </div>
                    </div>
                </div>
                <% } catch(Exception e){out.print(e);}%>
            </div>
        </div>
    </body>
</html>
