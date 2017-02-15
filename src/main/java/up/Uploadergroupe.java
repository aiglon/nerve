package up;

import defi.Fonctiondefi;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class Uploadergroupe  extends HttpServlet  {
    private final String UPLOAD_DIRECTORY = "upload";
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name="";
        String description="";
        String idgroupe="";
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
                String uploadPath = getServletContext().getRealPath("")
                    + File.separator + UPLOAD_DIRECTORY;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                for(FileItem item : multiparts){
                    if(item.getFieldName().equals("descript")){
                        description=item.getString();
                    }
                    if(item.getFieldName().equals("idgroupe")){
                        idgroupe=item.getString();
                    }
                    if(!item.isFormField()){
                        name = new File(item.getName()).getName();
                        item.write(new File(uploadPath+File.separator+name));
                  }
                }
               
            } catch (Exception e) {
               
            }          
        }
        try
        {
            Fonctiondefi fd=new Fonctiondefi();
            fd.uploadergroupe(name, (String)request.getSession().getAttribute("iduser"), description,idgroupe);
        }
        catch(Exception e)
        {
            System.out.print(e);
        }
        request.getRequestDispatcher("detailgroupe.jsp?page=1&id="+idgroupe).forward(request, response);
     
    }
  
}