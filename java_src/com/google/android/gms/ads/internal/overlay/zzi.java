package com.google.android.gms.ads.internal.overlay;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.TextureView;
import com.google.android.gms.ads.internal.overlay.zzaa;
import com.google.android.gms.internal.zzji;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public abstract class zzi extends TextureView implements zzaa.zza {
    protected final zzv zzcbw;
    protected final zzaa zzcbx;

    public zzi(Context context) {
        super(context);
        this.zzcbw = new zzv();
        this.zzcbx = new zzaa(context, this);
    }

    public abstract int getCurrentPosition();

    public abstract int getDuration();

    public abstract int getVideoHeight();

    public abstract int getVideoWidth();

    public abstract void pause();

    public abstract void play();

    public abstract void seekTo(int i);

    public abstract void setVideoPath(String str);

    public abstract void stop();

    public abstract void zza(float f, float f2);

    public abstract void zza(zzh zzhVar);

    public void zzb(float f) {
        this.zzcbx.zzb(f);
        zzpk();
    }

    public abstract String zzpg();

    public abstract void zzpk();

    public void zzqh() {
        this.zzcbx.setMuted(true);
        zzpk();
    }

    public void zzqi() {
        this.zzcbx.setMuted(false);
        zzpk();
    }
}
