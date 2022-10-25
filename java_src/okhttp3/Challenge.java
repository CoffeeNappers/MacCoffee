package okhttp3;

import okhttp3.internal.Util;
/* loaded from: classes3.dex */
public final class Challenge {
    private final String realm;
    private final String scheme;

    public Challenge(String scheme, String realm) {
        this.scheme = scheme;
        this.realm = realm;
    }

    public String scheme() {
        return this.scheme;
    }

    public String realm() {
        return this.realm;
    }

    public boolean equals(Object o) {
        return (o instanceof Challenge) && Util.equal(this.scheme, ((Challenge) o).scheme) && Util.equal(this.realm, ((Challenge) o).realm);
    }

    public int hashCode() {
        int i = 0;
        int result = (this.realm != null ? this.realm.hashCode() : 0) + 899;
        int i2 = result * 31;
        if (this.scheme != null) {
            i = this.scheme.hashCode();
        }
        int result2 = i2 + i;
        return result2;
    }

    public String toString() {
        return this.scheme + " realm=\"" + this.realm + "\"";
    }
}
