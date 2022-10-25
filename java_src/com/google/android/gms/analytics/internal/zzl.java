package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.database.sqlite.SQLiteException;
import android.text.TextUtils;
import android.util.Pair;
import com.google.android.gms.analytics.CampaignTrackingReceiver;
import com.google.android.gms.analytics.CampaignTrackingService;
import com.google.android.gms.internal.zzms;
import com.google.android.gms.internal.zzmt;
import com.google.android.gms.internal.zzmw;
import com.google.android.gms.internal.zznb;
import com.google.android.gms.internal.zzsz;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzl extends zzd {
    private final zzj dC;
    private final zzah dD;
    private final zzag dE;
    private final zzi dF;
    private long dG;
    private final zzt dH;
    private final zzt dI;
    private final zzal dJ;
    private long dK;
    private boolean dL;
    private boolean mStarted;

    /* JADX INFO: Access modifiers changed from: protected */
    public zzl(zzf zzfVar, zzg zzgVar) {
        super(zzfVar);
        com.google.android.gms.common.internal.zzaa.zzy(zzgVar);
        this.dG = Long.MIN_VALUE;
        this.dE = zzgVar.zzk(zzfVar);
        this.dC = zzgVar.zzm(zzfVar);
        this.dD = zzgVar.zzn(zzfVar);
        this.dF = zzgVar.zzo(zzfVar);
        this.dJ = new zzal(zzabz());
        this.dH = new zzt(zzfVar) { // from class: com.google.android.gms.analytics.internal.zzl.1
            @Override // com.google.android.gms.analytics.internal.zzt
            public void run() {
                zzl.this.zzadj();
            }
        };
        this.dI = new zzt(zzfVar) { // from class: com.google.android.gms.analytics.internal.zzl.2
            @Override // com.google.android.gms.analytics.internal.zzt
            public void run() {
                zzl.this.zzadk();
            }
        };
    }

    private void zza(zzh zzhVar, zzmt zzmtVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzhVar);
        com.google.android.gms.common.internal.zzaa.zzy(zzmtVar);
        com.google.android.gms.analytics.zza zzaVar = new com.google.android.gms.analytics.zza(zzabx());
        zzaVar.zzdr(zzhVar.zzacs());
        zzaVar.enableAdvertisingIdCollection(zzhVar.zzact());
        com.google.android.gms.analytics.zze zzyu = zzaVar.zzyu();
        zznb zznbVar = (zznb) zzyu.zzb(zznb.class);
        zznbVar.zzeh("data");
        zznbVar.zzat(true);
        zzyu.zza(zzmtVar);
        zzmw zzmwVar = (zzmw) zzyu.zzb(zzmw.class);
        zzms zzmsVar = (zzms) zzyu.zzb(zzms.class);
        for (Map.Entry<String, String> entry : zzhVar.zzmc().entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            if ("an".equals(key)) {
                zzmsVar.setAppName(value);
            } else if ("av".equals(key)) {
                zzmsVar.setAppVersion(value);
            } else if (AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID.equals(key)) {
                zzmsVar.setAppId(value);
            } else if ("aiid".equals(key)) {
                zzmsVar.setAppInstallerId(value);
            } else if (ArgKeys.UID.equals(key)) {
                zznbVar.setUserId(value);
            } else {
                zzmwVar.set(key, value);
            }
        }
        zzb("Sending installation campaign to", zzhVar.zzacs(), zzmtVar);
        zzyu.zzp(zzace().zzago());
        zzyu.zzzm();
    }

    private void zzadh() {
        zzzx();
        Context context = zzabx().getContext();
        if (!zzaj.zzat(context)) {
            zzev("AnalyticsReceiver is not registered or is disabled. Register the receiver for reliable dispatching on non-Google Play devices. See http://goo.gl/8Rd3yj for instructions.");
        } else if (!zzak.zzau(context)) {
            zzew("AnalyticsService is not registered or is disabled. Analytics service at risk of not starting. See http://goo.gl/8Rd3yj for instructions.");
        }
        if (!CampaignTrackingReceiver.zzat(context)) {
            zzev("CampaignTrackingReceiver is not registered, not exported or is disabled. Installation campaign tracking is not possible. See http://goo.gl/8Rd3yj for instructions.");
        } else if (CampaignTrackingService.zzau(context)) {
        } else {
            zzev("CampaignTrackingService is not registered or is disabled. Installation campaign tracking is not possible. See http://goo.gl/8Rd3yj for instructions.");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzadj() {
        zzb(new zzw() { // from class: com.google.android.gms.analytics.internal.zzl.4
            @Override // com.google.android.gms.analytics.internal.zzw
            public void zzf(Throwable th) {
                zzl.this.zzadp();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzadk() {
        try {
            this.dC.zzadb();
            zzadp();
        } catch (SQLiteException e) {
            zzd("Failed to delete stale hits", e);
        }
        zzt zztVar = this.dI;
        zzacb();
        zztVar.zzx(TimeUtils.DAY);
    }

    private boolean zzadq() {
        if (this.dL) {
            return false;
        }
        zzacb();
        return zzadw() > 0;
    }

    private void zzadr() {
        zzv zzacd = zzacd();
        if (zzacd.zzafn() && !zzacd.zzfy()) {
            long zzadc = zzadc();
            if (zzadc == 0 || Math.abs(zzabz().currentTimeMillis() - zzadc) > zzacb().zzaeo()) {
                return;
            }
            zza("Dispatch alarm scheduled (ms)", Long.valueOf(zzacb().zzaen()));
            zzacd.schedule();
        }
    }

    private void zzads() {
        long min;
        zzadr();
        long zzadw = zzadw();
        long zzagq = zzace().zzagq();
        if (zzagq != 0) {
            min = zzadw - Math.abs(zzabz().currentTimeMillis() - zzagq);
            if (min <= 0) {
                min = Math.min(zzacb().zzael(), zzadw);
            }
        } else {
            min = Math.min(zzacb().zzael(), zzadw);
        }
        zza("Dispatch scheduled (ms)", Long.valueOf(min));
        if (!this.dH.zzfy()) {
            this.dH.zzx(min);
            return;
        }
        this.dH.zzy(Math.max(1L, min + this.dH.zzafk()));
    }

    private void zzadt() {
        zzadu();
        zzadv();
    }

    private void zzadu() {
        if (this.dH.zzfy()) {
            zzes("All hits dispatched or no network/service. Going to power save mode");
        }
        this.dH.cancel();
    }

    private void zzadv() {
        zzv zzacd = zzacd();
        if (zzacd.zzfy()) {
            zzacd.cancel();
        }
    }

    private boolean zzez(String str) {
        return zzsz.zzco(getContext()).checkCallingOrSelfPermission(str) == 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onServiceConnected() {
        zzzx();
        zzacb();
        zzadm();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void start() {
        zzacj();
        com.google.android.gms.common.internal.zzaa.zza(!this.mStarted, "Analytics backend already started");
        this.mStarted = true;
        zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzl.3
            @Override // java.lang.Runnable
            public void run() {
                zzl.this.zzadi();
            }
        });
    }

    public long zza(zzh zzhVar, boolean z) {
        com.google.android.gms.common.internal.zzaa.zzy(zzhVar);
        zzacj();
        zzzx();
        try {
            try {
                this.dC.beginTransaction();
                this.dC.zza(zzhVar.zzacr(), zzhVar.zzze());
                long zza = this.dC.zza(zzhVar.zzacr(), zzhVar.zzze(), zzhVar.zzacs());
                if (!z) {
                    zzhVar.zzr(zza);
                } else {
                    zzhVar.zzr(1 + zza);
                }
                this.dC.zzb(zzhVar);
                this.dC.setTransactionSuccessful();
                try {
                    return zza;
                } catch (SQLiteException e) {
                    return zza;
                }
            } catch (SQLiteException e2) {
                zze("Failed to update Analytics property", e2);
                try {
                    this.dC.endTransaction();
                } catch (SQLiteException e3) {
                    zze("Failed to end transaction", e3);
                }
                return -1L;
            }
        } finally {
            try {
                this.dC.endTransaction();
            } catch (SQLiteException e4) {
                zze("Failed to end transaction", e4);
            }
        }
    }

    public void zza(zzab zzabVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        com.google.android.gms.analytics.zzi.zzzx();
        zzacj();
        if (this.dL) {
            zzet("Hit delivery not possible. Missing network permissions. See http://goo.gl/8Rd3yj for instructions");
        } else {
            zza("Delivering hit", zzabVar);
        }
        zzab zzf = zzf(zzabVar);
        zzadl();
        if (this.dF.zzb(zzf)) {
            zzet("Hit sent to the device AnalyticsService for delivery");
            return;
        }
        zzacb();
        try {
            this.dC.zzc(zzf);
            zzadp();
        } catch (SQLiteException e) {
            zze("Delivery failed to save hit to a database", e);
            zzaca().zza(zzf, "deliver: failed to insert hit to database");
        }
    }

    public void zza(zzw zzwVar, long j) {
        com.google.android.gms.analytics.zzi.zzzx();
        zzacj();
        long j2 = -1;
        long zzagq = zzace().zzagq();
        if (zzagq != 0) {
            j2 = Math.abs(zzabz().currentTimeMillis() - zzagq);
        }
        zzb("Dispatching local hits. Elapsed time since last dispatch (ms)", Long.valueOf(j2));
        zzacb();
        zzadl();
        try {
            zzadn();
            zzace().zzagr();
            zzadp();
            if (zzwVar != null) {
                zzwVar.zzf(null);
            }
            if (this.dK == j) {
                return;
            }
            this.dE.zzagj();
        } catch (Throwable th) {
            zze("Local dispatch failed", th);
            zzace().zzagr();
            zzadp();
            if (zzwVar == null) {
                return;
            }
            zzwVar.zzf(th);
        }
    }

    public void zzabr() {
        com.google.android.gms.analytics.zzi.zzzx();
        zzacj();
        zzacb();
        zzes("Delete all hits from local store");
        try {
            this.dC.zzacz();
            this.dC.zzada();
            zzadp();
        } catch (SQLiteException e) {
            zzd("Failed to delete hits from store", e);
        }
        zzadl();
        if (this.dF.zzacv()) {
            zzes("Device service unavailable. Can't clear hits stored on the device service.");
        }
    }

    public void zzabu() {
        com.google.android.gms.analytics.zzi.zzzx();
        zzacj();
        zzes("Service disconnected");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzabw() {
        zzzx();
        this.dK = zzabz().currentTimeMillis();
    }

    public long zzadc() {
        com.google.android.gms.analytics.zzi.zzzx();
        zzacj();
        try {
            return this.dC.zzadc();
        } catch (SQLiteException e) {
            zze("Failed to get min/max hit times from local store", e);
            return 0L;
        }
    }

    protected void zzadi() {
        zzacj();
        zzacb();
        zzadh();
        zzace().zzago();
        if (!zzez("android.permission.ACCESS_NETWORK_STATE")) {
            zzew("Missing required android.permission.ACCESS_NETWORK_STATE. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions");
            zzadx();
        }
        if (!zzez("android.permission.INTERNET")) {
            zzew("Missing required android.permission.INTERNET. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions");
            zzadx();
        }
        if (zzak.zzau(getContext())) {
            zzes("AnalyticsService registered in the app manifest and enabled");
        } else {
            zzacb();
            zzev("AnalyticsService not registered in the app manifest. Hits might not be delivered reliably. See http://goo.gl/8Rd3yj for instructions.");
        }
        if (!this.dL) {
            zzacb();
            if (!this.dC.isEmpty()) {
                zzadl();
            }
        }
        zzadp();
    }

    protected void zzadl() {
        if (!this.dL && zzacb().zzaeg() && !this.dF.isConnected()) {
            if (!this.dJ.zzz(zzacb().zzafb())) {
                return;
            }
            this.dJ.start();
            zzes("Connecting to service");
            if (!this.dF.connect()) {
                return;
            }
            zzes("Connected to service");
            this.dJ.clear();
            onServiceConnected();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0066 A[LOOP:1: B:20:0x0066->B:19:0x005d, LOOP_START] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x004b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void zzadm() {
        /*
            r6 = this;
            com.google.android.gms.analytics.zzi.zzzx()
            r6.zzacj()
            r6.zzaby()
            com.google.android.gms.analytics.internal.zzr r0 = r6.zzacb()
            boolean r0 = r0.zzaeg()
            if (r0 != 0) goto L19
            java.lang.String r0 = "Service client disabled. Can't dispatch local hits to device AnalyticsService"
            r6.zzev(r0)
        L19:
            com.google.android.gms.analytics.internal.zzi r0 = r6.dF
            boolean r0 = r0.isConnected()
            if (r0 != 0) goto L28
            java.lang.String r0 = "Service not connected"
            r6.zzes(r0)
        L27:
            return
        L28:
            com.google.android.gms.analytics.internal.zzj r0 = r6.dC
            boolean r0 = r0.isEmpty()
            if (r0 != 0) goto L27
            java.lang.String r0 = "Dispatching local hits to device AnalyticsService"
            r6.zzes(r0)
        L36:
            com.google.android.gms.analytics.internal.zzj r0 = r6.dC     // Catch: android.database.sqlite.SQLiteException -> L4f
            com.google.android.gms.analytics.internal.zzr r1 = r6.zzacb()     // Catch: android.database.sqlite.SQLiteException -> L4f
            int r1 = r1.zzaep()     // Catch: android.database.sqlite.SQLiteException -> L4f
            long r2 = (long) r1     // Catch: android.database.sqlite.SQLiteException -> L4f
            java.util.List r1 = r0.zzt(r2)     // Catch: android.database.sqlite.SQLiteException -> L4f
            boolean r0 = r1.isEmpty()     // Catch: android.database.sqlite.SQLiteException -> L4f
            if (r0 == 0) goto L66
            r6.zzadp()     // Catch: android.database.sqlite.SQLiteException -> L4f
            goto L27
        L4f:
            r0 = move-exception
            java.lang.String r1 = "Failed to read hits from store"
            r6.zze(r1, r0)
            r6.zzadt()
            goto L27
        L5a:
            r1.remove(r0)
            com.google.android.gms.analytics.internal.zzj r2 = r6.dC     // Catch: android.database.sqlite.SQLiteException -> L7f
            long r4 = r0.zzafz()     // Catch: android.database.sqlite.SQLiteException -> L7f
            r2.zzu(r4)     // Catch: android.database.sqlite.SQLiteException -> L7f
        L66:
            boolean r0 = r1.isEmpty()
            if (r0 != 0) goto L36
            r0 = 0
            java.lang.Object r0 = r1.get(r0)
            com.google.android.gms.analytics.internal.zzab r0 = (com.google.android.gms.analytics.internal.zzab) r0
            com.google.android.gms.analytics.internal.zzi r2 = r6.dF
            boolean r2 = r2.zzb(r0)
            if (r2 != 0) goto L5a
            r6.zzadp()
            goto L27
        L7f:
            r0 = move-exception
            java.lang.String r1 = "Failed to remove hit that was send for delivery"
            r6.zze(r1, r0)
            r6.zzadt()
            goto L27
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzl.zzadm():void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0061, code lost:
        zzes("Store is empty, nothing to dispatch");
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x006a, code lost:
        r12.dC.setTransactionSuccessful();
        r12.dC.endTransaction();
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0075, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0076, code lost:
        zze("Failed to commit local dispatch transaction", r0);
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00fb, code lost:
        if (r12.dF.isConnected() == false) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00fd, code lost:
        zzacb();
        zzes("Service connected, sending hits to the service");
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x010a, code lost:
        if (r8.isEmpty() != false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x010c, code lost:
        r0 = r8.get(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0119, code lost:
        if (r12.dF.zzb(r0) != false) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x011b, code lost:
        r0 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0122, code lost:
        if (r12.dD.zzagk() == false) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0124, code lost:
        r8 = r12.dD.zzt(r8);
        r9 = r8.iterator();
        r4 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0133, code lost:
        if (r9.hasNext() == false) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0135, code lost:
        r4 = java.lang.Math.max(r4, r9.next().longValue());
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0144, code lost:
        r4 = java.lang.Math.max(r4, r0.zzafz());
        r8.remove(r0);
        zzb("Hit sent do device AnalyticsService for delivery", r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0155, code lost:
        r12.dC.zzu(r0.zzafz());
        r3.add(java.lang.Long.valueOf(r0.zzafz()));
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x016a, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x016b, code lost:
        zze("Failed to remove hit that was send for delivery", r0);
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0174, code lost:
        r12.dC.setTransactionSuccessful();
        r12.dC.endTransaction();
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0180, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0181, code lost:
        zze("Failed to commit local dispatch transaction", r0);
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x018c, code lost:
        r12.dC.zzr(r8);
        r3.addAll(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0194, code lost:
        r0 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0199, code lost:
        if (r3.isEmpty() == false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x019b, code lost:
        r12.dC.setTransactionSuccessful();
        r12.dC.endTransaction();
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01a7, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01a8, code lost:
        zze("Failed to commit local dispatch transaction", r0);
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x01b3, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x01b4, code lost:
        zze("Failed to remove successfully uploaded hits", r0);
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x01bd, code lost:
        r12.dC.setTransactionSuccessful();
        r12.dC.endTransaction();
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x01c9, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x01ca, code lost:
        zze("Failed to commit local dispatch transaction", r0);
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x01d5, code lost:
        r12.dC.setTransactionSuccessful();
        r12.dC.endTransaction();
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x01e2, code lost:
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01e3, code lost:
        zze("Failed to commit local dispatch transaction", r0);
        zzadt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x0206, code lost:
        r0 = r4;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected boolean zzadn() {
        /*
            Method dump skipped, instructions count: 521
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzl.zzadn():boolean");
    }

    public void zzado() {
        com.google.android.gms.analytics.zzi.zzzx();
        zzacj();
        zzet("Sync dispatching local hits");
        long j = this.dK;
        zzacb();
        zzadl();
        try {
            zzadn();
            zzace().zzagr();
            zzadp();
            if (this.dK == j) {
                return;
            }
            this.dE.zzagj();
        } catch (Throwable th) {
            zze("Sync local dispatch failed", th);
            zzadp();
        }
    }

    public void zzadp() {
        boolean z;
        zzabx().zzzx();
        zzacj();
        if (!zzadq()) {
            this.dE.unregister();
            zzadt();
        } else if (this.dC.isEmpty()) {
            this.dE.unregister();
            zzadt();
        } else {
            if (!zzy.eU.get().booleanValue()) {
                this.dE.zzagh();
                z = this.dE.isConnected();
            } else {
                z = true;
            }
            if (z) {
                zzads();
                return;
            }
            zzadt();
            zzadr();
        }
    }

    public long zzadw() {
        if (this.dG != Long.MIN_VALUE) {
            return this.dG;
        }
        return zzzh().zzafu() ? zzzh().zzahl() * 1000 : zzacb().zzaem();
    }

    public void zzadx() {
        zzacj();
        zzzx();
        this.dL = true;
        this.dF.disconnect();
        zzadp();
    }

    public void zzaw(boolean z) {
        zzadp();
    }

    public void zzb(zzw zzwVar) {
        zza(zzwVar, this.dK);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzc(zzh zzhVar) {
        zzzx();
        zzb("Sending first hit to property", zzhVar.zzacs());
        if (zzace().zzagp().zzz(zzacb().zzafi())) {
            return;
        }
        String zzags = zzace().zzags();
        if (TextUtils.isEmpty(zzags)) {
            return;
        }
        zzmt zza = zzao.zza(zzaca(), zzags);
        zzb("Found relevant installation campaign", zza);
        zza(zzhVar, zza);
    }

    zzab zzf(zzab zzabVar) {
        Pair<String, Long> zzagw;
        if (TextUtils.isEmpty(zzabVar.zzage()) && (zzagw = zzace().zzagt().zzagw()) != null) {
            String str = (String) zzagw.first;
            String valueOf = String.valueOf((Long) zzagw.second);
            String sb = new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(str).length()).append(valueOf).append(":").append(str).toString();
            HashMap hashMap = new HashMap(zzabVar.zzmc());
            hashMap.put("_m", sb);
            return zzab.zza(this, zzabVar, hashMap);
        }
        return zzabVar;
    }

    public void zzfa(String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzzx();
        zzaby();
        zzmt zza = zzao.zza(zzaca(), str);
        if (zza == null) {
            zzd("Parsing failed. Ignoring invalid campaign data", str);
            return;
        }
        String zzags = zzace().zzags();
        if (str.equals(zzags)) {
            zzev("Ignoring duplicate install campaign");
        } else if (!TextUtils.isEmpty(zzags)) {
            zzd("Ignoring multiple install campaigns. original, new", zzags, str);
        } else {
            zzace().zzff(str);
            if (zzace().zzagp().zzz(zzacb().zzafi())) {
                zzd("Campaign received too late, ignoring", zza);
                return;
            }
            zzb("Received installation campaign", zza);
            for (zzh zzhVar : this.dC.zzv(0L)) {
                zza(zzhVar, zza);
            }
        }
    }

    public void zzw(long j) {
        com.google.android.gms.analytics.zzi.zzzx();
        zzacj();
        if (j < 0) {
            j = 0;
        }
        this.dG = j;
        zzadp();
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
        this.dC.initialize();
        this.dD.initialize();
        this.dF.initialize();
    }
}
