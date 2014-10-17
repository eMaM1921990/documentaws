/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author emam
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

public class Test {

    public static void main(String[] args) throws ClientProtocolException, IOException {
        DefaultHttpClient client = new DefaultHttpClient();
       HttpPut putRequest = new HttpPut("http://test.documenta.ro/api/api/v1/login/");
  //      HttpPost post = new HttpPost("http://test.documenta.ro/api/api/v1/login/");
        StringEntity input = new StringEntity("<user>\n"
                + "<username>Developershouse36@gmail.com</username>\n"
                + "<password>P@ssword</password>\n"
                + "</user>");
        input.setContentType("application/xml");

        putRequest.setEntity(input);
        HttpResponse response = client.execute(putRequest);
        BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
        String line = "";
        while ((line = rd.readLine()) != null) {
            
              System.out.println(line);
              
           
        }
    }
}
