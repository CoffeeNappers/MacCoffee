package com.my.target.core.providers;

import android.content.Context;
import android.os.Looper;
import com.my.target.Tracer;
import java.lang.reflect.Method;
/* compiled from: GoogleAIdDataProvider.java */
/* loaded from: classes2.dex */
public final class e extends a {
    private boolean a = false;

    public final synchronized void a(Context context) {
        Method method;
        Object invoke;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Tracer.d("You must not call collectData method from main thread");
        } else if (!this.a) {
            Tracer.d("get google AId");
            Class<?> cls = Class.forName("com.google.android.gms.ads.identifier.AdvertisingIdClient");
            if (cls != null && (method = cls.getMethod("getAdvertisingIdInfo", Context.class)) != null && (invoke = method.invoke(null, context)) != null) {
                Method method2 = invoke.getClass().getMethod("getId", new Class[0]);
                if (method2 != null) {
                    String str = (String) method2.invoke(invoke, new Object[0]);
                    addParam("advertising_id", str);
                    Tracer.d("google AId: " + str);
                }
                Method method3 = invoke.getClass().getMethod("isLimitAdTrackingEnabled", new Class[0]);
                if (method3 != null) {
                    boolean booleanValue = ((Boolean) method3.invoke(invoke, new Object[0])).booleanValue();
                    addParam("advertising_tracking_enabled", new StringBuilder().append(booleanValue ? 0 : 1).toString());
                    Tracer.d("ad tracking enabled: " + (!booleanValue));
                }
            }
            this.a = true;
        }
    }
}
