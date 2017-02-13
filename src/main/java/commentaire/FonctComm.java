package commentaire;
import java.sql.Connection;
import java.sql.Statement;

import connex.Connect;
public class FonctComm
{
	public void commenter(String contenu,String idpost,String user)throws Exception
	{
		String req="insert into commentaire values(nextval('commentaire_idcommentaire_seq'),"+user+","+idpost+",'"+contenu+"')";
		Connect con=new Connect();
        Connection c=con.connpostg();
		Statement st=c.createStatement();
        st.executeUpdate(req);
        c.close();
	}
}