// License: MIT (c) GitLab Inc.
import java.text.Normalizer;

public class ImproperUnicode {

    public boolean danger() {
        String s = "ADM\u0131N";
        if (s.equalsIgnoreCase("ADMIN")) {
            return true;
        }
        if (s.equals("ADMIN")) {
            return true;
        }
        if (s.toUpperCase().equalsIgnoreCase("ADMIN")) {
            return true;
        }
        if (s.matches("ADMIN")) {
            return true;
        }
        if (s.compareTo("ADMIN") == 0) {
            return true;
        }
        return s.equalsIgnoreCase("ADMIN");
    }

    public boolean danger2(String s) {
        if (s.equalsIgnoreCase("ADMIN")) {
            return true;
        }
        if (s.equals("ADMIN")) {
            return true;
        }
        if (s.toUpperCase().equalsIgnoreCase("ADMIN")) {
            return true;
        }
        if (s.matches("ADMIN")) {
            return true;
        }
        if (s.compareTo("ADMIN") == 0) {
            return true;
        }
        return s.equalsIgnoreCase("ADMIN");
    }

    public boolean ok(String s) {
        return Normalizer.normalize(s, Normalizer.Form.NFC).equals("ADMIN");
    }

    public boolean ok2(String s) {
        String normalized = Normalizer.normalize(s, Normalizer.Form.NFC);

        if(normalized.equalsIgnoreCase("ADMIN")) {
            return true;
        }

        return normalized.equals("ADMIN");
    }
}
