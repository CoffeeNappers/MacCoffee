package com.google.android.gms.measurement.internal;

import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import android.util.Pair;
import com.google.android.c2dm.C2DMessaging;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Locale;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzt extends zzaa {
    static final Pair<String, Long> asX = new Pair<>("", 0L);
    public final zzc asY;
    public final zzb asZ;
    public final zzb ata;
    public final zzb atb;
    public final zzb atc;
    public final zzb atd;
    private String ate;
    private boolean atf;
    private long atg;
    private SecureRandom ath;
    public final zzb ati;
    public final zzb atj;
    public final zza atk;
    public final zzb atl;
    public final zzb atm;
    public boolean atn;
    private SharedPreferences fF;

    /* loaded from: classes2.dex */
    public final class zza {
        private final boolean ato;
        private boolean atp;
        private boolean xv;
        private final String zzbcn;

        public zza(String str, boolean z) {
            com.google.android.gms.common.internal.zzaa.zzib(str);
            this.zzbcn = str;
            this.ato = z;
        }

        @WorkerThread
        private void zzbxo() {
            if (this.atp) {
                return;
            }
            this.atp = true;
            this.xv = zzt.this.fF.getBoolean(this.zzbcn, this.ato);
        }

        @WorkerThread
        public boolean get() {
            zzbxo();
            return this.xv;
        }

        @WorkerThread
        public void set(boolean z) {
            SharedPreferences.Editor edit = zzt.this.fF.edit();
            edit.putBoolean(this.zzbcn, z);
            edit.apply();
            this.xv = z;
        }
    }

    /* loaded from: classes2.dex */
    public final class zzb {
        private boolean atp;
        private final long atr;
        private long cf;
        private final String zzbcn;

        public zzb(String str, long j) {
            com.google.android.gms.common.internal.zzaa.zzib(str);
            this.zzbcn = str;
            this.atr = j;
        }

        @WorkerThread
        private void zzbxo() {
            if (this.atp) {
                return;
            }
            this.atp = true;
            this.cf = zzt.this.fF.getLong(this.zzbcn, this.atr);
        }

        @WorkerThread
        public long get() {
            zzbxo();
            return this.cf;
        }

        @WorkerThread
        public void set(long j) {
            SharedPreferences.Editor edit = zzt.this.fF.edit();
            edit.putLong(this.zzbcn, j);
            edit.apply();
            this.cf = j;
        }
    }

    /* loaded from: classes2.dex */
    public final class zzc {
        final String ats;
        private final String att;
        private final String atu;
        private final long fJ;

        private zzc(String str, long j) {
            com.google.android.gms.common.internal.zzaa.zzib(str);
            com.google.android.gms.common.internal.zzaa.zzbt(j > 0);
            this.ats = String.valueOf(str).concat(":start");
            this.att = String.valueOf(str).concat(":count");
            this.atu = String.valueOf(str).concat(":value");
            this.fJ = j;
        }

        @WorkerThread
        private void zzagu() {
            zzt.this.zzzx();
            long currentTimeMillis = zzt.this.zzabz().currentTimeMillis();
            SharedPreferences.Editor edit = zzt.this.fF.edit();
            edit.remove(this.att);
            edit.remove(this.atu);
            edit.putLong(this.ats, currentTimeMillis);
            edit.apply();
        }

        @WorkerThread
        private long zzagv() {
            zzt.this.zzzx();
            long zzagx = zzagx();
            if (zzagx == 0) {
                zzagu();
                return 0L;
            }
            return Math.abs(zzagx - zzt.this.zzabz().currentTimeMillis());
        }

        @WorkerThread
        private long zzagx() {
            return zzt.this.zzbxj().getLong(this.ats, 0L);
        }

        @WorkerThread
        public Pair<String, Long> zzagw() {
            zzt.this.zzzx();
            long zzagv = zzagv();
            if (zzagv < this.fJ) {
                return null;
            }
            if (zzagv > this.fJ * 2) {
                zzagu();
                return null;
            }
            String string = zzt.this.zzbxj().getString(this.atu, null);
            long j = zzt.this.zzbxj().getLong(this.att, 0L);
            zzagu();
            return (string == null || j <= 0) ? zzt.asX : new Pair<>(string, Long.valueOf(j));
        }

        @WorkerThread
        public void zzfg(String str) {
            zzg(str, 1L);
        }

        @WorkerThread
        public void zzg(String str, long j) {
            zzt.this.zzzx();
            if (zzagx() == 0) {
                zzagu();
            }
            if (str == null) {
                str = "";
            }
            long j2 = zzt.this.fF.getLong(this.att, 0L);
            if (j2 <= 0) {
                SharedPreferences.Editor edit = zzt.this.fF.edit();
                edit.putString(this.atu, str);
                edit.putLong(this.att, j);
                edit.apply();
                return;
            }
            boolean z = (zzt.this.zzbxg().nextLong() & Long.MAX_VALUE) < (Long.MAX_VALUE / (j2 + j)) * j;
            SharedPreferences.Editor edit2 = zzt.this.fF.edit();
            if (z) {
                edit2.putString(this.atu, str);
            }
            edit2.putLong(this.att, j2 + j);
            edit2.apply();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzt(zzx zzxVar) {
        super(zzxVar);
        this.asY = new zzc("health_monitor", zzbwd().zzafj());
        this.asZ = new zzb("last_upload", 0L);
        this.ata = new zzb("last_upload_attempt", 0L);
        this.atb = new zzb(C2DMessaging.BACKOFF, 0L);
        this.atc = new zzb("last_delete_stale", 0L);
        this.ati = new zzb("time_before_start", 10000L);
        this.atj = new zzb("session_timeout", 1800000L);
        this.atk = new zza("start_new_session", true);
        this.atl = new zzb("last_pause_time", 0L);
        this.atm = new zzb("time_active", 0L);
        this.atd = new zzb("midnight_offset", 0L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public SecureRandom zzbxg() {
        zzzx();
        if (this.ath == null) {
            this.ath = new SecureRandom();
        }
        return this.ath;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @WorkerThread
    public SharedPreferences zzbxj() {
        zzzx();
        zzacj();
        return this.fF;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void setMeasurementEnabled(boolean z) {
        zzzx();
        zzbwb().zzbxe().zzj("Setting measurementEnabled", Boolean.valueOf(z));
        SharedPreferences.Editor edit = zzbxj().edit();
        edit.putBoolean("measurement_enabled", z);
        edit.apply();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public String zzbtj() {
        zzzx();
        try {
            return com.google.firebase.iid.zzc.C().getId();
        } catch (IllegalStateException e) {
            zzbwb().zzbxa().log("Failed to retrieve Firebase Instance Id");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public String zzbxh() {
        byte[] bArr = new byte[16];
        zzbxg().nextBytes(bArr);
        return String.format(Locale.US, "%032x", new BigInteger(1, bArr));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public long zzbxi() {
        zzacj();
        zzzx();
        long j = this.atd.get();
        if (j == 0) {
            long nextInt = zzbxg().nextInt(86400000) + 1;
            this.atd.set(nextInt);
            return nextInt;
        }
        return j;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public String zzbxk() {
        zzzx();
        return zzbxj().getString("gmp_app_id", null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public Boolean zzbxl() {
        zzzx();
        if (!zzbxj().contains("use_service")) {
            return null;
        }
        return Boolean.valueOf(zzbxj().getBoolean("use_service", false));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzbxm() {
        boolean z = true;
        zzzx();
        zzbwb().zzbxe().log("Clearing collection preferences.");
        boolean contains = zzbxj().contains("measurement_enabled");
        if (contains) {
            z = zzch(true);
        }
        SharedPreferences.Editor edit = zzbxj().edit();
        edit.clear();
        edit.apply();
        if (contains) {
            setMeasurementEnabled(z);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @WorkerThread
    public String zzbxn() {
        zzzx();
        String string = zzbxj().getString("previous_os_version", null);
        String zzbws = zzbvs().zzbws();
        if (!TextUtils.isEmpty(zzbws) && !zzbws.equals(string)) {
            SharedPreferences.Editor edit = zzbxj().edit();
            edit.putString("previous_os_version", zzbws);
            edit.apply();
        }
        return string;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzcg(boolean z) {
        zzzx();
        zzbwb().zzbxe().zzj("Setting useService", Boolean.valueOf(z));
        SharedPreferences.Editor edit = zzbxj().edit();
        edit.putBoolean("use_service", z);
        edit.apply();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public boolean zzch(boolean z) {
        zzzx();
        return zzbxj().getBoolean("measurement_enabled", z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    @NonNull
    public Pair<String, Boolean> zzmk(String str) {
        zzzx();
        long elapsedRealtime = zzabz().elapsedRealtime();
        if (this.ate == null || elapsedRealtime >= this.atg) {
            this.atg = elapsedRealtime + zzbwd().zzlr(str);
            AdvertisingIdClient.setShouldSkipGmsCoreVersionCheck(true);
            try {
                AdvertisingIdClient.Info advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(getContext());
                this.ate = advertisingIdInfo.getId();
                if (this.ate == null) {
                    this.ate = "";
                }
                this.atf = advertisingIdInfo.isLimitAdTrackingEnabled();
            } catch (Throwable th) {
                zzbwb().zzbxd().zzj("Unable to get advertising id", th);
                this.ate = "";
            }
            AdvertisingIdClient.setShouldSkipGmsCoreVersionCheck(false);
            return new Pair<>(this.ate, Boolean.valueOf(this.atf));
        }
        return new Pair<>(this.ate, Boolean.valueOf(this.atf));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public String zzml(String str) {
        zzzx();
        String str2 = (String) zzmk(str).first;
        MessageDigest zzfl = zzal.zzfl(CommonUtils.MD5_INSTANCE);
        if (zzfl == null) {
            return null;
        }
        return String.format(Locale.US, "%032X", new BigInteger(1, zzfl.digest(str2.getBytes())));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzmm(String str) {
        zzzx();
        SharedPreferences.Editor edit = zzbxj().edit();
        edit.putString("gmp_app_id", str);
        edit.apply();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
        this.fF = getContext().getSharedPreferences("com.google.android.gms.measurement.prefs", 0);
        this.atn = this.fF.getBoolean("has_been_opened", false);
        if (!this.atn) {
            SharedPreferences.Editor edit = this.fF.edit();
            edit.putBoolean("has_been_opened", true);
            edit.apply();
        }
    }
}
