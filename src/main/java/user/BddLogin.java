package user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import connex.Connect;

public class BddLogin
{
	public static User login(String user, String mdp) throws Exception
	{
		User userObj = new User();
		String req="select * from  utilisateur where (login='"+ user +"' or email='"+ user +"') and mdp=md5('"+mdp+"')";
		Connect con=new Connect();
                Connection c=con.connpostg();
		Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		ResultSet res=st.executeQuery(req);
		res.next();
		try{
	        userObj.setIduser(res.getString("iduser"));
	        userObj.setPseudo(res.getString("pseudo"));
	        userObj.setEmail(res.getString("email"));
                }
		catch(Exception ex){
			return null;
		}
		finally{			
			res.close();
			st.close();
			c.close();
		}
                return userObj ;
	}
	
	public static boolean inscription (String nom, String mail, String mdp) throws Exception
	{
		if(!haveAccount(mail) && !compteExistant(nom, mdp))
		{	
			String req="insert into utilisateur values('"+nom+"', md5('"+mdp+"'),'"+mail+"','"+nom+"',nextval('idutilisateur'))";
			Connect con=new Connect();
                        Connection c=con.connpostg();
			Statement st=c.createStatement();
                        st.executeUpdate(req);
                        st.close();
                        c.close();
                        return true;
                }
                return false;
	}
	
	public static boolean haveAccount(String email)throws Exception
	{
		String req="select * from  utilisateur where email='"+email+"'";
		Connect con=new Connect();
                Connection c=con.connpostg();
                Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ResultSet res=st.executeQuery(req);
                res.last();
                int taille=res.getRow();
                res.close();
                st.close();
                c.close();
                return taille>0;
	}
	
	public static boolean compteExistant(String nom,String mdp)throws Exception
	{
		String req="select * from  utilisateur where login='"+nom+"' and mdp=md5('"+mdp+"')";
		Connect con=new Connect();
                Connection c=con.connpostg();
                Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ResultSet res=st.executeQuery(req);
                res.last();
                int taille=res.getRow();
                res.close();
                st.close();
                c.close();
                return taille>0;
	}
        public boolean checkmdp(String mdp,String user)throws Exception
        {
            String req="select * from  utilisateur where email='"+user+"' and mdp=md5('"+mdp+"')";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int taille=res.getRow();
            res.close();
            st.close();
            c.close();
            return taille>0;
        }
        public boolean changermdp(String user,String mdp,String mdpnv,String mdpconf)throws Exception
        {
            if(mdpnv.compareTo(mdpconf)!=0)
            {
                return false;
            }
            if(!checkmdp(mdp,user))
            {
                return false;
            }
            String req="update  utilisateur set mdp=md5('"+mdpnv+"') where mdp=md5('"+mdp+"') and email='"+user+"'";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement();
            st.executeUpdate(req);
            st.close();
            c.close();
            return true;
        }
        public boolean changerpseudo(String user,String nouveaupseudo)throws Exception
        {
            String req="update  utilisateur set pseudo='"+nouveaupseudo+"' where email='"+user+"'";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement();
            st.executeUpdate(req);
            st.close();
            c.close();
            return true;
        }
        public static void envoyedefi (String description, String destinataire, String typedestinataire,String iduser) throws Exception
	{
            String req="insert into demandedefi values(nextval('demandedefi_iddemande_seq'),"+iduser+",now(),'"+description+"',-1,"+destinataire+",'"+typedestinataire+"')";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement();
            st.executeUpdate(req);
            st.close();
            c.close();
	}
        public void accepterdefi(String iddemande)throws Exception
        {
            String req="update  demandedefi set confirme='1' where iddemande="+iddemande+"";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement();
            st.executeUpdate(req);
            st.close();
            c.close();
        }
        public void refuserdefi(String iddemande)throws Exception
        {
            String req="update  demandedefi set confirme='0' where iddemande="+iddemande+"";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement();
            st.executeUpdate(req);
            st.close();
            c.close();
        }
        public int nombredemande()throws Exception
        {
            String req="select * from requetedefi where confirme='0'";
            Connect con=new Connect();
            Connection c=con.connpostg();
            Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet res=st.executeQuery(req);
            res.last();
            int taille=0;
            taille=res.getRow();
            res.close();
            st.close();
            c.close();
            return taille;
        }
}