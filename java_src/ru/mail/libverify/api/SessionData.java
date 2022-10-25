package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.requests.response.VerifyApiResponse;
import ru.mail.libverify.utils.Gsonable;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class SessionData implements Gsonable {
    transient int a;
    private transient VerificationApi.VerificationState b;
    @Nullable
    String[] callFragmentTemplate;
    final Map<String, String> defaultSmsCodeTemplates;
    final String id;
    @NonNull
    final Set<String> rawSmsTexts;
    VerificationApi.FailReason reason;
    @Nullable
    String smsCode;
    VerificationApi.VerificationSource smsCodeSource;
    final long startTimeStamp;
    VerificationApi.VerificationState state;
    final String userId;
    final String userProvidedPhoneNumber;
    final String verificationService;
    @Nullable
    VerifyApiResponse verifyApiResponse;

    private SessionData() {
        this.a = 0;
        this.smsCodeSource = VerificationApi.VerificationSource.UNKNOWN;
        this.state = VerificationApi.VerificationState.INITIAL;
        this.reason = VerificationApi.FailReason.OK;
        this.verificationService = null;
        this.defaultSmsCodeTemplates = null;
        this.userProvidedPhoneNumber = null;
        this.userId = null;
        this.id = null;
        this.startTimeStamp = 0L;
        this.rawSmsTexts = new HashSet();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SessionData(String str, String str2, String str3, String str4, Map<String, String> map) {
        this.a = 0;
        this.smsCodeSource = VerificationApi.VerificationSource.UNKNOWN;
        this.state = VerificationApi.VerificationState.INITIAL;
        this.reason = VerificationApi.FailReason.OK;
        this.verificationService = str;
        this.userProvidedPhoneNumber = str2;
        this.userId = str3;
        this.id = str4;
        this.startTimeStamp = System.currentTimeMillis();
        this.defaultSmsCodeTemplates = map;
        this.rawSmsTexts = new HashSet();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(VerificationApi.VerificationState verificationState, VerificationApi.FailReason failReason) {
        if (this.b != verificationState) {
            this.a = 0;
        } else if (this.state == VerificationApi.VerificationState.SUSPENDED) {
            this.a++;
        }
        this.b = this.state;
        this.state = verificationState;
        this.reason = failReason;
        ru.mail.libverify.utils.d.c("SessionData", "Change session = %s state %s->%s (count %d) reason %s", this.id, this.b, verificationState, Integer.valueOf(this.a), failReason);
    }
}
