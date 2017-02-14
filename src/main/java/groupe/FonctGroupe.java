package groupe;

import java.sql.Connection;
import java.sql.Statement;

import connex.Connect;
public class FonctGroupe
{
	public void creationgroupe(String user,String nomgroupe)throws Exception
	{
		String req="insert into groupe values(nextval('GROUPE_idgroupe_seq'),'"+nomgroupe+"')";
		Connect con=new Connect();
                Connection c=con.connpostg();
		Statement st=c.createStatement();
                st.executeUpdate(req);
                req="insert into membregroupe values((select iduser from utilisateur where email='"+user+"'),currval('GROUPE_idgroupe_seq'))";
                st.executeUpdate(req);
                c.close();
	}
	public void ajoutmembre(String idgroupe,String user)throws Exception
	{
		String req="insert into membregroupe values((select iduser from utilisateur where email='"+user+"'),"+idgroupe+")";
		Connect con=new Connect();
                Connection c=con.connpostg();
		Statement st=c.createStatement();
                st.executeUpdate(req);
                c.close();
	}
	public void envoidefi(String user,String destinataire,String typedestinataire,String nomdefi)throws Exception
	{
		String req="insert into demandedefi values(nextval('demandedefi_idemande_seq'),-1,"+user+",now(),'"+nomdefi+"','-1')";
		Connect con=new Connect();
                Connection c=con.connpostg();
		Statement st=c.createStatement();
		if(typedestinataire.compareTo("groupe")==0)
		{
                    req="insert into demandedefi values(nextval('demandedefi_idemande_seq'),"+user+",-1,now(),'"+nomdefi+"','-1')";
		}
		st.executeUpdate(req);
		st.close();
		c.close();
	}
	
}