<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
    <body>
        <%  
            try{
            String nom=request.getParameter("login");
            String mdp=request.getParameter("pass");
            BddLogin logbdd=new BddLogin();
            User utilisateur=logbdd.login(nom,mdp);
            if(utilisateur==null)
            {
                response.sendRedirect("../index.html");
            }
            session.setAttribute( "pseudo", utilisateur.getPseudo() );
            session.setAttribute( "mail", utilisateur.getEmail());
            session.setAttribute( "iduser", utilisateur.getIduser() );
            response.sendRedirect("../acceuil.jsp?page=1");
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>