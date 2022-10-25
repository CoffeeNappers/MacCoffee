package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import com.facebook.internal.AnalyticsEvents;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzrk;
/* loaded from: classes2.dex */
public class zzn extends zzaa {
    private String aqF;
    private String aqM;
    private int asv;
    private long asw;
    private String bN;
    private String bO;
    private String zzctj;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzn(zzx zzxVar) {
        super(zzxVar);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    String zzaaf() {
        zzacj();
        return this.bO;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzbth() {
        zzacj();
        return this.aqF;
    }

    String zzbtn() {
        zzacj();
        return this.aqM;
    }

    long zzbto() {
        return zzbwd().zzbto();
    }

    @WorkerThread
    long zzbtp() {
        zzacj();
        zzzx();
        if (this.asw == 0) {
            this.asw = this.aqw.zzbvx().zzad(getContext(), getContext().getPackageName());
        }
        return this.asw;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzbwx() {
        zzacj();
        return this.asv;
    }

    protected void zzdw(Status status) {
        if (status == null) {
            zzbwb().zzbwy().log("GoogleService failed to initialize (no status)");
        } else {
            zzbwb().zzbwy().zze("GoogleService failed to initialize, status", Integer.valueOf(status.getStatusCode()), status.getStatusMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public AppMetadata zzmi(String str) {
        zzzx();
        return new AppMetadata(zzup(), zzbth(), zzaaf(), zzbwx(), zzbtn(), zzbto(), zzbtp(), str, this.aqw.isEnabled(), !zzbwc().atn, zzbwc().zzbtj());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzup() {
        zzacj();
        return this.zzctj;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
        boolean z;
        String str = "unknown";
        String str2 = AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN;
        int i = Integer.MIN_VALUE;
        String str3 = AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN;
        String packageName = getContext().getPackageName();
        PackageManager packageManager = getContext().getPackageManager();
        if (packageManager == null) {
            zzbwb().zzbwy().log("PackageManager is null, app identity information might be inaccurate");
        } else {
            try {
                str = packageManager.getInstallerPackageName(packageName);
            } catch (IllegalArgumentException e) {
                zzbwb().zzbwy().zzj("Error retrieving app installer package name", packageName);
            }
            if (str == null) {
                str = "manual_install";
            } else if ("com.android.vending".equals(str)) {
                str = "";
            }
            try {
                PackageInfo packageInfo = packageManager.getPackageInfo(getContext().getPackageName(), 0);
                if (packageInfo != null) {
                    CharSequence applicationLabel = packageManager.getApplicationLabel(packageInfo.applicationInfo);
                    if (!TextUtils.isEmpty(applicationLabel)) {
                        str3 = applicationLabel.toString();
                    }
                    str2 = packageInfo.versionName;
                    i = packageInfo.versionCode;
                }
            } catch (PackageManager.NameNotFoundException e2) {
                zzbwb().zzbwy().zzj("Error retrieving package info: appName", str3);
            }
        }
        this.zzctj = packageName;
        this.aqM = str;
        this.bO = str2;
        this.asv = i;
        this.bN = str3;
        zzbwd().zzayi();
        Status zzby = zzrk.zzby(getContext());
        boolean z2 = zzby != null && zzby.isSuccess();
        if (!z2) {
            zzdw(zzby);
        }
        if (z2) {
            Boolean zzbuu = zzbwd().zzbuu();
            if (zzbwd().zzbut()) {
                zzbwb().zzbxc().log("Collection disabled with firebase_analytics_collection_deactivated=1");
                z = false;
            } else if (zzbuu != null && !zzbuu.booleanValue()) {
                zzbwb().zzbxc().log("Collection disabled with firebase_analytics_collection_enabled=0");
                z = false;
            } else if (zzbuu != null || !zzbwd().zzatu()) {
                zzbwb().zzbxe().log("Collection enabled");
                z = true;
            } else {
                zzbwb().zzbxc().log("Collection disabled with google_app_measurement_enable=0");
                z = false;
            }
        } else {
            z = false;
        }
        this.aqF = "";
        if (!zzbwd().zzayi()) {
            try {
                String zzatt = zzrk.zzatt();
                if (TextUtils.isEmpty(zzatt)) {
                    zzatt = "";
                }
                this.aqF = zzatt;
                if (!z) {
                    return;
                }
                zzbwb().zzbxe().zze("App package, google app id", this.zzctj, this.aqF);
            } catch (IllegalStateException e3) {
                zzbwb().zzbwy().zzj("getGoogleAppId or isMeasurementEnabled failed with exception", e3);
            }
        }
    }
}
