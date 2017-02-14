package user;
public class User
{
	String pseudo;
	String iduser;
	String email;
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
}