package com.google.android.gms.internal;

import android.os.RemoteException;
import android.support.annotation.Nullable;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.internal.NativeProtocol;
import com.google.android.gms.ads.internal.client.zzab;
import java.util.HashMap;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzmi extends zzab.zza {
    private com.google.android.gms.ads.internal.client.zzac A;
    private boolean B;
    private boolean C;
    private float D;
    private float E;
    private final float w;
    private int z;
    private final Object zzako = new Object();
    private boolean zzakr = true;
    private final zzmd zzbnz;

    public zzmi(zzmd zzmdVar, float f) {
        this.zzbnz = zzmdVar;
        this.w = f;
    }

    private void zzdo(String str) {
        zze(str, null);
    }

    private void zze(String str, @Nullable Map<String, String> map) {
        final HashMap hashMap = map == null ? new HashMap() : new HashMap(map);
        hashMap.put(NativeProtocol.WEB_DIALOG_ACTION, str);
        com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzmi.1
            @Override // java.lang.Runnable
            public void run() {
                zzmi.this.zzbnz.zza("pubVideoCmd", hashMap);
            }
        });
    }

    private void zzk(final int i, final int i2) {
        com.google.android.gms.ads.internal.zzu.zzgm().runOnUiThread(new Runnable() { // from class: com.google.android.gms.internal.zzmi.2
            @Override // java.lang.Runnable
            public void run() {
                boolean z = false;
                synchronized (zzmi.this.zzako) {
                    boolean z2 = i != i2;
                    boolean z3 = !zzmi.this.B && i2 == 1;
                    boolean z4 = z2 && i2 == 1;
                    boolean z5 = z2 && i2 == 2;
                    boolean z6 = z2 && i2 == 3;
                    zzmi zzmiVar = zzmi.this;
                    if (zzmi.this.B || z3) {
                        z = true;
                    }
                    zzmiVar.B = z;
                    if (zzmi.this.A == null) {
                        return;
                    }
                    if (z3) {
                        try {
                            zzmi.this.A.zzkw();
                        } catch (RemoteException e) {
                            zzkx.zzc("Unable to call onVideoStart()", e);
                        }
                    }
                    if (z4) {
                        try {
                            zzmi.this.A.zzkx();
                        } catch (RemoteException e2) {
                            zzkx.zzc("Unable to call onVideoPlay()", e2);
                        }
                    }
                    if (z5) {
                        try {
                            zzmi.this.A.zzky();
                        } catch (RemoteException e3) {
                            zzkx.zzc("Unable to call onVideoPause()", e3);
                        }
                    }
                    if (z6) {
                        try {
                            zzmi.this.A.onVideoEnd();
                        } catch (RemoteException e4) {
                            zzkx.zzc("Unable to call onVideoEnd()", e4);
                        }
                    }
                }
            }
        });
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public float getAspectRatio() {
        float f;
        synchronized (this.zzako) {
            f = this.E;
        }
        return f;
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public int getPlaybackState() {
        int i;
        synchronized (this.zzako) {
            i = this.z;
        }
        return i;
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public boolean isMuted() {
        boolean z;
        synchronized (this.zzako) {
            z = this.C;
        }
        return z;
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public void pause() {
        zzdo("pause");
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public void play() {
        zzdo("play");
    }

    public void zza(float f, int i, boolean z, float f2) {
        int i2;
        synchronized (this.zzako) {
            this.D = f;
            this.C = z;
            i2 = this.z;
            this.z = i;
            this.E = f2;
        }
        zzk(i2, i);
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public void zza(com.google.android.gms.ads.internal.client.zzac zzacVar) {
        synchronized (this.zzako) {
            this.A = zzacVar;
        }
    }

    public void zzaq(boolean z) {
        synchronized (this.zzako) {
            this.zzakr = z;
        }
        zze("initialState", com.google.android.gms.common.util.zzf.zze("muteStart", z ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO));
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public float zzku() {
        return this.w;
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public float zzkv() {
        float f;
        synchronized (this.zzako) {
            f = this.D;
        }
        return f;
    }

    @Override // com.google.android.gms.ads.internal.client.zzab
    public void zzn(boolean z) {
        zzdo(z ? "mute" : "unmute");
    }
}
