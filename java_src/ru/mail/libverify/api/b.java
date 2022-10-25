package ru.mail.libverify.api;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.api.VerificationApi;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public interface b {
    void a();

    void a(@NonNull String str);

    void a(@NonNull String str, @Nullable String str2, VerificationApi.AccountCheckResult accountCheckResult);

    void b();

    void c();

    ru.mail.libverify.storage.o d();

    ExecutorService e();

    Handler f();
}
