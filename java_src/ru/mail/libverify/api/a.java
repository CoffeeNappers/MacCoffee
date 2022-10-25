package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.requests.response.SmsInfo;
import ru.mail.libverify.sms.SmsItem;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public interface a {
    void a();

    void a(@NonNull String str, @Nullable VerificationApi.AccountCheckListener accountCheckListener);

    void a(@Nullable SmsInfo smsInfo);

    void a(@NonNull SmsItem smsItem);

    void b();
}
