package ru.mail.libverify.api;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.LruCache;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.regex.Pattern;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.requests.i;
import ru.mail.libverify.requests.response.PhoneInfoResponse;
import ru.mail.libverify.utils.ServerException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class r {
    private static Pattern d;
    final HashMap<String, b> a = new HashMap<>();
    final LruCache<String, VerificationApi.PhoneCheckResult> b = new LruCache<>(50);
    final q c;
    private final ru.mail.libverify.storage.k e;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class a {
        static final HashSet<String> a = new HashSet<>();
        final String b;
        final String c;
        final HashMap<VerificationApi.PhoneCheckListener, String> d = new HashMap<>();
        final String e;
        final String f;
        final boolean g;
        final String h;

        /* JADX INFO: Access modifiers changed from: package-private */
        public a(@NonNull String str, @NonNull String str2, @NonNull String str3, boolean z, @NonNull VerificationApi.PhoneCheckListener phoneCheckListener) {
            this.b = str;
            this.c = str2;
            this.g = z;
            this.d.put(phoneCheckListener, str3);
            this.e = str3;
            this.f = r.a(str3);
            this.h = r.a(str2, this.f);
            a.add(str);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static boolean a(@NonNull String str) {
            return !a.contains(str);
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj != null && getClass() == obj.getClass()) {
                return this.h.equals(((a) obj).h);
            }
            return false;
        }

        public final int hashCode() {
            return this.h.hashCode();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class b {
        final Future a;
        final a b;

        b(@NonNull a aVar, @NonNull Future future) {
            this.b = aVar;
            this.a = future;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public r(@NonNull ru.mail.libverify.storage.k kVar, @NonNull q qVar) {
        this.e = kVar;
        this.c = qVar;
    }

    static /* synthetic */ String a(String str) {
        if (d == null) {
            d = Pattern.compile("[^\\+0-9]");
        }
        return d.matcher(str).replaceAll("");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String a(@NonNull String str, @NonNull String str2) {
        return String.format(Locale.US, "%s_%s", str2, str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(@NonNull a aVar, VerificationApi.PhoneCheckResult phoneCheckResult) {
        if (!aVar.d.isEmpty()) {
            for (Map.Entry<VerificationApi.PhoneCheckListener, String> entry : aVar.d.entrySet()) {
                entry.getKey().onCompleted(entry.getValue(), phoneCheckResult);
            }
        }
    }

    final VerificationApi.PhoneCheckResult a(@NonNull ru.mail.libverify.requests.j jVar, Future<PhoneInfoResponse> future, @NonNull a aVar) {
        VerificationApi.PhoneCheckResult c;
        VerificationApi.PhoneCheckResult a2;
        try {
            PhoneInfoResponse phoneInfoResponse = future.get();
            switch (phoneInfoResponse.getStatus()) {
                case OK:
                case UNSUPPORTED_NUMBER:
                case INCORRECT_PHONE_NUMBER:
                case PHONE_NUMBER_IN_BLACK_LIST:
                case PHONE_NUMBER_TYPE_NOT_ALLOWED:
                case NOT_ENOUGH_DATA:
                    a2 = p.a(phoneInfoResponse);
                    this.b.put(aVar.h, a2);
                    VerificationApi.PhoneCheckResult.ExtendedInfo extendedInfo = a2.getExtendedInfo();
                    if (extendedInfo != null && !TextUtils.isEmpty(extendedInfo.getModifiedPhoneNumber())) {
                        String a3 = a(aVar.c, a(extendedInfo.getModifiedPhoneNumber()));
                        if (!TextUtils.equals(a3, aVar.h)) {
                            this.b.put(a3, a2);
                            ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Modified phone %s from check %s added to cache", extendedInfo.getModifiedPhoneNumber(), aVar.e);
                            break;
                        }
                    }
                    break;
                case RATELIMIT:
                    a2 = p.a();
                    break;
                default:
                    this.c.a(phoneInfoResponse);
                    a2 = p.a();
                    break;
            }
            ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Check %s completed", aVar.e);
            return a2;
        } catch (ExecutionException e) {
            Throwable cause = e.getCause();
            if (cause == null) {
                c = p.a();
            } else {
                c = cause instanceof ServerException ? p.c() : cause instanceof IOException ? p.b() : p.a();
                this.c.a(jVar, cause);
            }
            ru.mail.libverify.utils.d.a("PhoneNumberChecker", e, "Check %s failed", aVar.e);
            return c;
        } catch (Throwable th) {
            VerificationApi.PhoneCheckResult a4 = p.a();
            ru.mail.libverify.utils.c.a("PhoneNumberChecker", th, "Check %s failed", aVar.e);
            return a4;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(@NonNull final a aVar, boolean z) {
        if (!this.e.j()) {
            if (z) {
                return;
            }
            a(aVar, p.b());
            return;
        }
        String str = aVar.c;
        final String format = String.format(Locale.US, "%s_%s", aVar.b, str);
        b bVar = this.a.get(format);
        if (bVar != null) {
            if (!bVar.a.isCancelled() && bVar.b.equals(aVar)) {
                ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Check %s requests joined", aVar.e);
                bVar.b.d.putAll(aVar.d);
                return;
            }
            ru.mail.libverify.utils.d.c("PhoneNumberChecker", "Check %s cancel previous request", aVar.e);
            bVar.a.cancel(true);
            bVar.b.d.clear();
            this.a.remove(format);
        }
        final ru.mail.libverify.requests.j jVar = new ru.mail.libverify.requests.j(this.e, aVar.f, aVar.c, aVar.b, aVar.g);
        ru.mail.libverify.utils.d.b("PhoneNumberChecker", "Check %s start request", aVar.e);
        this.a.put(format, new b(aVar, jVar.a(this.c.b(), new i.b<PhoneInfoResponse>() { // from class: ru.mail.libverify.api.r.1
            @Override // ru.mail.libverify.requests.i.b
            public final Handler a() {
                return r.this.c.a();
            }

            @Override // ru.mail.libverify.requests.i.b
            public final void a(Future<PhoneInfoResponse> future) {
                if (future.isCancelled()) {
                    return;
                }
                VerificationApi.PhoneCheckResult a2 = r.this.a(jVar, future, aVar);
                r.this.a.remove(format);
                r.a(aVar, a2);
            }
        })));
    }
}
