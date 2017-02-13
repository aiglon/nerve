package connex;
import java.sql.*;
public class Connect
{
	public Connection connpostg()throws Exception
	{
		Class.forName("org.postgresql.Driver");
                String url="jdbc:postgresql://ec2-54-83-25-217.compute-1.amazonaws.com:5432/dbpa9jrpcpf8s?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
                Connection c = DriverManager.getConnection(url,"splmkdyljhpvlv","efab4d9a80541876b90a0deb7517412707fb78f606c1508055aa60b7d13140e6");
                return c;
	}
}