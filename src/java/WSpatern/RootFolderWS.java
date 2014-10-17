/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package WSpatern;

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
public class RootFolderWS {
    public static String Root_folder;
    public static String Root_folder_Id;
     public void getRoot(String token){
        try {
            DefaultHttpClient client=new DefaultHttpClient();
            HttpGet get=new HttpGet("http://documenta-dms.com/DMSWS/api/v1/dir/"+token+"/get_root");
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
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("dirLink");
            if (response.getLength() > 0) {
                Element err = (Element) response.item(0);
                Root_folder=err.getElementsByTagName("name").item(0).getTextContent();
                Root_folder_Id=err.getElementsByTagName("id").item(0).getTextContent();
              
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
        new RootFolderWS().getRoot("efbfbdefbfbd387826efbfbdefbfbd2c5c561c5d353702454558efbfbd5c26efbfbdefbfbd2573ca9e63efbfbd0aefbfbd");
        System.out.println("RootFolder "+Root_folder);
               System.out.println("RootFolder "+Root_folder_Id);
    }
}
