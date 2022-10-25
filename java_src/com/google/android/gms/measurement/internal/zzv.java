package com.google.android.gms.measurement.internal;

import android.content.Context;
import android.support.annotation.WorkerThread;
import android.support.v4.util.ArrayMap;
import com.google.android.gms.internal.zzars;
import com.google.android.gms.internal.zzart;
import com.google.android.gms.internal.zzwb;
import com.google.android.gms.measurement.AppMeasurement;
import java.io.IOException;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzv extends zzaa {
    private final Map<String, Map<String, String>> atB;
    private final Map<String, Map<String, Boolean>> atC;
    private final Map<String, Map<String, Boolean>> atD;
    private final Map<String, zzwb.zzb> atE;
    private final Map<String, String> atF;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzv(zzx zzxVar) {
        super(zzxVar);
        this.atB = new ArrayMap();
        this.atC = new ArrayMap();
        this.atD = new ArrayMap();
        this.atE = new ArrayMap();
        this.atF = new ArrayMap();
    }

    private Map<String, String> zza(zzwb.zzb zzbVar) {
        zzwb.zzc[] zzcVarArr;
        ArrayMap arrayMap = new ArrayMap();
        if (zzbVar != null && zzbVar.awE != null) {
            for (zzwb.zzc zzcVar : zzbVar.awE) {
                if (zzcVar != null) {
                    arrayMap.put(zzcVar.zzcb, zzcVar.value);
                }
            }
        }
        return arrayMap;
    }

    private void zza(String str, zzwb.zzb zzbVar) {
        zzwb.zza[] zzaVarArr;
        ArrayMap arrayMap = new ArrayMap();
        ArrayMap arrayMap2 = new ArrayMap();
        if (zzbVar != null && zzbVar.awF != null) {
            for (zzwb.zza zzaVar : zzbVar.awF) {
                if (zzaVar != null) {
                    String str2 = AppMeasurement.zza.aqx.get(zzaVar.name);
                    if (str2 != null) {
                        zzaVar.name = str2;
                    }
                    arrayMap.put(zzaVar.name, zzaVar.awA);
                    arrayMap2.put(zzaVar.name, zzaVar.awB);
                }
            }
        }
        this.atC.put(str, arrayMap);
        this.atD.put(str, arrayMap2);
    }

    @WorkerThread
    private zzwb.zzb zze(String str, byte[] bArr) {
        if (bArr == null) {
            return new zzwb.zzb();
        }
        zzars zzbd = zzars.zzbd(bArr);
        zzwb.zzb zzbVar = new zzwb.zzb();
        try {
            zzwb.zzb zzbVar2 = (zzwb.zzb) zzbVar.zzb(zzbd);
            zzbwb().zzbxe().zze("Parsed config. version, gmp_app_id", zzbVar.awC, zzbVar.aqZ);
            return zzbVar;
        } catch (IOException e) {
            zzbwb().zzbxa().zze("Unable to merge remote config", str, e);
            return null;
        }
    }

    @WorkerThread
    private void zzmn(String str) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        if (!this.atE.containsKey(str)) {
            byte[] zzmb = zzbvw().zzmb(str);
            if (zzmb == null) {
                this.atB.put(str, null);
                this.atC.put(str, null);
                this.atD.put(str, null);
                this.atE.put(str, null);
                this.atF.put(str, null);
                return;
            }
            zzwb.zzb zze = zze(str, zzmb);
            this.atB.put(str, zza(zze));
            zza(str, zze);
            this.atE.put(str, zze);
            this.atF.put(str, null);
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
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
    @WorkerThread
    public String zzaw(String str, String str2) {
        zzzx();
        zzmn(str);
        Map<String, String> map = this.atB.get(str);
        if (map != null) {
            return map.get(str2);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public boolean zzax(String str, String str2) {
        Boolean bool;
        zzzx();
        zzmn(str);
        if (!zzbvx().zznh(str) || !zzal.zzne(str2)) {
            if (zzbvx().zzni(str) && zzal.zzmu(str2)) {
                return true;
            }
            Map<String, Boolean> map = this.atC.get(str);
            if (map != null && (bool = map.get(str2)) != null) {
                return bool.booleanValue();
            }
            return false;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public boolean zzay(String str, String str2) {
        Boolean bool;
        zzzx();
        zzmn(str);
        Map<String, Boolean> map = this.atD.get(str);
        if (map != null && (bool = map.get(str2)) != null) {
            return bool.booleanValue();
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public boolean zzb(String str, byte[] bArr, String str2) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzwb.zzb zze = zze(str, bArr);
        if (zze == null) {
            return false;
        }
        zza(str, zze);
        this.atE.put(str, zze);
        this.atF.put(str, str2);
        this.atB.put(str, zza(zze));
        zzbvp().zza(str, zze.awG);
        try {
            zze.awG = null;
            byte[] bArr2 = new byte[zze.cz()];
            zze.zza(zzart.zzbe(bArr2));
            bArr = bArr2;
        } catch (IOException e) {
            zzbwb().zzbxa().zzj("Unable to serialize reduced-size config.  Storing full config instead.", e);
        }
        zzbvw().zzd(str, bArr);
        return true;
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

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public zzwb.zzb zzmo(String str) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzmn(str);
        return this.atE.get(str);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public String zzmp(String str) {
        zzzx();
        return this.atF.get(str);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public void zzmq(String str) {
        zzzx();
        this.atF.put(str, null);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
