package ru.mail.libverify.controls;

import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Map;
import ru.mail.libverify.api.UncaughtExceptionListener;
import ru.mail.libverify.utils.LogReceiver;
/* loaded from: classes3.dex */
public interface VerificationSupportProvider {
    @Nullable
    String getAlreadyExistingProfileDataJson();

    @Nullable
    UncaughtExceptionListener getExceptionListener();

    long getIvrTimeoutDefault();

    @Nullable
    LogReceiver getLogReceiver();

    @NonNull
    SharedPreferences getPreferences();

    int getSmsCodeLengthDefault();

    @Nullable
    Map<String, String> getSmsCodeTemplatesDefault();

    @NonNull
    String getVerificationService();

    boolean isSmsCodeNumericDefault();
}
