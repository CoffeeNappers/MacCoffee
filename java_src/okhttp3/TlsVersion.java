package okhttp3;
/* loaded from: classes3.dex */
public enum TlsVersion {
    TLS_1_3("TLSv1.3"),
    TLS_1_2("TLSv1.2"),
    TLS_1_1("TLSv1.1"),
    TLS_1_0("TLSv1"),
    SSL_3_0("SSLv3");
    
    final String javaName;

    TlsVersion(String javaName) {
        this.javaName = javaName;
    }

    public static TlsVersion forJavaName(String javaName) {
        char c = 65535;
        switch (javaName.hashCode()) {
            case -503070503:
                if (javaName.equals("TLSv1.1")) {
                    c = 2;
                    break;
                }
                break;
            case -503070502:
                if (javaName.equals("TLSv1.2")) {
                    c = 1;
                    break;
                }
                break;
            case -503070501:
                if (javaName.equals("TLSv1.3")) {
                    c = 0;
                    break;
                }
                break;
            case 79201641:
                if (javaName.equals("SSLv3")) {
                    c = 4;
                    break;
                }
                break;
            case 79923350:
                if (javaName.equals("TLSv1")) {
                    c = 3;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return TLS_1_3;
            case 1:
                return TLS_1_2;
            case 2:
                return TLS_1_1;
            case 3:
                return TLS_1_0;
            case 4:
                return SSL_3_0;
            default:
                throw new IllegalArgumentException("Unexpected TLS version: " + javaName);
        }
    }

    public String javaName() {
        return this.javaName;
    }
}
