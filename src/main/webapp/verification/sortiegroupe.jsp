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
                String idgroupe=request.getParameter("id");
                String type=request.getParameter("type");
                String iduser=request.getParameter("iduser");
                FonctGroupe fg=new FonctGroupe();
                fg.sortirgroupe(idgroupe, iduser);
                if(type.compareTo("perso")==0)
                {
                    response.sendRedirect("../groupe.jsp");
                }
                response.sendRedirect("../listemembre.jsp?id="+idgroupe);
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>