// License: MIT (c) GitLab Inc.
import java.text.Normalizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class NormalizeAfterValidation {

    public String normalizeDanger(CharSequence s) {
        // ruleid:test
        Pattern pattern = Pattern.compile("[<>]"); // Check for angle brackets
        Matcher matcher = pattern.matcher(s);
        if (matcher.find()) {
            throw new IllegalStateException();
        }
        return Normalizer.normalize(s, Normalizer.Form.NFKC); // normalized after validation
    }

    public String normalizeOk(CharSequence s) {
        String normalized = Normalizer.normalize(s, Normalizer.Form.NFKC); // before validation
        Pattern pattern = Pattern.compile("[<>]"); // Check for angle brackets
        Matcher matcher = pattern.matcher(normalized);
        if (matcher.find()) {
            throw new IllegalStateException();
        }
        return normalized;
    }
}
