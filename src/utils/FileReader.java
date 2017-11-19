package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 * Created by hyx on 2016/1/9.
 */
public class FileReader {

    File file;
    Scanner sc;
    public FileReader(String filename) throws FileNotFoundException {
        file = new File(filename);
        sc = new Scanner(new FileInputStream(file));
    }

    public String readline(){
        if(sc != null) {
            if (sc.hasNextLine()) {
                return sc.nextLine();
            } else {
                sc.close();
            }
        }
        return null;
    }
}
