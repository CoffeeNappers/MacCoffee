package ru.mail.libverify.utils.network;

import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import ru.mail.libverify.utils.d;
/* loaded from: classes3.dex */
public class NetworkCheckService extends IntentService {
    private final long a;
    private final Object b;

    public NetworkCheckService() {
        super("NetworkCheckService");
        this.b = new Object();
        this.a = System.currentTimeMillis();
    }

    private long a() {
        long currentTimeMillis = System.currentTimeMillis() - this.a;
        if (currentTimeMillis < 0) {
            return 0L;
        }
        return 600000 - currentTimeMillis;
    }

    public static void a(@NonNull Context context) {
        d.c("NetworkCheckService", "start network checking");
        try {
            context.startService(new Intent(context, NetworkCheckService.class));
        } catch (Throwable th) {
            d.a("NetworkCheckService", "failed to start network check service", th);
        }
    }

    @Override // android.app.IntentService, android.app.Service
    public void onDestroy() {
        d.c("NetworkCheckService", "service destroyed");
        super.onDestroy();
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0045, code lost:
        ru.mail.libverify.utils.d.c("NetworkCheckService", "onHandleIntent internet connection detected");
     */
    @Override // android.app.IntentService
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void onHandleIntent(android.content.Intent r12) {
        /*
            r11 = this;
            r4 = 1
            r2 = 0
            java.lang.String r0 = "NetworkCheckService"
            java.lang.String r1 = "onHandleIntent started"
            ru.mail.libverify.utils.d.c(r0, r1)
            long r0 = r11.a()
            r6 = r4
        L11:
            int r4 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r4 <= 0) goto L4f
            java.lang.Object r7 = r11.b
            monitor-enter(r7)
            java.lang.String r4 = "NetworkCheckService"
            java.lang.String r5 = "onHandleIntent on iteration = %d remaining time = %d"
            r8 = 2
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            r9 = 0
            java.lang.Integer r10 = java.lang.Integer.valueOf(r6)     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            r8[r9] = r10     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            r9 = 1
            java.lang.Long r10 = java.lang.Long.valueOf(r0)     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            r8[r9] = r10     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            ru.mail.libverify.utils.d.c(r4, r5, r8)     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            java.lang.Object r8 = r11.b     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            int r4 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r4 >= 0) goto L59
            r0 = r2
        L39:
            r8.wait(r0)     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            ru.mail.libverify.utils.network.NetworkStateReceiver.b(r11)     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            boolean r0 = ru.mail.libverify.utils.network.NetworkStateReceiver.a()     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            if (r0 == 0) goto L73
            java.lang.String r0 = "NetworkCheckService"
            java.lang.String r1 = "onHandleIntent internet connection detected"
            ru.mail.libverify.utils.d.c(r0, r1)     // Catch: java.lang.InterruptedException -> L64 java.lang.Throwable -> L70
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L70
        L4f:
            java.lang.String r0 = "NetworkCheckService"
            java.lang.String r1 = "onHandleIntent completed"
            ru.mail.libverify.utils.d.c(r0, r1)
            return
        L59:
            int r4 = r6 * r6
            int r4 = r4 * 200
            long r4 = (long) r4
            int r9 = (r4 > r0 ? 1 : (r4 == r0 ? 0 : -1))
            if (r9 > 0) goto L39
            r0 = r4
            goto L39
        L64:
            r0 = move-exception
            java.lang.String r0 = "NetworkCheckService"
            java.lang.String r1 = "onHandleIntent wait loop interrupted"
            ru.mail.libverify.utils.d.a(r0, r1)     // Catch: java.lang.Throwable -> L70
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L70
            goto L4f
        L70:
            r0 = move-exception
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L70
            throw r0
        L73:
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L70
            int r4 = r6 + 1
            long r0 = r11.a()
            r6 = r4
            goto L11
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.utils.network.NetworkCheckService.onHandleIntent(android.content.Intent):void");
    }

    @Override // android.app.IntentService, android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        d.c("NetworkCheckService", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }
}
