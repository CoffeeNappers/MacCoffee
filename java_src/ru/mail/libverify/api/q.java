package ru.mail.libverify.api;

import android.os.Handler;
import android.support.annotation.NonNull;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public interface q {
    Handler a();

    void a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull Throwable th);

    void a(@NonNull ClientApiResponseBase clientApiResponseBase);

    ExecutorService b();

    void c();
}
