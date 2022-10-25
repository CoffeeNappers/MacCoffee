package ru.mail.libverify.requests;

import android.os.Handler;
import android.support.annotation.NonNull;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
/* loaded from: classes3.dex */
public interface a {
    ru.mail.libverify.storage.k a();

    void a(@NonNull e eVar);

    void a(@NonNull e eVar, @NonNull Throwable th);

    void a(@NonNull ClientApiResponseBase clientApiResponseBase);

    ExecutorService b();

    void b(@NonNull e eVar);

    Handler c();

    ru.mail.libverify.storage.o d();
}
