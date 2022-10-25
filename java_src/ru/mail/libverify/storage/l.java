package ru.mail.libverify.storage;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Locale;
import java.util.Map;
import ru.mail.libverify.requests.response.SmsInfo;
/* loaded from: classes3.dex */
public interface l extends k {
    void A();

    void B();

    boolean C();

    void D();

    void E();

    void F();

    @NonNull
    k G();

    void H();

    void I();

    void J();

    @NonNull
    n K();

    @Nullable
    SmsInfo L();

    boolean M();

    void a(int i);

    void a(@NonNull Object obj);

    void a(@NonNull Object obj, boolean z, int i);

    void a(@NonNull String str, int i);

    void a(@NonNull Locale locale);

    void a(@Nullable SmsInfo smsInfo);

    void a(@NonNull n nVar);

    void a(@Nullable u uVar);

    void a(boolean z);

    boolean a(@NonNull Map<String, String> map);

    void b(boolean z);

    void y();

    @NonNull
    o z();
}
