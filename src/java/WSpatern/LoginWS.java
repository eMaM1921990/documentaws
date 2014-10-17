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
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 *
 * @author emam
 */
public class LoginWS {

     public static String userId ;
     public static boolean valid ;
     public static String tokekn ;
     public static String unitId ;
     public static String expire;

    public void getLoginAuth(String user, String password) {
        try {
            DefaultHttpClient client = new DefaultHttpClient();
            HttpPut putRequest = new HttpPut("https://documenta-dms.com/DMSWS/api/v1/login/");
            //      HttpPost post = new HttpPost("http://test.documenta.ro/api/api/v1/login/");
            StringEntity input = new StringEntity("<user>\n"
                    + "<username>" + user + "</username>\n"
                    + "<password>" + password + "</password>\n"
                    + "</user>");
            input.setContentType("application/xml");

            putRequest.setEntity(input);
            HttpResponse response = client.execute(putRequest);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {

                System.out.println(line);
                parseXML(line);

            }
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(LoginWS.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginWS.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void parseXML(String line) {
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("userToken");
            if (response.getLength() > 0) {
                Element err = (Element) response.item(0);
                expire=err.getElementsByTagName("expires").item(0).getTextContent();
                tokekn=err.getElementsByTagName("token").item(0).getTextContent();
                unitId=err.getElementsByTagName("unitId").item(0).getTextContent();
                userId=err.getElementsByTagName("userId").item(0).getTextContent();
                valid=Boolean.valueOf(err.getElementsByTagName("valid").item(0).getTextContent());
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
        new LoginWS().getLoginAuth("abbas", "abbas");
    }
}
