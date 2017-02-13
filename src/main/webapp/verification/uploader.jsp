<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="defi.*"%>
<!DOCTYPE html>
<html>
        <% 
            if(request.getSession().getAttribute("pseudo")==null)
            {
                response.sendRedirect("../index.html");
            }
        %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
    <body>
        <%  
            try{
                String nom=request.getParameter("nom");
                String description=request.getParameter("description");
                String user=(String)session.getAttribute("iduser");
                Fonctiondefi fd=new Fonctiondefi();
                fd.uploader(nom, user, description);
                response.sendRedirect("../profile.jsp?page=1");
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>