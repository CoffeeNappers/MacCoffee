package ru.mail.libverify.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.support.annotation.NonNull;
import ru.mail.libverify.api.VerificationFactory;
import ru.mail.libverify.gcm.GcmRegisterService;
/* loaded from: classes3.dex */
public class PackageStateReceiver extends BroadcastReceiver {
    private static void a(@NonNull Context context) {
        if (!VerificationFactory.hasInstallation(context)) {
            return;
        }
        GcmRegisterService.b(context);
        AlarmReceiver.f(context);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0036, code lost:
        if (r4.equals("android.intent.action.MY_PACKAGE_REPLACED") != false) goto L8;
     */
    @Override // android.content.BroadcastReceiver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onReceive(android.content.Context r7, android.content.Intent r8) {
        /*
            r6 = this;
            r3 = 2
            r2 = 1
            r0 = 0
            if (r8 != 0) goto L6
        L5:
            return
        L6:
            java.lang.String r1 = "received %s %s"
            java.lang.Object[] r4 = new java.lang.Object[r3]
            java.lang.String r5 = r8.getAction()
            r4[r0] = r5
            android.net.Uri r5 = r8.getData()
            r4[r2] = r5
            java.lang.String.format(r1, r4)
            java.lang.String r4 = r8.getAction()
            r1 = -1
            int r5 = r4.hashCode()
            switch(r5) {
                case -810471698: goto L44;
                case 525384130: goto L39;
                case 1737074039: goto L2f;
                default: goto L26;
            }
        L26:
            r0 = r1
        L27:
            switch(r0) {
                case 0: goto L2b;
                case 1: goto L4f;
                case 2: goto L59;
                default: goto L2a;
            }
        L2a:
            goto L5
        L2b:
            a(r7)
            goto L5
        L2f:
            java.lang.String r2 = "android.intent.action.MY_PACKAGE_REPLACED"
            boolean r2 = r4.equals(r2)
            if (r2 == 0) goto L26
            goto L27
        L39:
            java.lang.String r0 = "android.intent.action.PACKAGE_REMOVED"
            boolean r0 = r4.equals(r0)
            if (r0 == 0) goto L26
            r0 = r2
            goto L27
        L44:
            java.lang.String r0 = "android.intent.action.PACKAGE_REPLACED"
            boolean r0 = r4.equals(r0)
            if (r0 == 0) goto L26
            r0 = r3
            goto L27
        L4f:
            boolean r0 = ru.mail.libverify.api.VerificationFactory.hasInstallation(r7)
            if (r0 == 0) goto L5
            ru.mail.libverify.utils.AlarmReceiver.d(r7)
            goto L5
        L59:
            android.net.Uri r0 = r8.getData()
            if (r0 != 0) goto L7e
            r0 = 0
        L60:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r2 = "package:"
            r1.<init>(r2)
            java.lang.String r2 = r7.getPackageName()
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            boolean r0 = android.text.TextUtils.equals(r0, r1)
            if (r0 == 0) goto L5
            a(r7)
            goto L5
        L7e:
            android.net.Uri r0 = r8.getData()
            java.lang.String r0 = r0.toString()
            goto L60
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.utils.PackageStateReceiver.onReceive(android.content.Context, android.content.Intent):void");
    }
}
