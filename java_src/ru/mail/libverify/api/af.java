package ru.mail.libverify.api;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.TimeUtils;
import java.io.IOException;
import java.net.MalformedURLException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.api.h;
import ru.mail.libverify.requests.i;
import ru.mail.libverify.requests.p;
import ru.mail.libverify.requests.response.AttemptApiResponse;
import ru.mail.libverify.requests.response.CallInfo;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.requests.response.VerifyApiResponse;
import ru.mail.libverify.sms.g;
import ru.mail.libverify.sms.k;
import ru.mail.libverify.utils.ServerException;
import ru.mail.libverify.utils.json.JsonParseException;
/* loaded from: classes3.dex */
final class af implements ae {
    private static final b a = new c((byte) 0);
    private final v b;
    private final ru.mail.libverify.storage.k c;
    private final SessionData d;
    private ru.mail.libverify.sms.e e;
    private g.b f;
    private Future g;
    private Future h;
    private Runnable i = new Runnable() { // from class: ru.mail.libverify.api.af.1
        @Override // java.lang.Runnable
        public final void run() {
            af.this.v();
        }
    };
    private Runnable j = new Runnable() { // from class: ru.mail.libverify.api.af.4
        @Override // java.lang.Runnable
        public final void run() {
            if (af.this.d.verifyApiResponse == null) {
                ru.mail.libverify.utils.d.a("VerificationSession", "wait for verify answer timeout expired");
                af.this.a(af.this.y());
            }
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public interface a {
        VerificationApi.VerificationStateDescriptor a();
    }

    /* loaded from: classes3.dex */
    interface b {
        String a();
    }

    /* loaded from: classes3.dex */
    private static class c implements b {
        private c() {
        }

        /* synthetic */ c(byte b) {
            this();
        }

        @Override // ru.mail.libverify.api.af.b
        public final String a() {
            ru.mail.libverify.utils.i.a();
            byte[] bArr = new byte[16];
            new SecureRandom().nextBytes(bArr);
            return ru.mail.libverify.utils.m.a(bArr);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public af(@NonNull v vVar, @NonNull ru.mail.libverify.storage.k kVar, @NonNull String str) {
        this.b = vVar;
        this.c = kVar;
        this.d = (SessionData) ru.mail.libverify.utils.json.a.a(str, SessionData.class);
        if (this.d == null) {
            throw new IllegalStateException("data field must be initialized");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public af(@NonNull v vVar, @NonNull ru.mail.libverify.storage.k kVar, @NonNull String str, @NonNull String str2, String str3, Map<String, String> map) {
        this.b = vVar;
        this.c = kVar;
        this.d = new SessionData(str, str2, str3, a.a(), map);
    }

    private String a(String str, String str2) {
        return this.b.d().a(String.format(Locale.US, "%s_%s_%s", str, this.d.verificationService, str2));
    }

    @NonNull
    private VerificationApi.VerificationStateDescriptor a(VerificationApi.VerificationState verificationState, VerificationApi.VerificationSource verificationSource, VerificationApi.FailReason failReason, VerifyApiResponse verifyApiResponse) {
        if (verifyApiResponse == null) {
            return new VerificationApi.VerificationStateDescriptor(verificationState, failReason);
        }
        return new VerificationApi.VerificationStateDescriptor(verificationState, verificationSource, failReason, verifyApiResponse.getModifiedPhoneNumber(), verifyApiResponse.getToken(), verifyApiResponse.getTokenExpirationTime(), verifyApiResponse.getCodeLength(), verifyApiResponse.getCodeType() == VerifyApiResponse.CodeType.NUMERIC, this.d.smsCodeSource != VerificationApi.VerificationSource.CALL ? this.d.smsCode : null, verifyApiResponse.getSupportedIvrLanguages(), b(verifyApiResponse), verifyApiResponse.getAppEndpoints());
    }

    static /* synthetic */ VerificationApi.VerificationStateDescriptor a(af afVar, ru.mail.libverify.requests.e eVar, final Future future) {
        return afVar.a(eVar, new a() { // from class: ru.mail.libverify.api.af.9
            @Override // ru.mail.libverify.api.af.a
            public final VerificationApi.VerificationStateDescriptor a() {
                return af.a(af.this, (AttemptApiResponse) future.get());
            }
        });
    }

    static /* synthetic */ VerificationApi.VerificationStateDescriptor a(af afVar, AttemptApiResponse attemptApiResponse) {
        ru.mail.libverify.utils.d.c("VerificationSession", "session with id = %s received AttemptApiResponse response = %s", afVar.d.id, attemptApiResponse.toString());
        afVar.b.a(attemptApiResponse.getFetcherInfo());
        if (attemptApiResponse.getStatus() != ClientApiResponseBase.Status.OK) {
            afVar.d.smsCode = null;
            afVar.d.rawSmsTexts.clear();
        } else {
            if (afVar.d.verifyApiResponse == null) {
                afVar.d.verifyApiResponse = new VerifyApiResponse();
            }
            afVar.d.verifyApiResponse.setToken(attemptApiResponse.getToken());
            afVar.d.verifyApiResponse.setAppEndpoints(attemptApiResponse.getAppEndpoints());
            afVar.d.verifyApiResponse.setTokenExpirationTime(attemptApiResponse.getTokenExpirationTime());
        }
        switch (attemptApiResponse.getStatus()) {
            case OK:
            case VERIFIED:
                return TextUtils.isEmpty(attemptApiResponse.getToken()) ? u() : afVar.a(VerificationApi.VerificationState.SUCCEEDED, afVar.d.smsCodeSource, VerificationApi.FailReason.OK, afVar.d.verifyApiResponse);
            case UNKNOWN:
            case INCORRECT_SIGNATURE:
            case NOT_ENOUGH_DATA:
            default:
                afVar.b.a(attemptApiResponse);
                return a(attemptApiResponse);
            case ERROR:
                if (afVar.d.smsCodeSource != VerificationApi.VerificationSource.USER_INPUT) {
                    return afVar.a(VerificationApi.VerificationState.WAITING_FOR_SMS_CODE, afVar.d.smsCodeSource, VerificationApi.FailReason.OK, afVar.d.verifyApiResponse);
                }
                VerificationApi.VerificationState verificationState = VerificationApi.VerificationState.WAITING_FOR_SMS_CODE;
                VerificationApi.VerificationSource verificationSource = afVar.d.smsCodeSource;
                VerificationApi.FailReason failReason = VerificationApi.FailReason.INCORRECT_SMS_CODE;
                failReason.description = attemptApiResponse.getDescription();
                return afVar.a(verificationState, verificationSource, failReason, afVar.d.verifyApiResponse);
        }
    }

    @NonNull
    private VerificationApi.VerificationStateDescriptor a(@NonNull ru.mail.libverify.requests.e eVar, @NonNull a aVar) {
        try {
            return aVar.a();
        } catch (InterruptedException e) {
            e = e;
            ru.mail.libverify.utils.d.a("VerificationSession", "apiMethodToNextState", e);
            return u();
        } catch (CancellationException e2) {
            e = e2;
            ru.mail.libverify.utils.d.a("VerificationSession", "apiMethodToNextState", e);
            return u();
        } catch (ExecutionException e3) {
            Throwable cause = e3.getCause();
            if (cause == null) {
                ru.mail.libverify.utils.c.a("VerificationSession", "apiMethodToNextState", e3);
                return u();
            }
            ru.mail.libverify.utils.d.b("VerificationSession", "apiMethodToNextState", cause);
            this.b.a(eVar, cause);
            return ((cause instanceof ServerException) || (cause instanceof IOException)) ? a(VerificationApi.VerificationState.SUSPENDED, VerificationApi.VerificationSource.UNKNOWN, m.c(), this.d.verifyApiResponse) : u();
        } catch (Throwable th) {
            ru.mail.libverify.utils.c.a("VerificationSession", "apiMethodToNextState", th);
            return u();
        }
    }

    private static VerificationApi.VerificationStateDescriptor a(@NonNull ClientApiResponseBase clientApiResponseBase) {
        VerificationApi.FailReason failReason;
        switch (clientApiResponseBase.getStatus()) {
            case UNKNOWN:
            case INCORRECT_SIGNATURE:
            case NOT_ENOUGH_DATA:
            case ERROR:
                VerificationApi.VerificationState verificationState = VerificationApi.VerificationState.FAILED;
                if (TextUtils.isEmpty(clientApiResponseBase.getDescription())) {
                    failReason = m.a();
                } else {
                    failReason = VerificationApi.FailReason.GENERAL_ERROR;
                    failReason.description = clientApiResponseBase.getDescription();
                }
                return new VerificationApi.VerificationStateDescriptor(verificationState, failReason);
            case PHONE_NUMBER_IN_BLACK_LIST:
            case INCORRECT_PHONE_NUMBER:
                VerificationApi.VerificationState verificationState2 = VerificationApi.VerificationState.FAILED;
                VerificationApi.FailReason failReason2 = VerificationApi.FailReason.INCORRECT_PHONE_NUMBER;
                failReason2.description = clientApiResponseBase.getDescription();
                return new VerificationApi.VerificationStateDescriptor(verificationState2, failReason2);
            case PHONE_NUMBER_TYPE_NOT_ALLOWED:
            case UNSUPPORTED_NUMBER:
                VerificationApi.VerificationState verificationState3 = VerificationApi.VerificationState.FAILED;
                VerificationApi.FailReason failReason3 = VerificationApi.FailReason.UNSUPPORTED_NUMBER;
                failReason3.description = clientApiResponseBase.getDescription();
                return new VerificationApi.VerificationStateDescriptor(verificationState3, failReason3);
            case RATELIMIT:
            case ATTEMPTLIMIT:
                VerificationApi.VerificationState verificationState4 = VerificationApi.VerificationState.FAILED;
                VerificationApi.FailReason failReason4 = VerificationApi.FailReason.RATELIMIT;
                failReason4.description = clientApiResponseBase.getDescription();
                return new VerificationApi.VerificationStateDescriptor(verificationState4, failReason4);
            default:
                throw new IllegalArgumentException("Undefined response status");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @NonNull
    public VerificationApi.VerificationStateDescriptor a(@NonNull VerifyApiResponse verifyApiResponse) {
        boolean z = false;
        boolean z2 = true;
        ru.mail.libverify.utils.d.c("VerificationSession", "session with id = %s received VerifyApiResponse response = %s", this.d.id, verifyApiResponse.toString());
        this.b.a(verifyApiResponse.getFetcherInfo());
        this.d.verifyApiResponse = verifyApiResponse;
        if (verifyApiResponse.getStatus() == ClientApiResponseBase.Status.VERIFIED && this.d.smsCodeSource == VerificationApi.VerificationSource.UNKNOWN) {
            this.d.smsCodeSource = VerificationApi.VerificationSource.ALREADY_VERIFIED;
        }
        if (this.d.verifyApiResponse.getCallFragmentTemplate() != null) {
            this.d.callFragmentTemplate = this.d.verifyApiResponse.getCallFragmentTemplate();
        }
        String t = this.c.t();
        if (verifyApiResponse.getCallTemplates() != null && verifyApiResponse.getCallTemplates().length != 0) {
            try {
                a("verification_session_last_saved_call_template", ru.mail.libverify.utils.json.a.a(verifyApiResponse.getCallTemplates()), t);
            } catch (JsonParseException e) {
                ru.mail.libverify.utils.c.a("VerificationSession", "failed to save call templates", e);
            }
            z = true;
        }
        if (TextUtils.isEmpty(verifyApiResponse.getSmsTemplate())) {
            a("verification_session_last_saved_sms_template", verifyApiResponse.getSmsTemplate(), t);
            z = true;
        }
        if (verifyApiResponse.getCodeType() != null) {
            a("verification_session_last_saved_code_type", verifyApiResponse.getCodeType().toString(), t);
            z = true;
        }
        if (verifyApiResponse.getCodeLength() != 0) {
            a("verification_session_last_saved_code_length", Integer.toString(verifyApiResponse.getCodeLength()), t);
        } else {
            z2 = z;
        }
        if (z2) {
            this.b.d().a();
        }
        o();
        switch (verifyApiResponse.getStatus()) {
            case OK:
                return a(VerificationApi.VerificationState.WAITING_FOR_SMS_CODE, VerificationApi.VerificationSource.UNKNOWN, VerificationApi.FailReason.OK, verifyApiResponse);
            case VERIFIED:
                return TextUtils.isEmpty(verifyApiResponse.getToken()) ? u() : a(VerificationApi.VerificationState.SUCCEEDED, this.d.smsCodeSource, VerificationApi.FailReason.OK, verifyApiResponse);
            default:
                this.b.a(verifyApiResponse);
                return a((ClientApiResponseBase) verifyApiResponse);
        }
    }

    private ru.mail.libverify.requests.p a(p.a[] aVarArr) {
        return new ru.mail.libverify.requests.p(this.c, this.d.id, this.d.verificationService, this.d.userProvidedPhoneNumber, this.d.userId, aVarArr);
    }

    private void a(String str, String str2, String str3) {
        this.b.d().a(String.format(Locale.US, "%s_%s_%s", str, this.d.verificationService, str3), str2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(@Nullable String str, @Nullable String str2, VerificationApi.VerificationSource verificationSource) {
        if (TextUtils.isEmpty(str)) {
            ru.mail.libverify.utils.d.b("VerificationSession", "empty sms code received");
            if (TextUtils.isEmpty(str2) || this.d.rawSmsTexts.contains(str2)) {
                return;
            }
            this.d.smsCodeSource = verificationSource;
            this.d.rawSmsTexts.add(str2);
            ru.mail.libverify.utils.d.b("VerificationSession", "save raw sms text %s for further processing", Arrays.toString(this.d.rawSmsTexts.toArray()));
            o();
        } else if (TextUtils.equals(this.d.smsCode, str)) {
            ru.mail.libverify.utils.d.b("VerificationSession", "provided sms code: %s is equal to the last stored one", str);
        } else if (n()) {
        } else {
            ru.mail.libverify.utils.d.c("VerificationSession", "received code: %s", str);
            this.d.reason = VerificationApi.FailReason.OK;
            this.d.smsCode = str;
            this.d.smsCodeSource = verificationSource;
            this.d.rawSmsTexts.clear();
            o();
            l();
            v();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(@Nullable VerificationApi.VerificationStateDescriptor verificationStateDescriptor) {
        boolean z;
        if (verificationStateDescriptor == null) {
            return;
        }
        this.b.a(this.d.id, verificationStateDescriptor);
        if (this.d.state == verificationStateDescriptor.getState()) {
            return;
        }
        this.d.a(verificationStateDescriptor.getState(), verificationStateDescriptor.getReason());
        SessionData sessionData = this.d;
        long currentTimeMillis = System.currentTimeMillis() - sessionData.startTimeStamp;
        Object[] objArr = new Object[3];
        objArr[0] = Long.valueOf(currentTimeMillis);
        objArr[1] = sessionData.state;
        objArr[2] = Boolean.valueOf(sessionData.verifyApiResponse != null);
        ru.mail.libverify.utils.d.c("SessionData", "Trace time from start = %d, state = %s, hasResponse = %s", objArr);
        if (currentTimeMillis < 0) {
            z = false;
        } else {
            if (sessionData.state == VerificationApi.VerificationState.SUSPENDED) {
                if (sessionData.verifyApiResponse == null && currentTimeMillis > 30000) {
                    z = false;
                } else if (sessionData.verifyApiResponse != null && currentTimeMillis > TimeUtils.HOUR) {
                    z = false;
                }
            }
            z = true;
        }
        if (!z) {
            ru.mail.libverify.utils.d.c("VerificationSession", "Mark session = %s data as failed and run control loop", this.d.id);
            SessionData sessionData2 = this.d;
            sessionData2.state = VerificationApi.VerificationState.FAILED;
            sessionData2.reason = m.c();
        }
        SessionData sessionData3 = this.d;
        if (!(sessionData3.state != VerificationApi.VerificationState.SUSPENDED || (this.c.j() && sessionData3.a <= 10))) {
            ru.mail.libverify.utils.d.c("VerificationSession", "Stop control loop for session = %s", this.d.id);
            return;
        }
        SessionData sessionData4 = this.d;
        int i = sessionData4.state == VerificationApi.VerificationState.SUSPENDED ? sessionData4.a * sessionData4.a * 300 : 0;
        ru.mail.libverify.utils.d.c("VerificationSession", "Schedule control loop for session = %s delay %d", this.d.id, Integer.valueOf(i));
        this.b.a().postDelayed(this.i, i);
    }

    private static int b(@NonNull VerifyApiResponse verifyApiResponse) {
        if (!TextUtils.isEmpty(verifyApiResponse.getIvrTimeoutSec())) {
            try {
                return Integer.parseInt(verifyApiResponse.getIvrTimeoutSec());
            } catch (Exception e) {
            }
        }
        return 30;
    }

    static /* synthetic */ VerificationApi.VerificationStateDescriptor b(af afVar, ru.mail.libverify.requests.e eVar, final Future future) {
        return afVar.a(eVar, new a() { // from class: ru.mail.libverify.api.af.11
            @Override // ru.mail.libverify.api.af.a
            public final VerificationApi.VerificationStateDescriptor a() {
                return af.this.a((VerifyApiResponse) future.get());
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean b(@NonNull String str, boolean z) {
        boolean z2 = true;
        ru.mail.libverify.utils.d.c("VerificationSession", "try to verify phone %s", str);
        if (h.c(str, r())) {
            a(str, str, VerificationApi.VerificationSource.CALL);
        } else {
            String a2 = h.a(str, s());
            if (TextUtils.isEmpty(a2)) {
                z2 = false;
            }
            if (z2 || z) {
                a(a2, str, VerificationApi.VerificationSource.CALL);
            }
        }
        return z2;
    }

    private void l() {
        if (this.g != null) {
            ru.mail.libverify.utils.d.c("VerificationSession", "cancel main request");
            this.g.cancel(true);
            this.g = null;
        }
    }

    private void m() {
        if (this.h != null) {
            ru.mail.libverify.utils.d.c("VerificationSession", "cancel ivr request");
            this.h.cancel(true);
            this.h = null;
        }
    }

    private boolean n() {
        SessionData sessionData = this.d;
        if (!(sessionData.state == VerificationApi.VerificationState.FINAL || sessionData.state == VerificationApi.VerificationState.SUCCEEDED) ? sessionData.state == VerificationApi.VerificationState.FAILED : sessionData.verifyApiResponse != null && !TextUtils.isEmpty(sessionData.verifyApiResponse.getToken())) {
            ru.mail.libverify.utils.d.a("VerificationSession", "failed to modify session state after completion");
            return true;
        }
        return false;
    }

    private void o() {
        this.b.a(this.d.id, a(this.d.state, this.d.smsCodeSource, this.d.reason, this.d.verifyApiResponse));
    }

    private void p() {
        if (this.f != null) {
            return;
        }
        this.f = new g.b() { // from class: ru.mail.libverify.api.af.5
            @Override // ru.mail.libverify.sms.g.b
            public final boolean a(@NonNull String str) {
                return af.this.b(str, true);
            }
        };
        this.b.c().a(this.f);
    }

    private void q() {
        if (this.e != null) {
            return;
        }
        final ru.mail.libverify.sms.i a2 = this.b.b().a();
        a2.c = new k.b() { // from class: ru.mail.libverify.api.af.7
            @Override // ru.mail.libverify.sms.k.b
            public final void a(ru.mail.libverify.sms.b bVar) {
                if (bVar == null) {
                    return;
                }
                af.this.a(h.a(bVar.d, af.this.t()), bVar.d, VerificationApi.VerificationSource.SMS);
            }
        };
        final k.f fVar = a2.b;
        final k.b bVar = a2.c;
        final k.d dVar = a2.d;
        final k.a aVar = a2.e;
        final k.e eVar = a2.f;
        final k.c cVar = a2.g;
        this.e = a2.a.a(a2.h, a2.i, new k.f() { // from class: ru.mail.libverify.sms.i.1
            @Override // ru.mail.libverify.sms.k.b
            public final void a(b bVar2) {
                if (bVar != null) {
                    bVar.a(bVar2);
                } else if (fVar == null) {
                } else {
                    fVar.a(bVar2);
                }
            }
        });
    }

    private h.a r() {
        h.a aVar = new h.a();
        if (this.d.callFragmentTemplate != null && this.d.callFragmentTemplate.length != 0) {
            aVar.a = this.d.callFragmentTemplate;
        }
        return aVar;
    }

    private h.a s() {
        h.a aVar = new h.a();
        aVar.d = VerifyApiResponse.CodeType.NUMERIC;
        if (this.d.verifyApiResponse == null || this.d.verifyApiResponse.getCallTemplates() == null || this.d.verifyApiResponse.getCallTemplates().length == 0) {
            String a2 = this.b.d().a("verification_session_last_saved_call_template");
            if (TextUtils.isEmpty(a2)) {
                ru.mail.libverify.utils.d.a("VerificationSession", "getCallParseData - can't parse incoming call without pattern");
                return null;
            }
            try {
                aVar.b = (String[]) ru.mail.libverify.utils.json.a.a(a2, String[].class);
            } catch (JsonParseException e) {
                ru.mail.libverify.utils.c.a("VerificationSession", "filed to read saved templates", e);
            }
            if (aVar.b == null || aVar.b.length == 0) {
                ru.mail.libverify.utils.d.a("VerificationSession", "getCallParseData - wrong saved pattern detected");
                return null;
            }
            String a3 = a("verification_session_last_saved_code_length", this.c.s());
            if (!TextUtils.isEmpty(a3)) {
                try {
                    aVar.c = Integer.parseInt(a3);
                } catch (NumberFormatException e2) {
                }
            }
        } else {
            aVar.b = this.d.verifyApiResponse.getCallTemplates();
            aVar.c = this.d.verifyApiResponse.getCodeLength();
        }
        return aVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public h.a t() {
        h.a aVar = new h.a();
        if (this.d.verifyApiResponse == null || TextUtils.isEmpty(this.d.verifyApiResponse.getSmsTemplate())) {
            String s = this.c.s();
            String a2 = a("verification_session_last_saved_sms_template", s);
            if (TextUtils.isEmpty(a2)) {
                ru.mail.libverify.utils.d.b("VerificationSession", "getSmsCodeParseData - there is no saved pattern. try to get default one.");
                SessionData sessionData = this.d;
                a2 = sessionData.defaultSmsCodeTemplates == null ? null : sessionData.defaultSmsCodeTemplates.get(s);
                if (TextUtils.isEmpty(a2)) {
                    ru.mail.libverify.utils.d.a("VerificationSession", "getSmsCodeParseData - can't parse incoming sms without pattern");
                    return null;
                }
            }
            aVar.b = new String[]{a2};
            String a3 = a("verification_session_last_saved_code_type", s);
            if (!TextUtils.isEmpty(a3)) {
                aVar.d = VerifyApiResponse.CodeType.valueOf(a3);
            }
            String a4 = a("verification_session_last_saved_code_length", s);
            if (!TextUtils.isEmpty(a4)) {
                try {
                    aVar.c = Integer.parseInt(a4);
                } catch (NumberFormatException e) {
                }
            }
        } else {
            aVar.b = new String[]{this.d.verifyApiResponse.getSmsTemplate()};
            aVar.c = this.d.verifyApiResponse.getCodeLength();
            aVar.d = this.d.verifyApiResponse.getCodeType();
        }
        return aVar;
    }

    private static VerificationApi.VerificationStateDescriptor u() {
        return new VerificationApi.VerificationStateDescriptor(VerificationApi.VerificationState.FAILED, m.a());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void v() {
        VerificationApi.VerificationStateDescriptor verificationStateDescriptor;
        VerificationApi.VerificationStateDescriptor verificationStateDescriptor2 = null;
        switch (this.d.state) {
            case INITIAL:
                verificationStateDescriptor2 = new VerificationApi.VerificationStateDescriptor(VerificationApi.VerificationState.VERIFYING_PHONE_NUMBER);
                this.b.a().postDelayed(this.j, 40000L);
                break;
            case VERIFYING_PHONE_NUMBER:
                q();
                p();
                if (!this.c.j()) {
                    ru.mail.libverify.utils.d.b("VerificationSession", "handleVerifyState start disallowed");
                    verificationStateDescriptor = y();
                } else if (x()) {
                    verificationStateDescriptor = null;
                } else {
                    ru.mail.libverify.utils.d.b("VerificationSession", "handleVerifyState start request");
                    final ru.mail.libverify.requests.p a2 = a(this.b.a(this.d.userProvidedPhoneNumber) ? new p.a[]{p.a.SMS, p.a.PUSH, p.a.CALL} : new p.a[]{p.a.SMS, p.a.PUSH});
                    this.g = a2.a(this.b.e(), new i.b<VerifyApiResponse>() { // from class: ru.mail.libverify.api.af.2
                        @Override // ru.mail.libverify.requests.i.b
                        public final Handler a() {
                            return af.this.b.a();
                        }

                        @Override // ru.mail.libverify.requests.i.b
                        public final void a(Future<VerifyApiResponse> future) {
                            if (future.isCancelled()) {
                                return;
                            }
                            af.this.g = null;
                            af.this.a(af.b(af.this, a2, future));
                        }
                    });
                    verificationStateDescriptor = null;
                }
                verificationStateDescriptor2 = verificationStateDescriptor;
                break;
            case SUSPENDED:
            case WAITING_FOR_SMS_CODE:
                q();
                p();
                if (this.d.verifyApiResponse == null) {
                    verificationStateDescriptor2 = new VerificationApi.VerificationStateDescriptor(VerificationApi.VerificationState.VERIFYING_PHONE_NUMBER);
                } else if (!TextUtils.isEmpty(this.d.verifyApiResponse.getToken())) {
                    verificationStateDescriptor2 = a(VerificationApi.VerificationState.SUCCEEDED, this.d.smsCodeSource, VerificationApi.FailReason.OK, this.d.verifyApiResponse);
                } else if (!TextUtils.isEmpty(this.d.smsCode)) {
                    verificationStateDescriptor2 = a(VerificationApi.VerificationState.VERIFYING_SMS_CODE, this.d.smsCodeSource, VerificationApi.FailReason.OK, this.d.verifyApiResponse);
                } else if (!this.d.rawSmsTexts.isEmpty()) {
                    if (!this.d.rawSmsTexts.isEmpty()) {
                        ru.mail.libverify.utils.d.b("VerificationSession", "verifyRawText %s", Arrays.toString(this.d.rawSmsTexts.toArray()));
                        Iterator<String> it = this.d.rawSmsTexts.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                String next = it.next();
                                switch (this.d.smsCodeSource) {
                                    case APPLICATION_LOCAL:
                                    case SMS:
                                        next = h.a(next, t());
                                        break;
                                    case CALL:
                                        if (!h.c(next, r())) {
                                            next = h.a(next, s());
                                            break;
                                        }
                                        break;
                                    default:
                                        ru.mail.libverify.utils.d.a("VerificationSession", "Illegal state %s for a sms code restoring from a raw text", this.d.smsCodeSource);
                                        next = null;
                                        break;
                                }
                                if (!TextUtils.isEmpty(next)) {
                                    a(next, (String) null, this.d.smsCodeSource);
                                }
                            }
                        }
                    }
                } else if (this.d.callFragmentTemplate != null) {
                    if (this.d.callFragmentTemplate == null) {
                        ru.mail.libverify.utils.d.b("VerificationSession", "skip checking last calls (no templates)");
                    } else if (!this.b.a(this.d.userProvidedPhoneNumber)) {
                        ru.mail.libverify.utils.d.b("VerificationSession", "skip checking last calls (call is not possible)");
                    } else {
                        ru.mail.libverify.utils.d.b("VerificationSession", "start checking last calls");
                        this.b.c().a(new g.a() { // from class: ru.mail.libverify.api.af.6
                            @Override // ru.mail.libverify.sms.g.a
                            public final long a() {
                                return af.this.d.startTimeStamp;
                            }

                            @Override // ru.mail.libverify.sms.g.a
                            public final void a(@NonNull List<String> list) {
                                if (list.isEmpty()) {
                                    return;
                                }
                                for (String str : list) {
                                    af.this.b(str, false);
                                }
                            }
                        });
                    }
                }
                if (this.d.state == VerificationApi.VerificationState.WAITING_FOR_SMS_CODE) {
                    w();
                    break;
                }
                break;
            case VERIFYING_SMS_CODE:
                try {
                    if (!this.c.j()) {
                        ru.mail.libverify.utils.d.b("VerificationSession", "handleAttemptState start disallowed");
                        verificationStateDescriptor2 = a(VerificationApi.VerificationState.SUSPENDED, VerificationApi.VerificationSource.UNKNOWN, m.b(), this.d.verifyApiResponse);
                    } else if (!x()) {
                        if (this.d.verifyApiResponse == null || this.d.smsCode == null) {
                            ru.mail.libverify.utils.d.a("VerificationSession", "handleAttemptState not enough data to call attempt api method");
                        } else {
                            ru.mail.libverify.utils.d.b("VerificationSession", "handleAttemptState start request");
                            final ru.mail.libverify.requests.d dVar = new ru.mail.libverify.requests.d(this.c, this.d.verifyApiResponse.getVerificationUrl(), this.d.smsCode, this.d.smsCodeSource);
                            this.g = dVar.a(this.b.e(), new i.b<AttemptApiResponse>() { // from class: ru.mail.libverify.api.af.8
                                @Override // ru.mail.libverify.requests.i.b
                                public final Handler a() {
                                    return af.this.b.a();
                                }

                                @Override // ru.mail.libverify.requests.i.b
                                public final void a(Future<AttemptApiResponse> future) {
                                    if (future.isCancelled()) {
                                        return;
                                    }
                                    af.this.g = null;
                                    af.this.a(af.a(af.this, dVar, future));
                                }
                            });
                        }
                    }
                    break;
                } catch (MalformedURLException e) {
                    verificationStateDescriptor2 = u();
                    break;
                }
            case SUCCEEDED:
            case FAILED:
                verificationStateDescriptor2 = a(VerificationApi.VerificationState.FINAL, this.d.smsCodeSource, this.d.reason, this.d.verifyApiResponse);
                break;
            case FINAL:
                l();
                w();
                if (this.e != null) {
                    this.e.a();
                    this.e = null;
                }
                if (this.f != null) {
                    this.b.c().b(this.f);
                    this.f = null;
                    break;
                }
                break;
            default:
                throw new IllegalArgumentException("Undefined state for current session");
        }
        a(verificationStateDescriptor2);
    }

    private void w() {
        this.b.a().removeCallbacks(this.j);
    }

    private boolean x() {
        if (this.g != null) {
            if (!this.g.isDone() && !this.g.isCancelled()) {
                ru.mail.libverify.utils.d.b("VerificationSession", "hasRunningRequest request has been already started");
                return true;
            }
            ru.mail.libverify.utils.d.b("VerificationSession", "hasRunningRequest cancel previous request");
            this.g.cancel(true);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @NonNull
    public VerificationApi.VerificationStateDescriptor y() {
        return a(VerificationApi.VerificationState.FAILED, VerificationApi.VerificationSource.UNKNOWN, m.b(), this.d.verifyApiResponse);
    }

    @Override // ru.mail.libverify.api.ae
    public final void a() {
        v();
    }

    @Override // ru.mail.libverify.api.ae
    public final void a(@NonNull String str) {
        a(str, (String) null, VerificationApi.VerificationSource.USER_INPUT);
    }

    @Override // ru.mail.libverify.api.ae
    public final void a(@NonNull String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            ru.mail.libverify.utils.d.a("VerificationSession", "verifySmsText smsText can't be empty");
        } else {
            a(h.a(str, t()), str, z ? VerificationApi.VerificationSource.APPLICATION_LOCAL : VerificationApi.VerificationSource.SMS);
        }
    }

    @Override // ru.mail.libverify.api.ae
    public final void a(final VerificationApi.IvrStateListener ivrStateListener) {
        ru.mail.libverify.utils.d.c("VerificationSession", "session %s ivr call requested", this.d.id);
        if (this.d.state != VerificationApi.VerificationState.WAITING_FOR_SMS_CODE) {
            ru.mail.libverify.utils.d.a("VerificationSession", "session %s wrong state for ivr call detected", this.d.id);
            if (ivrStateListener == null) {
                return;
            }
            ivrStateListener.onRequestExecuted(m.a());
        } else if (!this.c.j()) {
            ru.mail.libverify.utils.d.b("VerificationSession", "ivr request start disallowed");
            if (ivrStateListener == null) {
                return;
            }
            ivrStateListener.onRequestExecuted(m.b());
        } else {
            m();
            ru.mail.libverify.utils.d.b("VerificationSession", "start ivr request");
            final ru.mail.libverify.requests.p a2 = a(new p.a[]{p.a.IVR});
            this.h = a2.a(this.b.e(), new i.b<VerifyApiResponse>() { // from class: ru.mail.libverify.api.af.10
                @Override // ru.mail.libverify.requests.i.b
                public final Handler a() {
                    return af.this.b.a();
                }

                @Override // ru.mail.libverify.requests.i.b
                public final void a(Future<VerifyApiResponse> future) {
                    if (future.isCancelled()) {
                        return;
                    }
                    af.this.h = null;
                    VerificationApi.VerificationStateDescriptor b2 = af.b(af.this, a2, future);
                    if (ivrStateListener != null) {
                        ivrStateListener.onRequestExecuted(b2.getReason());
                    }
                    if (b2.getState() != VerificationApi.VerificationState.SUCCEEDED) {
                        return;
                    }
                    af.this.a(b2);
                }
            });
        }
    }

    @Override // ru.mail.libverify.api.ae
    public final void a(@NonNull CallInfo callInfo) {
        if (callInfo.getHashedSessionId() != null && !TextUtils.equals(ru.mail.libverify.utils.m.a(this.d.id), callInfo.getHashedSessionId())) {
            ru.mail.libverify.utils.d.b("VerificationSession", "call info update %s discarded (%s)", callInfo, "session id not equal");
        } else if (Arrays.equals(this.d.callFragmentTemplate, callInfo.getCallFragmentTemplate())) {
            ru.mail.libverify.utils.d.b("VerificationSession", "call info update %s discarded (%s)", callInfo, "equal to current");
        } else {
            this.d.callFragmentTemplate = callInfo.getCallFragmentTemplate();
            ru.mail.libverify.utils.d.b("VerificationSession", "call info updated %s", callInfo);
            o();
            v();
        }
    }

    @Override // ru.mail.libverify.api.ae
    public final void b() {
        ru.mail.libverify.utils.d.c("VerificationSession", "cancel session");
        l();
        m();
        w();
        this.d.a(VerificationApi.VerificationState.FINAL, VerificationApi.FailReason.OK);
        v();
    }

    @Override // ru.mail.libverify.api.ae
    public final void b(@NonNull String str) {
        b(str, true);
    }

    @Override // ru.mail.libverify.api.ae
    public final void c() {
        ru.mail.libverify.utils.d.c("VerificationSession", "session %s new sms code requested", this.d.id);
        if (n()) {
            return;
        }
        this.d.verifyApiResponse = null;
        this.d.callFragmentTemplate = null;
        this.d.smsCodeSource = VerificationApi.VerificationSource.UNKNOWN;
        this.d.smsCode = null;
        this.d.rawSmsTexts.clear();
        o();
        v();
    }

    @Override // ru.mail.libverify.api.ae
    public final void d() {
        ru.mail.libverify.utils.d.c("VerificationSession", "session %s reset verification error", this.d.id);
        if (this.d.state == VerificationApi.VerificationState.WAITING_FOR_SMS_CODE && this.d.reason == VerificationApi.FailReason.INCORRECT_SMS_CODE) {
            this.d.reason = VerificationApi.FailReason.OK;
            o();
        }
    }

    @Override // ru.mail.libverify.api.ae
    public final void e() {
        ru.mail.libverify.utils.d.c("VerificationSession", "session %s verified from other instance", this.d.id);
        if (n()) {
            return;
        }
        this.d.verifyApiResponse = null;
        this.d.callFragmentTemplate = null;
        this.d.smsCodeSource = VerificationApi.VerificationSource.APPLICATION_EXTERNAL;
        o();
        v();
    }

    @Override // ru.mail.libverify.api.ae
    public final void f() {
        l();
        v();
    }

    @Override // ru.mail.libverify.api.ae
    @NonNull
    public final String g() {
        return this.d.id;
    }

    @Override // ru.mail.libverify.api.ae
    @NonNull
    public final String h() {
        return ru.mail.libverify.utils.json.a.a(this.d);
    }

    @Override // ru.mail.libverify.api.ae
    @NonNull
    public final VerificationApi.VerificationStateDescriptor i() {
        return a(this.d.state, this.d.smsCodeSource, this.d.reason, this.d.verifyApiResponse);
    }

    @Override // ru.mail.libverify.api.ae
    public final long j() {
        return this.d.startTimeStamp;
    }

    @Override // ru.mail.libverify.api.ae
    @NonNull
    public final String k() {
        return this.d.verificationService;
    }

    public final String toString() {
        return "VerificationSession{id='" + this.d.id + "', state=" + this.d.state + ", userId='" + this.d.userId + "', userProvidedPhoneNumber='" + this.d.userProvidedPhoneNumber + "', verificationService='" + this.d.verificationService + "'}";
    }
}
