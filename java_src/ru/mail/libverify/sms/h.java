package ru.mail.libverify.sms;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import ru.mail.libverify.sms.g;
/* loaded from: classes3.dex */
public final class h implements g {
    final Context a;
    final Handler b;
    private final Map<g.b, a> c = new HashMap();
    private final ExecutorService d;

    /* loaded from: classes3.dex */
    private class a extends PhoneStateListener {
        private g.b b;

        private a() {
        }

        /* synthetic */ a(h hVar, byte b) {
            this();
        }

        @Override // android.telephony.PhoneStateListener
        public final void onCallStateChanged(final int i, final String str) {
            h.this.b.post(new Runnable() { // from class: ru.mail.libverify.sms.h.a.1
                @Override // java.lang.Runnable
                public final void run() {
                    ru.mail.libverify.utils.d.c("PhoneCallInterceptor", "onCallStateChanged state %d number %s", Integer.valueOf(i), str);
                    if (a.this.b == null || i != 1 || TextUtils.isEmpty(str) || !a.this.b.a(str)) {
                        return;
                    }
                    h hVar = h.this;
                    TelephonyManager a = hVar.a();
                    try {
                        if (!ru.mail.libverify.utils.m.b(hVar.a, "android.permission.CALL_PHONE")) {
                            ru.mail.libverify.utils.d.b("PhoneCallInterceptor", "can't reject call without %s permission", "android.permission.CALL_PHONE");
                        } else {
                            Method declaredMethod = TelephonyManager.class.getDeclaredMethod("getITelephony", new Class[0]);
                            declaredMethod.setAccessible(true);
                            Object invoke = declaredMethod.invoke(a, new Object[0]);
                            Class<?> cls = Class.forName("com.android.internal.telephony.ITelephony");
                            h.a(cls, invoke, "endCall");
                            h.a(cls, invoke, "silenceRinger");
                            h.a(cls, invoke, "cancelMissedCallsNotification");
                        }
                    } catch (Throwable th) {
                        ru.mail.libverify.utils.d.b("PhoneCallInterceptor", "can't reject call", th);
                    }
                }
            });
        }
    }

    public h(@NonNull Context context, @NonNull Handler handler, @NonNull ExecutorService executorService) {
        this.a = context;
        this.b = handler;
        this.d = executorService;
    }

    static void a(Class cls, Object obj, String str) {
        cls.getDeclaredMethod(str, new Class[0]).invoke(obj, new Object[0]);
    }

    final TelephonyManager a() {
        return (TelephonyManager) this.a.getSystemService(SignupPhoneFragment.KEY_PHONE);
    }

    @Override // ru.mail.libverify.sms.g
    public final void a(@NonNull final g.a aVar) {
        if (Build.VERSION.SDK_INT < 16) {
            ru.mail.libverify.utils.d.b("PhoneCallInterceptor", "can't read calls on api < 16");
        } else {
            this.d.submit(new Runnable() { // from class: ru.mail.libverify.sms.h.1
                /* JADX WARN: Multi-variable type inference failed */
                /* JADX WARN: Removed duplicated region for block: B:32:0x0120  */
                /* JADX WARN: Type inference failed for: r6v10 */
                /* JADX WARN: Type inference failed for: r6v11 */
                /* JADX WARN: Type inference failed for: r6v12 */
                /* JADX WARN: Type inference failed for: r6v13 */
                /* JADX WARN: Type inference failed for: r6v14 */
                /* JADX WARN: Type inference failed for: r6v7 */
                @Override // java.lang.Runnable
                @android.annotation.SuppressLint({"InlinedApi"})
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void run() {
                    /*
                        Method dump skipped, instructions count: 422
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.sms.h.AnonymousClass1.run():void");
                }
            });
        }
    }

    @Override // ru.mail.libverify.sms.g
    public final void a(g.b bVar) {
        if (!ru.mail.libverify.utils.m.b(this.a, "android.permission.READ_PHONE_STATE")) {
            ru.mail.libverify.utils.d.b("PhoneCallInterceptor", "can't register call listener without %s permission", "android.permission.READ_PHONE_STATE");
        } else if (this.c.containsKey(bVar)) {
            ru.mail.libverify.utils.d.a("PhoneCallInterceptor", "callback has been already registered");
        } else {
            ru.mail.libverify.utils.d.c("PhoneCallInterceptor", "callback registered");
            a aVar = new a(this, (byte) 0);
            aVar.b = bVar;
            this.c.put(bVar, aVar);
            try {
                a().listen(aVar, 32);
            } catch (Throwable th) {
                ru.mail.libverify.utils.d.a("PhoneCallInterceptor", "failed to subscribe for a call state", th);
            }
        }
    }

    @Override // ru.mail.libverify.sms.g
    public final void b(g.b bVar) {
        if (!ru.mail.libverify.utils.m.b(this.a, "android.permission.READ_PHONE_STATE")) {
            ru.mail.libverify.utils.d.b("PhoneCallInterceptor", "can't unregister call listener without %s permission", "android.permission.READ_PHONE_STATE");
            return;
        }
        ru.mail.libverify.utils.d.c("PhoneCallInterceptor", "callback unregistered");
        a remove = this.c.remove(bVar);
        if (remove == null) {
            return;
        }
        remove.b = null;
        try {
            a().listen(remove, 0);
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("PhoneCallInterceptor", "failed to subscribe for a call state", th);
        }
    }
}
