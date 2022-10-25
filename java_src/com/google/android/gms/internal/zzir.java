package com.google.android.gms.internal;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.webkit.WebView;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.internal.zzme;
@zzji
/* loaded from: classes.dex */
public class zzir implements Runnable {
    private final int zzakh;
    private final int zzaki;
    protected final zzmd zzbnz;
    private final Handler zzcgl;
    private final long zzcgm;
    private long zzcgn;
    private zzme.zza zzcgo;
    protected boolean zzcgp;
    protected boolean zzcgq;

    /* loaded from: classes2.dex */
    protected final class zza extends AsyncTask<Void, Void, Boolean> {
        private final WebView zzcgr;
        private Bitmap zzcgs;

        public zza(WebView webView) {
            this.zzcgr = webView;
        }

        @Override // android.os.AsyncTask
        protected synchronized void onPreExecute() {
            this.zzcgs = Bitmap.createBitmap(zzir.this.zzakh, zzir.this.zzaki, Bitmap.Config.ARGB_8888);
            this.zzcgr.setVisibility(0);
            this.zzcgr.measure(View.MeasureSpec.makeMeasureSpec(zzir.this.zzakh, 0), View.MeasureSpec.makeMeasureSpec(zzir.this.zzaki, 0));
            this.zzcgr.layout(0, 0, zzir.this.zzakh, zzir.this.zzaki);
            this.zzcgr.draw(new Canvas(this.zzcgs));
            this.zzcgr.invalidate();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        /* renamed from: zza */
        public void onPostExecute(Boolean bool) {
            zzir.zzc(zzir.this);
            if (bool.booleanValue() || zzir.this.zzsc() || zzir.this.zzcgn <= 0) {
                zzir.this.zzcgq = bool.booleanValue();
                zzir.this.zzcgo.zza(zzir.this.zzbnz, true);
            } else if (zzir.this.zzcgn <= 0) {
            } else {
                if (zzkx.zzbi(2)) {
                    zzkx.zzdg("Ad not detected, scheduling another run.");
                }
                zzir.this.zzcgl.postDelayed(zzir.this, zzir.this.zzcgm);
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        /* renamed from: zzb */
        public synchronized Boolean doInBackground(Void... voidArr) {
            boolean z;
            int width = this.zzcgs.getWidth();
            int height = this.zzcgs.getHeight();
            if (width == 0 || height == 0) {
                z = false;
            } else {
                int i = 0;
                for (int i2 = 0; i2 < width; i2 += 10) {
                    for (int i3 = 0; i3 < height; i3 += 10) {
                        if (this.zzcgs.getPixel(i2, i3) != 0) {
                            i++;
                        }
                    }
                }
                z = Boolean.valueOf(((double) i) / (((double) (width * height)) / 100.0d) > 0.1d);
            }
            return z;
        }
    }

    public zzir(zzme.zza zzaVar, zzmd zzmdVar, int i, int i2) {
        this(zzaVar, zzmdVar, i, i2, 200L, 50L);
    }

    public zzir(zzme.zza zzaVar, zzmd zzmdVar, int i, int i2, long j, long j2) {
        this.zzcgm = j;
        this.zzcgn = j2;
        this.zzcgl = new Handler(Looper.getMainLooper());
        this.zzbnz = zzmdVar;
        this.zzcgo = zzaVar;
        this.zzcgp = false;
        this.zzcgq = false;
        this.zzaki = i2;
        this.zzakh = i;
    }

    static /* synthetic */ long zzc(zzir zzirVar) {
        long j = zzirVar.zzcgn - 1;
        zzirVar.zzcgn = j;
        return j;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.zzbnz == null || zzsc()) {
            this.zzcgo.zza(this.zzbnz, true);
        } else {
            new zza(this.zzbnz.getWebView()).execute(new Void[0]);
        }
    }

    public void zza(AdResponseParcel adResponseParcel) {
        zza(adResponseParcel, new zzmo(this, this.zzbnz, adResponseParcel.zzcli));
    }

    public void zza(AdResponseParcel adResponseParcel, zzmo zzmoVar) {
        this.zzbnz.setWebViewClient(zzmoVar);
        this.zzbnz.loadDataWithBaseURL(TextUtils.isEmpty(adResponseParcel.zzcbo) ? null : com.google.android.gms.ads.internal.zzu.zzgm().zzcz(adResponseParcel.zzcbo), adResponseParcel.body, "text/html", "UTF-8", null);
    }

    public void zzsa() {
        this.zzcgl.postDelayed(this, this.zzcgm);
    }

    public synchronized void zzsb() {
        this.zzcgp = true;
    }

    public synchronized boolean zzsc() {
        return this.zzcgp;
    }

    public boolean zzsd() {
        return this.zzcgq;
    }
}
