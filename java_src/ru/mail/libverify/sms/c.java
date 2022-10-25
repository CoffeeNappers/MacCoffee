package ru.mail.libverify.sms;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Collection;
import java.util.List;
/* loaded from: classes3.dex */
public interface c {

    /* loaded from: classes3.dex */
    public interface a {
        long a();

        String a(@NonNull String str);

        long b();

        boolean b(@Nullable String str);

        int c();

        int d();
    }

    @NonNull
    List<SmsItem> a(@NonNull a aVar);

    @NonNull
    List<SmsItem> a(@NonNull a aVar, @NonNull Collection<SmsItem> collection);
}
