<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="defi.*"%>
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
                String idpost=request.getParameter("id");
                Fonctiondefi fd=new Fonctiondefi();
                fd.effacer(idpost);
                response.sendRedirect("../admin/index.jsp?page=1");
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>