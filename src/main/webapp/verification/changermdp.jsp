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
                String mdpact=request.getParameter("passactuel");
                String mdpnv=request.getParameter("passnouveau");
                String mdpconf=request.getParameter("passnouveau");
                String user=(String)session.getAttribute("mail");
                BddLogin bdd=new BddLogin();
                if(bdd.changermdp(user, mdpact, mdpnv, mdpconf))
                {
                    response.sendRedirect("../profile.jsp?page=1");
                }
                response.sendRedirect("../configurationmdp.jsp");
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>