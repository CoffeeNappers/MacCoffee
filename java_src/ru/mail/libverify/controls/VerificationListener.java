package ru.mail.libverify.controls;

import android.support.annotation.NonNull;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.controls.VerificationController;
/* loaded from: classes3.dex */
public interface VerificationListener {
    void onCompleted(@NonNull String str, @NonNull String str2);

    void onError(VerificationApi.FailReason failReason);

    void onIvrCallError(VerificationApi.FailReason failReason);

    void onPhoneNumberReceived(@NonNull String str);

    void onProgress(boolean z);

    void onSmsCodeReceived(@NonNull String str);

    void onStateChanged(VerificationController.State state);
}
