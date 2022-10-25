package ru.mail.libverify.storage;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.io.File;
import ru.mail.libverify.requests.response.SmsInfo;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class s {
    private static SmsInfo a;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void a(@NonNull Context context, @Nullable SmsInfo smsInfo) {
        File file;
        synchronized (s.class) {
            try {
                a = smsInfo;
                File c = c(context);
                if (smsInfo != null) {
                    ru.mail.libverify.utils.d.c("SmsTemplatesStorage", "start file write");
                    long currentTimeMillis = System.currentTimeMillis();
                    ru.mail.libverify.utils.m.a(c, ru.mail.libverify.utils.json.a.a(smsInfo));
                    ru.mail.libverify.utils.d.c("SmsTemplatesStorage", "file write competed (%d ms)", Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                } else if (c.exists()) {
                    boolean delete = c.delete();
                    if (!delete && (delete = c.renameTo((file = new File(ru.mail.libverify.utils.m.b(context), "SMS_TEMPLATES_TMP"))))) {
                        delete = file.delete();
                    }
                    ru.mail.libverify.utils.d.b("SmsTemplatesStorage", "sms info delete result " + delete);
                }
            } catch (Throwable th) {
                ru.mail.libverify.utils.c.a("SmsTemplatesStorage", "Failed to write sms info file", th);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized boolean a(@NonNull Context context) {
        boolean exists;
        synchronized (s.class) {
            exists = c(context).exists();
        }
        return exists;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public static synchronized SmsInfo b(@NonNull Context context) {
        SmsInfo smsInfo;
        synchronized (s.class) {
            if (a != null) {
                smsInfo = a;
            } else {
                if (c(context).exists()) {
                    ru.mail.libverify.utils.d.c("SmsTemplatesStorage", "start file read");
                    long currentTimeMillis = System.currentTimeMillis();
                    String a2 = ru.mail.libverify.utils.m.a(c(context));
                    if (!TextUtils.isEmpty(a2)) {
                        a = (SmsInfo) ru.mail.libverify.utils.json.a.a(a2, SmsInfo.class);
                        ru.mail.libverify.utils.d.c("SmsTemplatesStorage", "file read competed (%d ms)", Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    }
                }
                smsInfo = a;
            }
        }
        return smsInfo;
    }

    private static File c(@NonNull Context context) {
        return new File(ru.mail.libverify.utils.m.b(context), "SMS_TEMPLATES");
    }
}
