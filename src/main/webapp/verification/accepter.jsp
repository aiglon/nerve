<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="user.*"%>
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
                String iddemande=request.getParameter("id");
                String type=request.getParameter("type");
                BddLogin bdd=new BddLogin();
                if(type.compareTo("accepter")==0)
                {
                    bdd.accepterdefi(iddemande);
                }
                else
                {
                    bdd.refuserdefi(iddemande);
                }
                response.sendRedirect("../groupe.jsp?id="+(String)request.getSession().getAttribute("iduser") +"&type=groupe");
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>