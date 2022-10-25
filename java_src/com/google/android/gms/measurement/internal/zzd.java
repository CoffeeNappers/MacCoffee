package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.support.annotation.Size;
import android.text.TextUtils;
import com.google.android.exoplayer2.extractor.ogg.DefaultOggSeeker;
import com.google.android.gms.internal.zzrk;
import com.google.android.gms.measurement.internal.zzl;
import com.vkontakte.android.TimeUtils;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
import java.lang.reflect.InvocationTargetException;
/* loaded from: classes2.dex */
public class zzd extends zzz {
    static final String ari = String.valueOf(com.google.android.gms.common.zzc.GOOGLE_PLAY_SERVICES_VERSION_CODE / 1000).replaceAll("(\\d+)(\\d)(\\d\\d)", "$1.$2.$3");
    private Boolean eb;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzd(zzx zzxVar) {
        super(zzxVar);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    public long zza(String str, zzl.zza<Long> zzaVar) {
        if (str == null) {
            return zzaVar.get().longValue();
        }
        String zzaw = zzbvy().zzaw(str, zzaVar.getKey());
        if (TextUtils.isEmpty(zzaw)) {
            return zzaVar.get().longValue();
        }
        try {
            return zzaVar.get(Long.valueOf(Long.valueOf(zzaw).longValue())).longValue();
        } catch (NumberFormatException e) {
            return zzaVar.get().longValue();
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    public boolean zzaef() {
        if (this.eb == null) {
            synchronized (this) {
                if (this.eb == null) {
                    ApplicationInfo applicationInfo = getContext().getApplicationInfo();
                    String zzayz = com.google.android.gms.common.util.zzt.zzayz();
                    if (applicationInfo != null) {
                        String str = applicationInfo.processName;
                        this.eb = Boolean.valueOf(str != null && str.equals(zzayz));
                    }
                    if (this.eb == null) {
                        this.eb = Boolean.TRUE;
                        zzbwb().zzbwy().log("My process not in the list of running processes");
                    }
                }
            }
        }
        return this.eb.booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long zzaez() {
        return zzl.asu.get().longValue();
    }

    public String zzafe() {
        return "google_app_measurement.db";
    }

    public long zzafj() {
        return Math.max(0L, zzl.arR.get().longValue());
    }

    public String zzao(String str, String str2) {
        Uri.Builder builder = new Uri.Builder();
        Uri.Builder encodedAuthority = builder.scheme(zzl.arT.get()).encodedAuthority(zzl.arU.get());
        String valueOf = String.valueOf(str);
        encodedAuthority.path(valueOf.length() != 0 ? "config/app/".concat(valueOf) : new String("config/app/")).appendQueryParameter("app_instance_id", str2).appendQueryParameter(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE).appendQueryParameter("gmp_version", String.valueOf(9877L));
        return builder.build().toString();
    }

    public boolean zzatu() {
        return zzrk.zzatu();
    }

    public boolean zzayi() {
        return false;
    }

    public int zzb(String str, zzl.zza<Integer> zzaVar) {
        if (str == null) {
            return zzaVar.get().intValue();
        }
        String zzaw = zzbvy().zzaw(str, zzaVar.getKey());
        if (TextUtils.isEmpty(zzaw)) {
            return zzaVar.get().intValue();
        }
        try {
            return zzaVar.get(Integer.valueOf(Integer.valueOf(zzaw).intValue())).intValue();
        } catch (NumberFormatException e) {
            return zzaVar.get().intValue();
        }
    }

    public long zzbto() {
        return 9877L;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzbub() {
        return zzl.arP.get();
    }

    public int zzbuc() {
        return 25;
    }

    public int zzbud() {
        return 32;
    }

    public int zzbue() {
        return 24;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzbuf() {
        return 24;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzbug() {
        return 36;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzbuh() {
        return 256;
    }

    public int zzbui() {
        return 36;
    }

    public int zzbuj() {
        return 2048;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzbuk() {
        return 500;
    }

    public long zzbul() {
        return zzl.arZ.get().intValue();
    }

    public long zzbum() {
        return zzl.asb.get().intValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzbun() {
        return 25;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzbuo() {
        return 50;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long zzbup() {
        return TimeUtils.HOUR;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long zzbuq() {
        return 60000L;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long zzbur() {
        return 61000L;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzbus() {
        return "google_app_measurement_local.db";
    }

    public boolean zzbut() {
        Boolean zzlu = zzlu("firebase_analytics_collection_deactivated");
        return zzlu != null && zzlu.booleanValue();
    }

    public Boolean zzbuu() {
        return zzlu("firebase_analytics_collection_enabled");
    }

    public long zzbuv() {
        return zzl.asr.get().longValue();
    }

    public long zzbuw() {
        return zzl.asm.get().longValue();
    }

    public long zzbux() {
        return zzl.asn.get().longValue();
    }

    public long zzbuy() {
        return 1000L;
    }

    public int zzbuz() {
        return Math.max(0, zzl.arX.get().intValue());
    }

    public int zzbva() {
        return Math.max(1, zzl.arY.get().intValue());
    }

    public int zzbvb() {
        return DefaultOggSeeker.MATCH_BYTE_RANGE;
    }

    public String zzbvc() {
        return zzl.asf.get();
    }

    public long zzbvd() {
        return zzl.arS.get().longValue();
    }

    public long zzbve() {
        return Math.max(0L, zzl.asg.get().longValue());
    }

    public long zzbvf() {
        return Math.max(0L, zzl.asi.get().longValue());
    }

    public long zzbvg() {
        return Math.max(0L, zzl.asj.get().longValue());
    }

    public long zzbvh() {
        return Math.max(0L, zzl.ask.get().longValue());
    }

    public long zzbvi() {
        return Math.max(0L, zzl.asl.get().longValue());
    }

    public long zzbvj() {
        return zzl.ash.get().longValue();
    }

    public long zzbvk() {
        return Math.max(0L, zzl.aso.get().longValue());
    }

    public long zzbvl() {
        return Math.max(0L, zzl.asp.get().longValue());
    }

    public int zzbvm() {
        return Math.min(20, Math.max(0, zzl.asq.get().intValue()));
    }

    public String zzbvn() {
        try {
            return (String) Class.forName("android.os.SystemProperties").getMethod("get", String.class, String.class).invoke(null, "firebase.analytics.debug-mode", "");
        } catch (ClassNotFoundException e) {
            zzbwb().zzbwy().zzj("Could not find SystemProperties class", e);
            return "";
        } catch (IllegalAccessException e2) {
            zzbwb().zzbwy().zzj("Could not access SystemProperties.get()", e2);
            return "";
        } catch (NoSuchMethodException e3) {
            zzbwb().zzbwy().zzj("Could not find SystemProperties.get() method", e3);
            return "";
        } catch (InvocationTargetException e4) {
            zzbwb().zzbwy().zzj("SystemProperties.get() threw an exception", e4);
            return "";
        }
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

    public int zzlo(@Size(min = 1) String str) {
        return Math.max(0, Math.min(1000000, zzb(str, zzl.asa)));
    }

    public int zzlp(@Size(min = 1) String str) {
        return zzb(str, zzl.asc);
    }

    public int zzlq(@Size(min = 1) String str) {
        return zzb(str, zzl.asd);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long zzlr(String str) {
        return zza(str, zzl.arQ);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzls(String str) {
        return zzb(str, zzl.ass);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzlt(String str) {
        return Math.max(0, Math.min(2000, zzb(str, zzl.ast)));
    }

    @Nullable
    Boolean zzlu(@Size(min = 1) String str) {
        Boolean bool = null;
        com.google.android.gms.common.internal.zzaa.zzib(str);
        try {
            PackageManager packageManager = getContext().getPackageManager();
            if (packageManager == null) {
                zzbwb().zzbwy().log("Failed to load metadata: PackageManager is null");
            } else {
                ApplicationInfo applicationInfo = packageManager.getApplicationInfo(getContext().getPackageName(), 128);
                if (applicationInfo == null) {
                    zzbwb().zzbwy().log("Failed to load metadata: ApplicationInfo is null");
                } else if (applicationInfo.metaData == null) {
                    zzbwb().zzbwy().log("Failed to load metadata: Metadata bundle is null");
                } else if (applicationInfo.metaData.containsKey(str)) {
                    bool = Boolean.valueOf(applicationInfo.metaData.getBoolean(str));
                }
            }
        } catch (PackageManager.NameNotFoundException e) {
            zzbwb().zzbwy().zzj("Failed to load metadata: Package name not found", e);
        }
        return bool;
    }

    public int zzlv(String str) {
        return zzb(str, zzl.arV);
    }

    public int zzlw(String str) {
        return Math.max(0, zzb(str, zzl.arW));
    }

    public int zzlx(String str) {
        return Math.max(0, Math.min(1000000, zzb(str, zzl.ase)));
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }
}
