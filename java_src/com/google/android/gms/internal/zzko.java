package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.request.AutoClickProtectionConfigurationParcel;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzko {
    public final int errorCode;
    public final int orientation;
    public final List<String> zzbvk;
    public final List<String> zzbvl;
    @Nullable
    public final List<String> zzbvn;
    public final long zzbvq;
    @Nullable
    public final zzgp zzbwm;
    @Nullable
    public final zzha zzbwn;
    @Nullable
    public final String zzbwo;
    @Nullable
    public final zzgs zzbwp;
    @Nullable
    public final zzmd zzcbm;
    public final AdRequestParcel zzcju;
    public final String zzcjx;
    public final long zzcla;
    public final boolean zzclb;
    public final long zzclc;
    public final List<String> zzcld;
    public final String zzclg;
    @Nullable
    public final RewardItemParcel zzclq;
    @Nullable
    public final List<String> zzcls;
    public final boolean zzclt;
    public final AutoClickProtectionConfigurationParcel zzclu;
    public final String zzclx;
    public final JSONObject zzcsi;
    public boolean zzcsj;
    public final zzgq zzcsk;
    @Nullable
    public final String zzcsl;
    public final AdSizeParcel zzcsm;
    @Nullable
    public final List<String> zzcsn;
    public final long zzcso;
    public final long zzcsp;
    @Nullable
    public final zzi.zza zzcsq;
    public boolean zzcsr;
    public boolean zzcss;
    public boolean zzcst;

    @zzji
    /* loaded from: classes.dex */
    public static final class zza {
        public final int errorCode;
        @Nullable
        public final AdSizeParcel zzarm;
        public final AdRequestInfoParcel zzcmx;
        @Nullable
        public final JSONObject zzcsi;
        public final zzgq zzcsk;
        public final long zzcso;
        public final long zzcsp;
        public final AdResponseParcel zzcsu;

        public zza(AdRequestInfoParcel adRequestInfoParcel, AdResponseParcel adResponseParcel, zzgq zzgqVar, AdSizeParcel adSizeParcel, int i, long j, long j2, JSONObject jSONObject) {
            this.zzcmx = adRequestInfoParcel;
            this.zzcsu = adResponseParcel;
            this.zzcsk = zzgqVar;
            this.zzarm = adSizeParcel;
            this.errorCode = i;
            this.zzcso = j;
            this.zzcsp = j2;
            this.zzcsi = jSONObject;
        }
    }

    public zzko(AdRequestParcel adRequestParcel, @Nullable zzmd zzmdVar, List<String> list, int i, List<String> list2, List<String> list3, int i2, long j, String str, boolean z, @Nullable zzgp zzgpVar, @Nullable zzha zzhaVar, @Nullable String str2, zzgq zzgqVar, @Nullable zzgs zzgsVar, long j2, AdSizeParcel adSizeParcel, long j3, long j4, long j5, String str3, JSONObject jSONObject, @Nullable zzi.zza zzaVar, RewardItemParcel rewardItemParcel, List<String> list4, List<String> list5, boolean z2, AutoClickProtectionConfigurationParcel autoClickProtectionConfigurationParcel, @Nullable String str4, List<String> list6, String str5) {
        this.zzcsr = false;
        this.zzcss = false;
        this.zzcst = false;
        this.zzcju = adRequestParcel;
        this.zzcbm = zzmdVar;
        this.zzbvk = zzm(list);
        this.errorCode = i;
        this.zzbvl = zzm(list2);
        this.zzcld = zzm(list3);
        this.orientation = i2;
        this.zzbvq = j;
        this.zzcjx = str;
        this.zzclb = z;
        this.zzbwm = zzgpVar;
        this.zzbwn = zzhaVar;
        this.zzbwo = str2;
        this.zzcsk = zzgqVar;
        this.zzbwp = zzgsVar;
        this.zzclc = j2;
        this.zzcsm = adSizeParcel;
        this.zzcla = j3;
        this.zzcso = j4;
        this.zzcsp = j5;
        this.zzclg = str3;
        this.zzcsi = jSONObject;
        this.zzcsq = zzaVar;
        this.zzclq = rewardItemParcel;
        this.zzcsn = zzm(list4);
        this.zzcls = zzm(list5);
        this.zzclt = z2;
        this.zzclu = autoClickProtectionConfigurationParcel;
        this.zzcsl = str4;
        this.zzbvn = zzm(list6);
        this.zzclx = str5;
    }

    public zzko(zza zzaVar, @Nullable zzmd zzmdVar, @Nullable zzgp zzgpVar, @Nullable zzha zzhaVar, @Nullable String str, @Nullable zzgs zzgsVar, @Nullable zzi.zza zzaVar2, @Nullable String str2) {
        this(zzaVar.zzcmx.zzcju, zzmdVar, zzaVar.zzcsu.zzbvk, zzaVar.errorCode, zzaVar.zzcsu.zzbvl, zzaVar.zzcsu.zzcld, zzaVar.zzcsu.orientation, zzaVar.zzcsu.zzbvq, zzaVar.zzcmx.zzcjx, zzaVar.zzcsu.zzclb, zzgpVar, zzhaVar, str, zzaVar.zzcsk, zzgsVar, zzaVar.zzcsu.zzclc, zzaVar.zzarm, zzaVar.zzcsu.zzcla, zzaVar.zzcso, zzaVar.zzcsp, zzaVar.zzcsu.zzclg, zzaVar.zzcsi, zzaVar2, zzaVar.zzcsu.zzclq, zzaVar.zzcsu.zzclr, zzaVar.zzcsu.zzclr, zzaVar.zzcsu.zzclt, zzaVar.zzcsu.zzclu, str2, zzaVar.zzcsu.zzbvn, zzaVar.zzcsu.zzclx);
    }

    @Nullable
    private static <T> List<T> zzm(@Nullable List<T> list) {
        if (list == null) {
            return null;
        }
        return Collections.unmodifiableList(list);
    }

    public boolean zzic() {
        if (this.zzcbm == null || this.zzcbm.zzxc() == null) {
            return false;
        }
        return this.zzcbm.zzxc().zzic();
    }
}
