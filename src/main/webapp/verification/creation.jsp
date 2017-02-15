<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="groupe.*"%>
<!DOCTYPE html>
<html>
        <% 
            if(request.getSession().getAttribute("pseudo")==null)
            {
                response.sendRedirect("../index.jsp");
            }
        %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
    <body>
        <%  
            try{
                String nomgroupe=request.getParameter("nomgroupe");
                String user=(String)request.getSession().getAttribute("iduser");
                FonctGroupe fg=new FonctGroupe();
                int id=fg.creationgroupe(user, nomgroupe);
                response.sendRedirect("../detailgroupe.jsp?id="+id);
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>