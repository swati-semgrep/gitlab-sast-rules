// License: MIT (c) GitLab Inc.
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ModifyAfterValidation {

    public String modifyDanger(String s) {
        Pattern pattern = Pattern.compile("<script>");
        Matcher matcher = pattern.matcher(s);
        if (matcher.find()) {
            throw new IllegalArgumentException("Invalid input");
        }
        return s.replaceAll("[\\p{Cn}]", ""); // modified after validation
    }

    public String modifyDanger2(String s) {
        Pattern pattern = Pattern.compile("<script>");
        Matcher matcher = pattern.matcher(s);
        if (matcher.find()) {
            throw new IllegalArgumentException("Invalid input");
        }
        String modified = s.replace("[\\p{Cn}]", ""); // modified after validation
        return modified;
    }

    public String modifyOk(String s) {
        String modified = s.replaceAll("[\\p{Cn}]", ""); // modified before validation
        Pattern pattern = Pattern.compile("[<>]"); 
        Matcher matcher = pattern.matcher(modified);
        if (matcher.find()) {
            throw new IllegalStateException();
        }
        return modified;
    }
}
