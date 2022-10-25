package com.google.android.gms.measurement.internal;

import android.app.Application;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.annotation.Size;
import android.support.annotation.WorkerThread;
import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import android.util.Pair;
import com.google.android.exoplayer2.C;
import com.google.android.gms.internal.zzart;
import com.google.android.gms.internal.zzwb;
import com.google.android.gms.internal.zzwc;
import com.google.android.gms.measurement.AppMeasurement;
import com.google.android.gms.measurement.internal.zze;
import com.google.android.gms.measurement.internal.zzq;
import com.google.android.gms.measurement.internal.zzr;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.friends.FriendsGetRequests;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzx {
    private static volatile zzx atW;
    private final zzd atX;
    private final zzt atY;
    private final zzq atZ;
    private final zzw aua;
    private final zzag aub;
    private final zzv auc;
    private final AppMeasurement aud;
    private final FirebaseAnalytics aue;
    private final zzal auf;
    private final zze aug;
    private final zzo auh;
    private final zzr aui;
    private final zzad auj;
    private final zzae auk;
    private final zzg aul;
    private final zzac aum;
    private final zzn aun;
    private final zzs auo;
    private final zzai aup;
    private final zzc auq;
    private boolean aur;
    private Boolean aus;
    private long aut;
    private FileLock auu;
    private FileChannel auv;
    private List<Long> auw;
    private int aux;
    private int auy;
    private long auz;
    private final boolean cR;
    private final Context mContext;
    private final com.google.android.gms.common.util.zze zzaql;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zza implements zze.zzb {
        zzwc.zze auB;
        List<Long> auC;
        long auD;
        List<zzwc.zzb> zzani;

        private zza() {
        }

        private long zza(zzwc.zzb zzbVar) {
            return ((zzbVar.awO.longValue() / 1000) / 60) / 60;
        }

        boolean isEmpty() {
            return this.zzani == null || this.zzani.isEmpty();
        }

        @Override // com.google.android.gms.measurement.internal.zze.zzb
        public boolean zza(long j, zzwc.zzb zzbVar) {
            com.google.android.gms.common.internal.zzaa.zzy(zzbVar);
            if (this.zzani == null) {
                this.zzani = new ArrayList();
            }
            if (this.auC == null) {
                this.auC = new ArrayList();
            }
            if (this.zzani.size() <= 0 || zza(this.zzani.get(0)) == zza(zzbVar)) {
                long cz = this.auD + zzbVar.cz();
                if (cz >= zzx.this.zzbwd().zzbuz()) {
                    return false;
                }
                this.auD = cz;
                this.zzani.add(zzbVar);
                this.auC.add(Long.valueOf(j));
                return this.zzani.size() < zzx.this.zzbwd().zzbva();
            }
            return false;
        }

        @Override // com.google.android.gms.measurement.internal.zze.zzb
        public void zzb(zzwc.zze zzeVar) {
            com.google.android.gms.common.internal.zzaa.zzy(zzeVar);
            this.auB = zzeVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzx(zzab zzabVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        this.mContext = zzabVar.mContext;
        this.auz = -1L;
        this.zzaql = zzabVar.zzn(this);
        this.atX = zzabVar.zza(this);
        zzt zzb = zzabVar.zzb(this);
        zzb.initialize();
        this.atY = zzb;
        zzq zzc = zzabVar.zzc(this);
        zzc.initialize();
        this.atZ = zzc;
        zzbwb().zzbxc().zzj("App measurement is starting up, version", Long.valueOf(zzbwd().zzbto()));
        zzbwb().zzbxc().log("To enable debug logging run: adb shell setprop log.tag.FA VERBOSE");
        zzbwb().zzbxd().log("Debug-level message logging enabled");
        zzbwb().zzbxd().zzj("AppMeasurement singleton hash", Integer.valueOf(System.identityHashCode(this)));
        this.auf = zzabVar.zzj(this);
        zzg zzq = zzabVar.zzq(this);
        zzq.initialize();
        this.aul = zzq;
        zzn zzr = zzabVar.zzr(this);
        zzr.initialize();
        this.aun = zzr;
        if (!zzbwd().zzayi()) {
            String zzup = zzr.zzup();
            if (zzbvx().zznf(zzup)) {
                zzbwb().zzbxc().log("Faster debug mode event logging enabled. To disable, run:\n  adb shell setprop firebase.analytics.debug-mode .none.");
            } else {
                zzq.zza zzbxc = zzbwb().zzbxc();
                String valueOf = String.valueOf(zzup);
                zzbxc.log(valueOf.length() != 0 ? "To enable faster debug mode event logging run:\n  adb shell setprop firebase.analytics.debug-mode ".concat(valueOf) : new String("To enable faster debug mode event logging run:\n  adb shell setprop firebase.analytics.debug-mode "));
            }
        }
        zze zzk = zzabVar.zzk(this);
        zzk.initialize();
        this.aug = zzk;
        zzo zzl = zzabVar.zzl(this);
        zzl.initialize();
        this.auh = zzl;
        zzc zzu = zzabVar.zzu(this);
        zzu.initialize();
        this.auq = zzu;
        zzr zzm = zzabVar.zzm(this);
        zzm.initialize();
        this.aui = zzm;
        zzad zzo = zzabVar.zzo(this);
        zzo.initialize();
        this.auj = zzo;
        zzae zzp = zzabVar.zzp(this);
        zzp.initialize();
        this.auk = zzp;
        zzac zzi = zzabVar.zzi(this);
        zzi.initialize();
        this.aum = zzi;
        zzai zzt = zzabVar.zzt(this);
        zzt.initialize();
        this.aup = zzt;
        this.auo = zzabVar.zzs(this);
        this.aud = zzabVar.zzh(this);
        this.aue = zzabVar.zzg(this);
        zzag zze = zzabVar.zze(this);
        zze.initialize();
        this.aub = zze;
        zzv zzf = zzabVar.zzf(this);
        zzf.initialize();
        this.auc = zzf;
        zzw zzd = zzabVar.zzd(this);
        zzd.initialize();
        this.aua = zzd;
        if (this.aux != this.auy) {
            zzbwb().zzbwy().zze("Not all components initialized", Integer.valueOf(this.aux), Integer.valueOf(this.auy));
        }
        this.cR = true;
        if (!this.atX.zzayi()) {
            if (!(this.mContext.getApplicationContext() instanceof Application)) {
                zzbwb().zzbxa().log("Application context is not an Application");
            } else if (Build.VERSION.SDK_INT >= 14) {
                zzbvq().zzbyp();
            } else {
                zzbwb().zzbxd().log("Not tracking deep linking pre-ICS");
            }
        }
        this.aua.zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzx.1
            @Override // java.lang.Runnable
            public void run() {
                zzx.this.start();
            }
        });
    }

    private void zza(zzaa zzaaVar) {
        if (zzaaVar == null) {
            throw new IllegalStateException("Component not created");
        }
        if (zzaaVar.isInitialized()) {
            return;
        }
        throw new IllegalStateException("Component not initialized");
    }

    private void zza(zzz zzzVar) {
        if (zzzVar == null) {
            throw new IllegalStateException("Component not created");
        }
    }

    private boolean zza(zzh zzhVar) {
        if (zzhVar.arC == null) {
            return false;
        }
        Iterator<String> it = zzhVar.arC.iterator();
        while (it.hasNext()) {
            if ("_r".equals(it.next())) {
                return true;
            }
        }
        return zzbvy().zzay(zzhVar.zzctj, zzhVar.mName) && zzbvw().zza(zzbyb(), zzhVar.zzctj, false, false, false, false, false).art < ((long) zzbwd().zzlq(zzhVar.zzctj));
    }

    private zzwc.zza[] zza(String str, zzwc.zzg[] zzgVarArr, zzwc.zzb[] zzbVarArr) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        return zzbvp().zza(str, zzbVarArr, zzgVarArr);
    }

    private boolean zzbyf() {
        zzzx();
        zzacj();
        return zzbvw().zzbwk() || !TextUtils.isEmpty(zzbvw().zzbwe());
    }

    @WorkerThread
    private void zzbyg() {
        zzzx();
        zzacj();
        if (!zzbyk()) {
            return;
        }
        if (!zzbxq() || !zzbyf()) {
            zzbxw().unregister();
            zzbxx().cancel();
            return;
        }
        long zzbyh = zzbyh();
        if (zzbyh == 0) {
            zzbxw().unregister();
            zzbxx().cancel();
        } else if (!zzbxv().zzagk()) {
            zzbxw().zzagh();
            zzbxx().cancel();
        } else {
            long j = zzbwc().atb.get();
            long zzbve = zzbwd().zzbve();
            if (!zzbvx().zzf(j, zzbve)) {
                zzbyh = Math.max(zzbyh, j + zzbve);
            }
            zzbxw().unregister();
            long currentTimeMillis = zzbyh - zzabz().currentTimeMillis();
            if (currentTimeMillis <= 0) {
                currentTimeMillis = zzbwd().zzbvh();
                zzbwc().asZ.set(zzabz().currentTimeMillis());
            }
            zzbwb().zzbxe().zzj("Upload scheduled in approximately ms", Long.valueOf(currentTimeMillis));
            zzbxx().zzx(currentTimeMillis);
        }
    }

    private long zzbyh() {
        long currentTimeMillis = zzabz().currentTimeMillis();
        long zzbvk = zzbwd().zzbvk();
        boolean z = zzbvw().zzbwl() || zzbvw().zzbwf();
        long zzbvg = z ? zzbwd().zzbvg() : zzbwd().zzbvf();
        long j = zzbwc().asZ.get();
        long j2 = zzbwc().ata.get();
        long max = Math.max(zzbvw().zzbwi(), zzbvw().zzbwj());
        if (max == 0) {
            return 0L;
        }
        long abs = currentTimeMillis - Math.abs(max - currentTimeMillis);
        long abs2 = currentTimeMillis - Math.abs(j2 - currentTimeMillis);
        long max2 = Math.max(currentTimeMillis - Math.abs(j - currentTimeMillis), abs2);
        long j3 = abs + zzbvk;
        if (z && max2 > 0) {
            j3 = Math.min(abs, max2) + zzbvg;
        }
        if (!zzbvx().zzf(max2, zzbvg)) {
            j3 = max2 + zzbvg;
        }
        if (abs2 == 0 || abs2 < abs) {
            return j3;
        }
        for (int i = 0; i < zzbwd().zzbvm(); i++) {
            j3 += (1 << i) * zzbwd().zzbvl();
            if (j3 > abs2) {
                return j3;
            }
        }
        return 0L;
    }

    public static zzx zzdq(Context context) {
        com.google.android.gms.common.internal.zzaa.zzy(context);
        com.google.android.gms.common.internal.zzaa.zzy(context.getApplicationContext());
        if (atW == null) {
            synchronized (zzx.class) {
                if (atW == null) {
                    atW = new zzab(context).zzbyo();
                }
            }
        }
        return atW;
    }

    @WorkerThread
    private void zze(AppMetadata appMetadata) {
        boolean z = true;
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(appMetadata);
        com.google.android.gms.common.internal.zzaa.zzib(appMetadata.packageName);
        com.google.android.gms.measurement.internal.zza zzlz = zzbvw().zzlz(appMetadata.packageName);
        String zzml = zzbwc().zzml(appMetadata.packageName);
        boolean z2 = false;
        if (zzlz == null) {
            com.google.android.gms.measurement.internal.zza zzaVar = new com.google.android.gms.measurement.internal.zza(this, appMetadata.packageName);
            zzaVar.zzlj(zzbwc().zzbxh());
            zzaVar.zzll(zzml);
            zzlz = zzaVar;
            z2 = true;
        } else if (!zzml.equals(zzlz.zzbti())) {
            zzlz.zzll(zzml);
            zzlz.zzlj(zzbwc().zzbxh());
            z2 = true;
        }
        if (!TextUtils.isEmpty(appMetadata.aqZ) && !appMetadata.aqZ.equals(zzlz.zzbth())) {
            zzlz.zzlk(appMetadata.aqZ);
            z2 = true;
        }
        if (!TextUtils.isEmpty(appMetadata.arh) && !appMetadata.arh.equals(zzlz.zzbtj())) {
            zzlz.zzlm(appMetadata.arh);
            z2 = true;
        }
        if (appMetadata.arb != 0 && appMetadata.arb != zzlz.zzbto()) {
            zzlz.zzay(appMetadata.arb);
            z2 = true;
        }
        if (!TextUtils.isEmpty(appMetadata.aii) && !appMetadata.aii.equals(zzlz.zzaaf())) {
            zzlz.setAppVersion(appMetadata.aii);
            z2 = true;
        }
        if (appMetadata.arg != zzlz.zzbtm()) {
            zzlz.zzax(appMetadata.arg);
            z2 = true;
        }
        if (!TextUtils.isEmpty(appMetadata.ara) && !appMetadata.ara.equals(zzlz.zzbtn())) {
            zzlz.zzln(appMetadata.ara);
            z2 = true;
        }
        if (appMetadata.arc != zzlz.zzbtp()) {
            zzlz.zzaz(appMetadata.arc);
            z2 = true;
        }
        if (appMetadata.are != zzlz.zzbtq()) {
            zzlz.setMeasurementEnabled(appMetadata.are);
        } else {
            z = z2;
        }
        if (z) {
            zzbvw().zza(zzlz);
        }
    }

    private boolean zzh(String str, long j) {
        boolean z;
        int i;
        boolean z2;
        int i2;
        boolean z3;
        boolean z4;
        zzbvw().beginTransaction();
        try {
            zza zzaVar = new zza();
            zzbvw().zza(str, j, this.auz, zzaVar);
            if (zzaVar.isEmpty()) {
                zzbvw().setTransactionSuccessful();
                zzbvw().endTransaction();
                return false;
            }
            boolean z5 = false;
            zzwc.zze zzeVar = zzaVar.auB;
            zzeVar.awV = new zzwc.zzb[zzaVar.zzani.size()];
            int i3 = 0;
            int i4 = 0;
            while (i4 < zzaVar.zzani.size()) {
                if (zzbvy().zzax(zzaVar.auB.zzcs, zzaVar.zzani.get(i4).name)) {
                    zzbwb().zzbxa().zzj("Dropping blacklisted raw event", zzaVar.zzani.get(i4).name);
                    if ((zzbvx().zznh(zzaVar.auB.zzcs) || zzbvx().zzni(zzaVar.auB.zzcs)) || "_err".equals(zzaVar.zzani.get(i4).name)) {
                        i = i3;
                        z2 = z5;
                    } else {
                        zzbvx().zza(11, "_ev", zzaVar.zzani.get(i4).name, 0);
                        i = i3;
                        z2 = z5;
                    }
                } else {
                    if (zzbvy().zzay(zzaVar.auB.zzcs, zzaVar.zzani.get(i4).name)) {
                        boolean z6 = false;
                        boolean z7 = false;
                        if (zzaVar.zzani.get(i4).awN == null) {
                            zzaVar.zzani.get(i4).awN = new zzwc.zzc[0];
                        }
                        zzwc.zzc[] zzcVarArr = zzaVar.zzani.get(i4).awN;
                        int length = zzcVarArr.length;
                        int i5 = 0;
                        while (i5 < length) {
                            zzwc.zzc zzcVar = zzcVarArr[i5];
                            if ("_c".equals(zzcVar.name)) {
                                zzcVar.awR = 1L;
                                z6 = true;
                                z4 = z7;
                            } else if ("_r".equals(zzcVar.name)) {
                                zzcVar.awR = 1L;
                                z4 = true;
                            } else {
                                z4 = z7;
                            }
                            i5++;
                            z7 = z4;
                        }
                        if (!z6) {
                            zzbwb().zzbxe().zzj("Marking event as conversion", zzaVar.zzani.get(i4).name);
                            zzwc.zzc[] zzcVarArr2 = (zzwc.zzc[]) Arrays.copyOf(zzaVar.zzani.get(i4).awN, zzaVar.zzani.get(i4).awN.length + 1);
                            zzwc.zzc zzcVar2 = new zzwc.zzc();
                            zzcVar2.name = "_c";
                            zzcVar2.awR = 1L;
                            zzcVarArr2[zzcVarArr2.length - 1] = zzcVar2;
                            zzaVar.zzani.get(i4).awN = zzcVarArr2;
                        }
                        if (!z7) {
                            zzbwb().zzbxe().zzj("Marking event as real-time", zzaVar.zzani.get(i4).name);
                            zzwc.zzc[] zzcVarArr3 = (zzwc.zzc[]) Arrays.copyOf(zzaVar.zzani.get(i4).awN, zzaVar.zzani.get(i4).awN.length + 1);
                            zzwc.zzc zzcVar3 = new zzwc.zzc();
                            zzcVar3.name = "_r";
                            zzcVar3.awR = 1L;
                            zzcVarArr3[zzcVarArr3.length - 1] = zzcVar3;
                            zzaVar.zzani.get(i4).awN = zzcVarArr3;
                        }
                        boolean z8 = true;
                        boolean zzmu = zzal.zzmu(zzaVar.zzani.get(i4).name);
                        if (zzbvw().zza(zzbyb(), zzaVar.auB.zzcs, false, false, false, false, true).art > zzbwd().zzlq(zzaVar.auB.zzcs)) {
                            zzwc.zzb zzbVar = zzaVar.zzani.get(i4);
                            int i6 = 0;
                            while (true) {
                                if (i6 >= zzbVar.awN.length) {
                                    break;
                                } else if ("_r".equals(zzbVar.awN[i6].name)) {
                                    zzwc.zzc[] zzcVarArr4 = new zzwc.zzc[zzbVar.awN.length - 1];
                                    if (i6 > 0) {
                                        System.arraycopy(zzbVar.awN, 0, zzcVarArr4, 0, i6);
                                    }
                                    if (i6 < zzcVarArr4.length) {
                                        System.arraycopy(zzbVar.awN, i6 + 1, zzcVarArr4, i6, zzcVarArr4.length - i6);
                                    }
                                    zzbVar.awN = zzcVarArr4;
                                } else {
                                    i6++;
                                }
                            }
                            z8 = z5;
                        }
                        if (zzmu && zzbvw().zza(zzbyb(), zzaVar.auB.zzcs, false, false, true, false, false).arr > zzbwd().zzlp(zzaVar.auB.zzcs)) {
                            zzbwb().zzbxa().log("Too many conversions. Not logging as conversion.");
                            zzwc.zzb zzbVar2 = zzaVar.zzani.get(i4);
                            boolean z9 = false;
                            zzwc.zzc zzcVar4 = null;
                            zzwc.zzc[] zzcVarArr5 = zzbVar2.awN;
                            int length2 = zzcVarArr5.length;
                            int i7 = 0;
                            while (i7 < length2) {
                                zzwc.zzc zzcVar5 = zzcVarArr5[i7];
                                if ("_c".equals(zzcVar5.name)) {
                                    z3 = z9;
                                } else if ("_err".equals(zzcVar5.name)) {
                                    zzwc.zzc zzcVar6 = zzcVar4;
                                    z3 = true;
                                    zzcVar5 = zzcVar6;
                                } else {
                                    zzcVar5 = zzcVar4;
                                    z3 = z9;
                                }
                                i7++;
                                z9 = z3;
                                zzcVar4 = zzcVar5;
                            }
                            if (z9 && zzcVar4 != null) {
                                zzwc.zzc[] zzcVarArr6 = new zzwc.zzc[zzbVar2.awN.length - 1];
                                int i8 = 0;
                                zzwc.zzc[] zzcVarArr7 = zzbVar2.awN;
                                int length3 = zzcVarArr7.length;
                                int i9 = 0;
                                while (i9 < length3) {
                                    zzwc.zzc zzcVar7 = zzcVarArr7[i9];
                                    if (zzcVar7 != zzcVar4) {
                                        i2 = i8 + 1;
                                        zzcVarArr6[i8] = zzcVar7;
                                    } else {
                                        i2 = i8;
                                    }
                                    i9++;
                                    i8 = i2;
                                }
                                zzbVar2.awN = zzcVarArr6;
                                z = z8;
                            } else if (zzcVar4 != null) {
                                zzcVar4.name = "_err";
                                zzcVar4.awR = 10L;
                                z = z8;
                            } else {
                                zzbwb().zzbwy().log("Did not find conversion parameter. Error not tracked");
                            }
                        }
                        z = z8;
                    } else {
                        z = z5;
                    }
                    zzeVar.awV[i3] = zzaVar.zzani.get(i4);
                    i = i3 + 1;
                    z2 = z;
                }
                i4++;
                i3 = i;
                z5 = z2;
            }
            if (i3 < zzaVar.zzani.size()) {
                zzeVar.awV = (zzwc.zzb[]) Arrays.copyOf(zzeVar.awV, i3);
            }
            zzeVar.axo = zza(zzaVar.auB.zzcs, zzaVar.auB.awW, zzeVar.awV);
            zzeVar.awY = Long.MAX_VALUE;
            zzeVar.awZ = Long.MIN_VALUE;
            for (int i10 = 0; i10 < zzeVar.awV.length; i10++) {
                zzwc.zzb zzbVar3 = zzeVar.awV[i10];
                if (zzbVar3.awO.longValue() < zzeVar.awY.longValue()) {
                    zzeVar.awY = zzbVar3.awO;
                }
                if (zzbVar3.awO.longValue() > zzeVar.awZ.longValue()) {
                    zzeVar.awZ = zzbVar3.awO;
                }
            }
            String str2 = zzaVar.auB.zzcs;
            com.google.android.gms.measurement.internal.zza zzlz = zzbvw().zzlz(str2);
            if (zzlz == null) {
                zzbwb().zzbwy().log("Bundling raw events w/o app info");
            } else if (zzeVar.awV.length > 0) {
                long zzbtl = zzlz.zzbtl();
                zzeVar.axb = zzbtl != 0 ? Long.valueOf(zzbtl) : null;
                long zzbtk = zzlz.zzbtk();
                if (zzbtk != 0) {
                    zzbtl = zzbtk;
                }
                zzeVar.axa = zzbtl != 0 ? Long.valueOf(zzbtl) : null;
                zzlz.zzbtu();
                zzeVar.axm = Integer.valueOf((int) zzlz.zzbtr());
                zzlz.zzav(zzeVar.awY.longValue());
                zzlz.zzaw(zzeVar.awZ.longValue());
                zzbvw().zza(zzlz);
            }
            if (zzeVar.awV.length > 0) {
                zzeVar.ard = zzbwb().zzbxf();
                zzwb.zzb zzmo = zzbvy().zzmo(zzaVar.auB.zzcs);
                if (zzmo == null || zzmo.awC == null) {
                    zzbwb().zzbxa().log("Did not find measurement config or missing version info");
                } else {
                    zzeVar.axt = zzmo.awC;
                }
                zzbvw().zza(zzeVar, z5);
            }
            zzbvw().zzaf(zzaVar.auC);
            zzbvw().zzmg(str2);
            zzbvw().setTransactionSuccessful();
            return zzeVar.awV.length > 0;
        } finally {
            zzbvw().endTransaction();
        }
    }

    public Context getContext() {
        return this.mContext;
    }

    @WorkerThread
    public boolean isEnabled() {
        boolean z = false;
        zzzx();
        zzacj();
        if (zzbwd().zzbut()) {
            return false;
        }
        Boolean zzbuu = zzbwd().zzbuu();
        if (zzbuu != null) {
            z = zzbuu.booleanValue();
        } else if (!zzbwd().zzatu()) {
            z = true;
        }
        return zzbwc().zzch(z);
    }

    @WorkerThread
    protected void start() {
        zzzx();
        zzbvw().zzbwg();
        if (zzbwc().asZ.get() == 0) {
            zzbwc().asZ.set(zzabz().currentTimeMillis());
        }
        if (zzbxq()) {
            if (!zzbwd().zzayi() && !TextUtils.isEmpty(zzbvr().zzbth())) {
                String zzbxk = zzbwc().zzbxk();
                if (zzbxk == null) {
                    zzbwc().zzmm(zzbvr().zzbth());
                } else if (!zzbxk.equals(zzbvr().zzbth())) {
                    zzbwb().zzbxc().log("Rechecking which service to use due to a GMP App Id change");
                    zzbwc().zzbxm();
                    this.auk.disconnect();
                    this.auk.zzadl();
                    zzbwc().zzmm(zzbvr().zzbth());
                }
            }
            if (!zzbwd().zzayi() && !TextUtils.isEmpty(zzbvr().zzbth())) {
                zzbvq().zzbyq();
            }
        } else if (isEnabled()) {
            if (!zzbvx().zzez("android.permission.INTERNET")) {
                zzbwb().zzbwy().log("App is missing INTERNET permission");
            }
            if (!zzbvx().zzez("android.permission.ACCESS_NETWORK_STATE")) {
                zzbwb().zzbwy().log("App is missing ACCESS_NETWORK_STATE permission");
            }
            if (!zzbwd().zzayi()) {
                if (!zzu.zzh(getContext(), false)) {
                    zzbwb().zzbwy().log("AppMeasurementReceiver not registered/enabled");
                }
                if (!zzaf.zzi(getContext(), false)) {
                    zzbwb().zzbwy().log("AppMeasurementService not registered/enabled");
                }
            }
            zzbwb().zzbwy().log("Uploading is not possible. App measurement disabled");
        }
        zzbyg();
    }

    @WorkerThread
    int zza(FileChannel fileChannel) {
        int i = 0;
        zzzx();
        if (fileChannel == null || !fileChannel.isOpen()) {
            zzbwb().zzbwy().log("Bad chanel to read from");
        } else {
            ByteBuffer allocate = ByteBuffer.allocate(4);
            try {
                fileChannel.position(0L);
                int read = fileChannel.read(allocate);
                if (read == 4) {
                    allocate.flip();
                    i = allocate.getInt();
                } else if (read != -1) {
                    zzbwb().zzbxa().zzj("Unexpected data length. Bytes read", Integer.valueOf(read));
                }
            } catch (IOException e) {
                zzbwb().zzbwy().zzj("Failed to read from channel", e);
            }
        }
        return i;
    }

    @WorkerThread
    protected void zza(int i, Throwable th, byte[] bArr) {
        boolean z = false;
        zzzx();
        zzacj();
        if (bArr == null) {
            bArr = new byte[0];
        }
        List<Long> list = this.auw;
        this.auw = null;
        if ((i != 200 && i != 204) || th != null) {
            zzbwb().zzbxe().zze("Network upload failed. Will retry later. code, error", Integer.valueOf(i), th);
            zzbwc().ata.set(zzabz().currentTimeMillis());
            if (i == 503 || i == 429) {
                z = true;
            }
            if (z) {
                zzbwc().atb.set(zzabz().currentTimeMillis());
            }
            zzbyg();
            return;
        }
        zzbwc().asZ.set(zzabz().currentTimeMillis());
        zzbwc().ata.set(0L);
        zzbyg();
        zzbwb().zzbxe().zze("Successful upload. Got network response. code, size", Integer.valueOf(i), Integer.valueOf(bArr.length));
        zzbvw().beginTransaction();
        try {
            for (Long l : list) {
                zzbvw().zzbj(l.longValue());
            }
            zzbvw().setTransactionSuccessful();
            zzbvw().endTransaction();
            if (zzbxv().zzagk() && zzbyf()) {
                zzbye();
                return;
            }
            this.auz = -1L;
            zzbyg();
        } catch (Throwable th2) {
            zzbvw().endTransaction();
            throw th2;
        }
    }

    @WorkerThread
    void zza(AppMetadata appMetadata, long j) {
        com.google.android.gms.measurement.internal.zza zzlz = zzbvw().zzlz(appMetadata.packageName);
        if (zzlz != null && zzlz.zzbth() != null && !zzlz.zzbth().equals(appMetadata.aqZ)) {
            zzbwb().zzbxa().log("New GMP App Id passed in. Removing cached database data.");
            zzbvw().zzme(zzlz.zzup());
            zzlz = null;
        }
        if (zzlz == null || zzlz.zzaaf() == null || zzlz.zzaaf().equals(appMetadata.aii)) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putString("_pv", zzlz.zzaaf());
        zzb(new EventParcel("_au", new EventParams(bundle), "auto", j), appMetadata);
    }

    void zza(zzh zzhVar, AppMetadata appMetadata) {
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(zzhVar);
        com.google.android.gms.common.internal.zzaa.zzy(appMetadata);
        com.google.android.gms.common.internal.zzaa.zzib(zzhVar.zzctj);
        com.google.android.gms.common.internal.zzaa.zzbt(zzhVar.zzctj.equals(appMetadata.packageName));
        zzwc.zze zzeVar = new zzwc.zze();
        zzeVar.awU = 1;
        zzeVar.axc = AbstractSpiCall.ANDROID_CLIENT_TYPE;
        zzeVar.zzcs = appMetadata.packageName;
        zzeVar.ara = appMetadata.ara;
        zzeVar.aii = appMetadata.aii;
        zzeVar.axp = Integer.valueOf((int) appMetadata.arg);
        zzeVar.axg = Long.valueOf(appMetadata.arb);
        zzeVar.aqZ = appMetadata.aqZ;
        zzeVar.axl = appMetadata.arc == 0 ? null : Long.valueOf(appMetadata.arc);
        Pair<String, Boolean> zzmk = zzbwc().zzmk(appMetadata.packageName);
        if (zzmk != null && !TextUtils.isEmpty((CharSequence) zzmk.first)) {
            zzeVar.axi = (String) zzmk.first;
            zzeVar.axj = (Boolean) zzmk.second;
        } else if (!zzbvs().zzdp(this.mContext)) {
            String string = Settings.Secure.getString(this.mContext.getContentResolver(), "android_id");
            if (string == null) {
                zzbwb().zzbxa().log("null secure ID");
                string = "null";
            } else if (string.isEmpty()) {
                zzbwb().zzbxa().log("empty secure ID");
            }
            zzeVar.axs = string;
        }
        zzeVar.axd = zzbvs().zzvt();
        zzeVar.zzdb = zzbvs().zzbws();
        zzeVar.axf = Integer.valueOf((int) zzbvs().zzbwt());
        zzeVar.axe = zzbvs().zzbwu();
        zzeVar.axh = null;
        zzeVar.awX = null;
        zzeVar.awY = null;
        zzeVar.awZ = null;
        com.google.android.gms.measurement.internal.zza zzlz = zzbvw().zzlz(appMetadata.packageName);
        if (zzlz == null) {
            zzlz = new com.google.android.gms.measurement.internal.zza(this, appMetadata.packageName);
            zzlz.zzlj(zzbwc().zzbxh());
            zzlz.zzlm(appMetadata.arh);
            zzlz.zzlk(appMetadata.aqZ);
            zzlz.zzll(zzbwc().zzml(appMetadata.packageName));
            zzlz.zzba(0L);
            zzlz.zzav(0L);
            zzlz.zzaw(0L);
            zzlz.setAppVersion(appMetadata.aii);
            zzlz.zzax(appMetadata.arg);
            zzlz.zzln(appMetadata.ara);
            zzlz.zzay(appMetadata.arb);
            zzlz.zzaz(appMetadata.arc);
            zzlz.setMeasurementEnabled(appMetadata.are);
            zzbvw().zza(zzlz);
        }
        zzeVar.axk = zzlz.zzazn();
        zzeVar.arh = zzlz.zzbtj();
        List<zzak> zzly = zzbvw().zzly(appMetadata.packageName);
        zzeVar.awW = new zzwc.zzg[zzly.size()];
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= zzly.size()) {
                try {
                    zzbvw().zza(zzhVar, zzbvw().zza(zzeVar), zza(zzhVar));
                    return;
                } catch (IOException e) {
                    zzbwb().zzbwy().zzj("Data loss. Failed to insert raw event metadata", e);
                    return;
                }
            }
            zzwc.zzg zzgVar = new zzwc.zzg();
            zzeVar.awW[i2] = zzgVar;
            zzgVar.name = zzly.get(i2).mName;
            zzgVar.axx = Long.valueOf(zzly.get(i2).avX);
            zzbvx().zza(zzgVar, zzly.get(i2).zzcyd);
            i = i2 + 1;
        }
    }

    @WorkerThread
    boolean zza(int i, FileChannel fileChannel) {
        zzzx();
        if (fileChannel == null || !fileChannel.isOpen()) {
            zzbwb().zzbwy().log("Bad chanel to read from");
            return false;
        }
        ByteBuffer allocate = ByteBuffer.allocate(4);
        allocate.putInt(i);
        allocate.flip();
        try {
            fileChannel.truncate(0L);
            fileChannel.write(allocate);
            fileChannel.force(true);
            if (fileChannel.size() == 4) {
                return true;
            }
            zzbwb().zzbwy().zzj("Error writing to channel. Bytes written", Long.valueOf(fileChannel.size()));
            return true;
        } catch (IOException e) {
            zzbwb().zzbwy().zzj("Failed to write to channel", e);
            return false;
        }
    }

    @WorkerThread
    public byte[] zza(@NonNull EventParcel eventParcel, @Size(min = 1) String str) {
        long j;
        zzacj();
        zzzx();
        zzbyc();
        com.google.android.gms.common.internal.zzaa.zzy(eventParcel);
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzwc.zzd zzdVar = new zzwc.zzd();
        zzbvw().beginTransaction();
        try {
            com.google.android.gms.measurement.internal.zza zzlz = zzbvw().zzlz(str);
            if (zzlz == null) {
                zzbwb().zzbxd().zzj("Log and bundle not available. package_name", str);
                return new byte[0];
            } else if (!zzlz.zzbtq()) {
                zzbwb().zzbxd().zzj("Log and bundle disabled. package_name", str);
                return new byte[0];
            } else {
                zzwc.zze zzeVar = new zzwc.zze();
                zzdVar.awS = new zzwc.zze[]{zzeVar};
                zzeVar.awU = 1;
                zzeVar.axc = AbstractSpiCall.ANDROID_CLIENT_TYPE;
                zzeVar.zzcs = zzlz.zzup();
                zzeVar.ara = zzlz.zzbtn();
                zzeVar.aii = zzlz.zzaaf();
                zzeVar.axp = Integer.valueOf((int) zzlz.zzbtm());
                zzeVar.axg = Long.valueOf(zzlz.zzbto());
                zzeVar.aqZ = zzlz.zzbth();
                zzeVar.axl = Long.valueOf(zzlz.zzbtp());
                Pair<String, Boolean> zzmk = zzbwc().zzmk(zzlz.zzup());
                if (zzmk != null && !TextUtils.isEmpty((CharSequence) zzmk.first)) {
                    zzeVar.axi = (String) zzmk.first;
                    zzeVar.axj = (Boolean) zzmk.second;
                }
                zzeVar.axd = zzbvs().zzvt();
                zzeVar.zzdb = zzbvs().zzbws();
                zzeVar.axf = Integer.valueOf((int) zzbvs().zzbwt());
                zzeVar.axe = zzbvs().zzbwu();
                zzeVar.axk = zzlz.zzazn();
                zzeVar.arh = zzlz.zzbtj();
                List<zzak> zzly = zzbvw().zzly(zzlz.zzup());
                zzeVar.awW = new zzwc.zzg[zzly.size()];
                for (int i = 0; i < zzly.size(); i++) {
                    zzwc.zzg zzgVar = new zzwc.zzg();
                    zzeVar.awW[i] = zzgVar;
                    zzgVar.name = zzly.get(i).mName;
                    zzgVar.axx = Long.valueOf(zzly.get(i).avX);
                    zzbvx().zza(zzgVar, zzly.get(i).zzcyd);
                }
                Bundle zzbww = eventParcel.arJ.zzbww();
                if ("_iap".equals(eventParcel.name)) {
                    zzbww.putLong("_c", 1L);
                    zzbwb().zzbxd().log("Marking in-app purchase as real-time");
                    zzbww.putLong("_r", 1L);
                }
                zzbww.putString("_o", eventParcel.arK);
                if (zzbvx().zznf(zzeVar.zzcs)) {
                    zzbvx().zza(zzbww, "_dbg", (Object) 1L);
                    zzbvx().zza(zzbww, "_r", (Object) 1L);
                }
                zzi zzap = zzbvw().zzap(str, eventParcel.name);
                if (zzap == null) {
                    zzbvw().zza(new zzi(str, eventParcel.name, 1L, 0L, eventParcel.arL));
                    j = 0;
                } else {
                    j = zzap.arF;
                    zzbvw().zza(zzap.zzbl(eventParcel.arL).zzbwv());
                }
                zzh zzhVar = new zzh(this, eventParcel.arK, str, eventParcel.name, eventParcel.arL, j, zzbww);
                zzwc.zzb zzbVar = new zzwc.zzb();
                zzeVar.awV = new zzwc.zzb[]{zzbVar};
                zzbVar.awO = Long.valueOf(zzhVar.vO);
                zzbVar.name = zzhVar.mName;
                zzbVar.awP = Long.valueOf(zzhVar.arB);
                zzbVar.awN = new zzwc.zzc[zzhVar.arC.size()];
                Iterator<String> it = zzhVar.arC.iterator();
                int i2 = 0;
                while (it.hasNext()) {
                    String next = it.next();
                    zzwc.zzc zzcVar = new zzwc.zzc();
                    zzbVar.awN[i2] = zzcVar;
                    zzcVar.name = next;
                    zzbvx().zza(zzcVar, zzhVar.arC.get(next));
                    i2++;
                }
                zzeVar.axo = zza(zzlz.zzup(), zzeVar.awW, zzeVar.awV);
                zzeVar.awY = zzbVar.awO;
                zzeVar.awZ = zzbVar.awO;
                long zzbtl = zzlz.zzbtl();
                zzeVar.axb = zzbtl != 0 ? Long.valueOf(zzbtl) : null;
                long zzbtk = zzlz.zzbtk();
                if (zzbtk != 0) {
                    zzbtl = zzbtk;
                }
                zzeVar.axa = zzbtl != 0 ? Long.valueOf(zzbtl) : null;
                zzlz.zzbtu();
                zzeVar.axm = Integer.valueOf((int) zzlz.zzbtr());
                zzeVar.axh = Long.valueOf(zzbwd().zzbto());
                zzeVar.awX = Long.valueOf(zzabz().currentTimeMillis());
                zzeVar.axn = Boolean.TRUE;
                zzlz.zzav(zzeVar.awY.longValue());
                zzlz.zzaw(zzeVar.awZ.longValue());
                zzbvw().zza(zzlz);
                zzbvw().setTransactionSuccessful();
                try {
                    byte[] bArr = new byte[zzdVar.cz()];
                    zzart zzbe = zzart.zzbe(bArr);
                    zzdVar.zza(zzbe);
                    zzbe.cm();
                    return zzbvx().zzk(bArr);
                } catch (IOException e) {
                    zzbwb().zzbwy().zzj("Data loss. Failed to bundle and serialize", e);
                    return null;
                }
            }
        } finally {
            zzbvw().endTransaction();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzaby() {
        zzbwd().zzayi();
    }

    public com.google.android.gms.common.util.zze zzabz() {
        return this.zzaql;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzacj() {
        if (!this.cR) {
            throw new IllegalStateException("AppMeasurement is not initialized");
        }
    }

    protected void zzag(List<Long> list) {
        com.google.android.gms.common.internal.zzaa.zzbt(!list.isEmpty());
        if (this.auw != null) {
            zzbwb().zzbwy().log("Set uploading progress before finishing the previous upload");
        } else {
            this.auw = new ArrayList(list);
        }
    }

    public void zzaw(boolean z) {
        zzbyg();
    }

    @WorkerThread
    void zzb(AppMetadata appMetadata, long j) {
        PackageInfo packageInfo;
        ApplicationInfo applicationInfo;
        zzzx();
        zzacj();
        Bundle bundle = new Bundle();
        bundle.putLong("_c", 1L);
        bundle.putLong("_r", 1L);
        bundle.putLong("_uwa", 0L);
        bundle.putLong("_pfo", 0L);
        bundle.putLong("_sys", 0L);
        bundle.putLong("_sysu", 0L);
        PackageManager packageManager = getContext().getPackageManager();
        if (packageManager == null) {
            zzbwb().zzbwy().log("PackageManager is null, first open report might be inaccurate");
        } else {
            try {
                packageInfo = packageManager.getPackageInfo(appMetadata.packageName, 0);
            } catch (PackageManager.NameNotFoundException e) {
                zzbwb().zzbwy().zzj("Package info is null, first open report might be inaccurate", e);
                packageInfo = null;
            }
            if (packageInfo != null && packageInfo.firstInstallTime != 0 && packageInfo.firstInstallTime != packageInfo.lastUpdateTime) {
                bundle.putLong("_uwa", 1L);
            }
            try {
                applicationInfo = packageManager.getApplicationInfo(appMetadata.packageName, 0);
            } catch (PackageManager.NameNotFoundException e2) {
                zzbwb().zzbwy().zzj("Application info is null, first open report might be inaccurate", e2);
                applicationInfo = null;
            }
            if (applicationInfo != null) {
                if ((applicationInfo.flags & 1) != 0) {
                    bundle.putLong("_sys", 1L);
                }
                if ((applicationInfo.flags & 128) != 0) {
                    bundle.putLong("_sysu", 1L);
                }
            }
        }
        long zzmf = zzbvw().zzmf(appMetadata.packageName);
        if (zzmf >= 0) {
            bundle.putLong("_pfo", zzmf);
        }
        zzb(new EventParcel("_f", new EventParams(bundle), "auto", j), appMetadata);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzb(EventParcel eventParcel, AppMetadata appMetadata) {
        long j;
        zzak zzakVar;
        zzi zzbl;
        com.google.android.gms.measurement.internal.zza zzlz;
        long nanoTime = System.nanoTime();
        zzzx();
        zzacj();
        String str = appMetadata.packageName;
        com.google.android.gms.common.internal.zzaa.zzib(str);
        if (!zzal.zzc(eventParcel, appMetadata)) {
            return;
        }
        if (!appMetadata.are && !FriendsGetRequests.FILE_PREFIX_IN.equals(eventParcel.name)) {
            zze(appMetadata);
        } else if (zzbvy().zzax(str, eventParcel.name)) {
            zzbwb().zzbxa().zzj("Dropping blacklisted event", eventParcel.name);
            boolean z = zzbvx().zznh(str) || zzbvx().zzni(str);
            if (!z && !"_err".equals(eventParcel.name)) {
                zzbvx().zza(11, "_ev", eventParcel.name, 0);
            }
            if (!z || (zzlz = zzbvw().zzlz(str)) == null) {
                return;
            }
            if (Math.abs(zzabz().currentTimeMillis() - Math.max(zzlz.zzbtt(), zzlz.zzbts())) <= zzbwd().zzbux()) {
                return;
            }
            zzbwb().zzbxd().log("Fetching config for blacklisted app");
            zzb(zzlz);
        } else {
            if (zzbwb().zzbi(2)) {
                zzbwb().zzbxe().zzj("Logging event", eventParcel);
            }
            zzbvw().beginTransaction();
            try {
                Bundle zzbww = eventParcel.arJ.zzbww();
                zze(appMetadata);
                if ("_iap".equals(eventParcel.name) || FirebaseAnalytics.Event.ECOMMERCE_PURCHASE.equals(eventParcel.name)) {
                    String string = zzbww.getString("currency");
                    if (FirebaseAnalytics.Event.ECOMMERCE_PURCHASE.equals(eventParcel.name)) {
                        double d = zzbww.getDouble("value") * 1000000.0d;
                        if (d == 0.0d) {
                            d = zzbww.getLong("value") * 1000000.0d;
                        }
                        if (d > 9.223372036854776E18d || d < -9.223372036854776E18d) {
                            zzbwb().zzbxa().zzj("Data lost. Currency value is too big", Double.valueOf(d));
                            zzbvw().setTransactionSuccessful();
                            return;
                        }
                        j = Math.round(d);
                    } else {
                        j = zzbww.getLong("value");
                    }
                    if (!TextUtils.isEmpty(string)) {
                        String upperCase = string.toUpperCase(Locale.US);
                        if (upperCase.matches("[A-Z]{3}")) {
                            String valueOf = String.valueOf("_ltv_");
                            String valueOf2 = String.valueOf(upperCase);
                            String concat = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
                            zzak zzar = zzbvw().zzar(str, concat);
                            if (zzar == null || !(zzar.zzcyd instanceof Long)) {
                                zzbvw().zzz(str, zzbwd().zzls(str) - 1);
                                zzakVar = new zzak(str, concat, zzabz().currentTimeMillis(), Long.valueOf(j));
                            } else {
                                zzakVar = new zzak(str, concat, zzabz().currentTimeMillis(), Long.valueOf(j + ((Long) zzar.zzcyd).longValue()));
                            }
                            if (!zzbvw().zza(zzakVar)) {
                                zzbwb().zzbwy().zze("Too many unique user properties are set. Ignoring user property.", zzakVar.mName, zzakVar.zzcyd);
                                zzbvx().zza(9, (String) null, (String) null, 0);
                            }
                        }
                    }
                }
                boolean zzmu = zzal.zzmu(eventParcel.name);
                boolean equals = "_err".equals(eventParcel.name);
                zze.zza zza2 = zzbvw().zza(zzbyb(), str, true, zzmu, false, equals, false);
                long zzbul = zza2.arq - zzbwd().zzbul();
                if (zzbul > 0) {
                    if (zzbul % 1000 == 1) {
                        zzbwb().zzbwy().zzj("Data loss. Too many events logged. count", Long.valueOf(zza2.arq));
                    }
                    zzbvx().zza(16, "_ev", eventParcel.name, 0);
                    zzbvw().setTransactionSuccessful();
                    return;
                }
                if (zzmu) {
                    long zzbum = zza2.arp - zzbwd().zzbum();
                    if (zzbum > 0) {
                        if (zzbum % 1000 == 1) {
                            zzbwb().zzbwy().zzj("Data loss. Too many public events logged. count", Long.valueOf(zza2.arp));
                        }
                        zzbvx().zza(16, "_ev", eventParcel.name, 0);
                        zzbvw().setTransactionSuccessful();
                        return;
                    }
                }
                if (equals) {
                    long zzlo = zza2.ars - zzbwd().zzlo(appMetadata.packageName);
                    if (zzlo > 0) {
                        if (zzlo == 1) {
                            zzbwb().zzbwy().zzj("Too many error events logged. count", Long.valueOf(zza2.ars));
                        }
                        zzbvw().setTransactionSuccessful();
                        return;
                    }
                }
                zzbvx().zza(zzbww, "_o", eventParcel.arK);
                if (zzbvx().zznf(str)) {
                    zzbvx().zza(zzbww, "_dbg", (Object) 1L);
                    zzbvx().zza(zzbww, "_r", (Object) 1L);
                }
                long zzma = zzbvw().zzma(str);
                if (zzma > 0) {
                    zzbwb().zzbxa().zzj("Data lost. Too many events stored on disk, deleted", Long.valueOf(zzma));
                }
                zzh zzhVar = new zzh(this, eventParcel.arK, str, eventParcel.name, eventParcel.arL, 0L, zzbww);
                zzi zzap = zzbvw().zzap(str, zzhVar.mName);
                if (zzap == null) {
                    long zzmh = zzbvw().zzmh(str);
                    zzbwd().zzbuk();
                    if (zzmh >= 500) {
                        zzbwb().zzbwy().zze("Too many event names used, ignoring event. name, supported count", zzhVar.mName, Integer.valueOf(zzbwd().zzbuk()));
                        zzbvx().zza(8, (String) null, (String) null, 0);
                        return;
                    }
                    zzbl = new zzi(str, zzhVar.mName, 0L, 0L, zzhVar.vO);
                } else {
                    zzhVar = zzhVar.zza(this, zzap.arF);
                    zzbl = zzap.zzbl(zzhVar.vO);
                }
                zzbvw().zza(zzbl);
                zza(zzhVar, appMetadata);
                zzbvw().setTransactionSuccessful();
                if (zzbwb().zzbi(2)) {
                    zzbwb().zzbxe().zzj("Event recorded", zzhVar);
                }
                zzbvw().endTransaction();
                zzbyg();
                zzbwb().zzbxe().zzj("Background event processing time, ms", Long.valueOf(((System.nanoTime() - nanoTime) + 500000) / C.MICROS_PER_SECOND));
            } finally {
                zzbvw().endTransaction();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzb(EventParcel eventParcel, String str) {
        com.google.android.gms.measurement.internal.zza zzlz = zzbvw().zzlz(str);
        if (zzlz == null || TextUtils.isEmpty(zzlz.zzaaf())) {
            zzbwb().zzbxd().zzj("No app data available; dropping event", str);
            return;
        }
        try {
            String str2 = getContext().getPackageManager().getPackageInfo(str, 0).versionName;
            if (zzlz.zzaaf() != null && !zzlz.zzaaf().equals(str2)) {
                zzbwb().zzbxa().zzj("App version does not match; dropping event", str);
                return;
            }
        } catch (PackageManager.NameNotFoundException e) {
            if (!"_ui".equals(eventParcel.name)) {
                zzbwb().zzbxa().zzj("Could not find package", str);
            }
        }
        zzb(eventParcel, new AppMetadata(str, zzlz.zzbth(), zzlz.zzaaf(), zzlz.zzbtm(), zzlz.zzbtn(), zzlz.zzbto(), zzlz.zzbtp(), null, zzlz.zzbtq(), false, zzlz.zzbtj()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzb(UserAttributeParcel userAttributeParcel, AppMetadata appMetadata) {
        int i = 0;
        zzzx();
        zzacj();
        if (TextUtils.isEmpty(appMetadata.aqZ)) {
            return;
        }
        if (!appMetadata.are) {
            zze(appMetadata);
            return;
        }
        int zzmy = zzbvx().zzmy(userAttributeParcel.name);
        if (zzmy != 0) {
            String zza2 = zzbvx().zza(userAttributeParcel.name, zzbwd().zzbue(), true);
            if (userAttributeParcel.name != null) {
                i = userAttributeParcel.name.length();
            }
            zzbvx().zza(zzmy, "_ev", zza2, i);
            return;
        }
        int zzm = zzbvx().zzm(userAttributeParcel.name, userAttributeParcel.getValue());
        if (zzm != 0) {
            String zza3 = zzbvx().zza(userAttributeParcel.name, zzbwd().zzbue(), true);
            Object value = userAttributeParcel.getValue();
            if (value != null && ((value instanceof String) || (value instanceof CharSequence))) {
                i = String.valueOf(value).length();
            }
            zzbvx().zza(zzm, "_ev", zza3, i);
            return;
        }
        Object zzn = zzbvx().zzn(userAttributeParcel.name, userAttributeParcel.getValue());
        if (zzn == null) {
            return;
        }
        zzak zzakVar = new zzak(appMetadata.packageName, userAttributeParcel.name, userAttributeParcel.avT, zzn);
        zzbwb().zzbxd().zze("Setting user property", zzakVar.mName, zzn);
        zzbvw().beginTransaction();
        try {
            zze(appMetadata);
            boolean zza4 = zzbvw().zza(zzakVar);
            zzbvw().setTransactionSuccessful();
            if (zza4) {
                zzbwb().zzbxd().zze("User property set", zzakVar.mName, zzakVar.zzcyd);
            } else {
                zzbwb().zzbwy().zze("Too many unique user properties are set. Ignoring user property.", zzakVar.mName, zzakVar.zzcyd);
                zzbvx().zza(9, (String) null, (String) null, 0);
            }
        } finally {
            zzbvw().endTransaction();
        }
    }

    void zzb(com.google.android.gms.measurement.internal.zza zzaVar) {
        String zzao = zzbwd().zzao(zzaVar.zzbth(), zzaVar.zzazn());
        try {
            URL url = new URL(zzao);
            zzbwb().zzbxe().zzj("Fetching remote configuration", zzaVar.zzup());
            zzwb.zzb zzmo = zzbvy().zzmo(zzaVar.zzup());
            ArrayMap arrayMap = null;
            String zzmp = zzbvy().zzmp(zzaVar.zzup());
            if (zzmo != null && !TextUtils.isEmpty(zzmp)) {
                arrayMap = new ArrayMap();
                arrayMap.put("If-Modified-Since", zzmp);
            }
            zzbxv().zza(zzaVar.zzup(), url, arrayMap, new zzr.zza() { // from class: com.google.android.gms.measurement.internal.zzx.3
                @Override // com.google.android.gms.measurement.internal.zzr.zza
                public void zza(String str, int i, Throwable th, byte[] bArr, Map<String, List<String>> map) {
                    zzx.this.zzb(str, i, th, bArr, map);
                }
            });
        } catch (MalformedURLException e) {
            zzbwb().zzbwy().zzj("Failed to parse config URL. Not fetching", zzao);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(zzaa zzaaVar) {
        this.aux++;
    }

    @WorkerThread
    void zzb(String str, int i, Throwable th, byte[] bArr, Map<String, List<String>> map) {
        boolean z = false;
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        if (bArr == null) {
            bArr = new byte[0];
        }
        zzbvw().beginTransaction();
        try {
            com.google.android.gms.measurement.internal.zza zzlz = zzbvw().zzlz(str);
            boolean z2 = (i == 200 || i == 204 || i == 304) && th == null;
            if (zzlz == null) {
                zzbwb().zzbxa().zzj("App does not exist in onConfigFetched", str);
            } else if (z2 || i == 404) {
                List<String> list = map != null ? map.get("Last-Modified") : null;
                String str2 = (list == null || list.size() <= 0) ? null : list.get(0);
                if (i == 404 || i == 304) {
                    if (zzbvy().zzmo(str) == null && !zzbvy().zzb(str, null, null)) {
                        return;
                    }
                } else if (!zzbvy().zzb(str, bArr, str2)) {
                    return;
                }
                zzlz.zzbb(zzabz().currentTimeMillis());
                zzbvw().zza(zzlz);
                if (i == 404) {
                    zzbwb().zzbxa().log("Config not found. Using empty config");
                } else {
                    zzbwb().zzbxe().zze("Successfully fetched config. Got network response. code, size", Integer.valueOf(i), Integer.valueOf(bArr.length));
                }
                if (!zzbxv().zzagk() || !zzbyf()) {
                    zzbyg();
                } else {
                    zzbye();
                }
            } else {
                zzlz.zzbc(zzabz().currentTimeMillis());
                zzbvw().zza(zzlz);
                zzbwb().zzbxe().zze("Fetching config failed. code, error", Integer.valueOf(i), th);
                zzbvy().zzmq(str);
                zzbwc().ata.set(zzabz().currentTimeMillis());
                if (i == 503 || i == 429) {
                    z = true;
                }
                if (z) {
                    zzbwc().atb.set(zzabz().currentTimeMillis());
                }
                zzbyg();
            }
            zzbvw().setTransactionSuccessful();
        } finally {
            zzbvw().endTransaction();
        }
    }

    boolean zzbm(long j) {
        return zzh(null, j);
    }

    public zzc zzbvp() {
        zza((zzaa) this.auq);
        return this.auq;
    }

    public zzac zzbvq() {
        zza((zzaa) this.aum);
        return this.aum;
    }

    public zzn zzbvr() {
        zza((zzaa) this.aun);
        return this.aun;
    }

    public zzg zzbvs() {
        zza((zzaa) this.aul);
        return this.aul;
    }

    public zzae zzbvt() {
        zza((zzaa) this.auk);
        return this.auk;
    }

    public zzad zzbvu() {
        zza((zzaa) this.auj);
        return this.auj;
    }

    public zzo zzbvv() {
        zza((zzaa) this.auh);
        return this.auh;
    }

    public zze zzbvw() {
        zza((zzaa) this.aug);
        return this.aug;
    }

    public zzal zzbvx() {
        zza(this.auf);
        return this.auf;
    }

    public zzv zzbvy() {
        zza((zzaa) this.auc);
        return this.auc;
    }

    public zzag zzbvz() {
        zza((zzaa) this.aub);
        return this.aub;
    }

    public zzw zzbwa() {
        zza((zzaa) this.aua);
        return this.aua;
    }

    public zzq zzbwb() {
        zza((zzaa) this.atZ);
        return this.atZ;
    }

    public zzt zzbwc() {
        zza((zzz) this.atY);
        return this.atY;
    }

    public zzd zzbwd() {
        return this.atX;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public boolean zzbxq() {
        boolean z = false;
        zzacj();
        zzzx();
        if (this.aus == null || this.aut == 0 || (this.aus != null && !this.aus.booleanValue() && Math.abs(zzabz().elapsedRealtime() - this.aut) > 1000)) {
            this.aut = zzabz().elapsedRealtime();
            zzbwd().zzayi();
            if (zzbvx().zzez("android.permission.INTERNET") && zzbvx().zzez("android.permission.ACCESS_NETWORK_STATE") && zzu.zzh(getContext(), false) && zzaf.zzi(getContext(), false)) {
                z = true;
            }
            this.aus = Boolean.valueOf(z);
            if (this.aus.booleanValue()) {
                this.aus = Boolean.valueOf(zzbvx().zznb(zzbvr().zzbth()));
            }
        }
        return this.aus.booleanValue();
    }

    public zzq zzbxr() {
        if (this.atZ == null || !this.atZ.isInitialized()) {
            return null;
        }
        return this.atZ;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzw zzbxs() {
        return this.aua;
    }

    public AppMeasurement zzbxt() {
        return this.aud;
    }

    public FirebaseAnalytics zzbxu() {
        return this.aue;
    }

    public zzr zzbxv() {
        zza((zzaa) this.aui);
        return this.aui;
    }

    public zzs zzbxw() {
        if (this.auo == null) {
            throw new IllegalStateException("Network broadcast receiver not created");
        }
        return this.auo;
    }

    public zzai zzbxx() {
        zza((zzaa) this.aup);
        return this.aup;
    }

    FileChannel zzbxy() {
        return this.auv;
    }

    @WorkerThread
    void zzbxz() {
        zzzx();
        zzacj();
        if (!zzbyk() || !zzbya()) {
            return;
        }
        zzv(zza(zzbxy()), zzbvr().zzbwx());
    }

    @WorkerThread
    boolean zzbya() {
        zzzx();
        try {
            this.auv = new RandomAccessFile(new File(getContext().getFilesDir(), this.aug.zzade()), "rw").getChannel();
            this.auu = this.auv.tryLock();
        } catch (FileNotFoundException e) {
            zzbwb().zzbwy().zzj("Failed to acquire storage lock", e);
        } catch (IOException e2) {
            zzbwb().zzbwy().zzj("Failed to access storage lock file", e2);
        }
        if (this.auu != null) {
            zzbwb().zzbxe().log("Storage concurrent access okay");
            return true;
        }
        zzbwb().zzbwy().log("Storage concurrent data access panic");
        return false;
    }

    long zzbyb() {
        return ((((zzabz().currentTimeMillis() + zzbwc().zzbxi()) / 1000) / 60) / 60) / 24;
    }

    void zzbyc() {
        if (!zzbwd().zzayi()) {
            throw new IllegalStateException("Unexpected call on client side");
        }
    }

    @WorkerThread
    protected boolean zzbyd() {
        zzzx();
        return this.auw != null;
    }

    @WorkerThread
    public void zzbye() {
        com.google.android.gms.measurement.internal.zza zzlz;
        String str;
        List<Pair<zzwc.zze, Long>> list;
        zzzx();
        zzacj();
        if (!zzbwd().zzayi()) {
            Boolean zzbxl = zzbwc().zzbxl();
            if (zzbxl == null) {
                zzbwb().zzbxa().log("Upload data called on the client side before use of service was decided");
                return;
            } else if (zzbxl.booleanValue()) {
                zzbwb().zzbwy().log("Upload called in the client side when service should be used");
                return;
            }
        }
        if (zzbyd()) {
            zzbwb().zzbxa().log("Uploading requested multiple times");
        } else if (!zzbxv().zzagk()) {
            zzbwb().zzbxa().log("Network not connected, ignoring upload request");
            zzbyg();
        } else {
            long currentTimeMillis = zzabz().currentTimeMillis();
            zzbm(currentTimeMillis - zzbwd().zzbvd());
            long j = zzbwc().asZ.get();
            if (j != 0) {
                zzbwb().zzbxd().zzj("Uploading events. Elapsed time since last upload attempt (ms)", Long.valueOf(Math.abs(currentTimeMillis - j)));
            }
            String zzbwe = zzbvw().zzbwe();
            if (TextUtils.isEmpty(zzbwe)) {
                this.auz = -1L;
                String zzbk = zzbvw().zzbk(currentTimeMillis - zzbwd().zzbvd());
                if (TextUtils.isEmpty(zzbk) || (zzlz = zzbvw().zzlz(zzbk)) == null) {
                    return;
                }
                zzb(zzlz);
                return;
            }
            if (this.auz == -1) {
                this.auz = zzbvw().zzbwm();
            }
            List<Pair<zzwc.zze, Long>> zzn = zzbvw().zzn(zzbwe, zzbwd().zzlv(zzbwe), zzbwd().zzlw(zzbwe));
            if (zzn.isEmpty()) {
                return;
            }
            Iterator<Pair<zzwc.zze, Long>> it = zzn.iterator();
            while (true) {
                if (!it.hasNext()) {
                    str = null;
                    break;
                }
                zzwc.zze zzeVar = (zzwc.zze) it.next().first;
                if (!TextUtils.isEmpty(zzeVar.axi)) {
                    str = zzeVar.axi;
                    break;
                }
            }
            if (str != null) {
                for (int i = 0; i < zzn.size(); i++) {
                    zzwc.zze zzeVar2 = (zzwc.zze) zzn.get(i).first;
                    if (!TextUtils.isEmpty(zzeVar2.axi) && !zzeVar2.axi.equals(str)) {
                        list = zzn.subList(0, i);
                        break;
                    }
                }
            }
            list = zzn;
            zzwc.zzd zzdVar = new zzwc.zzd();
            zzdVar.awS = new zzwc.zze[list.size()];
            ArrayList arrayList = new ArrayList(list.size());
            for (int i2 = 0; i2 < zzdVar.awS.length; i2++) {
                zzdVar.awS[i2] = (zzwc.zze) list.get(i2).first;
                arrayList.add((Long) list.get(i2).second);
                zzdVar.awS[i2].axh = Long.valueOf(zzbwd().zzbto());
                zzdVar.awS[i2].awX = Long.valueOf(currentTimeMillis);
                zzdVar.awS[i2].axn = Boolean.valueOf(zzbwd().zzayi());
            }
            String zzb = zzbwb().zzbi(2) ? zzal.zzb(zzdVar) : null;
            byte[] zza2 = zzbvx().zza(zzdVar);
            String zzbvc = zzbwd().zzbvc();
            try {
                URL url = new URL(zzbvc);
                zzag(arrayList);
                zzbwc().ata.set(currentTimeMillis);
                String str2 = "?";
                if (zzdVar.awS.length > 0) {
                    str2 = zzdVar.awS[0].zzcs;
                }
                zzbwb().zzbxe().zzd("Uploading data. app, uncompressed size, data", str2, Integer.valueOf(zza2.length), zzb);
                zzbxv().zza(zzbwe, url, zza2, null, new zzr.zza() { // from class: com.google.android.gms.measurement.internal.zzx.2
                    @Override // com.google.android.gms.measurement.internal.zzr.zza
                    public void zza(String str3, int i3, Throwable th, byte[] bArr, Map<String, List<String>> map) {
                        zzx.this.zza(i3, th, bArr);
                    }
                });
            } catch (MalformedURLException e) {
                zzbwb().zzbwy().zzj("Failed to parse upload URL. Not uploading", zzbvc);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzbyi() {
        this.auy++;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzbyj() {
        zzzx();
        zzacj();
        if (!this.aur) {
            zzbwb().zzbxc().log("This instance being marked as an uploader");
            zzbxz();
        }
        this.aur = true;
    }

    @WorkerThread
    boolean zzbyk() {
        zzzx();
        zzacj();
        return this.aur;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzc(AppMetadata appMetadata) {
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzib(appMetadata.packageName);
        zze(appMetadata);
    }

    @WorkerThread
    void zzc(AppMetadata appMetadata, long j) {
        Bundle bundle = new Bundle();
        bundle.putLong("_et", 1L);
        zzb(new EventParcel("_e", new EventParams(bundle), "auto", j), appMetadata);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzc(UserAttributeParcel userAttributeParcel, AppMetadata appMetadata) {
        zzzx();
        zzacj();
        if (TextUtils.isEmpty(appMetadata.aqZ)) {
            return;
        }
        if (!appMetadata.are) {
            zze(appMetadata);
            return;
        }
        zzbwb().zzbxd().zzj("Removing user property", userAttributeParcel.name);
        zzbvw().beginTransaction();
        try {
            zze(appMetadata);
            zzbvw().zzaq(appMetadata.packageName, userAttributeParcel.name);
            zzbvw().setTransactionSuccessful();
            zzbwb().zzbxd().zzj("User property removed", userAttributeParcel.name);
        } finally {
            zzbvw().endTransaction();
        }
    }

    @WorkerThread
    public void zzd(AppMetadata appMetadata) {
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(appMetadata);
        com.google.android.gms.common.internal.zzaa.zzib(appMetadata.packageName);
        if (TextUtils.isEmpty(appMetadata.aqZ)) {
            return;
        }
        if (!appMetadata.are) {
            zze(appMetadata);
            return;
        }
        long currentTimeMillis = zzabz().currentTimeMillis();
        zzbvw().beginTransaction();
        try {
            zza(appMetadata, currentTimeMillis);
            zze(appMetadata);
            if (zzbvw().zzap(appMetadata.packageName, "_f") == null) {
                zzb(new UserAttributeParcel("_fot", currentTimeMillis, Long.valueOf((1 + (currentTimeMillis / TimeUtils.HOUR)) * TimeUtils.HOUR), "auto"), appMetadata);
                zzb(appMetadata, currentTimeMillis);
                zzc(appMetadata, currentTimeMillis);
            } else if (appMetadata.arf) {
                zzd(appMetadata, currentTimeMillis);
            }
            zzbvw().setTransactionSuccessful();
        } finally {
            zzbvw().endTransaction();
        }
    }

    @WorkerThread
    void zzd(AppMetadata appMetadata, long j) {
        zzb(new EventParcel("_cd", new EventParams(new Bundle()), "auto", j), appMetadata);
    }

    @WorkerThread
    boolean zzv(int i, int i2) {
        zzzx();
        if (i > i2) {
            zzbwb().zzbwy().zze("Panic: can't downgrade version. Previous, current version", Integer.valueOf(i), Integer.valueOf(i2));
            return false;
        }
        if (i < i2) {
            if (!zza(i2, zzbxy())) {
                zzbwb().zzbwy().zze("Storage version upgrade failed. Previous, current version", Integer.valueOf(i), Integer.valueOf(i2));
                return false;
            }
            zzbwb().zzbxe().zze("Storage version upgraded. Previous, current version", Integer.valueOf(i), Integer.valueOf(i2));
        }
        return true;
    }

    @WorkerThread
    public void zzzx() {
        zzbwa().zzzx();
    }
}
