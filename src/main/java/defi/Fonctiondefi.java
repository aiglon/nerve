package defi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import connex.Connect;
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
        return defi;
    }
    public void uploader(String nom,String user,String description)throws Exception
    {
        String req="insert into defi values(nextval('defi_idpost_seq'),"+user+",'"+nom+"','"+description+"',now())";
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement();
        st.executeUpdate(req);
        c.close();
    }
    public void effacer(String idpost)throws Exception
    {
        String req="delete from defi where idpost="+idpost;
        Connect con=new Connect();
        Connection c=con.connpostg();
        Statement st=c.createStatement();
        st.executeUpdate(req);
        c.close();
    }
}
