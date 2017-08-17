
package Copy;

import java.text.Normalizer;
import java.util.regex.Pattern;

/**
 *
 * @author np
 */
public class convetNFD {
  public static String removeAccent(String s) {
  
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(temp).replaceAll("");
    }
}
