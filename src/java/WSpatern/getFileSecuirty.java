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
 * @author Dev
 */
public class getFileSecuirty {
   
    public static String hasFull;
    public static String hasRead;
    public static String hasWrite;
    public static String secName;
    

    public void getSecuirty(String token,String id){
        try {
            DefaultHttpClient client=new DefaultHttpClient();
            HttpGet get=new HttpGet("http://documenta-dms.com/DMSWS/api/v1/attribute/"+token+"/file_security_by_id/"+id);
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
            NodeList response = doc.getElementsByTagName("securityLink");
            if (response.getLength() > 0) {
                for(int i=0;i<response.getLength();i++){
                    Element err = (Element) response.item(i);
                   
                hasFull=err.getElementsByTagName("hasFull").item(0).getTextContent();
                hasRead=err.getElementsByTagName("hasRead").item(0).getTextContent();
                hasWrite=err.getElementsByTagName("hasWrite").item(0).getTextContent();
                secName=err.getElementsByTagName("secName").item(0).getTextContent();
               
              
                    System.out.println("Full "+hasFull);
                    System.out.println("Read" +hasRead);
                    System.out.println("Write"+hasWrite);
                    
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
        new getFileSecuirty().getSecuirty("efbfbd3834efbfbdefbfbdefbfbd6e215aefbfbdefbfbdefbfbd5d647f1a5b6eefbfbd2a58efbfbdefbfbdefbfbd7975efbfbd0defbfbd53efbfbd", "-114496");
    }
}
