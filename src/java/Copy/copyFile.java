package Copy;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author np
 */
public class copyFile {

    public static void copy(String path1, String path2) {
        try {
            File file = new File(path1);
            FileInputStream inputStream = new FileInputStream(file);
            FileChannel inChannel = inputStream.getChannel();

            File newFile = new File(path2);
            FileOutputStream outputStream = new FileOutputStream(newFile);
            FileChannel outChannel = outputStream.getChannel();

            inChannel.transferTo(0, file.length(), outChannel);
//            System.out.println("OKasdasdasdasd");
           
//            System.out.println("asdsdf1s2d3f12s3df");
            
            inputStream.close();
            inChannel.close();
            outputStream.close();
            outChannel.close();
            
//            File file2 = new File(path1);
//            file2.delete();
            file.delete();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
