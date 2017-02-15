package groupe;
import user.*;
public class Groupe
{
    private String idgroupe;
    private String nomgroupe;
    private User membre;
    private String nbrmembre;
    private String idchef;

    public String getIdgroupe() {
        return idgroupe;
    }

    public void setIdgroupe(String idgroupe) {
        this.idgroupe = idgroupe;
    }

    public String getNomgroupe() {
        return nomgroupe;
    }

    public void setNomgroupe(String nomgroupe) {
        this.nomgroupe = nomgroupe;
    }

    public User getMembre() {
        return membre;
    }

    public void setMembre(User membre) {
        this.membre = membre;
    }

    public String getNbrmembre() {
        return nbrmembre;
    }

    public void setNbrmembre(String nbrmembre) {
        this.nbrmembre = nbrmembre;
    }

    public String getIdchef() {
        return idchef;
    }

    public void setIdchef(String idchef) {
        this.idchef = idchef;
    }
	
	
}