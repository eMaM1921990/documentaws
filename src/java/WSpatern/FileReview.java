/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WSpatern;

import static WSpatern.ListOfFile.files;
import static WSpatern.ListOfFile.files_Id;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
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
public class FileReview {

    static public InputStream is;

    public void getFileToPreview(String token, String id) {

        try {
            DefaultHttpClient client = new DefaultHttpClient();
            HttpGet get = new HttpGet("https://documenta-dms.com/DMSWS/api/v1/file/" + token + "/pdf_by_id/" + id);
            HttpResponse response = client.execute(get);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {

                line=line+line;
                System.out.println(line);
                
                //parseXML(line);

            }
            
            getDate(line);
        } catch (IOException ex) {
            Logger.getLogger(ValidTokenWS.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void getDate(String data) {
        try {
            File f=new File("/home/testing.pdf");
            f.createNewFile();
            is = new ByteArrayInputStream(data.getBytes());
            OutputStream outputStream = null;
            // write the inputStream to a FileOutputStream
            outputStream
                    = new FileOutputStream(f);
            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            System.out.println("Done!");
        } catch (FileNotFoundException ex) {
            Logger.getLogger(FileReview.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(FileReview.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        new FileReview().getFileToPreview("efbfbdefbfbdefbfbdefbfbd7aefbfbd0c51721b100c39400155efbfbd20efbfbd015e63efbfbd1eefbfbd13efbfbdefbfbd407defbfbd", "-126651");
    }
}
