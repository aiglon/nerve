<%@page import="com.google.gson.Gson"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%  
   
    try{
        String nom=request.getParameter("login");
        String mdp=request.getParameter("pass");
        BddLogin logbdd=new BddLogin();
        User utilisateur=logbdd.login(nom,mdp);
        Gson gson = new Gson();
        out.print(gson.toJson(utilisateur));
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