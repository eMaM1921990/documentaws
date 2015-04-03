/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package WSpatern;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 *
 * @author emam
 */
public class uploadFile {
    public void Uploadfile(String token,String dirid,String userid,byte[] file){
        try {
            DefaultHttpClient client = new DefaultHttpClient();
            HttpPost post=new HttpPost("https://documenta-dms.com/DMSWS/api/v1/file/upload/"+token+"/"+dirid+"/"+userid+"/"+Arrays.toString(file));
            HttpResponse response = client.execute(post);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {

                System.out.println(line);
             // parseXML(line);

            }
        } catch (IOException ex) {
            Logger.getLogger(uploadFile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
