package ru.mail.libverify.api;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.safetynet.SafetyNet;
import com.google.android.gms.safetynet.SafetyNetApi;
import java.util.concurrent.Future;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class g implements e {
    final ru.mail.libverify.storage.k a;
    final f b;
    Future c;
    String d;

    /* JADX INFO: Access modifiers changed from: package-private */
    public g(@NonNull ru.mail.libverify.storage.k kVar, @NonNull f fVar) {
        this.a = kVar;
        this.b = fVar;
    }

    private void d() {
        if (this.c != null) {
            this.c.cancel(true);
            this.c = null;
        }
        this.d = null;
    }

    @Override // ru.mail.libverify.api.e
    public final void a() {
        if (TextUtils.isEmpty(this.b.b().a("app_check_started"))) {
            ru.mail.libverify.utils.d.c("ApplicationChecker", "no pending job");
            return;
        }
        final String str = this.d;
        if (TextUtils.isEmpty(str)) {
            this.b.a();
            ru.mail.libverify.utils.d.b("ApplicationChecker", "request server for an application check id");
        } else if (this.c != null) {
        } else {
            this.c = this.b.c().submit(new Runnable() { // from class: ru.mail.libverify.api.g.1
                @Override // java.lang.Runnable
                public final void run() {
                    final d dVar;
                    byte[] e;
                    GoogleApiClient build;
                    ConnectionResult blockingConnect;
                    final String str2 = null;
                    if (Thread.interrupted()) {
                        ru.mail.libverify.utils.d.b("ApplicationChecker", "application check interrupted");
                        return;
                    }
                    try {
                        Context d = g.this.a.d();
                        e = ru.mail.libverify.utils.m.e(str);
                        ru.mail.libverify.utils.d.c("ApplicationChecker", "jws request started");
                        build = new GoogleApiClient.Builder(d).addApi(SafetyNet.API).build();
                        blockingConnect = build.blockingConnect();
                    } catch (InterruptedException e2) {
                        ru.mail.libverify.utils.d.a("ApplicationChecker", "application check interrupted", e2);
                        return;
                    } catch (AttestationFailedException e3) {
                        dVar = d.ATTESTATION_FAILED;
                        ru.mail.libverify.utils.d.a("ApplicationChecker", "application check failed", e3);
                    } catch (GAPIClientFailedException e4) {
                        dVar = d.GP_SERVICE_NOT_AVAILABLE;
                        ru.mail.libverify.utils.d.a("ApplicationChecker", "application check failed", e4);
                    } catch (Throwable th) {
                        dVar = d.GENERAL_ERROR;
                        ru.mail.libverify.utils.d.a("ApplicationChecker", "application check failed", th);
                    }
                    if (!blockingConnect.isSuccess()) {
                        ru.mail.libverify.utils.d.a("ApplicationChecker", "connection failed with result %s", String.valueOf(blockingConnect.getErrorCode()));
                        throw new GAPIClientFailedException();
                    }
                    SafetyNetApi.AttestationResult await = SafetyNet.SafetyNetApi.attest(build, e).await();
                    Status status = await.getStatus();
                    if (status.isSuccess()) {
                        ru.mail.libverify.utils.d.b("ApplicationChecker", "attestation completed with status %s", status);
                        str2 = await.getJwsResult();
                        dVar = d.SUCCESS;
                        final g gVar = g.this;
                        gVar.b.d().post(new Runnable() { // from class: ru.mail.libverify.api.g.2
                            @Override // java.lang.Runnable
                            public final void run() {
                                ru.mail.libverify.utils.d.c("ApplicationChecker", "application check completed jws %s, result %s", str2, dVar);
                                g.this.c = null;
                                g.this.d = null;
                                ru.mail.libverify.storage.o d2 = g.this.b.b().d("app_check_started");
                                if (dVar == d.SUCCESS) {
                                    d2.a("app_check_completed", Long.toString(System.currentTimeMillis()));
                                }
                                d2.a();
                                g.this.b.a(str2, dVar);
                            }
                        });
                    } else if (status.isInterrupted() || status.isCanceled()) {
                        ru.mail.libverify.utils.d.a("ApplicationChecker", "attestation cancelled with status %s", status);
                        throw new InterruptedException();
                    } else {
                        ru.mail.libverify.utils.d.a("ApplicationChecker", "attestation failed with status %s", status);
                        throw new AttestationFailedException();
                    }
                }
            });
        }
    }

    @Override // ru.mail.libverify.api.e
    public final void a(@NonNull String str) {
        ru.mail.libverify.utils.d.b("ApplicationChecker", "application check server id %s received", str);
        this.d = str;
        a();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0039  */
    @Override // ru.mail.libverify.api.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b() {
        /*
            r4 = this;
            ru.mail.libverify.api.f r0 = r4.b
            ru.mail.libverify.storage.o r0 = r0.b()
            java.lang.String r1 = "app_check_completed"
            java.lang.String r0 = r0.a(r1)
            boolean r1 = android.text.TextUtils.isEmpty(r0)
            if (r1 != 0) goto L37
            long r2 = java.lang.System.currentTimeMillis()
            long r0 = java.lang.Long.parseLong(r0)
            long r0 = r2 - r0
            r2 = 0
            int r2 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r2 <= 0) goto L37
            r2 = 86400000(0x5265c00, double:4.2687272E-316)
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 >= 0) goto L37
            r0 = 0
        L2b:
            if (r0 != 0) goto L39
            java.lang.String r0 = "ApplicationChecker"
            java.lang.String r1 = "application check blocked by timeout"
            ru.mail.libverify.utils.d.a(r0, r1)
        L36:
            return
        L37:
            r0 = 1
            goto L2b
        L39:
            java.lang.String r0 = "ApplicationChecker"
            java.lang.String r1 = "application check requested"
            ru.mail.libverify.utils.d.b(r0, r1)
            ru.mail.libverify.api.f r0 = r4.b
            ru.mail.libverify.storage.o r0 = r0.b()
            java.lang.String r1 = "app_check_started"
            long r2 = java.lang.System.currentTimeMillis()
            java.lang.String r2 = java.lang.Long.toString(r2)
            ru.mail.libverify.storage.o r0 = r0.a(r1, r2)
            r0.a()
            r4.d()
            r4.a()
            goto L36
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.api.g.b():void");
    }

    @Override // ru.mail.libverify.api.e
    public final void c() {
        d();
        this.b.b().d("app_check_completed").d("app_check_started").a();
    }
}
