package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.reward.mediation.client.RewardItemParcel;
import com.google.android.gms.ads.internal.safebrowsing.SafeBrowsingConfigParcel;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
import java.util.Collections;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public final class AdResponseParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AdResponseParcel> CREATOR = new zzh();
    public String body;
    public final int errorCode;
    public final int orientation;
    public final int versionCode;
    public final boolean zzazt;
    public final boolean zzazu;
    public final boolean zzazv;
    public final List<String> zzbvk;
    public final List<String> zzbvl;
    public final List<String> zzbvn;
    public final boolean zzbvo;
    public final long zzbvq;
    private AdRequestInfoParcel zzbws;
    public final String zzcbo;
    public final boolean zzckc;
    public final boolean zzcks;
    @Nullable
    public String zzckt;
    public final long zzcla;
    public final boolean zzclb;
    public final long zzclc;
    public final List<String> zzcld;
    public final String zzcle;
    public final long zzclf;
    public final String zzclg;
    public final boolean zzclh;
    public final String zzcli;
    public final String zzclj;
    public final boolean zzclk;
    public final boolean zzcll;
    public final boolean zzclm;
    public LargeParcelTeleporter zzcln;
    public String zzclo;
    public final String zzclp;
    @Nullable
    public final RewardItemParcel zzclq;
    @Nullable
    public final List<String> zzclr;
    @Nullable
    public final List<String> zzcls;
    public final boolean zzclt;
    @Nullable
    public final AutoClickProtectionConfigurationParcel zzclu;
    @Nullable
    public final String zzclv;
    @Nullable
    public final SafeBrowsingConfigParcel zzclw;
    @Nullable
    public final String zzclx;
    public final boolean zzcly;

    public AdResponseParcel(int i) {
        this(18, null, null, null, i, null, -1L, false, -1L, null, -1L, -1, null, -1L, null, false, null, null, false, false, false, true, false, null, null, null, false, false, null, null, null, false, null, false, null, null, false, null, null, null, true);
    }

    public AdResponseParcel(int i, long j) {
        this(18, null, null, null, i, null, -1L, false, -1L, null, j, -1, null, -1L, null, false, null, null, false, false, false, true, false, null, null, null, false, false, null, null, null, false, null, false, null, null, false, null, null, null, true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdResponseParcel(int i, String str, String str2, List<String> list, int i2, List<String> list2, long j, boolean z, long j2, List<String> list3, long j3, int i3, String str3, long j4, String str4, boolean z2, String str5, String str6, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, LargeParcelTeleporter largeParcelTeleporter, String str7, String str8, boolean z8, boolean z9, RewardItemParcel rewardItemParcel, List<String> list4, List<String> list5, boolean z10, AutoClickProtectionConfigurationParcel autoClickProtectionConfigurationParcel, boolean z11, String str9, List<String> list6, boolean z12, String str10, SafeBrowsingConfigParcel safeBrowsingConfigParcel, String str11, boolean z13) {
        StringParcel stringParcel;
        this.versionCode = i;
        this.zzcbo = str;
        this.body = str2;
        this.zzbvk = list != null ? Collections.unmodifiableList(list) : null;
        this.errorCode = i2;
        this.zzbvl = list2 != null ? Collections.unmodifiableList(list2) : null;
        this.zzcla = j;
        this.zzclb = z;
        this.zzclc = j2;
        this.zzcld = list3 != null ? Collections.unmodifiableList(list3) : null;
        this.zzbvq = j3;
        this.orientation = i3;
        this.zzcle = str3;
        this.zzclf = j4;
        this.zzclg = str4;
        this.zzclh = z2;
        this.zzcli = str5;
        this.zzclj = str6;
        this.zzclk = z3;
        this.zzazt = z4;
        this.zzckc = z5;
        this.zzcll = z6;
        this.zzcly = z13;
        this.zzclm = z7;
        this.zzcln = largeParcelTeleporter;
        this.zzclo = str7;
        this.zzclp = str8;
        if (this.body == null && this.zzcln != null && (stringParcel = (StringParcel) this.zzcln.zza(StringParcel.CREATOR)) != null && !TextUtils.isEmpty(stringParcel.zzth())) {
            this.body = stringParcel.zzth();
        }
        this.zzazu = z8;
        this.zzazv = z9;
        this.zzclq = rewardItemParcel;
        this.zzclr = list4;
        this.zzcls = list5;
        this.zzclt = z10;
        this.zzclu = autoClickProtectionConfigurationParcel;
        this.zzcks = z11;
        this.zzckt = str9;
        this.zzbvn = list6;
        this.zzbvo = z12;
        this.zzclv = str10;
        this.zzclw = safeBrowsingConfigParcel;
        this.zzclx = str11;
    }

    public AdResponseParcel(AdRequestInfoParcel adRequestInfoParcel, String str, String str2, List<String> list, List<String> list2, long j, boolean z, long j2, List<String> list3, long j3, int i, String str3, long j4, String str4, String str5, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, String str6, boolean z7, boolean z8, RewardItemParcel rewardItemParcel, List<String> list4, List<String> list5, boolean z9, AutoClickProtectionConfigurationParcel autoClickProtectionConfigurationParcel, boolean z10, String str7, List<String> list6, boolean z11, String str8, SafeBrowsingConfigParcel safeBrowsingConfigParcel, String str9, boolean z12) {
        this(18, str, str2, list, -2, list2, j, z, j2, list3, j3, i, str3, j4, str4, false, null, str5, z2, z3, z4, z5, z6, null, null, str6, z7, z8, rewardItemParcel, list4, list5, z9, autoClickProtectionConfigurationParcel, z10, str7, list6, z11, str8, safeBrowsingConfigParcel, str9, z12);
        this.zzbws = adRequestInfoParcel;
    }

    public AdResponseParcel(AdRequestInfoParcel adRequestInfoParcel, String str, String str2, List<String> list, List<String> list2, long j, boolean z, long j2, List<String> list3, long j3, int i, String str3, long j4, String str4, boolean z2, String str5, String str6, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, String str7, boolean z8, boolean z9, RewardItemParcel rewardItemParcel, List<String> list4, List<String> list5, boolean z10, AutoClickProtectionConfigurationParcel autoClickProtectionConfigurationParcel, boolean z11, String str8, List<String> list6, boolean z12, String str9, SafeBrowsingConfigParcel safeBrowsingConfigParcel, String str10, boolean z13) {
        this(18, str, str2, list, -2, list2, j, z, j2, list3, j3, i, str3, j4, str4, z2, str5, str6, z3, z4, z5, z6, z7, null, null, str7, z8, z9, rewardItemParcel, list4, list5, z10, autoClickProtectionConfigurationParcel, z11, str8, list6, z12, str9, safeBrowsingConfigParcel, str10, z13);
        this.zzbws = adRequestInfoParcel;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        if (this.zzbws != null && this.zzbws.versionCode >= 9 && !TextUtils.isEmpty(this.body)) {
            this.zzcln = new LargeParcelTeleporter(new StringParcel(this.body));
            this.body = null;
        }
        zzh.zza(this, parcel, i);
    }
}
