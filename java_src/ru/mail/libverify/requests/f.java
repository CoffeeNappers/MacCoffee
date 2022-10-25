package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.net.URL;
import java.util.Locale;
/* loaded from: classes3.dex */
final class f {
    final URL a;
    private String b;
    private String c;

    /* JADX INFO: Access modifiers changed from: package-private */
    public f(@NonNull String str) {
        this.a = new URL(str);
    }

    public final String a() {
        if (TextUtils.isEmpty(this.c)) {
            String url = this.a.toString();
            int indexOf = url.indexOf(this.a.getPath());
            if (indexOf == -1) {
                this.c = url;
            } else {
                this.c = url.substring(0, indexOf);
            }
        }
        return this.c;
    }

    public final String b() {
        if (TextUtils.isEmpty(this.b)) {
            String path = this.a.getPath();
            if (TextUtils.isEmpty(path)) {
                throw new IllegalArgumentException(String.format(Locale.US, "Can't get method name from provided URL: %s", this.a));
            }
            int lastIndexOf = path.lastIndexOf(47);
            if (lastIndexOf < 0) {
                this.b = path;
            } else if (lastIndexOf == path.length() - 1) {
                throw new IllegalArgumentException(String.format(Locale.US, "Can't get method name from provided URL: %s", this.a));
            } else {
                this.b = path.substring(lastIndexOf + 1);
            }
        }
        return this.b;
    }
}
