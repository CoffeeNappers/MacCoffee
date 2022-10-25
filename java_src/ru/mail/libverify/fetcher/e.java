package ru.mail.libverify.fetcher;

import android.os.Handler;
import android.support.annotation.NonNull;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.gcm.ServerInfo;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.storage.o;
/* loaded from: classes3.dex */
public interface e {
    o a();

    void a(@NonNull String str);

    void a(@NonNull ServerInfo serverInfo);

    void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th);

    void a(@NonNull ClientApiResponseBase clientApiResponseBase);

    void a(boolean z);

    ExecutorService b();

    void b(boolean z);

    ExecutorService c();

    Handler d();

    boolean e();
}
