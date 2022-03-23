// License: MIT (c) GitLab Inc.
import java.util.Random;

public class PseudoRandom {
    static String randomVal =  Long.toHexString(new Random().nextLong());

    public static String generateSecretToken() {
        Random r = new Random();
        return Long.toHexString(r.nextLong());
    }

    public static String get(Random r) {
        return Long.toHexString(r.nextLong());
    }

    public static long count() {
        return new Random().doubles().limit(10).count();
    }

}