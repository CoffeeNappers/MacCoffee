package ru.mail.libverify.api;

import android.support.annotation.NonNull;
/* loaded from: classes3.dex */
public interface aa {

    /* loaded from: classes3.dex */
    public enum a {
        PACKAGE_UPDATED,
        PACKAGE_REMOVED,
        RESTART,
        TIMER,
        SMS_TEMPLATES_CHECK,
        UNKNOWN
    }

    void a(a aVar);

    void b(boolean z);

    void h(@NonNull String str);
}
