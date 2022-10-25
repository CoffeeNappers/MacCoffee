package ru.mail.libverify.requests;

import android.support.annotation.NonNull;
import java.util.Locale;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
final class AttemptData implements l, Gsonable {
    public final String applicationId;
    public final String code;
    public final VerificationApi.VerificationSource codeSource;
    public final String verificationUrl;

    private AttemptData() {
        this.verificationUrl = null;
        this.code = null;
        this.applicationId = null;
        this.codeSource = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AttemptData(@NonNull String str, @NonNull String str2, VerificationApi.VerificationSource verificationSource, String str3) {
        this.verificationUrl = str;
        this.code = str2;
        this.applicationId = str3;
        this.codeSource = verificationSource;
    }

    @Override // ru.mail.libverify.requests.l
    public final String a() {
        return String.format(Locale.US, "%s_%s_%s_%s", this.verificationUrl, this.code, this.codeSource, this.applicationId);
    }
}
