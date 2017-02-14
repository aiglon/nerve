
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%  
    
    try{
        String nom=request.getParameter("pseudo");
        String mdp=request.getParameter("pass");
        String mail=request.getParameter("mail");
        BddLogin logbdd=new BddLogin();
       
        if(logbdd.inscription(nom,mail,mdp))
        {
            
            response.sendRedirect("../index.jsp");
        }
       
        response.sendRedirect("../inscription.jsp");
    }
    catch(Exception e){
        out.print(e);
    }
%>