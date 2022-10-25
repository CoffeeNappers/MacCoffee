package ru.mail.libverify.fetcher;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.gcm.ServerInfo;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.requests.response.FetcherInfo;
/* loaded from: classes3.dex */
interface b {
    void a();

    void a(@Nullable Long l);

    void a(@NonNull String str, @NonNull String str2);

    void a(@NonNull ServerInfo serverInfo);

    void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th);

    void a(@NonNull ClientApiResponseBase clientApiResponseBase);

    void a(@Nullable FetcherInfo fetcherInfo);

    void b();

    ExecutorService c();

    ExecutorService d();

    boolean e();

    boolean f();

    int g();

    String h();

    long i();
}
