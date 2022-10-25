package ru.mail.libverify.api;

import android.content.Context;
import android.support.annotation.NonNull;
import ru.mail.libverify.R;
import ru.mail.libverify.api.VerificationApi;
/* loaded from: classes3.dex */
final class m {
    private static VerificationApi.FailReason a = null;
    private static VerificationApi.FailReason b = null;
    private static VerificationApi.FailReason c = null;
    private static Context d;

    public static VerificationApi.FailReason a() {
        if (a == null) {
            VerificationApi.FailReason failReason = VerificationApi.FailReason.GENERAL_ERROR;
            failReason.description = d != null ? d.getString(R.string.general_error_description) : null;
            a = failReason;
        }
        return a;
    }

    public static void a(@NonNull Context context) {
        d = context;
    }

    public static VerificationApi.FailReason b() {
        if (b == null) {
            VerificationApi.FailReason failReason = VerificationApi.FailReason.NO_NETWORK;
            failReason.description = d != null ? d.getString(R.string.network_error_description) : null;
            b = failReason;
        }
        return b;
    }

    public static VerificationApi.FailReason c() {
        if (c == null) {
            VerificationApi.FailReason failReason = VerificationApi.FailReason.NETWORK_ERROR;
            failReason.description = d != null ? d.getString(R.string.general_error_description) : null;
            c = failReason;
        }
        return c;
    }
}
