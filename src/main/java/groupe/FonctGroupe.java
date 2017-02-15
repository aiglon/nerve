package groupe;

import java.sql.Connection;
import java.sql.Statement;
import user.User;
import connex.Connect;
import java.sql.ResultSet;
public class FonctGroupe
{
	public int creationgroupe(String user,String nomgroupe)throws Exception
	{
		String req="insert into groupe values(nextval('GROUPE_idgroupe_seq'),'"+nomgroupe+"',"+user+")";
		Connect con=new Connect();
                Connection c=con.connpostg();
		Statement st=c.createStatement();
                st.executeUpdate(req);
                req="insert into membregroupe values("+user+",currval('GROUPE_idgroupe_seq'))";
                st.executeUpdate(req);
                req="select currval('GROUPE_idgroupe_seq') id";
                ResultSet res=st.executeQuery(req);
                res.next();
                int idgroupe=res.getInt("id");
                st.close();
                c.close();
                return idgroupe;
	}
	public void ajoutmembre(String idgroupe,String user)throws Exception
	{
		String req="insert into membregroupe values("+user+","+idgroupe+")";
		Connect con=new Connect();
                Connection c=con.connpostg();
		Statement st=c.createStatement();
                st.executeUpdate(req);
                st.close();
                c.close();
	}
        public User[] getalluser(String idgroupe)throws Exception
        {
            String req="select * from  utilisateur u  left join membregroupe mg on mg.iduser=u.iduser where mg.iduser is null and (mg.idgroupe="+idgroupe+" or mg.idgroupe is null)";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int taille=0;
            taille=res.getRow();
            User[] u=new User[taille];
            res.beforeFirst();
            int i=0;
            while(res.next())
            {
                u[i]=new User();
                u[i].setIduser(res.getString("iduser"));
                u[i].setPseudo(res.getString("pseudo"));
                i++;
            }
            res.close();
            st.close();
            c.close();
            return u;
        }
        public User[] getmembre(String idgroupe)throws Exception
        {
            String req="select u.iduser,u.pseudo,g.proprietaire from utilisateur u join membregroupe mg on mg.iduser=u.iduser join groupe g on g.idgroupe=mg.idgroupe where mg.idgroupe="+idgroupe;
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int taille=0;
            taille=res.getRow();
            User[] u=new User[taille];
            res.beforeFirst();
            int i=0;
            while(res.next())
            {
                u[i]=new User();
                u[i].setIduser(res.getString("iduser"));
                u[i].setPseudo(res.getString("pseudo"));
                u[i].setProprietaire(res.getString("proprietaire"));
                i++;
            }
            res.close();
            st.close();
            c.close();
            return u;
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
        public int nombredegroupe(String user)throws Exception
        {
            String req="select * from  membregroupe where iduser="+user;
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int resultat=0;
            resultat=res.getRow();
            res.close();
            st.close();
            c.close();
            return resultat;
        }
        public Groupe[] getgroupeuser(String user)throws Exception
        {
            String req="select g.idgroupe,g.nomgroupe,u.pseudo,u.iduser,(select count(idgroupe) from membregroupe where idgroupe=mg.idgroupe) nbrmembre from  groupe g join membregroupe mg on mg.idgroupe=g.idgroupe join utilisateur u on u.iduser=g.proprietaire where  mg.iduser="+user;
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int taille=0;
            taille=res.getRow();
            Groupe[] resultat=new Groupe[taille];
            res.beforeFirst();
            int i=0;
            while(res.next())
            {
                User u=new User();
                u.setPseudo(res.getString("pseudo"));
                u.setIduser(res.getString("iduser"));
                resultat[i]=new Groupe();
                resultat[i].setIdgroupe(res.getString("idgroupe"));
                resultat[i].setNomgroupe(res.getString("nomgroupe"));
                resultat[i].setMembre(u);
                resultat[i].setNbrmembre(res.getString("nbrmembre"));
                i++;
            }
            res.close();
            st.close();
            c.close();
            return resultat;
        }
        public Groupe[] getallgroupe()throws Exception
        {
            String req="select * from  groupe g join utilisateur u on u.iduser=g.proprietaire ";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int taille=0;
            taille=res.getRow();
            Groupe[] resultat=new Groupe[taille];
            res.beforeFirst();
            int i=0;
            while(res.next())
            {
                User u=new User();
                u.setPseudo(res.getString("pseudo"));
                u.setIduser(res.getString("iduser"));
                resultat[i]=new Groupe();
                resultat[i].setIdgroupe(res.getString("idgroupe"));
                resultat[i].setNomgroupe(res.getString("nomgroupe"));
                resultat[i].setMembre(u);
                i++;
            }
            res.close();
            st.close();
            c.close();
            return resultat;
        }
        public void sortirgroupe(String idgroupe,String iduser)throws Exception
        {
            String req="select * from  membregroupe where idgroupe= "+idgroupe;
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int taille=0;
            taille=res.getRow();
            String req1="delete from groupe where idgroupe="+idgroupe;
            req="delete from membregroupe where iduser="+iduser+" and idgroupe="+idgroupe;
            st.executeUpdate(req);
            if(taille==1)
            {
                st.executeUpdate(req1);
            }
            st.close();
            res.close();
            c.close();
        }
	
}