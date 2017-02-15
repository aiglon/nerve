<%@ page import="defi.*"%>
<!DOCTYPE html>
<html>
<head>
	<TITLE>Confirmation de Conge</TITLE>
</head>
<body>
	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<% 
			String difficulte=request.getParameter("checker");
                        String iduser=(String)request.getSession().getAttribute("iduser");
			try{
                            Fonctiondefi fd=new Fonctiondefi();
                            fd.demanderdefi(iduser, difficulte);
                            response.sendRedirect("../profile.jsp?page=1");
                        }
			catch(Exception e)
			{
                            out.print(e);
			}
		%>
	</div>
</body>
</html>
