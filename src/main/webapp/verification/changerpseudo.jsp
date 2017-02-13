<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<!DOCTYPE html>
<html>
        <% 
            if(request.getSession()==null)
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
                String nouveaupseudo=request.getParameter("nvpseudo");
                String user=(String)request.getSession().getAttribute("mail");
                BddLogin bdd=new BddLogin();
                if(bdd.changerpseudo(user,nouveaupseudo))
                {
                    request.getSession().setAttribute("pseudo",nouveaupseudo);
                    response.sendRedirect("../profile.jsp?page=1");
                }
                response.sendRedirect("../configurationpseudo.jsp");
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>