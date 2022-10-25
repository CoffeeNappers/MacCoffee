package okhttp3;

import java.io.UnsupportedEncodingException;
import okio.ByteString;
/* loaded from: classes3.dex */
public final class Credentials {
    private Credentials() {
    }

    public static String basic(String userName, String password) {
        try {
            String usernameAndPassword = userName + ":" + password;
            byte[] bytes = usernameAndPassword.getBytes("ISO-8859-1");
            String encoded = ByteString.of(bytes).base64();
            return "Basic " + encoded;
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError();
        }
    }
}
