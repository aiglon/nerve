package commentaire;
import java.sql.Connection;
import java.sql.Statement;

import connex.Connect;
import java.sql.ResultSet;
public class FonctComm
{
	public void commenter(String contenu,String idpost,String user)throws Exception
	{
		String req="insert into commentaire values(nextval('commentaire_idcommentaire_seq'),"+user+","+idpost+",'"+contenu+"')";
		Connect con=new Connect();
                Connection c=con.connpostg();
		Statement st=c.createStatement();
                st.executeUpdate(req);
                st.close();
                c.close();
	}
        public Commentaire[] getcommentaire(String post)throws Exception
        {
            int taille=0;
            String req="select * from  commentaire c join utilisateur u on c.iduser=u.iduser where idpost="+post;
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            taille=res.getRow();
            res.beforeFirst();
            int i=0;
            Commentaire[] comm=new Commentaire[taille];
            while(res.next())
            {
                comm[i]=new Commentaire();
                comm[i].setContenu(res.getString("idpost"));
                i++;
            }
            res.close();
            st.close();
            c.close();
            return comm;
        }
}