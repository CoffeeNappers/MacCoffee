package ru.mail.libverify.storage;

import android.content.Context;
import android.support.annotation.NonNull;
import java.io.File;
import java.io.RandomAccessFile;
/* loaded from: classes3.dex */
final class j {
    private static int a = 0;
    private static int b = 1;
    private int c;

    /* JADX INFO: Access modifiers changed from: package-private */
    public j(@NonNull Context context) {
        this.c = a;
        this.c = a(context);
    }

    private static int a(@NonNull Context context) {
        RandomAccessFile randomAccessFile;
        try {
            File file = new File(ru.mail.libverify.utils.m.b(context), "VERIFY_INSTALLATION_FLAGS");
            if (!file.exists()) {
                return a;
            }
            try {
                randomAccessFile = new RandomAccessFile(file, "r");
                try {
                    int readInt = randomAccessFile.readInt();
                    randomAccessFile.close();
                    return readInt;
                } catch (Throwable th) {
                    th = th;
                    if (randomAccessFile != null) {
                        randomAccessFile.close();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                randomAccessFile = null;
            }
        } catch (Throwable th3) {
            ru.mail.libverify.utils.c.a("InstallationFlags", "failed to read installation flags file", new RuntimeException(th3));
            return a;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(@NonNull Context context, boolean z) {
        RandomAccessFile randomAccessFile;
        if (z != a()) {
            if (z) {
                this.c |= b;
            } else {
                this.c &= b ^ (-1);
            }
            ru.mail.libverify.utils.d.b("InstallationFlags", "no encryption option set to value %s", Boolean.valueOf(z));
            try {
                try {
                    randomAccessFile = new RandomAccessFile(new File(ru.mail.libverify.utils.m.b(context), "VERIFY_INSTALLATION_FLAGS"), "rw");
                    try {
                        randomAccessFile.writeInt(this.c);
                        randomAccessFile.close();
                    } catch (Throwable th) {
                        th = th;
                        if (randomAccessFile != null) {
                            randomAccessFile.close();
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    ru.mail.libverify.utils.c.a("InstallationFlags", "failed to save installation flags file", new RuntimeException(th2));
                }
            } catch (Throwable th3) {
                th = th3;
                randomAccessFile = null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final boolean a() {
        return (this.c & b) == b;
    }
}
