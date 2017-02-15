<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<%  
    
    try{
        String description=request.getParameter("descript");
        String destinataire=request.getParameter("destinataire");
        String typedestinataire=request.getParameter("typedestinataire");
        String iduser=(String)request.getSession().getAttribute("iduser");
        BddLogin logbdd=new BddLogin();
        logbdd.envoyedefi(description, destinataire, typedestinataire, iduser);
        if(typedestinataire.compareTo("groupe")!=0)
        {
            response.sendRedirect("../detail.jsp?page=1&id="+destinataire);
        }
        response.sendRedirect("../detailgroupe.jsp?page=1&id="+destinataire);
    }
    catch(Exception e){
        out.print(e);
    }
%>