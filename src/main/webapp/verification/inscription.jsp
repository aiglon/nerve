<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
    <body>
        <%  
            try{
            String nom=request.getParameter("pseudo");
            String mdp=request.getParameter("pass");
            String mail=request.getParameter("mail");
            BddLogin logbdd=new BddLogin();
            if(logbdd.inscription(nom,mail, mdp))
            {
                response.sendRedirect("../index.html");
            }
            response.sendRedirect("../inscription.jsp");
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>