package ru.mail.libverify.api;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.requests.response.FetcherInfo;
/* loaded from: classes3.dex */
public interface v {
    Handler a();

    void a(@NonNull String str, @NonNull VerificationApi.VerificationStateDescriptor verificationStateDescriptor);

    void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th);

    void a(@NonNull ClientApiResponseBase clientApiResponseBase);

    void a(@Nullable FetcherInfo fetcherInfo);

    boolean a(@NonNull String str);

    ru.mail.libverify.sms.k b();

    ru.mail.libverify.sms.g c();

    ru.mail.libverify.storage.o d();

    ExecutorService e();
}
