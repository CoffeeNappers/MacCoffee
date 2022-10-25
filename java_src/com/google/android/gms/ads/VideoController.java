package com.google.android.gms.ads;

import android.os.RemoteException;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.zzab;
import com.google.android.gms.ads.internal.client.zzap;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class VideoController {
    private final Object zzako = new Object();
    @Nullable
    private zzab zzakp;
    @Nullable
    private VideoLifecycleCallbacks zzakq;

    /* loaded from: classes.dex */
    public static abstract class VideoLifecycleCallbacks {
        public void onVideoEnd() {
        }
    }

    public float getAspectRatio() {
        float f = 0.0f;
        synchronized (this.zzako) {
            if (this.zzakp != null) {
                try {
                    f = this.zzakp.getAspectRatio();
                } catch (RemoteException e) {
                    zzb.zzb("Unable to call getAspectRatio on video controller.", e);
                }
            }
        }
        return f;
    }

    @Nullable
    public VideoLifecycleCallbacks getVideoLifecycleCallbacks() {
        VideoLifecycleCallbacks videoLifecycleCallbacks;
        synchronized (this.zzako) {
            videoLifecycleCallbacks = this.zzakq;
        }
        return videoLifecycleCallbacks;
    }

    public boolean hasVideoContent() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzakp != null;
        }
        return z;
    }

    public void setVideoLifecycleCallbacks(VideoLifecycleCallbacks videoLifecycleCallbacks) {
        zzaa.zzb(videoLifecycleCallbacks, "VideoLifecycleCallbacks may not be null.");
        synchronized (this.zzako) {
            this.zzakq = videoLifecycleCallbacks;
            if (this.zzakp == null) {
                return;
            }
            try {
                this.zzakp.zza(new zzap(videoLifecycleCallbacks));
            } catch (RemoteException e) {
                zzb.zzb("Unable to call setVideoLifecycleCallbacks on video controller.", e);
            }
        }
    }

    public void zza(zzab zzabVar) {
        synchronized (this.zzako) {
            this.zzakp = zzabVar;
            if (this.zzakq != null) {
                setVideoLifecycleCallbacks(this.zzakq);
            }
        }
    }

    public zzab zzdw() {
        zzab zzabVar;
        synchronized (this.zzako) {
            zzabVar = this.zzakp;
        }
        return zzabVar;
    }
}
