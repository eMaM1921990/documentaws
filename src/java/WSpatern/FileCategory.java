/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package WSpatern;

import static WSpatern.ListOfFile.files;
import static WSpatern.ListOfFile.files_Id;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 *
 * @author emam
 */
public class FileCategory {
    public static String category;
     public void getFile(String token,String id){
        try {
            DefaultHttpClient client=new DefaultHttpClient();
            HttpGet get=new HttpGet("http://documenta-dms.com/DMSWS/api/v1/file/"+token+"/category_by_id/"+id);
            HttpResponse response = client.execute(get);
             BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {

                System.out.println(line);
             parseXML(line);

            }
        } catch (IOException ex) {
            Logger.getLogger(ValidTokenWS.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
     
     
     private void parseXML(String line) {
         files.removeAllElements();
         files_Id.removeAllElements();
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("categoryLink");
            if (response.getLength() > 0) {
                for(int i=0;i<response.getLength();i++){
                    Element err = (Element) response.item(i);
                category=err.getElementsByTagName("category").item(0).getTextContent();
               
              
                }
                
            }
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(LoginWS.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(LoginWS.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginWS.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     public static void main(String[] args) {
        new FileCategory().getFile("4aefbfbd64efbfbd77efbfbd70efbfbd27efbfbd60efbfbd2cefbfbdefbfbdefbfbd0308efbfbdefbfbd55efbfbdefbfbdefbfbd11efbfbdefbfbd28efbfbd497d", "-114496");
    }
}
