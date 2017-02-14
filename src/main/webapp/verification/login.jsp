
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%  
   
    try{
        String nom=request.getParameter("login");
        String mdp=request.getParameter("pass");
        BddLogin logbdd=new BddLogin();
        User utilisateur=logbdd.login(nom,mdp);
        if(utilisateur==null)
        {             
            response.sendRedirect("../index.jsp");
        }
        if(utilisateur.getEmail().compareTo("aiglon@gmail.com")==0 && utilisateur.getPseudo().compareTo("Bo")==0)
        {
            response.sendRedirect("../admin/index.jsp?page=1");
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