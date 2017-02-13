package commentaire;
import defi.Defi;

public class Commentaire extends Defi
{
    private String user;
    private String idComm;
    private String contenu;
	
    public void setIdComm(String idComm)
    {
            this.idComm=idComm;
    }
    public void setContenu(String contenu)
    {
            this.contenu=contenu;
    }
    public String getIdComm()
    {
            return idComm;
    }
    public String getContenu()
    {
            return contenu;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}