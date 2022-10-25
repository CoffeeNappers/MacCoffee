package com.google.android.gms.ads.internal.overlay;

import android.annotation.TargetApi;
import android.content.Context;
import android.media.AudioManager;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.android.gms.internal.zzji;
@zzji
@TargetApi(14)
/* loaded from: classes.dex */
public class zzaa implements AudioManager.OnAudioFocusChangeListener {
    private final AudioManager mAudioManager;
    private boolean zzccd;
    private final zza zzceq;
    private boolean zzcer;
    private boolean zzces;
    private float zzcet = 1.0f;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface zza {
        void zzpk();
    }

    public zzaa(Context context, zza zzaVar) {
        this.mAudioManager = (AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO);
        this.zzceq = zzaVar;
    }

    private void zzri() {
        boolean z = this.zzccd && !this.zzces && this.zzcet > 0.0f;
        if (z && !this.zzcer) {
            zzrj();
            this.zzceq.zzpk();
        } else if (z || !this.zzcer) {
        } else {
            zzrk();
            this.zzceq.zzpk();
        }
    }

    private void zzrj() {
        boolean z = true;
        if (this.mAudioManager == null || this.zzcer) {
            return;
        }
        if (this.mAudioManager.requestAudioFocus(this, 3, 2) != 1) {
            z = false;
        }
        this.zzcer = z;
    }

    private void zzrk() {
        if (this.mAudioManager == null || !this.zzcer) {
            return;
        }
        this.zzcer = this.mAudioManager.abandonAudioFocus(this) == 0;
    }

    @Override // android.media.AudioManager.OnAudioFocusChangeListener
    public void onAudioFocusChange(int i) {
        this.zzcer = i > 0;
        this.zzceq.zzpk();
    }

    public void setMuted(boolean z) {
        this.zzces = z;
        zzri();
    }

    public void zzb(float f) {
        this.zzcet = f;
        zzri();
    }

    public void zzre() {
        this.zzccd = true;
        zzri();
    }

    public void zzrf() {
        this.zzccd = false;
        zzri();
    }

    public float zzrh() {
        float f = this.zzces ? 0.0f : this.zzcet;
        if (this.zzcer) {
            return f;
        }
        return 0.0f;
    }
}
