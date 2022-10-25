package ru.mail.libverify.storage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes3.dex */
final class q implements o {
    private final File a;
    private Map<String, String> b;
    private boolean c = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public q(@NonNull Context context) {
        this.a = new File(ru.mail.libverify.utils.m.b(context), "VERIFY_SETTINGS");
    }

    private void b() {
        if (this.b == null) {
            if (!this.a.exists()) {
                this.b = new HashMap();
                return;
            }
            try {
                ru.mail.libverify.utils.d.c("SecureSettings", "start file read");
                String a = ru.mail.libverify.utils.m.a(this.a);
                if (!TextUtils.isEmpty(a)) {
                    this.b = ru.mail.libverify.utils.json.a.c(a, String.class);
                }
                if (this.b != null) {
                    return;
                }
                this.b = new HashMap();
            } catch (Exception e) {
                ru.mail.libverify.utils.c.a("SecureSettings", "Failed to read settings file", e);
                this.b = new HashMap();
            }
        }
    }

    @Override // ru.mail.libverify.storage.o
    public final synchronized String a(@NonNull String str) {
        b();
        return this.b.get(str);
    }

    @Override // ru.mail.libverify.storage.o
    public final o a(@NonNull String str, int i) {
        return a(str, Integer.toString(i));
    }

    @Override // ru.mail.libverify.storage.o
    public final o a(@NonNull String str, long j) {
        return a(str, Long.toString(j));
    }

    @Override // ru.mail.libverify.storage.o
    public final synchronized o a(@NonNull String str, @NonNull String str2) {
        b();
        this.c = (!TextUtils.equals(str2, this.b.put(str, str2))) | this.c;
        return this;
    }

    @Override // ru.mail.libverify.storage.o
    public final synchronized void a() {
        ru.mail.libverify.utils.d.c("SecureSettings", "commit (%s)", Boolean.valueOf(this.c));
        if (this.c) {
            try {
                ru.mail.libverify.utils.d.c("SecureSettings", "start file write");
                long currentTimeMillis = System.currentTimeMillis();
                ru.mail.libverify.utils.m.a(this.a, ru.mail.libverify.utils.json.a.a(this.b));
                ru.mail.libverify.utils.d.c("SecureSettings", "file write competed (%d ms)", Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            } catch (Exception e) {
                ru.mail.libverify.utils.c.a("SecureSettings", "Failed to write settings file", e);
                this.b = null;
            }
            this.c = false;
        }
    }

    @Override // ru.mail.libverify.storage.o
    public final Long b(@NonNull String str) {
        b();
        try {
            return Long.valueOf(Long.parseLong(this.b.get(str)));
        } catch (NumberFormatException e) {
            return null;
        }
    }

    @Override // ru.mail.libverify.storage.o
    public final Integer c(@NonNull String str) {
        b();
        try {
            return Integer.valueOf(Integer.parseInt(this.b.get(str)));
        } catch (NumberFormatException e) {
            return null;
        }
    }

    @Override // ru.mail.libverify.storage.o
    public final synchronized o d(@NonNull String str) {
        b();
        this.c = (this.b.remove(str) != null) | this.c;
        return this;
    }
}
