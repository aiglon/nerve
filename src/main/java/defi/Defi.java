package defi;
import user.*;
public class Defi
{
	String nomdefi;
	User concerne;
	String idpost;
	String urlvideo;
    String datevideo;
    String src;

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

        public String getDatevideo() {
            return datevideo;
        }

        public void setDatevideo(String datevideo) {
            this.datevideo = datevideo;
        }
	public void setIdpost(String idpost)
	{
		this.idpost=idpost;
	}
	public void setNomdefi(String nomdefi)
	{
		this.nomdefi=nomdefi;
	}
	public void setUrlvideo(String urlvideo)
	{
		this.urlvideo=urlvideo;
	}
	public void setConcerne(User concerne)
	{
		this.concerne=concerne;
	}
	public String getIdpost()
	{
		return idpost;
	}
	public String getNomdefi()
	{
		return nomdefi;
	}
	public User getConcerne()
	{
		return concerne;
	}
	public String getUrlvideo()
	{
		return urlvideo;
	}
}