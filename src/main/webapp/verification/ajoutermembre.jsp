<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="groupe.*"%>
<!DOCTYPE html>
<html>
        <% 
            if(request.getSession()==null)
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
                String iduser=request.getParameter("id");
                String idgroupe=request.getParameter("idgroupe");
                FonctGroupe fg=new FonctGroupe();
                fg.ajoutmembre(idgroupe, iduser);
                response.sendRedirect("../ajoutmembre.jsp?id="+idgroupe);
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>