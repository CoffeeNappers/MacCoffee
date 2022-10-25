package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.regex.Pattern;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.api.h;
import ru.mail.libverify.requests.response.SmsInfo;
import ru.mail.libverify.sms.SmsItem;
import ru.mail.libverify.sms.c;
import ru.mail.libverify.utils.json.JsonParseException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class c implements ru.mail.libverify.api.a {
    private static final Pattern a = Pattern.compile("^.*(\\d{4,}).*$");
    private final ru.mail.libverify.storage.k b;
    private final b c;
    private final Runnable d = new Runnable() { // from class: ru.mail.libverify.api.c.1
        @Override // java.lang.Runnable
        public final void run() {
            ru.mail.libverify.utils.d.a("AccountChecker", "sms info request timeout expired");
            c.this.a(VerificationApi.AccountCheckResult.NO_SMS_INFO);
        }
    };
    private volatile SmsInfo e;
    private volatile List<SmsItem> f;
    private VerificationApi.AccountCheckListener g;
    private String h;
    private Map<String, SmsItem> i;
    private Future j;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class a {
        boolean a;
        boolean b;

        private a() {
            this.a = false;
            this.b = false;
        }

        /* synthetic */ a(byte b) {
            this();
        }

        public final String toString() {
            return "SmsMatchReport{hasAtLeastOneMatch=" + this.a + ", hasAtLeastOneDigitalCode=" + this.b + '}';
        }
    }

    public c(@NonNull ru.mail.libverify.storage.k kVar, @NonNull b bVar) {
        this.b = kVar;
        this.c = bVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(@NonNull List<SmsItem> list) {
        ru.mail.libverify.utils.d.b("AccountChecker", "account data %s check completed, sms found %d", this.h, Integer.valueOf(list.size()));
        this.c.a(this.h, b(list), VerificationApi.AccountCheckResult.OK);
        if (this.g != null) {
            this.g.onComplete(VerificationApi.AccountCheckResult.OK);
        }
        g();
        h();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(VerificationApi.AccountCheckResult accountCheckResult) {
        ru.mail.libverify.utils.d.a("AccountChecker", "failed to check account data %s, error %s", this.h, accountCheckResult);
        this.c.a(this.h, b(accountCheckResult), accountCheckResult);
        if (this.g != null) {
            this.g.onComplete(accountCheckResult);
        }
        if (accountCheckResult == VerificationApi.AccountCheckResult.GENERAL_ERROR) {
            b();
            return;
        }
        g();
        h();
    }

    private static String b(@NonNull List<SmsItem> list) {
        if (list.isEmpty()) {
            return null;
        }
        try {
            return ru.mail.libverify.utils.json.a.a(new AccountCheckFormatter(list));
        } catch (JsonParseException e) {
            ru.mail.libverify.utils.c.a("AccountChecker", "failed to format json", e);
            return null;
        }
    }

    private static String b(VerificationApi.AccountCheckResult accountCheckResult) {
        try {
            return ru.mail.libverify.utils.json.a.a(new AccountCheckFormatter(accountCheckResult));
        } catch (JsonParseException e) {
            ru.mail.libverify.utils.c.a("AccountChecker", "failed to format json", e);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static c.a b(@NonNull final SmsInfo smsInfo, @NonNull final h.a aVar, @NonNull final a aVar2) {
        return new c.a() { // from class: ru.mail.libverify.api.c.3
            @Override // ru.mail.libverify.sms.c.a
            public final long a() {
                return smsInfo.getTimeShiftMax();
            }

            @Override // ru.mail.libverify.sms.c.a
            public final String a(@NonNull String str) {
                if (Thread.interrupted()) {
                    throw new InterruptedException();
                }
                String b = h.b(str, h.a.this);
                if (!aVar2.b && TextUtils.isEmpty(b) && !TextUtils.isEmpty(str)) {
                    aVar2.b = c.a.matcher(str).matches();
                }
                return b;
            }

            @Override // ru.mail.libverify.sms.c.a
            public final long b() {
                return smsInfo.getTimeShiftMin();
            }

            @Override // ru.mail.libverify.sms.c.a
            public final boolean b(@Nullable String str) {
                if (Thread.interrupted()) {
                    throw new InterruptedException();
                }
                boolean contains = smsInfo.getSourceNumbers().contains(str);
                if (!aVar2.a) {
                    aVar2.a = contains;
                }
                return contains;
            }

            @Override // ru.mail.libverify.sms.c.a
            public final int c() {
                return smsInfo.getDepth();
            }

            @Override // ru.mail.libverify.sms.c.a
            public final int d() {
                return smsInfo.getMaxSmsCount();
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean c(SmsInfo smsInfo) {
        return (smsInfo == null || smsInfo.getSmsTemplates() == null || smsInfo.getSmsTemplates().length == 0 || smsInfo.getSourceNumbers() == null || smsInfo.getSourceNumbers().isEmpty()) ? false : true;
    }

    private void d() {
        if (this.i == null || this.i.isEmpty()) {
            ru.mail.libverify.utils.d.b("AccountChecker", "no intercepted sms");
        } else if (!c(this.e)) {
        } else {
            try {
                a aVar = new a((byte) 0);
                h.a aVar2 = new h.a();
                aVar2.b = this.e.getSmsTemplates();
                String b = b(this.b.r().a(b(this.e, aVar2, aVar), this.i.values()));
                ru.mail.libverify.utils.d.c("AccountChecker", "intercepted sms parse result %s", aVar);
                if (TextUtils.isEmpty(b)) {
                    return;
                }
                this.c.a(b);
            } catch (Throwable th) {
                try {
                    ru.mail.libverify.utils.d.a("AccountChecker", "failed to process intercepted sms");
                } finally {
                    h();
                }
            }
        }
    }

    private void e() {
        if (TextUtils.isEmpty(this.h)) {
            ru.mail.libverify.utils.d.b("AccountChecker", "no application json");
        } else if (this.f != null) {
            ru.mail.libverify.utils.d.b("AccountChecker", "application check has been already completed");
            a(this.f);
        } else if (this.j != null) {
            ru.mail.libverify.utils.d.b("AccountChecker", "sms finding process for the account data %s has been already started", this.h);
        } else {
            ru.mail.libverify.utils.d.b("AccountChecker", "start sms finding process for the account data %s", this.h);
            this.j = this.c.e().submit(new Runnable() { // from class: ru.mail.libverify.api.c.2
                @Override // java.lang.Runnable
                public final void run() {
                    SmsInfo smsInfo = c.this.e;
                    if (!c.c(smsInfo)) {
                        c.this.c.f().post(new Runnable() { // from class: ru.mail.libverify.api.c.2.1
                            @Override // java.lang.Runnable
                            public final void run() {
                                c.this.j = null;
                                c.this.a(VerificationApi.AccountCheckResult.NO_SMS_INFO);
                            }
                        });
                        return;
                    }
                    c.this.c.b();
                    ru.mail.libverify.sms.c r = c.this.b.r();
                    final a aVar = new a((byte) 0);
                    h.a aVar2 = new h.a();
                    aVar2.b = smsInfo.getSmsTemplates();
                    try {
                        final List<SmsItem> a2 = r.a(c.b(smsInfo, aVar2, aVar));
                        c.this.c.f().post(new Runnable() { // from class: ru.mail.libverify.api.c.2.2
                            @Override // java.lang.Runnable
                            public final void run() {
                                try {
                                    if (!a2.isEmpty()) {
                                        c.this.f = a2;
                                        c.this.a(c.this.f);
                                    } else if (aVar.b) {
                                        c.this.a(VerificationApi.AccountCheckResult.NO_SMS_FOUND_HAS_CODE);
                                    } else if (aVar.a) {
                                        c.this.a(VerificationApi.AccountCheckResult.NO_SMS_FOUND_HAS_SOURCE_MATCH);
                                    } else {
                                        c.this.a(VerificationApi.AccountCheckResult.NO_SMS_FOUND);
                                    }
                                } finally {
                                    c.this.j = null;
                                    c.this.c.c();
                                }
                            }
                        });
                    } catch (InterruptedException e) {
                        ru.mail.libverify.utils.d.b("AccountChecker", "query user sms messages interrupted", e);
                    } catch (Throwable th) {
                        ru.mail.libverify.utils.d.a("AccountChecker", "failed to query user sms messages", th);
                        c.this.c.f().post(new Runnable() { // from class: ru.mail.libverify.api.c.2.3
                            @Override // java.lang.Runnable
                            public final void run() {
                                try {
                                    c.this.f = new ArrayList();
                                    c.this.a(VerificationApi.AccountCheckResult.GENERAL_ERROR);
                                } finally {
                                    c.this.j = null;
                                    c.this.c.c();
                                }
                            }
                        });
                    }
                }
            });
        }
    }

    private void f() {
        this.c.a();
        this.c.f().postDelayed(this.d, 1800000L);
    }

    private void g() {
        this.c.d().a("account_check_time", Long.toString(System.currentTimeMillis()));
    }

    private void h() {
        this.c.f().removeCallbacks(this.d);
        this.c.d().d("account_check_app_json").d("account_check_intercepted_sms").a();
        this.h = null;
        this.i = null;
    }

    private void i() {
        if (this.h == null) {
            this.h = this.c.d().a("account_check_app_json");
        }
        if (this.i == null) {
            try {
                String a2 = this.c.d().a("account_check_intercepted_sms");
                if (TextUtils.isEmpty(a2)) {
                    return;
                }
                this.i = ru.mail.libverify.utils.json.a.c(a2, SmsItem.class);
            } catch (Throwable th) {
                ru.mail.libverify.utils.d.a("AccountChecker", "failed to restore intercepted sms");
                this.c.d().d("account_check_intercepted_sms").a();
            }
        }
    }

    private void j() {
        if (this.h != null) {
            this.c.d().a("account_check_app_json", this.h);
        } else {
            this.c.d().d("account_check_time");
        }
        if (this.i != null) {
            try {
                this.c.d().a("account_check_intercepted_sms", ru.mail.libverify.utils.json.a.a(this.i));
            } catch (Throwable th) {
                ru.mail.libverify.utils.d.a("AccountChecker", "failed to save intercepted sms");
                this.i = null;
            }
        } else {
            this.c.d().d("account_check_intercepted_sms");
        }
        this.c.d().a();
    }

    @Override // ru.mail.libverify.api.a
    public final void a() {
        i();
        if (!TextUtils.isEmpty(this.h)) {
            a(this.h, this.g);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x004a  */
    @Override // ru.mail.libverify.api.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(@android.support.annotation.NonNull java.lang.String r9, @android.support.annotation.Nullable ru.mail.libverify.api.VerificationApi.AccountCheckListener r10) {
        /*
            r8 = this;
            r2 = 1
            r1 = 0
            boolean r0 = android.text.TextUtils.isEmpty(r9)
            if (r0 == 0) goto Le
            ru.mail.libverify.api.VerificationApi$AccountCheckResult r0 = ru.mail.libverify.api.VerificationApi.AccountCheckResult.EMPTY_ACCOUNT_DATA
            r8.a(r0)
        Ld:
            return
        Le:
            ru.mail.libverify.api.b r0 = r8.c
            ru.mail.libverify.storage.o r0 = r0.d()
            java.lang.String r3 = "account_check_time"
            java.lang.String r0 = r0.a(r3)
            boolean r3 = android.text.TextUtils.isEmpty(r0)
            if (r3 != 0) goto L48
            long r4 = java.lang.System.currentTimeMillis()
            long r6 = java.lang.Long.parseLong(r0)
            long r4 = r4 - r6
            r6 = 0
            int r0 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r0 < 0) goto L48
            r6 = 43200000(0x2932e00, double:2.1343636E-316)
            int r0 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r0 >= 0) goto L48
            r0 = r1
        L38:
            if (r0 != 0) goto L4a
            java.lang.String r0 = "AccountChecker"
            java.lang.String r3 = "account data %s check dismissed by timeout"
            java.lang.Object[] r2 = new java.lang.Object[r2]
            r2[r1] = r9
            ru.mail.libverify.utils.d.b(r0, r3, r2)
            goto Ld
        L48:
            r0 = r2
            goto L38
        L4a:
            java.lang.String r0 = "AccountChecker"
            java.lang.String r3 = "account data %s check started"
            java.lang.Object[] r2 = new java.lang.Object[r2]
            r2[r1] = r9
            ru.mail.libverify.utils.d.b(r0, r3, r2)
            r8.g = r10
            r8.h = r9
            r8.j()
            ru.mail.libverify.storage.k r0 = r8.b
            android.content.Context r0 = r0.d()
            java.lang.String r1 = "android.permission.READ_SMS"
            boolean r0 = ru.mail.libverify.utils.m.b(r0, r1)
            if (r0 != 0) goto L73
            ru.mail.libverify.api.VerificationApi$AccountCheckResult r0 = ru.mail.libverify.api.VerificationApi.AccountCheckResult.NO_SMS_PERMISSION
            r8.a(r0)
            goto Ld
        L73:
            ru.mail.libverify.requests.response.SmsInfo r0 = r8.e
            if (r0 != 0) goto L7b
            r8.f()
            goto Ld
        L7b:
            r8.e()
            goto Ld
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.api.c.a(java.lang.String, ru.mail.libverify.api.VerificationApi$AccountCheckListener):void");
    }

    @Override // ru.mail.libverify.api.a
    public final void a(@Nullable SmsInfo smsInfo) {
        this.e = smsInfo;
        e();
        d();
    }

    @Override // ru.mail.libverify.api.a
    public final void a(@NonNull SmsItem smsItem) {
        ru.mail.libverify.utils.d.c("AccountChecker", "process alien sms from %s with text %s", smsItem.from, smsItem.extracted);
        i();
        if (this.i == null) {
            this.i = new HashMap();
        }
        this.i.put(smsItem.from, smsItem);
        j();
        if (this.e == null) {
            f();
        } else {
            d();
        }
    }

    @Override // ru.mail.libverify.api.a
    public final void b() {
        ru.mail.libverify.utils.d.b("AccountChecker", "reset started");
        h();
        this.c.d().d("account_check_time");
        this.e = null;
        this.f = null;
        if (this.j != null) {
            this.j.cancel(true);
            this.j = null;
        }
        ru.mail.libverify.utils.d.b("AccountChecker", "reset completed");
    }
}
