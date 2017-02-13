<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%  
    response.setContentType("application/json;charset=UTF-8");
    response.setHeader("Cache-control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "-1");
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "POST");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type");
    response.setHeader("Access-Control-Max-Age", "86400");
    try{
        String nom=request.getParameter("pseudo");
        String mdp=request.getParameter("pass");
        String mail=request.getParameter("mail");
        BddLogin logbdd=new BddLogin();
        Gson gson = new Gson();
        if(logbdd.inscription(nom,mail,mdp))
        {
            out.print(gson.toJson("asdfasdf"));
            response.sendRedirect("../index.html");
        }
        out.print(gson.toJson("true"));
        response.sendRedirect("../inscription.jsp");
    }
    catch(Exception e){
        out.print(e);
    }
%>