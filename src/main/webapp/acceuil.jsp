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
                Defi[] d=fd.getdefiacceuil(debut, total);
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
                <ul>
                    <li>
                        <a href="acceuil.jsp?page=1" class="btnStyle"><i class="fa fa-home iconStyle"></i>Actus</a>
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
                        <a class="col-md-12" href="detail.jsp?page=1&id=<%out.print(u.getIduser());%>"><%out.print(u.getPseudo());%></a>
                    </div>             
                    <div class="row">
                        <p><%out.print(d[i].getNomdefi());%></p>
                    </div>
                    <video class="row vidStyle" src="<%out.print("upload/"+d[i].getUrlvideo());%>" controls="controls"></video>
                </div>
                <%}}%>
                <div class="row">
                    <div class="col-md-8">
                        <a href="acceuil.jsp?page=<%out.print(debut+total-1);%>" class="btn btn-primary" >Plus de video</a>
                    </div>
                </div>
                <% } catch(Exception e){out.print(e);}%>
            </div>
        </div>
    </body>
</html>
