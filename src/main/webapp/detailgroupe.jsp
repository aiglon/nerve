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
                String idgroupe=request.getParameter("id");
                int total=5;
                int debut=Integer.parseInt(request.getParameter("page"));
                Fonctiondefi fd=new Fonctiondefi();
                FonctGroupe fg=new FonctGroupe();
                String iduser=(String)request.getSession().getAttribute("iduser");
                int definonfini=fd.getnombredefinonfini(iduser,"perso");
                int definonfinigroupe=fd.getnombredefinonfini(idgroupe,"groupe");
                int nombregroupe=fg.nombredegroupe(iduser);
                int defiattente=fd.nombredefiattente(iduser,"perso");
                int defiattentegroupe=fd.nombredefiattente(idgroupe,"groupe");
                Defi[] d=fd.getdefigroupe(debut, total, Integer.parseInt(idgroupe));
                BddLogin bdd=new BddLogin();
                int nombredemande=bdd.nombredemande();
                int taille=d.length;
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
                        <a href="listemembre.jsp?id=<%out.print(idgroupe);%>" class="btnStyle"><i class="fa fa-group iconStyle"></i>Liste des membres</a>
                    </li>
                    <li>
                        <a href="groupe.jsp?page=1" class="btnStyle"><i class="fa fa-group iconStyle"></i>Groupes(<%out.print(nombregroupe);%>)</a>
                    </li>
                    <li>
                        <a href="defi.jsp?id=<%out.print(iduser);%>&type=perso" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Defi en attente(<%out.print(defiattente);%>)</a>
                    </li>
                    <li>
                        <a href="defiattentegroupe.jsp?id=<%out.print(idgroupe);%>&type=groupe" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Defi en attente groupe(<%out.print(defiattentegroupe);%>)</a>
                    </li>
                    <li>
                        <a href="listedemande.jsp" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Joueur(s) cherchant defi(<%out.print(nombredemande);%>)</a>
                    </li>
                    <li>
                        <a href="listenonfini.jsp?page=1" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Defi non fini(<%out.print(definonfini);%>)</a>
                    </li>
                    <li>
                        <a href="listenonfinigroupe.jsp?page=1&id=<%out.print(idgroupe);%>" class="btnStyle"><i class="fa fa-newspaper-o iconStyle"></i>Defi non fini groupe(<%out.print(definonfinigroupe);%>)</a>
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
                <div class="vidPane">
                    <form action="verification/envoye.jsp" method="post" class="form-group">                      
                        <textarea style="display: block;resize: none" class="form-control" type="text" name="descript" placeholder="Description..."  required></textarea>
                        <br>
                        <input style="display: inline-block;" class="btn btn-primary" type="submit" value="Envoyer Defi" />
                        <input style="display: inline-block;" class="" type="hidden" name="destinataire" value="<%out.print(idgroupe);%>"/>
                        <input style="display: inline-block;" class="" type="hidden" name="typedestinataire" value="groupe"/>
                    </form>
                </div>
                <% for(int i=0;i<taille;i++){%>
                <% if(d[i]!=null){
                    User u=d[i].getConcerne();%>
                <div class="vidPane">
                    <div class="row">
                        <a class="col-md-12" href="detail.jsp?page=1&id=<%out.print(u.getIduser());%>"><%out.print(u.getPseudo());%></a>
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
                            <a href="detailgroupe.jsp?id=<%out.print(idgroupe);%>&page=<%out.print(debut+total-1);%>" class="btn btn-primary" >Plus de video</a>
                        </div>
                        <div class="col-md-4">
                            <a href="ajoutmembre.jsp?id=<%out.print(idgroupe);%>" class="btn btn-primary "  >Ajouter membre</a>
                        </div>
                    </div>
                </div>
                <% } catch(Exception e){out.print(e);}%>
            </div>
        </div>
    </body>
</html>
