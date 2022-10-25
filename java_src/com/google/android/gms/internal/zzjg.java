package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Looper;
import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzjh;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.Thread;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.WeakHashMap;
@zzji
/* loaded from: classes.dex */
public class zzjg implements zzjh {
    private static final Object zzaox = new Object();
    private static zzjh zzcja = null;
    private final VersionInfoParcel zzapc;
    private final String zzcjc;
    private final Object zzcjb = new Object();
    private final WeakHashMap<Thread, Boolean> zzcjd = new WeakHashMap<>();

    zzjg(String str, VersionInfoParcel versionInfoParcel) {
        this.zzcjc = str;
        this.zzapc = versionInfoParcel;
        zzsz();
        zzsy();
    }

    public static zzjh zzb(Context context, VersionInfoParcel versionInfoParcel) {
        synchronized (zzaox) {
            if (zzcja == null) {
                if (zzdr.zzbdc.get().booleanValue()) {
                    zzcja = new zzjg(context.getApplicationContext().getPackageName(), versionInfoParcel);
                } else {
                    zzcja = new zzjh.zza();
                }
            }
        }
        return zzcja;
    }

    private Throwable zzd(Throwable th) {
        Throwable th2;
        if (zzdr.zzbdd.get().booleanValue()) {
            return th;
        }
        LinkedList linkedList = new LinkedList();
        while (th != null) {
            linkedList.push(th);
            th = th.getCause();
        }
        Throwable th3 = null;
        while (!linkedList.isEmpty()) {
            Throwable th4 = (Throwable) linkedList.pop();
            StackTraceElement[] stackTrace = th4.getStackTrace();
            ArrayList arrayList = new ArrayList();
            arrayList.add(new StackTraceElement(th4.getClass().getName(), "<filtered>", "<filtered>", 1));
            boolean z = false;
            for (StackTraceElement stackTraceElement : stackTrace) {
                if (zzck(stackTraceElement.getClassName())) {
                    arrayList.add(stackTraceElement);
                    z = true;
                } else if (zzcl(stackTraceElement.getClassName())) {
                    arrayList.add(stackTraceElement);
                } else {
                    arrayList.add(new StackTraceElement("<filtered>", "<filtered>", "<filtered>", 1));
                }
            }
            if (z) {
                th2 = th3 == null ? new Throwable(th4.getMessage()) : new Throwable(th4.getMessage(), th3);
                th2.setStackTrace((StackTraceElement[]) arrayList.toArray(new StackTraceElement[0]));
            } else {
                th2 = th3;
            }
            th3 = th2;
        }
        return th3;
    }

    private void zzsy() {
        final Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.google.android.gms.internal.zzjg.1
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public void uncaughtException(Thread thread, Throwable th) {
                try {
                    zzjg.this.zza(thread, th);
                } catch (Throwable th2) {
                    try {
                        zzkx.e("AdMob exception reporter failed reporting the exception.");
                        if (defaultUncaughtExceptionHandler == null) {
                            return;
                        }
                        defaultUncaughtExceptionHandler.uncaughtException(thread, th);
                    } finally {
                        if (defaultUncaughtExceptionHandler != null) {
                            defaultUncaughtExceptionHandler.uncaughtException(thread, th);
                        }
                    }
                }
            }
        });
    }

    private void zzsz() {
        zza(Looper.getMainLooper().getThread());
    }

    String zza(Class cls, Throwable th, String str) {
        StringWriter stringWriter = new StringWriter();
        th.printStackTrace(new PrintWriter(stringWriter));
        return new Uri.Builder().scheme(UriUtil.HTTPS_SCHEME).path("//pagead2.googlesyndication.com/pagead/gen_204").appendQueryParameter("id", "gmob-apps-report-exception").appendQueryParameter("os", Build.VERSION.RELEASE).appendQueryParameter("api", String.valueOf(Build.VERSION.SDK_INT)).appendQueryParameter("device", com.google.android.gms.ads.internal.zzu.zzgm().zzvt()).appendQueryParameter("js", this.zzapc.zzda).appendQueryParameter("appid", this.zzcjc).appendQueryParameter("exceptiontype", cls.getName()).appendQueryParameter("stacktrace", stringWriter.toString()).appendQueryParameter("eids", TextUtils.join(",", zzdr.zzlq())).appendQueryParameter("exceptionkey", str).appendQueryParameter("cl", "135396225").appendQueryParameter("rc", "dev").toString();
    }

    public void zza(Thread thread) {
        if (thread == null) {
            return;
        }
        synchronized (this.zzcjb) {
            this.zzcjd.put(thread, true);
        }
        final Thread.UncaughtExceptionHandler uncaughtExceptionHandler = thread.getUncaughtExceptionHandler();
        thread.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() { // from class: com.google.android.gms.internal.zzjg.2
            @Override // java.lang.Thread.UncaughtExceptionHandler
            public void uncaughtException(Thread thread2, Throwable th) {
                try {
                    zzjg.this.zza(thread2, th);
                } catch (Throwable th2) {
                    try {
                        zzkx.e("AdMob exception reporter failed reporting the exception.");
                        if (uncaughtExceptionHandler == null) {
                            return;
                        }
                        uncaughtExceptionHandler.uncaughtException(thread2, th);
                    } finally {
                        if (uncaughtExceptionHandler != null) {
                            uncaughtExceptionHandler.uncaughtException(thread2, th);
                        }
                    }
                }
            }
        });
    }

    protected void zza(Thread thread, Throwable th) {
        if (zzb(th)) {
            zzc(th);
        }
    }

    @Override // com.google.android.gms.internal.zzjh
    public void zza(Throwable th, String str) {
        Throwable zzd = zzd(th);
        if (zzd == null) {
            return;
        }
        Class<?> cls = th.getClass();
        ArrayList arrayList = new ArrayList();
        arrayList.add(zza(cls, zzd, str));
        com.google.android.gms.ads.internal.zzu.zzgm().zza(arrayList, com.google.android.gms.ads.internal.zzu.zzgq().zzux());
    }

    protected boolean zzb(Throwable th) {
        StackTraceElement[] stackTrace;
        boolean z = true;
        if (th == null) {
            return false;
        }
        boolean z2 = false;
        boolean z3 = false;
        while (th != null) {
            for (StackTraceElement stackTraceElement : th.getStackTrace()) {
                if (zzck(stackTraceElement.getClassName())) {
                    z3 = true;
                }
                if (getClass().getName().equals(stackTraceElement.getClassName())) {
                    z2 = true;
                }
            }
            th = th.getCause();
        }
        if (!z3 || z2) {
            z = false;
        }
        return z;
    }

    public void zzc(Throwable th) {
        zza(th, "");
    }

    protected boolean zzck(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        if (str.startsWith(zzdr.zzbde.get())) {
            return true;
        }
        try {
            return Class.forName(str).isAnnotationPresent(zzji.class);
        } catch (Exception e) {
            String valueOf = String.valueOf(str);
            zzkx.zza(valueOf.length() != 0 ? "Fail to check class type for class ".concat(valueOf) : new String("Fail to check class type for class "), e);
            return false;
        }
    }

    protected boolean zzcl(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.startsWith("android.") || str.startsWith("java.");
    }
}
