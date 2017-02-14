package groupe;
import user.*;
import defi.*;
public class Groupe
{
	String idgroupe;
	String nomgroupe;
	User[] membre;
	Defi[] defi;
	
	public void setIdgroupe(String idgroupe)
	{
		this.idgroupe=idgroupe;
	}
	public void setNomgroupe(String nomgroupe)
	{
		this.nomgroupe=nomgroupe;
	}
	public void setMembre(User[] membre)
	{
		this.membre=membre;
	}
	public void setDefi(Defi[] defi)
	{
		this.defi=defi;
	}
	public String getIdgroupe()
	{
		return idgroupe;
	}
	public String getNomgroupe()
	{
		return nomgroupe;
	}
	public User[] getMembre()
	{
		return membre;
	}
	public Defi[] getDefi()
	{
		return defi;
	}
}