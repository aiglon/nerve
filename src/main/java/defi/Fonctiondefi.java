package defi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import connex.Connect;
import user.Requetedefi;
import user.User;

public class Fonctiondefi {
    public Defi[] getdefiacceuil(int debut,int total)throws Exception
    {
        String req="select * from defi d join utilisateur u on u.iduser=d.iduser  order by datedefi desc limit "+total+" offset "+(debut-1);
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet res=st.executeQuery(req);
        res.last();
        int taille=res.getRow();
        Defi[] defi=new Defi[taille];
        res.beforeFirst();
        int i=0;
	while(res.next())
        {
            defi[i]=new Defi();
            defi[i].setIdpost(res.getString("idpost"));
            defi[i].setNomdefi(res.getString("nomvideo"));
            defi[i].setUrlvideo(res.getString("urlvideo"));
            defi[i].setDatevideo(res.getString("datedefi"));         
            defi[i].setSrc("http://testsahve.herokuapp.com/upload/"+res.getString("urlvideo"));         
            User u=new User();
            u.setIduser(res.getString("iduser"));
            u.setPseudo(res.getString("pseudo"));
            defi[i].setConcerne(u);
            i++;
        }
        res.close();
        st.close();
        c.close();
        return defi;
    }
    public Defi[] getdefiprofile(int debut,int total,int iduser)throws Exception
    {
        String req="select * from defi d join utilisateur u on u.iduser=d.iduser where d.iduser="+iduser+"  order by datedefi desc limit "+total+" offset "+(debut-1) ;
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet res=st.executeQuery(req);
        res.last();
        int taille=res.getRow();
        Defi[] defi=new Defi[taille];
        res.beforeFirst();
        int i=0;
        while(res.next())
        {
            defi[i]=new Defi();
            defi[i].setIdpost(res.getString("idpost"));
            defi[i].setNomdefi(res.getString("nomvideo"));
            defi[i].setUrlvideo(res.getString("urlvideo"));
            defi[i].setDatevideo(res.getString("datedefi"));
            defi[i].setSrc("http://testsahve.herokuapp.com/upload/"+res.getString("urlvideo"));
            User u=new User();
            u.setIduser(res.getString("iduser"));
            u.setPseudo(res.getString("pseudo"));
            defi[i].setConcerne(u);
            i++;
        }
        res.close();
        st.close();
        c.close();
        return defi;
    }
    public Defi[] getdefigroupe(int debut,int total,int iduser)throws Exception
    {
        String req="select * from defigroupe dg join defi d on d.idpost=dg.idpost join utilisateur u on u.iduser=d.iduser where dg.idgroupe="+iduser+"  order by datedefi desc limit "+total+" offset "+(debut-1) ;
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet res=st.executeQuery(req);
        res.last();
        int taille=res.getRow();
        Defi[] defi=new Defi[taille];
        res.beforeFirst();
        int i=0;
        while(res.next())
        {
            defi[i]=new Defi();
            defi[i].setIdpost(res.getString("idpost"));
            defi[i].setNomdefi(res.getString("nomvideo"));
            defi[i].setUrlvideo(res.getString("urlvideo"));
            defi[i].setDatevideo(res.getString("datedefi"));
            defi[i].setSrc("http://testsahve.herokuapp.com/upload/"+res.getString("urlvideo"));
            User u=new User();
            u.setIduser(res.getString("iduser"));
            u.setPseudo(res.getString("pseudo"));
            defi[i].setConcerne(u);
            i++;
        }
        res.close();
        st.close();
        c.close();
        return defi;
    }
    public void uploader(String nom,String user,String description)throws Exception
    {
        String req="insert into defi values(nextval('defi_idpost_seq'),"+user+",'"+nom+"','"+description+"',now())";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement();
        st.executeUpdate(req);
        st.close();
        c.close();
    }
    public void uploadergroupe(String nom,String user,String description,String idgroupe)throws Exception
    {
        String req="insert into defi values(nextval('defi_idpost_seq'),"+user+",'"+nom+"','"+description+"',now())";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement();
        st.executeUpdate(req);
        req="insert into defigroupe values(currval('defi_idpost_seq'),"+idgroupe+")";
        st.executeUpdate(req);
        st.close();
        c.close();
    }
    public void effacer(String idpost)throws Exception
    {
        String req="delete from defi where idpost="+idpost;
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement();
        st.executeUpdate(req);
        st.close();
        c.close();
    }
    public int nombredefiattente(String iduser,String type)throws Exception
    {
        String req="select * from  demandedefi where destination="+iduser+" and confirme='-1' and typedestination='"+type+"'";
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
    public Defiajouer[] getdefienattente(String user,String type)throws Exception
    {
        String req="select * from  demandedefi dd join utilisateur u on dd.iduser=u.iduser where destination="+user+" and confirme='-1' and typedestination='"+type+"'";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet res=st.executeQuery(req);
        res.last();
        int taille=0;
        taille=res.getRow();
        Defiajouer[] resultat=new Defiajouer[taille];
        res.beforeFirst();
        int i=0;
        while(res.next())
        {
            resultat[i]=new Defiajouer();
            resultat[i].setNomdefi(res.getString("nomdefi"));
            resultat[i].setIduser(res.getString("iduser"));
            resultat[i].setPseudo(res.getString("pseudo"));
            resultat[i].setDatedemande(res.getString("datedemandedefi"));
            resultat[i].setIddefi(res.getString("iddemande"));
            i++;
        }
        res.close();
        st.close();
        c.close();
        return resultat;
    }
    public Defiajouer[] getdefifini(String user,String type)throws Exception
    {
        String req="select * from  demandedefi dd join defi d on dd.nomdefi=d.nomvideo where dd.destination="+user+" and confirme='1' and typedestination='"+type+"'";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet res=st.executeQuery(req);
        res.last();
        int taille=0;
        taille=res.getRow();
        Defiajouer[] resultat=new Defiajouer[taille];
        res.beforeFirst();
        int i=0;
        while(res.next())
        {
            resultat[i]=new Defiajouer();
            resultat[i].setNomdefi(res.getString("nomdefi"));
            resultat[i].setDatedemande(res.getString("datedemandedefi"));
            resultat[i].setIddefi(res.getString("idpost"));
            i++;
        }
        res.close();
        st.close();
        c.close();
        return resultat;
    }
    public Defiajouer[] getdefinonfini(String user,String type)throws Exception
    {
        String req="select * from utilisateur u join demandedefi dd on u.iduser=dd.iduser left join defi d on dd.nomdefi=d.nomvideo where dd.destination="+user+" and confirme='1' and typedestination='"+type+"' and d.iduser is null";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet res=st.executeQuery(req);
        res.last();
        int taille=0;
        taille=res.getRow();
        Defiajouer[] resultat=new Defiajouer[taille];
        res.beforeFirst();
        int i=0;
        while(res.next())
        {
            resultat[i]=new Defiajouer();
            resultat[i].setIduser(res.getString("iduser"));
            resultat[i].setPseudo(res.getString("pseudo"));
            resultat[i].setNomdefi(res.getString("nomdefi"));
            resultat[i].setDatedemande(res.getString("datedemandedefi"));
            resultat[i].setIddefi(res.getString("iddemande"));
            i++;
        }
        res.close();
        st.close();
        c.close();
        return resultat;
    }
    public int getnombredefinonfini(String user,String type)throws Exception
    {
        String req="select * from utilisateur u join demandedefi dd on u.iduser=dd.iduser left join defi d on dd.nomdefi=d.nomvideo where dd.destination="+user+" and confirme='1' and typedestination='"+type+"' and d.iduser is null";
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
    public void demanderdefi(String iduser,String difficulte)throws Exception
    {
        String req="insert into requetedefi values(nextval('idrequetedefi'),"+iduser+",'"+difficulte+"',now(),'0')";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement();
        st.executeUpdate(req);
        st.close();
        c.close();
    }
    public Requetedefi[] getallrequete()throws Exception
    {
        String req="select * from utilisateur u join requetedefi rd on u.iduser=rd.iduser where rd.confirme='0' and Extract(DAY from now())-Extract(DAY from rd.datedemandereq)<7";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet res=st.executeQuery(req);
        res.last();
        int taille=0;
        taille=res.getRow();
        Requetedefi[] resultat=new Requetedefi[taille];
        res.beforeFirst();
        int i=0;
        while(res.next())
        {
            resultat[i]=new Requetedefi();
            resultat[i].setIduser(res.getString("iduser"));
            resultat[i].setPseudo(res.getString("pseudo"));
            resultat[i].setDatedemande(res.getString("datedemandereq"));
            resultat[i].setDifficulte(res.getString("difficulte"));
            i++;
        }
        res.close();
        st.close();
        c.close();
        return resultat;
    }
}
