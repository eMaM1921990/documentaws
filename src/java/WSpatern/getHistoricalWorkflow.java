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
public class getHistoricalWorkflow {
    
    public static List<String> w_flowid=new ArrayList<String>();
    public static List<String> w_flowname=new ArrayList<String>();
    public void getWorkFlow(String token,String steptype) {
        try {
            DefaultHttpClient client = new DefaultHttpClient();
            HttpGet get = new HttpGet("https://documenta-dms.com/DMSWS/api/v1/flow/" + token + "/get/F/F/"+steptype);
            HttpResponse response = client.execute(get);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {

                System.out.println(line);
              parseXML(line);

            }
        } catch (IOException ex) {
            Logger.getLogger(GetAllWorkflow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
        
        private void parseXML(String line) {
        
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("flowFileList");
            if (response.getLength() > 0) {
                for(int i=0;i<response.getLength();i++){
                    Element err = (Element) response.item(i);
                    if(err.getElementsByTagName("fileName").getLength()>0){
                        w_flowname.add(err.getElementsByTagName("fileName").item(0).getTextContent());
                    }
                    
                    if(err.getElementsByTagName("fileId").getLength()>0){
                         w_flowid.add(err.getElementsByTagName("fileId").item(0).getTextContent());
                    }
                    
                   
                             
                //category=err.getElementsByTagName("category").item(0).getTextContent();
               
              
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
}
