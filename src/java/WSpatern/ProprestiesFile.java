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
public class ProprestiesFile {

    public static List<String> prop = new ArrayList<String>();
    public static List<String> label = new ArrayList<String>();

    public void getProp(String token, String id) {
        try {
            DefaultHttpClient client = new DefaultHttpClient();
            HttpGet get = new HttpGet("http://documenta-dms.com/DMSWS/api/v1/attribute/" + token + "/file_attr_general_by_id/" + id);
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
        prop.clear();
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("docAttrLink");
            if (response.getLength() > 0) {

                for (int i = 0; i < response.getLength(); i++) {

                    Element err = (Element) response.item(i);
                 //   System.out.println("VAlues" + err.getElementsByTagName("position").item(0).getTextContent());

                    if (err.getElementsByTagName("value").getLength() >0) {
                        prop.add(err.getElementsByTagName("value").item(0).getTextContent());
                    } else {
                        prop.add("");
                    }
                    
                    if (err.getElementsByTagName("label").getLength() >0) {
                        label.add(err.getElementsByTagName("label").item(0).getTextContent());
                    } else {
                        label.add("");
                    }
                    
                    

                }

                //    Root_folder_Id=err.getElementsByTagName("id").item(0).getTextContent();
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
        new ProprestiesFile().getProp("5befbfbdddb91f6c6701efbfbdefbfbd1b44efbfbdefbfbd72efbfbdefbfbd5eefbfbd0e47efbfbd6672efbfbdefbfbd43efbfbdefbfbd61efbfbd", "-126651");
        for(int i=0;i<prop.size();i++){
            System.out.println(i+">"+prop.get(i));
        }
    }
}
