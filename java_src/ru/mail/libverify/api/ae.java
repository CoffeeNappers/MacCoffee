package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.requests.response.CallInfo;
/* loaded from: classes3.dex */
public interface ae {
    void a();

    void a(@NonNull String str);

    void a(@NonNull String str, boolean z);

    void a(VerificationApi.IvrStateListener ivrStateListener);

    void a(@NonNull CallInfo callInfo);

    void b();

    void b(@NonNull String str);

    void c();

    void d();

    void e();

    void f();

    @NonNull
    String g();

    @NonNull
    String h();

    @NonNull
    VerificationApi.VerificationStateDescriptor i();

    long j();

    @NonNull
    String k();
}
