package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import android.support.annotation.NonNull;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.zzaf;
import com.google.android.gms.internal.zzax;
import dalvik.system.DexClassLoader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes2.dex */
public class zzbc {
    private static final String TAG = zzbc.class.getSimpleName();
    protected static final Object zzaid = new Object();
    protected static final Object zzaih = new Object();
    private static com.google.android.gms.common.zzc zzaij = null;
    protected Context zzahs;
    protected Context zzaht;
    private ExecutorService zzahu;
    private DexClassLoader zzahv;
    private zzax zzahw;
    private byte[] zzahx;
    private zzap zzaie;
    private volatile AdvertisingIdClient zzahy = null;
    private volatile boolean zzagy = false;
    private Future zzahz = null;
    private volatile zzaf.zza zzaia = null;
    private Future zzaib = null;
    private volatile boolean zzaic = false;
    private GoogleApiClient zzaif = null;
    protected boolean zzaig = false;
    protected boolean zzaii = false;
    protected boolean zzaik = false;
    private Map<Pair<String, String>, zzbx> zzail = new HashMap();

    private zzbc(Context context) {
        this.zzahs = context;
        this.zzaht = context.getApplicationContext();
    }

    public static zzbc zza(Context context, String str, String str2, boolean z) {
        zzbc zzbcVar = new zzbc(context);
        if (zzbcVar.zzc(str, str2, z)) {
            return zzbcVar;
        }
        return null;
    }

    @NonNull
    private File zza(String str, File file, String str2) throws zzax.zza, IOException {
        File file2 = new File(String.format("%s/%s.jar", file, str2));
        if (!file2.exists()) {
            byte[] zzc = this.zzahw.zzc(this.zzahx, str);
            file2.createNewFile();
            FileOutputStream fileOutputStream = new FileOutputStream(file2);
            fileOutputStream.write(zzc, 0, zzc.length);
            fileOutputStream.close();
        }
        return file2;
    }

    private void zza(File file) {
        if (!file.exists()) {
            Log.d(TAG, String.format("File %s not found. No need for deletion", file.getAbsolutePath()));
        } else {
            file.delete();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:76:0x00a9 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00a4 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void zza(java.io.File r12, java.lang.String r13) {
        /*
            Method dump skipped, instructions count: 241
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzbc.zza(java.io.File, java.lang.String):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:91:0x00d2 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:93:0x00cd A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v16 */
    /* JADX WARN: Type inference failed for: r1v21, types: [java.io.IOException] */
    /* JADX WARN: Type inference failed for: r1v22 */
    /* JADX WARN: Type inference failed for: r1v23, types: [java.io.IOException] */
    /* JADX WARN: Type inference failed for: r1v24 */
    /* JADX WARN: Type inference failed for: r1v25 */
    /* JADX WARN: Type inference failed for: r1v28 */
    /* JADX WARN: Type inference failed for: r1v32 */
    /* JADX WARN: Type inference failed for: r1v33 */
    /* JADX WARN: Type inference failed for: r1v34 */
    /* JADX WARN: Type inference failed for: r1v35 */
    /* JADX WARN: Type inference failed for: r1v36 */
    /* JADX WARN: Type inference failed for: r1v5, types: [java.io.FileOutputStream] */
    /* JADX WARN: Type inference failed for: r1v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean zzb(java.io.File r11, java.lang.String r12) {
        /*
            Method dump skipped, instructions count: 279
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzbc.zzb(java.io.File, java.lang.String):boolean");
    }

    private void zzc(boolean z) {
        this.zzagy = z;
        if (!z) {
            return;
        }
        this.zzahz = this.zzahu.submit(new Runnable() { // from class: com.google.android.gms.internal.zzbc.1
            @Override // java.lang.Runnable
            public void run() {
                zzbc.this.zzcx();
            }
        });
    }

    private boolean zzc(String str, String str2, boolean z) throws zzaz {
        this.zzahu = Executors.newCachedThreadPool();
        zzc(z);
        zzdb();
        zzcy();
        if (!zzbe.zzdg() || !zzdr.zzbih.get().booleanValue()) {
            zzo(str);
            zzp(str2);
            this.zzaie = new zzap(this);
            return true;
        }
        throw new IllegalStateException("Task Context initialization must not be called from the UI thread.");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcx() {
        try {
            if (this.zzahy != null || this.zzaht == null) {
                return;
            }
            AdvertisingIdClient advertisingIdClient = new AdvertisingIdClient(this.zzaht);
            advertisingIdClient.start();
            this.zzahy = advertisingIdClient;
        } catch (GooglePlayServicesNotAvailableException | GooglePlayServicesRepairableException | IOException e) {
            this.zzahy = null;
        }
    }

    private void zzcy() {
        if (!zzdr.zzbij.get().booleanValue()) {
            return;
        }
        zzcz();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzda() {
        if (this.zzaii) {
            try {
                this.zzaia = com.google.android.gms.gass.internal.zza.zzi(this.zzahs, this.zzahs.getPackageName(), Integer.toString(this.zzahs.getPackageManager().getPackageInfo(this.zzahs.getPackageName(), 0).versionCode));
            } catch (PackageManager.NameNotFoundException e) {
            }
        }
    }

    private void zzdb() {
        boolean z = true;
        this.zzahu.execute(new Runnable() { // from class: com.google.android.gms.internal.zzbc.3
            @Override // java.lang.Runnable
            public void run() {
                zzdr.initialize(zzbc.this.zzahs);
            }
        });
        zzaij = com.google.android.gms.common.zzc.zzaql();
        this.zzaig = zzaij.zzbk(this.zzahs) > 0;
        if (zzaij.isGooglePlayServicesAvailable(this.zzahs) != 0) {
            z = false;
        }
        this.zzaii = z;
        if (this.zzahs.getApplicationContext() != null) {
            this.zzaif = new GoogleApiClient.Builder(this.zzahs).addApi(com.google.android.gms.clearcut.zza.API).build();
        }
    }

    private void zzo(String str) throws zzaz {
        this.zzahw = new zzax(null);
        try {
            this.zzahx = this.zzahw.zzn(str);
        } catch (zzax.zza e) {
            throw new zzaz(e);
        }
    }

    private boolean zzp(String str) throws zzaz {
        try {
            File cacheDir = this.zzahs.getCacheDir();
            if (cacheDir == null && (cacheDir = this.zzahs.getDir("dex", 0)) == null) {
                throw new zzaz();
            }
            File file = cacheDir;
            String zzba = zzay.zzba();
            File zza = zza(str, file, zzba);
            zzb(file, zzba);
            try {
                this.zzahv = new DexClassLoader(zza.getAbsolutePath(), file.getAbsolutePath(), null, this.zzahs.getClassLoader());
                zza(zza);
                zza(file, zzba);
                zzq(String.format("%s/%s.dex", file, zzba));
                return true;
            } catch (Throwable th) {
                zza(zza);
                zza(file, zzba);
                zzq(String.format("%s/%s.dex", file, zzba));
                throw th;
            }
        } catch (zzax.zza e) {
            throw new zzaz(e);
        } catch (FileNotFoundException e2) {
            throw new zzaz(e2);
        } catch (IOException e3) {
            throw new zzaz(e3);
        } catch (NullPointerException e4) {
            throw new zzaz(e4);
        }
    }

    private void zzq(String str) {
        zza(new File(str));
    }

    public Context getApplicationContext() {
        return this.zzaht;
    }

    public Context getContext() {
        return this.zzahs;
    }

    public boolean zza(String str, String str2, List<Class> list) {
        if (!this.zzail.containsKey(new Pair(str, str2))) {
            this.zzail.put(new Pair<>(str, str2), new zzbx(this, str, str2, list));
            return true;
        }
        return false;
    }

    public int zzaw() {
        zzap zzct = zzct();
        if (zzct != null) {
            return zzct.zzaw();
        }
        return Integer.MIN_VALUE;
    }

    public Method zzc(String str, String str2) {
        zzbx zzbxVar = this.zzail.get(new Pair(str, str2));
        if (zzbxVar == null) {
            return null;
        }
        return zzbxVar.zzdq();
    }

    public ExecutorService zzcm() {
        return this.zzahu;
    }

    public DexClassLoader zzcn() {
        return this.zzahv;
    }

    public zzax zzco() {
        return this.zzahw;
    }

    public byte[] zzcp() {
        return this.zzahx;
    }

    public GoogleApiClient zzcq() {
        return this.zzaif;
    }

    public boolean zzcr() {
        return this.zzaig;
    }

    public boolean zzcs() {
        return this.zzaik;
    }

    public zzap zzct() {
        return this.zzaie;
    }

    public boolean zzcu() {
        return this.zzaii;
    }

    public zzaf.zza zzcv() {
        return this.zzaia;
    }

    public Future zzcw() {
        return this.zzaib;
    }

    public void zzcz() {
        synchronized (zzaid) {
            if (!this.zzaic) {
                this.zzaib = this.zzahu.submit(new Runnable() { // from class: com.google.android.gms.internal.zzbc.2
                    @Override // java.lang.Runnable
                    public void run() {
                        zzbc.this.zzda();
                        synchronized (zzbc.zzaid) {
                            zzbc.this.zzaic = false;
                        }
                    }
                });
                this.zzaic = true;
            }
        }
    }

    public AdvertisingIdClient zzdc() {
        if (!this.zzagy) {
            return null;
        }
        if (this.zzahy != null) {
            return this.zzahy;
        }
        if (this.zzahz != null) {
            try {
                this.zzahz.get(2000L, TimeUnit.MILLISECONDS);
                this.zzahz = null;
            } catch (InterruptedException e) {
            } catch (ExecutionException e2) {
            } catch (TimeoutException e3) {
                this.zzahz.cancel(true);
            }
        }
        return this.zzahy;
    }

    public void zzdd() {
        synchronized (zzaih) {
            if (this.zzaik) {
                return;
            }
            if (!this.zzaii || this.zzaif == null) {
                this.zzaik = false;
            } else {
                this.zzaif.connect();
                this.zzaik = true;
            }
        }
    }

    public void zzde() {
        synchronized (zzaih) {
            if (this.zzaik && this.zzaif != null) {
                this.zzaif.disconnect();
                this.zzaik = false;
            }
        }
    }
}
