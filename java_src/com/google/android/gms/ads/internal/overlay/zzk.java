package com.google.android.gms.ads.internal.overlay;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.Nullable;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.InputDeviceCompat;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import com.google.android.gms.internal.zzmd;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.HashMap;
@zzji
/* loaded from: classes.dex */
public class zzk extends FrameLayout implements zzh {
    private final zzmd zzbnz;
    private String zzbrb;
    private final FrameLayout zzcby;
    private final zzdz zzcbz;
    private final zzz zzcca;
    private final long zzccb;
    @Nullable
    private zzi zzccc;
    private boolean zzccd;
    private boolean zzcce;
    private boolean zzccf;
    private boolean zzccg;
    private long zzcch;
    private long zzcci;
    private Bitmap zzccj;
    private ImageView zzcck;
    private boolean zzccl;

    public zzk(Context context, zzmd zzmdVar, int i, boolean z, zzdz zzdzVar) {
        super(context);
        this.zzbnz = zzmdVar;
        this.zzcbz = zzdzVar;
        this.zzcby = new FrameLayout(context);
        addView(this.zzcby, new FrameLayout.LayoutParams(-1, -1));
        com.google.android.gms.common.internal.zzc.zzu(zzmdVar.zzec());
        this.zzccc = zzmdVar.zzec().zzamq.zza(context, zzmdVar, i, z, zzdzVar);
        if (this.zzccc != null) {
            this.zzcby.addView(this.zzccc, new FrameLayout.LayoutParams(-1, -1, 17));
            if (zzdr.zzbdx.get().booleanValue()) {
                zzqj();
            }
        }
        this.zzcck = new ImageView(context);
        this.zzccb = zzdr.zzbeb.get().longValue();
        this.zzccg = zzdr.zzbdz.get().booleanValue();
        if (this.zzcbz != null) {
            this.zzcbz.zzg("spinner_used", this.zzccg ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        }
        this.zzcca = new zzz(this);
        this.zzcca.zzrg();
        if (this.zzccc != null) {
            this.zzccc.zza(this);
        }
        if (this.zzccc == null) {
            zzk("AdVideoUnderlay Error", "Allocating player failed.");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(String str, String... strArr) {
        HashMap hashMap = new HashMap();
        hashMap.put("event", str);
        int length = strArr.length;
        int i = 0;
        String str2 = null;
        while (i < length) {
            String str3 = strArr[i];
            if (str2 != null) {
                hashMap.put(str2, str3);
                str3 = null;
            }
            i++;
            str2 = str3;
        }
        this.zzbnz.zza("onVideoEvent", hashMap);
    }

    private void zzg(int i, int i2) {
        if (!this.zzccg) {
            return;
        }
        int max = Math.max(i / zzdr.zzbea.get().intValue(), 1);
        int max2 = Math.max(i2 / zzdr.zzbea.get().intValue(), 1);
        if (this.zzccj != null && this.zzccj.getWidth() == max && this.zzccj.getHeight() == max2) {
            return;
        }
        this.zzccj = Bitmap.createBitmap(max, max2, Bitmap.Config.ARGB_8888);
        this.zzccl = false;
    }

    public static void zzi(zzmd zzmdVar) {
        HashMap hashMap = new HashMap();
        hashMap.put("event", "no_video_view");
        zzmdVar.zza("onVideoEvent", hashMap);
    }

    @TargetApi(14)
    private void zzql() {
        if (this.zzccj == null) {
            return;
        }
        long elapsedRealtime = com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime();
        if (this.zzccc.getBitmap(this.zzccj) != null) {
            this.zzccl = true;
        }
        long elapsedRealtime2 = com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime() - elapsedRealtime;
        if (zzkx.zzvo()) {
            zzkx.v(new StringBuilder(46).append("Spinner frame grab took ").append(elapsedRealtime2).append("ms").toString());
        }
        if (elapsedRealtime2 <= this.zzccb) {
            return;
        }
        zzkx.zzdi("Spinner frame grab crossed jank threshold! Suspending spinner.");
        this.zzccg = false;
        this.zzccj = null;
        if (this.zzcbz == null) {
            return;
        }
        this.zzcbz.zzg("spinner_jank", Long.toString(elapsedRealtime2));
    }

    private void zzqm() {
        if (!this.zzccl || this.zzccj == null || zzqo()) {
            return;
        }
        this.zzcck.setImageBitmap(this.zzccj);
        this.zzcck.invalidate();
        this.zzcby.addView(this.zzcck, new FrameLayout.LayoutParams(-1, -1));
        this.zzcby.bringChildToFront(this.zzcck);
    }

    private void zzqn() {
        if (zzqo()) {
            this.zzcby.removeView(this.zzcck);
        }
    }

    private boolean zzqo() {
        return this.zzcck.getParent() != null;
    }

    private void zzqp() {
        if (this.zzbnz.zzwy() != null && !this.zzcce) {
            this.zzccf = (this.zzbnz.zzwy().getWindow().getAttributes().flags & 128) != 0;
            if (this.zzccf) {
                return;
            }
            this.zzbnz.zzwy().getWindow().addFlags(128);
            this.zzcce = true;
        }
    }

    private void zzqq() {
        if (this.zzbnz.zzwy() != null && this.zzcce && !this.zzccf) {
            this.zzbnz.zzwy().getWindow().clearFlags(128);
            this.zzcce = false;
        }
    }

    public void destroy() {
        this.zzcca.cancel();
        if (this.zzccc != null) {
            this.zzccc.stop();
        }
        zzqq();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void onPaused() {
        zza("pause", new String[0]);
        zzqq();
        this.zzccd = false;
    }

    public void pause() {
        if (this.zzccc == null) {
            return;
        }
        this.zzccc.pause();
    }

    public void play() {
        if (this.zzccc == null) {
            return;
        }
        this.zzccc.play();
    }

    public void seekTo(int i) {
        if (this.zzccc == null) {
            return;
        }
        this.zzccc.seekTo(i);
    }

    public void zza(float f, float f2) {
        if (this.zzccc != null) {
            this.zzccc.zza(f, f2);
        }
    }

    public void zzb(float f) {
        if (this.zzccc == null) {
            return;
        }
        this.zzccc.zzb(f);
    }

    public void zzce(String str) {
        this.zzbrb = str;
    }

    public void zzd(int i, int i2, int i3, int i4) {
        if (i3 == 0 || i4 == 0) {
            return;
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(i3, i4);
        layoutParams.setMargins(i, i2, 0, 0);
        this.zzcby.setLayoutParams(layoutParams);
        requestLayout();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzf(int i, int i2) {
        zzg(i, i2);
    }

    @TargetApi(14)
    public void zzf(MotionEvent motionEvent) {
        if (this.zzccc == null) {
            return;
        }
        this.zzccc.dispatchTouchEvent(motionEvent);
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzk(String str, @Nullable String str2) {
        zza("error", "what", str, JsonMarshaller.EXTRA, str2);
    }

    public void zznt() {
        if (this.zzccc == null) {
            return;
        }
        if (!TextUtils.isEmpty(this.zzbrb)) {
            this.zzccc.setVideoPath(this.zzbrb);
        } else {
            zza("no_src", new String[0]);
        }
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzqb() {
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzk.1
            @Override // java.lang.Runnable
            public void run() {
                zzk.this.zza("surfaceCreated", new String[0]);
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzqc() {
        if (this.zzccc != null && this.zzcci == 0) {
            zza("canplaythrough", "duration", String.valueOf(this.zzccc.getDuration() / 1000.0f), "videoWidth", String.valueOf(this.zzccc.getVideoWidth()), "videoHeight", String.valueOf(this.zzccc.getVideoHeight()));
        }
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzqd() {
        zzqp();
        this.zzccd = true;
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzqe() {
        zza("ended", new String[0]);
        zzqq();
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzqf() {
        zzqm();
        this.zzcci = this.zzcch;
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzk.2
            @Override // java.lang.Runnable
            public void run() {
                zzk.this.zza("surfaceDestroyed", new String[0]);
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.overlay.zzh
    public void zzqg() {
        if (this.zzccd) {
            zzqn();
        }
        zzql();
    }

    public void zzqh() {
        if (this.zzccc == null) {
            return;
        }
        this.zzccc.zzqh();
    }

    public void zzqi() {
        if (this.zzccc == null) {
            return;
        }
        this.zzccc.zzqi();
    }

    @TargetApi(14)
    public void zzqj() {
        if (this.zzccc == null) {
            return;
        }
        TextView textView = new TextView(this.zzccc.getContext());
        String valueOf = String.valueOf(this.zzccc.zzpg());
        textView.setText(valueOf.length() != 0 ? "AdMob - ".concat(valueOf) : new String("AdMob - "));
        textView.setTextColor(SupportMenu.CATEGORY_MASK);
        textView.setBackgroundColor(InputDeviceCompat.SOURCE_ANY);
        this.zzcby.addView(textView, new FrameLayout.LayoutParams(-2, -2, 17));
        this.zzcby.bringChildToFront(textView);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzqk() {
        if (this.zzccc == null) {
            return;
        }
        long currentPosition = this.zzccc.getCurrentPosition();
        if (this.zzcch == currentPosition || currentPosition <= 0) {
            return;
        }
        zza("timeupdate", "time", String.valueOf(((float) currentPosition) / 1000.0f));
        this.zzcch = currentPosition;
    }
}
