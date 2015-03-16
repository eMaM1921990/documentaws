/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package utils;

import java.util.ArrayList;

/**
 *
 * @author emam
 */
public class CssClass {
    public String getCssClass(String ext){
        String classes=null;
        ArrayList<String> data=new ArrayList<>();
        data.add("xls");
        data.add("xlsx");
        data.add("doc");
        data.add("docx");
        data.add("ai");
        data.add("aiff");
        data.add("asp");
        data.add("blank");
        data.add("bmp");
        data.add("c2");
        data.add("cpp");
        data.add("css");
        data.add("csv");
        data.add("dat");
        data.add("blank");
        data.add("dmg");
        data.add("dxt");
        data.add("eps");
        data.add("exe");
        data.add("flv");
        data.add("gif");
        data.add("h2");
        data.add("html");
        data.add("ico");
        data.add("java");
        data.add("jpg");
        data.add("key");
        data.add("m4v");
        data.add("md");
        data.add("mov");
        data.add("mp3");
        data.add("mp4");
        data.add("mpg");
        data.add("odp");
        data.add("ods");
        data.add("odt");
        data.add("otp");
        data.add("ots");
        data.add("ott");
        data.add("php");
        data.add("pps");
        data.add("ppt");
        data.add("pptx");
        data.add("psd");
        data.add("py2");
        data.add("qt2");
        data.add("rar");
        data.add("rb2");
        data.add("rtf");
        data.add("sql");
        data.add("tiff");
        data.add("tqa");
        data.add("tqz");
        data.add("txt");
        data.add("wav");
        data.add("bmp");
        data.add("empty");
        data.add("gif");
        data.add("jpg");

        if(data.indexOf(ext)>-1){
            classes=ext;
        }else{
            classes="blank";
        }




        
        return classes;
    }
}
