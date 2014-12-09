/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package WSpatern;

import static WSpatern.RootFolderWS.Root_folder;
import static WSpatern.RootFolderWS.Root_folder_Id;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
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
public class SubFolderWS {
     public static List<String> sub_folder=new ArrayList<String>();
    public static List<String> sub_folder_Id=new ArrayList<String>();
    
     public void getRoot(String token,String Id){
        try {
            DefaultHttpClient client=new DefaultHttpClient();
            HttpGet get=new HttpGet("http://documenta-dms.com/DMSWS/api/v1/dir/"+token+"/get_subfolders/"+Id);
            HttpResponse response = client.execute(get);
             BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {

                System.out.println("Sub"+line);
             parseXML(line);

            }
        } catch (IOException ex) {
            Logger.getLogger(ValidTokenWS.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
     
      private void parseXML(String line) {
           sub_folder.clear();
              sub_folder_Id.clear();
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("dirLink");
            if (response.getLength() > 0) {
                for(int i=0;i<response.getLength();i++){
                    Element err = (Element) response.item(i);
                sub_folder.add(err.getElementsByTagName("name").item(0).getTextContent());
                sub_folder_Id.add(err.getElementsByTagName("id").item(0).getTextContent());
           ///   System.out.println("Folder "+"-->" +sub_folder);
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
     
 
     /*
     public static void main(String[] args) {
       //  RootFolderWS x=new RootFolderWS();
         //x.getRoot("efbfbde982a5efbfbdefbfbd27efbfbd67efbfbd71efbfbddca2efbfbdefbfbd411706efbfbd36685574efbfbdefbfbd3f2defbfbd33efbfbdefbfbd");
        new SubFolderWS().getRoot("efbfbdefbfbd76efbfbdefbfbdefbfbd44efbfbd17efbfbd4cefbfbd38efbfbdefbfbd2fefbfbdefbfbd6cefbfbd4114c89eefbfbdefbfbd41efbfbd2902efbfbd","17271" );
        for(int i=0;i<sub_folder.size();i++){
            System.out.println("Folder "+i +"-->" +sub_folder.get(i));
        }
    }*/
}
