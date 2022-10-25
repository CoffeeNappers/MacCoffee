package com.google.android.gms.ads.internal.overlay;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.TextureView;
import com.facebook.share.internal.ShareConstants;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzdr;
import com.google.android.gms.internal.zzdv;
import com.google.android.gms.internal.zzdx;
import com.google.android.gms.internal.zzdz;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlh;
import com.vkontakte.android.data.ServerKeys;
import java.util.concurrent.TimeUnit;
@zzji
/* loaded from: classes.dex */
public class zzy {
    private final Context mContext;
    private final VersionInfoParcel zzapc;
    @Nullable
    private final zzdz zzcbz;
    private boolean zzccd;
    private final String zzcec;
    @Nullable
    private final zzdx zzced;
    private final long[] zzcef;
    private final String[] zzceg;
    private zzi zzcel;
    private boolean zzcem;
    private boolean zzcen;
    private final zzlh zzcee = new zzlh.zzb().zza("min_1", Double.MIN_VALUE, 1.0d).zza("1_5", 1.0d, 5.0d).zza("5_10", 5.0d, 10.0d).zza("10_20", 10.0d, 20.0d).zza("20_30", 20.0d, 30.0d).zza("30_max", 30.0d, Double.MAX_VALUE).zzwi();
    private boolean zzceh = false;
    private boolean zzcei = false;
    private boolean zzcej = false;
    private boolean zzcek = false;
    private long zzceo = -1;

    public zzy(Context context, VersionInfoParcel versionInfoParcel, String str, @Nullable zzdz zzdzVar, @Nullable zzdx zzdxVar) {
        this.mContext = context;
        this.zzapc = versionInfoParcel;
        this.zzcec = str;
        this.zzcbz = zzdzVar;
        this.zzced = zzdxVar;
        String str2 = zzdr.zzbdv.get();
        if (str2 == null) {
            this.zzceg = new String[0];
            this.zzcef = new long[0];
            return;
        }
        String[] split = TextUtils.split(str2, ",");
        this.zzceg = new String[split.length];
        this.zzcef = new long[split.length];
        for (int i = 0; i < split.length; i++) {
            try {
                this.zzcef[i] = Long.parseLong(split[i]);
            } catch (NumberFormatException e) {
                zzkx.zzc("Unable to parse frame hash target time number.", e);
                this.zzcef[i] = -1;
            }
        }
    }

    private void zzc(zzi zziVar) {
        long longValue = zzdr.zzbdw.get().longValue();
        long currentPosition = zziVar.getCurrentPosition();
        for (int i = 0; i < this.zzceg.length; i++) {
            if (this.zzceg[i] == null && longValue > Math.abs(currentPosition - this.zzcef[i])) {
                this.zzceg[i] = zza((TextureView) zziVar);
                return;
            }
        }
    }

    private void zzrd() {
        if (this.zzcej && !this.zzcek) {
            zzdv.zza(this.zzcbz, this.zzced, "vff2");
            this.zzcek = true;
        }
        long nanoTime = com.google.android.gms.ads.internal.zzu.zzgs().nanoTime();
        if (this.zzccd && this.zzcen && this.zzceo != -1) {
            this.zzcee.zza(TimeUnit.SECONDS.toNanos(1L) / (nanoTime - this.zzceo));
        }
        this.zzcen = this.zzccd;
        this.zzceo = nanoTime;
    }

    public void onStop() {
        if (!zzdr.zzbdu.get().booleanValue() || this.zzcem) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putString(ServerKeys.TYPE, "native-player-metrics");
        bundle.putString(ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID, this.zzcec);
        bundle.putString("player", this.zzcel.zzpg());
        for (zzlh.zza zzaVar : this.zzcee.getBuckets()) {
            String valueOf = String.valueOf("fps_c_");
            String valueOf2 = String.valueOf(zzaVar.name);
            bundle.putString(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf), Integer.toString(zzaVar.count));
            String valueOf3 = String.valueOf("fps_p_");
            String valueOf4 = String.valueOf(zzaVar.name);
            bundle.putString(valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3), Double.toString(zzaVar.zzcwo));
        }
        for (int i = 0; i < this.zzcef.length; i++) {
            String str = this.zzceg[i];
            if (str != null) {
                String valueOf5 = String.valueOf("fh_");
                String valueOf6 = String.valueOf(Long.valueOf(this.zzcef[i]));
                bundle.putString(new StringBuilder(String.valueOf(valueOf5).length() + 0 + String.valueOf(valueOf6).length()).append(valueOf5).append(valueOf6).toString(), str);
            }
        }
        com.google.android.gms.ads.internal.zzu.zzgm().zza(this.mContext, this.zzapc.zzda, "gmob-apps", bundle, true);
        this.zzcem = true;
    }

    @TargetApi(14)
    String zza(TextureView textureView) {
        long j;
        Bitmap bitmap = textureView.getBitmap(8, 8);
        long j2 = 0;
        long j3 = 63;
        int i = 0;
        while (i < 8) {
            int i2 = 0;
            long j4 = j2;
            while (true) {
                j = j3;
                int i3 = i2;
                if (i3 < 8) {
                    int pixel = bitmap.getPixel(i3, i);
                    j4 |= (Color.green(pixel) + (Color.blue(pixel) + Color.red(pixel)) > 128 ? 1L : 0L) << ((int) j);
                    i2 = i3 + 1;
                    j3 = j - 1;
                }
            }
            i++;
            j3 = j;
            j2 = j4;
        }
        return String.format("%016X", Long.valueOf(j2));
    }

    public void zza(zzi zziVar) {
        zzdv.zza(this.zzcbz, this.zzced, "vpc2");
        this.zzceh = true;
        if (this.zzcbz != null) {
            this.zzcbz.zzg("vpn", zziVar.zzpg());
        }
        this.zzcel = zziVar;
    }

    public void zzb(zzi zziVar) {
        zzrd();
        zzc(zziVar);
    }

    public void zzqc() {
        if (!this.zzceh || this.zzcei) {
            return;
        }
        zzdv.zza(this.zzcbz, this.zzced, "vfr2");
        this.zzcei = true;
    }

    public void zzre() {
        this.zzccd = true;
        if (!this.zzcei || this.zzcej) {
            return;
        }
        zzdv.zza(this.zzcbz, this.zzced, "vfp2");
        this.zzcej = true;
    }

    public void zzrf() {
        this.zzccd = false;
    }
}
