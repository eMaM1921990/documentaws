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
public class WorkFlow {

    public List<String> Flowname = new ArrayList<>();
    public List<String> Flowid = new ArrayList<>();

    public void getWorkFlow(String token, String id) {
        try {
            DefaultHttpClient client = new DefaultHttpClient();
            HttpGet get = new HttpGet("https://documenta-dms.com/DMSWS/api/v1/flow/" + token + "/get/" + id);
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
        Flowid.clear();
        Flowname.clear();
        try {
            org.w3c.dom.Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                    .parse(new InputSource(new StringReader(line)));
            NodeList response = doc.getElementsByTagName("flowFileList");
            if (response.getLength() > 0) {
                for (int i = 0; i < response.getLength(); i++) {
                    Element err = (Element) response.item(i);
                    Flowid.add(err.getElementsByTagName("flowId").item(0).getTextContent());
                    Flowname.add(err.getElementsByTagName("flowName").item(0).getTextContent());

                }

            }
        } catch (ParserConfigurationException | SAXException | IOException ex) {
            Logger.getLogger(LoginWS.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String args[]) {
        WorkFlow f = new WorkFlow();
        f.getWorkFlow("157defbfbdefbfbddba9034aefbfbdefbfbd1cefbfbd4468efbfbdefbfbdefbfbd5309efbfbdefbfbdefbfbd1e3121efbfbd7d40efbfbd0b5916", "-114443");
    }
}
