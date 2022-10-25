package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Rect;
import android.os.PowerManager;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.TextView;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public class zzda extends Thread {
    private final zzcy zzawi;
    private final zzjh zzawj;
    private boolean mStarted = false;
    private boolean zzawh = false;
    private boolean zzbl = false;
    private final Object zzako = new Object();
    private final int zzavi = zzdr.zzbev.get().intValue();
    private final int zzawl = zzdr.zzbew.get().intValue();
    private final int zzavk = zzdr.zzbex.get().intValue();
    private final int zzawm = zzdr.zzbey.get().intValue();
    private final int zzawn = zzdr.zzbfb.get().intValue();
    private final int zzawo = zzdr.zzbfd.get().intValue();
    private final int zzawp = zzdr.zzbfe.get().intValue();
    private final int zzawk = zzdr.zzbez.get().intValue();
    private final String zzawq = zzdr.zzbfg.get();

    /* JADX INFO: Access modifiers changed from: package-private */
    @zzji
    /* loaded from: classes.dex */
    public class zza {
        final int zzawy;
        final int zzawz;

        zza(int i, int i2) {
            this.zzawy = i;
            this.zzawz = i2;
        }
    }

    public zzda(zzcy zzcyVar, zzjh zzjhVar) {
        this.zzawi = zzcyVar;
        this.zzawj = zzjhVar;
        setName("ContentFetchTask");
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        while (true) {
            try {
                if (zzji()) {
                    Activity activity = com.google.android.gms.ads.internal.zzu.zzgp().getActivity();
                    if (activity == null) {
                        zzkx.zzdg("ContentFetchThread: no activity. Sleeping.");
                        zzjk();
                    } else {
                        zza(activity);
                    }
                } else {
                    zzkx.zzdg("ContentFetchTask: sleeping");
                    zzjk();
                }
                Thread.sleep(this.zzawk * 1000);
            } catch (InterruptedException e) {
                zzkx.zzb("Error in ContentFetchTask", e);
            } catch (Throwable th) {
                zzkx.zzb("Error in ContentFetchTask", th);
                this.zzawj.zza(th, "ContentFetchTask.run");
            }
            synchronized (this.zzako) {
                while (this.zzawh) {
                    try {
                        zzkx.zzdg("ContentFetchTask: waiting");
                        this.zzako.wait();
                    } catch (InterruptedException e2) {
                    }
                }
            }
        }
    }

    public void wakeup() {
        synchronized (this.zzako) {
            this.zzawh = false;
            this.zzako.notifyAll();
            zzkx.zzdg("ContentFetchThread: wakeup");
        }
    }

    zza zza(@Nullable View view, zzcx zzcxVar) {
        int i = 0;
        if (view == null) {
            return new zza(0, 0);
        }
        Context context = com.google.android.gms.ads.internal.zzu.zzgp().getContext();
        if (context != null) {
            String str = (String) view.getTag(context.getResources().getIdentifier(zzdr.zzbff.get(), "id", context.getPackageName()));
            if (!TextUtils.isEmpty(this.zzawq) && str != null && str.equals(this.zzawq)) {
                return new zza(0, 0);
            }
        }
        boolean globalVisibleRect = view.getGlobalVisibleRect(new Rect());
        if ((view instanceof TextView) && !(view instanceof EditText)) {
            CharSequence text = ((TextView) view).getText();
            if (TextUtils.isEmpty(text)) {
                return new zza(0, 0);
            }
            zzcxVar.zzb(text.toString(), globalVisibleRect, view.getX(), view.getY(), view.getWidth(), view.getHeight());
            return new zza(1, 0);
        } else if ((view instanceof WebView) && !(view instanceof zzmd)) {
            zzcxVar.zzjd();
            return zza((WebView) view, zzcxVar, globalVisibleRect) ? new zza(0, 1) : new zza(0, 0);
        } else if (!(view instanceof ViewGroup)) {
            return new zza(0, 0);
        } else {
            ViewGroup viewGroup = (ViewGroup) view;
            int i2 = 0;
            for (int i3 = 0; i3 < viewGroup.getChildCount(); i3++) {
                zza zza2 = zza(viewGroup.getChildAt(i3), zzcxVar);
                i2 += zza2.zzawy;
                i += zza2.zzawz;
            }
            return new zza(i2, i);
        }
    }

    void zza(@Nullable Activity activity) {
        if (activity == null) {
            return;
        }
        View view = null;
        try {
            if (activity.getWindow() != null && activity.getWindow().getDecorView() != null) {
                view = activity.getWindow().getDecorView().findViewById(16908290);
            }
        } catch (Throwable th) {
            zzkx.zzdg("Failed getting root view of activity. Content not extracted.");
        }
        if (view == null) {
            return;
        }
        zzh(view);
    }

    void zza(zzcx zzcxVar, WebView webView, String str, boolean z) {
        zzcxVar.zzjc();
        try {
            if (!TextUtils.isEmpty(str)) {
                String optString = new JSONObject(str).optString("text");
                if (!TextUtils.isEmpty(webView.getTitle())) {
                    String valueOf = String.valueOf(webView.getTitle());
                    zzcxVar.zza(new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(optString).length()).append(valueOf).append("\n").append(optString).toString(), z, webView.getX(), webView.getY(), webView.getWidth(), webView.getHeight());
                } else {
                    zzcxVar.zza(optString, z, webView.getX(), webView.getY(), webView.getWidth(), webView.getHeight());
                }
            }
            if (!zzcxVar.zzix()) {
                return;
            }
            this.zzawi.zzb(zzcxVar);
        } catch (JSONException e) {
            zzkx.zzdg("Json string may be malformed.");
        } catch (Throwable th) {
            zzkx.zza("Failed to get webview content.", th);
            this.zzawj.zza(th, "ContentFetchTask.processWebViewContent");
        }
    }

    boolean zza(ActivityManager.RunningAppProcessInfo runningAppProcessInfo) {
        return runningAppProcessInfo.importance == 100;
    }

    @TargetApi(19)
    boolean zza(final WebView webView, final zzcx zzcxVar, final boolean z) {
        if (!com.google.android.gms.common.util.zzs.zzayu()) {
            return false;
        }
        zzcxVar.zzjd();
        webView.post(new Runnable() { // from class: com.google.android.gms.internal.zzda.2
            ValueCallback<String> zzawt = new ValueCallback<String>() { // from class: com.google.android.gms.internal.zzda.2.1
                @Override // android.webkit.ValueCallback
                /* renamed from: zzaf */
                public void onReceiveValue(String str) {
                    zzda.this.zza(zzcxVar, webView, str, z);
                }
            };

            @Override // java.lang.Runnable
            public void run() {
                if (webView.getSettings().getJavaScriptEnabled()) {
                    try {
                        webView.evaluateJavascript("(function() { return  {text:document.body.innerText}})();", this.zzawt);
                    } catch (Throwable th) {
                        this.zzawt.onReceiveValue("");
                    }
                }
            }
        });
        return true;
    }

    boolean zzh(Context context) {
        PowerManager powerManager = (PowerManager) context.getSystemService("power");
        if (powerManager == null) {
            return false;
        }
        return powerManager.isScreenOn();
    }

    boolean zzh(@Nullable final View view) {
        if (view == null) {
            return false;
        }
        view.post(new Runnable() { // from class: com.google.android.gms.internal.zzda.1
            @Override // java.lang.Runnable
            public void run() {
                zzda.this.zzi(view);
            }
        });
        return true;
    }

    void zzi(View view) {
        try {
            zzcx zzcxVar = new zzcx(this.zzavi, this.zzawl, this.zzavk, this.zzawm, this.zzawn, this.zzawo, this.zzawp);
            zza zza2 = zza(view, zzcxVar);
            zzcxVar.zzje();
            if (zza2.zzawy == 0 && zza2.zzawz == 0) {
                return;
            }
            if (zza2.zzawz == 0 && zzcxVar.zzjf() == 0) {
                return;
            }
            if (zza2.zzawz == 0 && this.zzawi.zza(zzcxVar)) {
                return;
            }
            this.zzawi.zzc(zzcxVar);
        } catch (Exception e) {
            zzkx.zzb("Exception in fetchContentOnUIThread", e);
            this.zzawj.zza(e, "ContentFetchTask.fetchContent");
        }
    }

    public void zzjh() {
        synchronized (this.zzako) {
            if (this.mStarted) {
                zzkx.zzdg("Content hash thread already started, quiting...");
                return;
            }
            this.mStarted = true;
            start();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0049, code lost:
        if (zza(r0) == false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x004f, code lost:
        if (r1.inKeyguardRestrictedInputMode() != false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0055, code lost:
        if (zzh(r3) == false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0057, code lost:
        return true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    boolean zzji() {
        /*
            r7 = this;
            r2 = 0
            com.google.android.gms.internal.zzcz r0 = com.google.android.gms.ads.internal.zzu.zzgp()     // Catch: java.lang.Throwable -> L5b
            android.content.Context r3 = r0.getContext()     // Catch: java.lang.Throwable -> L5b
            if (r3 != 0) goto Ld
            r0 = r2
        Lc:
            return r0
        Ld:
            java.lang.String r0 = "activity"
            java.lang.Object r0 = r3.getSystemService(r0)     // Catch: java.lang.Throwable -> L5b
            android.app.ActivityManager r0 = (android.app.ActivityManager) r0     // Catch: java.lang.Throwable -> L5b
            java.lang.String r1 = "keyguard"
            java.lang.Object r1 = r3.getSystemService(r1)     // Catch: java.lang.Throwable -> L5b
            android.app.KeyguardManager r1 = (android.app.KeyguardManager) r1     // Catch: java.lang.Throwable -> L5b
            if (r0 == 0) goto L23
            if (r1 != 0) goto L25
        L23:
            r0 = r2
            goto Lc
        L25:
            java.util.List r0 = r0.getRunningAppProcesses()     // Catch: java.lang.Throwable -> L5b
            if (r0 != 0) goto L2d
            r0 = r2
            goto Lc
        L2d:
            java.util.Iterator r4 = r0.iterator()     // Catch: java.lang.Throwable -> L5b
        L31:
            boolean r0 = r4.hasNext()     // Catch: java.lang.Throwable -> L5b
            if (r0 == 0) goto L59
            java.lang.Object r0 = r4.next()     // Catch: java.lang.Throwable -> L5b
            android.app.ActivityManager$RunningAppProcessInfo r0 = (android.app.ActivityManager.RunningAppProcessInfo) r0     // Catch: java.lang.Throwable -> L5b
            int r5 = android.os.Process.myPid()     // Catch: java.lang.Throwable -> L5b
            int r6 = r0.pid     // Catch: java.lang.Throwable -> L5b
            if (r5 != r6) goto L31
            boolean r0 = r7.zza(r0)     // Catch: java.lang.Throwable -> L5b
            if (r0 == 0) goto L59
            boolean r0 = r1.inKeyguardRestrictedInputMode()     // Catch: java.lang.Throwable -> L5b
            if (r0 != 0) goto L59
            boolean r0 = r7.zzh(r3)     // Catch: java.lang.Throwable -> L5b
            if (r0 == 0) goto L59
            r0 = 1
            goto Lc
        L59:
            r0 = r2
            goto Lc
        L5b:
            r0 = move-exception
            r0 = r2
            goto Lc
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzda.zzji():boolean");
    }

    public zzcx zzjj() {
        return this.zzawi.zzjg();
    }

    public void zzjk() {
        synchronized (this.zzako) {
            this.zzawh = true;
            zzkx.zzdg(new StringBuilder(42).append("ContentFetchThread: paused, mPause = ").append(this.zzawh).toString());
        }
    }

    public boolean zzjl() {
        return this.zzawh;
    }
}
