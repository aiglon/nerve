package user;
public class User
{
	String pseudo;
	String iduser;
	String email;
        private String proprietaire;
	public void setPseudo(String pseudo)
	{
		this.pseudo=pseudo;
	}
	public void setIduser(String iduser)
	{
		this.iduser=iduser;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	public String getPseudo()
	{
		return pseudo;
	}
	public String getIduser()
	{
		return iduser;
	}
	public String getEmail()
	{
		return email;
	}

    public String getProprietaire() {
        return proprietaire;
    }

    public void setProprietaire(String proprietaire) {
        this.proprietaire = proprietaire;
    }
}