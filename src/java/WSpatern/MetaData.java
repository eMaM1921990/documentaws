/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package WSpatern;

import static WSpatern.DownloadLink.download_link;
import static WSpatern.FileCategory.category;
import static WSpatern.ListOfFile.files;
import static WSpatern.ListOfFile.files_Id;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
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
public class MetaData {
    public static List<String> codAtribut=new  ArrayList<String>();
   public static List<String> valoare=new  ArrayList<String>();
     public void getMeta(String token,String id){
        try {
            DefaultHttpClient client=new DefaultHttpClient();
            HttpGet get=new HttpGet("http://documenta-dms.com/DMSWS/api/v1/file/"+token+"/meta_by_id/"+id);
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
         codAtribut.clear();
         valoare.clear();
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("atribute");
            if (response.getLength() > 0) {
                for(int i=0;i<response.getLength();i++){
                    Element err = (Element) response.item(i);
                    if(err.getElementsByTagName("codAtribut").getLength()>0){
                        codAtribut.add(err.getElementsByTagName("codAtribut").item(0).getTextContent());
                    }else{
                        codAtribut.add("");
                    }
                    
                    if(err.getElementsByTagName("valoare").getLength()>0){
                        valoare.add(err.getElementsByTagName("valoare").item(0).getTextContent());
                    }else{
                        valoare.add("");
                    }
                  
               
              
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
        new MetaData().getMeta("724fefbfbd455d4605efbfbdefbfbd7615efbfbdefbfbd6f3b7750efbfbd48efbfbd16efbfbd6fefbfbdefbfbd3f576c0befbfbdefbfbdefbfbd", "-180938");
    }
}
