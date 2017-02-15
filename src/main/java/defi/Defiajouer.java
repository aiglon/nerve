package defi;
import user.*;
public class Defiajouer extends User{
    private String nomdefi;
    private String datedemande;
    private String iddefi;

    public String getNomdefi() {
        return nomdefi;
    }

    public void setNomdefi(String nomdefi) {
        this.nomdefi = nomdefi;
    }

    public String getDatedemande() {
        return datedemande;
    }

    public void setDatedemande(String datedemande) {
        this.datedemande = datedemande;
    }

    public String getIddefi() {
        return iddefi;
    }

    public void setIddefi(String iddefi) {
        this.iddefi = iddefi;
    }
}
