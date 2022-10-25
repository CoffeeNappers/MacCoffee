package com.google.android.gms.ads.internal.request;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
import java.util.Collections;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public final class AdRequestInfoParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AdRequestInfoParcel> CREATOR = new zzf();
    public final ApplicationInfo applicationInfo;
    public final int versionCode;
    public final String zzarf;
    public final String zzarg;
    public final VersionInfoParcel zzari;
    public final AdSizeParcel zzarm;
    public final NativeAdOptionsParcel zzasa;
    public final List<String> zzase;
    public final float zzavd;
    public final boolean zzbvo;
    @Nullable
    public final Bundle zzcjt;
    public final AdRequestParcel zzcju;
    @Nullable
    public final PackageInfo zzcjv;
    public final String zzcjw;
    public final String zzcjx;
    public final String zzcjy;
    public final Bundle zzcjz;
    public final int zzcka;
    public final Bundle zzckb;
    public final boolean zzckc;
    public final Messenger zzckd;
    public final int zzcke;
    public final int zzckf;
    public final String zzckg;
    public final long zzckh;
    public final String zzcki;
    @Nullable
    public final List<String> zzckj;
    public final List<String> zzckk;
    public final long zzckl;
    public final CapabilityParcel zzckm;
    public final String zzckn;
    public final float zzcko;
    public final int zzckp;
    public final int zzckq;
    public final boolean zzckr;
    public final boolean zzcks;
    public final String zzckt;
    public final boolean zzcku;
    public final String zzckv;
    public final int zzckw;
    public final Bundle zzckx;
    public final String zzcky;

    @zzji
    /* loaded from: classes.dex */
    public static final class zza {
        public final ApplicationInfo applicationInfo;
        public final String zzarf;
        public final String zzarg;
        public final VersionInfoParcel zzari;
        public final AdSizeParcel zzarm;
        public final NativeAdOptionsParcel zzasa;
        public final List<String> zzase;
        public final float zzavd;
        public final boolean zzbvo;
        @Nullable
        public final Bundle zzcjt;
        public final AdRequestParcel zzcju;
        @Nullable
        public final PackageInfo zzcjv;
        public final String zzcjx;
        public final String zzcjy;
        public final Bundle zzcjz;
        public final int zzcka;
        public final Bundle zzckb;
        public final boolean zzckc;
        public final Messenger zzckd;
        public final int zzcke;
        public final int zzckf;
        public final String zzckg;
        public final long zzckh;
        public final String zzcki;
        @Nullable
        public final List<String> zzckj;
        public final List<String> zzckk;
        public final CapabilityParcel zzckm;
        public final String zzckn;
        public final float zzcko;
        public final int zzckp;
        public final int zzckq;
        public final boolean zzckr;
        public final boolean zzcks;
        public final String zzckt;
        public final boolean zzcku;
        public final String zzckv;
        public final int zzckw;
        public final Bundle zzckx;
        public final String zzcky;

        public zza(@Nullable Bundle bundle, AdRequestParcel adRequestParcel, AdSizeParcel adSizeParcel, String str, ApplicationInfo applicationInfo, @Nullable PackageInfo packageInfo, String str2, String str3, VersionInfoParcel versionInfoParcel, Bundle bundle2, List<String> list, List<String> list2, Bundle bundle3, boolean z, Messenger messenger, int i, int i2, float f, String str4, long j, String str5, @Nullable List<String> list3, String str6, NativeAdOptionsParcel nativeAdOptionsParcel, CapabilityParcel capabilityParcel, String str7, float f2, boolean z2, int i3, int i4, boolean z3, boolean z4, String str8, String str9, boolean z5, int i5, Bundle bundle4, String str10) {
            this.zzcjt = bundle;
            this.zzcju = adRequestParcel;
            this.zzarm = adSizeParcel;
            this.zzarg = str;
            this.applicationInfo = applicationInfo;
            this.zzcjv = packageInfo;
            this.zzcjx = str2;
            this.zzcjy = str3;
            this.zzari = versionInfoParcel;
            this.zzcjz = bundle2;
            this.zzckc = z;
            this.zzckd = messenger;
            this.zzcke = i;
            this.zzckf = i2;
            this.zzavd = f;
            if (list == null || list.size() <= 0) {
                this.zzcka = 0;
                this.zzase = null;
                this.zzckk = null;
            } else {
                this.zzcka = 3;
                this.zzase = list;
                this.zzckk = list2;
            }
            this.zzckb = bundle3;
            this.zzckg = str4;
            this.zzckh = j;
            this.zzcki = str5;
            this.zzckj = list3;
            this.zzarf = str6;
            this.zzasa = nativeAdOptionsParcel;
            this.zzckm = capabilityParcel;
            this.zzckn = str7;
            this.zzcko = f2;
            this.zzcku = z2;
            this.zzckp = i3;
            this.zzckq = i4;
            this.zzckr = z3;
            this.zzcks = z4;
            this.zzckt = str8;
            this.zzckv = str9;
            this.zzbvo = z5;
            this.zzckw = i5;
            this.zzckx = bundle4;
            this.zzcky = str10;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AdRequestInfoParcel(int i, Bundle bundle, AdRequestParcel adRequestParcel, AdSizeParcel adSizeParcel, String str, ApplicationInfo applicationInfo, PackageInfo packageInfo, String str2, String str3, String str4, VersionInfoParcel versionInfoParcel, Bundle bundle2, int i2, List<String> list, Bundle bundle3, boolean z, Messenger messenger, int i3, int i4, float f, String str5, long j, String str6, List<String> list2, String str7, NativeAdOptionsParcel nativeAdOptionsParcel, List<String> list3, long j2, CapabilityParcel capabilityParcel, String str8, float f2, boolean z2, int i5, int i6, boolean z3, boolean z4, String str9, String str10, boolean z5, int i7, Bundle bundle4, String str11) {
        this.versionCode = i;
        this.zzcjt = bundle;
        this.zzcju = adRequestParcel;
        this.zzarm = adSizeParcel;
        this.zzarg = str;
        this.applicationInfo = applicationInfo;
        this.zzcjv = packageInfo;
        this.zzcjw = str2;
        this.zzcjx = str3;
        this.zzcjy = str4;
        this.zzari = versionInfoParcel;
        this.zzcjz = bundle2;
        this.zzcka = i2;
        this.zzase = list;
        this.zzckk = list3 == null ? Collections.emptyList() : Collections.unmodifiableList(list3);
        this.zzckb = bundle3;
        this.zzckc = z;
        this.zzckd = messenger;
        this.zzcke = i3;
        this.zzckf = i4;
        this.zzavd = f;
        this.zzckg = str5;
        this.zzckh = j;
        this.zzcki = str6;
        this.zzckj = list2 == null ? Collections.emptyList() : Collections.unmodifiableList(list2);
        this.zzarf = str7;
        this.zzasa = nativeAdOptionsParcel;
        this.zzckl = j2;
        this.zzckm = capabilityParcel;
        this.zzckn = str8;
        this.zzcko = f2;
        this.zzcku = z2;
        this.zzckp = i5;
        this.zzckq = i6;
        this.zzckr = z3;
        this.zzcks = z4;
        this.zzckt = str9;
        this.zzckv = str10;
        this.zzbvo = z5;
        this.zzckw = i7;
        this.zzckx = bundle4;
        this.zzcky = str11;
    }

    public AdRequestInfoParcel(@Nullable Bundle bundle, AdRequestParcel adRequestParcel, AdSizeParcel adSizeParcel, String str, ApplicationInfo applicationInfo, @Nullable PackageInfo packageInfo, String str2, String str3, String str4, VersionInfoParcel versionInfoParcel, Bundle bundle2, int i, List<String> list, List<String> list2, Bundle bundle3, boolean z, Messenger messenger, int i2, int i3, float f, String str5, long j, String str6, @Nullable List<String> list3, String str7, NativeAdOptionsParcel nativeAdOptionsParcel, long j2, CapabilityParcel capabilityParcel, String str8, float f2, boolean z2, int i4, int i5, boolean z3, boolean z4, String str9, String str10, boolean z5, int i6, Bundle bundle4, String str11) {
        this(19, bundle, adRequestParcel, adSizeParcel, str, applicationInfo, packageInfo, str2, str3, str4, versionInfoParcel, bundle2, i, list, bundle3, z, messenger, i2, i3, f, str5, j, str6, list3, str7, nativeAdOptionsParcel, list2, j2, capabilityParcel, str8, f2, z2, i4, i5, z3, z4, str9, str10, z5, i6, bundle4, str11);
    }

    public AdRequestInfoParcel(zza zzaVar, String str, long j) {
        this(zzaVar.zzcjt, zzaVar.zzcju, zzaVar.zzarm, zzaVar.zzarg, zzaVar.applicationInfo, zzaVar.zzcjv, str, zzaVar.zzcjx, zzaVar.zzcjy, zzaVar.zzari, zzaVar.zzcjz, zzaVar.zzcka, zzaVar.zzase, zzaVar.zzckk, zzaVar.zzckb, zzaVar.zzckc, zzaVar.zzckd, zzaVar.zzcke, zzaVar.zzckf, zzaVar.zzavd, zzaVar.zzckg, zzaVar.zzckh, zzaVar.zzcki, zzaVar.zzckj, zzaVar.zzarf, zzaVar.zzasa, j, zzaVar.zzckm, zzaVar.zzckn, zzaVar.zzcko, zzaVar.zzcku, zzaVar.zzckp, zzaVar.zzckq, zzaVar.zzckr, zzaVar.zzcks, zzaVar.zzckt, zzaVar.zzckv, zzaVar.zzbvo, zzaVar.zzckw, zzaVar.zzckx, zzaVar.zzcky);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }
}
