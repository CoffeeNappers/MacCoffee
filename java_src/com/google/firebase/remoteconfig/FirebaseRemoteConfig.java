package com.google.firebase.remoteconfig;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.XmlResourceParser;
import android.os.AsyncTask;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.config.internal.zzd;
import com.google.android.gms.internal.zzanv;
import com.google.android.gms.internal.zzanw;
import com.google.android.gms.internal.zzanx;
import com.google.android.gms.internal.zzany;
import com.google.android.gms.internal.zzanz;
import com.google.android.gms.internal.zzaoa;
import com.google.android.gms.internal.zzaob;
import com.google.android.gms.internal.zztb;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import com.google.firebase.FirebaseApp;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigSettings;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.Executor;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
/* loaded from: classes2.dex */
public class FirebaseRemoteConfig {
    public static final boolean DEFAULT_VALUE_FOR_BOOLEAN = false;
    public static final byte[] DEFAULT_VALUE_FOR_BYTE_ARRAY = new byte[0];
    public static final double DEFAULT_VALUE_FOR_DOUBLE = 0.0d;
    public static final long DEFAULT_VALUE_FOR_LONG = 0;
    public static final String DEFAULT_VALUE_FOR_STRING = "";
    public static final int LAST_FETCH_STATUS_FAILURE = 1;
    public static final int LAST_FETCH_STATUS_NO_FETCH_YET = 0;
    public static final int LAST_FETCH_STATUS_SUCCESS = -1;
    public static final int LAST_FETCH_STATUS_THROTTLED = 2;
    public static final int VALUE_SOURCE_DEFAULT = 1;
    public static final int VALUE_SOURCE_REMOTE = 2;
    public static final int VALUE_SOURCE_STATIC = 0;
    private static FirebaseRemoteConfig blh;
    private zzanx bli;
    private zzanx blj;
    private zzanx blk;
    private zzaoa bll;
    private final ReadWriteLock blm;
    private final Context mContext;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza implements Executor {
        zza() {
        }

        @Override // java.util.concurrent.Executor
        public void execute(Runnable runnable) {
            new Thread(runnable).start();
        }
    }

    FirebaseRemoteConfig(Context context) {
        this(context, null, null, null, null);
    }

    private FirebaseRemoteConfig(Context context, zzanx zzanxVar, zzanx zzanxVar2, zzanx zzanxVar3, zzaoa zzaoaVar) {
        this.blm = new ReentrantReadWriteLock(true);
        this.mContext = context;
        if (zzaoaVar != null) {
            this.bll = zzaoaVar;
        } else {
            this.bll = new zzaoa();
        }
        this.bll.zzcq(zzex(this.mContext));
        if (zzanxVar != null) {
            this.bli = zzanxVar;
        }
        if (zzanxVar2 != null) {
            this.blj = zzanxVar2;
        }
        if (zzanxVar3 != null) {
            this.blk = zzanxVar3;
        }
    }

    private void S() {
        this.blm.readLock().lock();
        try {
            zzanw zzanwVar = new zzanw(this.mContext, this.bli, this.blj, this.blk, this.bll);
            if (Build.VERSION.SDK_INT >= 11) {
                AsyncTask.SERIAL_EXECUTOR.execute(zzanwVar);
            } else {
                new zza().execute(zzanwVar);
            }
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public static FirebaseRemoteConfig getInstance() {
        if (blh == null) {
            FirebaseApp firebaseApp = FirebaseApp.getInstance();
            if (firebaseApp != null) {
                return zzew(firebaseApp.getApplicationContext());
            }
            throw new IllegalStateException("FirebaseApp has not been initialized.");
        }
        return blh;
    }

    private static zzanx zza(zzaob.zza zzaVar) {
        zzaob.zzd[] zzdVarArr;
        if (zzaVar == null) {
            return null;
        }
        HashMap hashMap = new HashMap();
        for (zzaob.zzd zzdVar : zzaVar.blC) {
            String str = zzdVar.EY;
            HashMap hashMap2 = new HashMap();
            zzaob.zzb[] zzbVarArr = zzdVar.blI;
            for (zzaob.zzb zzbVar : zzbVarArr) {
                hashMap2.put(zzbVar.zzcb, zzbVar.blE);
            }
            hashMap.put(str, hashMap2);
        }
        return new zzanx(hashMap, zzaVar.timestamp);
    }

    private static zzaoa zza(zzaob.zzc zzcVar) {
        if (zzcVar == null) {
            return null;
        }
        zzaoa zzaoaVar = new zzaoa();
        zzaoaVar.zzagf(zzcVar.blF);
        zzaoaVar.zzdd(zzcVar.blG);
        return zzaoaVar;
    }

    private static Map<String, zzanv> zza(zzaob.zzf[] zzfVarArr) {
        HashMap hashMap = new HashMap();
        if (zzfVarArr != null) {
            for (zzaob.zzf zzfVar : zzfVarArr) {
                hashMap.put(zzfVar.EY, new zzanv(zzfVar.resourceId, zzfVar.blP));
            }
        }
        return hashMap;
    }

    private static long zzb(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[4096];
        long j = 0;
        while (true) {
            int read = inputStream.read(bArr);
            if (read == -1) {
                return j;
            }
            outputStream.write(bArr, 0, read);
            j += read;
        }
    }

    private void zzc(Map<String, Object> map, String str, boolean z) {
        if (str == null) {
            return;
        }
        boolean z2 = map == null || map.isEmpty();
        HashMap hashMap = new HashMap();
        if (!z2) {
            for (String str2 : map.keySet()) {
                Object obj = map.get(str2);
                if (obj instanceof String) {
                    hashMap.put(str2, ((String) obj).getBytes(zzanz.UTF_8));
                } else if (obj instanceof Long) {
                    hashMap.put(str2, ((Long) obj).toString().getBytes(zzanz.UTF_8));
                } else if (obj instanceof Integer) {
                    hashMap.put(str2, ((Integer) obj).toString().getBytes(zzanz.UTF_8));
                } else if (obj instanceof Double) {
                    hashMap.put(str2, ((Double) obj).toString().getBytes(zzanz.UTF_8));
                } else if (obj instanceof Float) {
                    hashMap.put(str2, ((Float) obj).toString().getBytes(zzanz.UTF_8));
                } else if (obj instanceof byte[]) {
                    hashMap.put(str2, (byte[]) obj);
                } else if (!(obj instanceof Boolean)) {
                    throw new IllegalArgumentException("The type of a default value needs to beone of String, Long, Double, Boolean, or byte[].");
                } else {
                    hashMap.put(str2, ((Boolean) obj).toString().getBytes(zzanz.UTF_8));
                }
            }
        }
        this.blm.writeLock().lock();
        try {
            if (!z2) {
                if (this.blk == null) {
                    this.blk = new zzanx(new HashMap(), System.currentTimeMillis());
                }
                this.blk.zzk(hashMap, str);
                this.blk.setTimestamp(System.currentTimeMillis());
            } else if (this.blk == null || !this.blk.zzuc(str)) {
                return;
            } else {
                this.blk.zzk(null, str);
                this.blk.setTimestamp(System.currentTimeMillis());
            }
            if (z) {
                this.bll.zzud(str);
            }
            S();
        } finally {
            this.blm.writeLock().unlock();
        }
    }

    public static FirebaseRemoteConfig zzew(Context context) {
        if (blh == null) {
            zzaob.zze zzey = zzey(context);
            if (zzey == null) {
                if (Log.isLoggable("FirebaseRemoteConfig", 3)) {
                    Log.d("FirebaseRemoteConfig", "No persisted config was found. Initializing from scratch.");
                }
                blh = new FirebaseRemoteConfig(context);
            } else {
                if (Log.isLoggable("FirebaseRemoteConfig", 3)) {
                    Log.d("FirebaseRemoteConfig", "Initializing from persisted config.");
                }
                zzanx zza2 = zza(zzey.blJ);
                zzanx zza3 = zza(zzey.blK);
                zzanx zza4 = zza(zzey.blL);
                zzaoa zza5 = zza(zzey.blM);
                if (zza5 != null) {
                    zza5.zzch(zza(zzey.blN));
                }
                blh = new FirebaseRemoteConfig(context, zza2, zza3, zza4, zza5);
            }
        }
        return blh;
    }

    private long zzex(Context context) {
        try {
            return this.mContext.getPackageManager().getPackageInfo(context.getPackageName(), 0).lastUpdateTime;
        } catch (PackageManager.NameNotFoundException e) {
            String valueOf = String.valueOf(context.getPackageName());
            Log.e("FirebaseRemoteConfig", new StringBuilder(String.valueOf(valueOf).length() + 25).append("Package [").append(valueOf).append("] was not found!").toString());
            return 0L;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0079 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static com.google.android.gms.internal.zzaob.zze zzey(android.content.Context r5) {
        /*
            r1 = 0
            if (r5 != 0) goto L5
            r0 = r1
        L4:
            return r0
        L5:
            java.lang.String r0 = "persisted_config"
            java.io.FileInputStream r3 = r5.openFileInput(r0)     // Catch: java.io.FileNotFoundException -> L31 java.io.IOException -> L58 java.lang.Throwable -> L75
            byte[] r0 = zzl(r3)     // Catch: java.lang.Throwable -> L88 java.io.IOException -> L8d java.io.FileNotFoundException -> L8f
            com.google.android.gms.internal.zzars r0 = com.google.android.gms.internal.zzars.zzbd(r0)     // Catch: java.lang.Throwable -> L88 java.io.IOException -> L8d java.io.FileNotFoundException -> L8f
            com.google.android.gms.internal.zzaob$zze r2 = new com.google.android.gms.internal.zzaob$zze     // Catch: java.lang.Throwable -> L88 java.io.IOException -> L8d java.io.FileNotFoundException -> L8f
            r2.<init>()     // Catch: java.lang.Throwable -> L88 java.io.IOException -> L8d java.io.FileNotFoundException -> L8f
            com.google.android.gms.internal.zzasa r0 = r2.zzb(r0)     // Catch: java.lang.Throwable -> L88 java.io.IOException -> L8d java.io.FileNotFoundException -> L8f
            com.google.android.gms.internal.zzaob$zze r0 = (com.google.android.gms.internal.zzaob.zze) r0     // Catch: java.lang.Throwable -> L88 java.io.IOException -> L8d java.io.FileNotFoundException -> L8f
            if (r3 == 0) goto L24
            r3.close()     // Catch: java.io.IOException -> L26
        L24:
            r0 = r2
            goto L4
        L26:
            r0 = move-exception
            java.lang.String r1 = "FirebaseRemoteConfig"
            java.lang.String r3 = "Failed to close persisted config file."
            android.util.Log.e(r1, r3, r0)
            goto L24
        L31:
            r0 = move-exception
            r2 = r1
        L33:
            java.lang.String r3 = "FirebaseRemoteConfig"
            r4 = 3
            boolean r3 = android.util.Log.isLoggable(r3, r4)     // Catch: java.lang.Throwable -> L8a
            if (r3 == 0) goto L46
            java.lang.String r3 = "FirebaseRemoteConfig"
            java.lang.String r4 = "Persisted config file was not found."
            android.util.Log.d(r3, r4, r0)     // Catch: java.lang.Throwable -> L8a
        L46:
            if (r2 == 0) goto L4b
            r2.close()     // Catch: java.io.IOException -> L4d
        L4b:
            r0 = r1
            goto L4
        L4d:
            r0 = move-exception
            java.lang.String r2 = "FirebaseRemoteConfig"
            java.lang.String r3 = "Failed to close persisted config file."
            android.util.Log.e(r2, r3, r0)
            goto L4b
        L58:
            r0 = move-exception
            r3 = r1
        L5a:
            java.lang.String r2 = "FirebaseRemoteConfig"
            java.lang.String r4 = "Cannot initialize from persisted config."
            android.util.Log.e(r2, r4, r0)     // Catch: java.lang.Throwable -> L88
            if (r3 == 0) goto L68
            r3.close()     // Catch: java.io.IOException -> L6a
        L68:
            r0 = r1
            goto L4
        L6a:
            r0 = move-exception
            java.lang.String r2 = "FirebaseRemoteConfig"
            java.lang.String r3 = "Failed to close persisted config file."
            android.util.Log.e(r2, r3, r0)
            goto L68
        L75:
            r0 = move-exception
            r3 = r1
        L77:
            if (r3 == 0) goto L7c
            r3.close()     // Catch: java.io.IOException -> L7d
        L7c:
            throw r0
        L7d:
            r1 = move-exception
            java.lang.String r2 = "FirebaseRemoteConfig"
            java.lang.String r3 = "Failed to close persisted config file."
            android.util.Log.e(r2, r3, r1)
            goto L7c
        L88:
            r0 = move-exception
            goto L77
        L8a:
            r0 = move-exception
            r3 = r2
            goto L77
        L8d:
            r0 = move-exception
            goto L5a
        L8f:
            r0 = move-exception
            r2 = r3
            goto L33
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.firebase.remoteconfig.FirebaseRemoteConfig.zzey(android.content.Context):com.google.android.gms.internal.zzaob$zze");
    }

    private static byte[] zzl(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        zzb(inputStream, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }

    public boolean activateFetched() {
        this.blm.writeLock().lock();
        try {
            if (this.bli == null) {
                return false;
            }
            if (this.blj != null && this.blj.getTimestamp() >= this.bli.getTimestamp()) {
                return false;
            }
            long timestamp = this.bli.getTimestamp();
            this.blj = this.bli;
            this.blj.setTimestamp(System.currentTimeMillis());
            this.bli = new zzanx(null, timestamp);
            S();
            this.blm.writeLock().unlock();
            return true;
        } finally {
            this.blm.writeLock().unlock();
        }
    }

    public Task<Void> fetch() {
        return fetch(43200L);
    }

    public Task<Void> fetch(long j) {
        final TaskCompletionSource taskCompletionSource = new TaskCompletionSource();
        this.blm.readLock().lock();
        try {
            zztb.zza.C0133zza c0133zza = new zztb.zza.C0133zza();
            c0133zza.zzaj(j);
            if (this.bll.isDeveloperModeEnabled()) {
                c0133zza.zzag("_rcn_developer", "true");
            }
            c0133zza.zzhj(10200);
            new zzd(this.mContext).zza(c0133zza.zzazi()).setResultCallback(new ResultCallback<zztb.zzb>() { // from class: com.google.firebase.remoteconfig.FirebaseRemoteConfig.1
                @Override // com.google.android.gms.common.api.ResultCallback
                /* renamed from: zza */
                public void onResult(@NonNull zztb.zzb zzbVar) {
                    FirebaseRemoteConfig.this.zza(taskCompletionSource, zzbVar);
                }
            });
            this.blm.readLock().unlock();
            return taskCompletionSource.getTask();
        } catch (Throwable th) {
            this.blm.readLock().unlock();
            throw th;
        }
    }

    public boolean getBoolean(String str) {
        return getBoolean(str, "configns:firebase");
    }

    public boolean getBoolean(String str, String str2) {
        if (str2 == null) {
            return false;
        }
        this.blm.readLock().lock();
        try {
            if (this.blj != null && this.blj.zzbv(str, str2)) {
                String str3 = new String(this.blj.zzbw(str, str2), zzanz.UTF_8);
                if (zzanz.GW.matcher(str3).matches()) {
                    return true;
                }
                if (zzanz.GX.matcher(str3).matches()) {
                    return false;
                }
            }
            if (this.blk != null && this.blk.zzbv(str, str2)) {
                String str4 = new String(this.blk.zzbw(str, str2), zzanz.UTF_8);
                if (zzanz.GW.matcher(str4).matches()) {
                    return true;
                }
                if (zzanz.GX.matcher(str4).matches()) {
                    return false;
                }
            }
            return false;
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public byte[] getByteArray(String str) {
        return getByteArray(str, "configns:firebase");
    }

    public byte[] getByteArray(String str, String str2) {
        byte[] bArr;
        if (str2 == null) {
            return DEFAULT_VALUE_FOR_BYTE_ARRAY;
        }
        this.blm.readLock().lock();
        try {
            if (this.blj != null && this.blj.zzbv(str, str2)) {
                bArr = this.blj.zzbw(str, str2);
            } else if (this.blk == null || !this.blk.zzbv(str, str2)) {
                bArr = DEFAULT_VALUE_FOR_BYTE_ARRAY;
                this.blm.readLock().unlock();
            } else {
                bArr = this.blk.zzbw(str, str2);
                this.blm.readLock().unlock();
            }
            return bArr;
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public double getDouble(String str) {
        return getDouble(str, "configns:firebase");
    }

    public double getDouble(String str, String str2) {
        double d = 0.0d;
        if (str2 != null) {
            this.blm.readLock().lock();
            try {
                if (this.blj != null && this.blj.zzbv(str, str2)) {
                    try {
                        d = Double.valueOf(new String(this.blj.zzbw(str, str2), zzanz.UTF_8)).doubleValue();
                    } catch (NumberFormatException e) {
                    }
                }
                if (this.blk != null && this.blk.zzbv(str, str2)) {
                    try {
                        d = Double.valueOf(new String(this.blk.zzbw(str, str2), zzanz.UTF_8)).doubleValue();
                        this.blm.readLock().unlock();
                    } catch (NumberFormatException e2) {
                    }
                }
                this.blm.readLock().unlock();
            } finally {
                this.blm.readLock().unlock();
            }
        }
        return d;
    }

    public FirebaseRemoteConfigInfo getInfo() {
        zzany zzanyVar = new zzany();
        this.blm.readLock().lock();
        try {
            zzanyVar.zzcp(this.bli == null ? -1L : this.bli.getTimestamp());
            zzanyVar.zzagf(this.bll.getLastFetchStatus());
            zzanyVar.setConfigSettings(new FirebaseRemoteConfigSettings.Builder().setDeveloperModeEnabled(this.bll.isDeveloperModeEnabled()).build());
            return zzanyVar;
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public Set<String> getKeysByPrefix(String str) {
        return getKeysByPrefix(str, "configns:firebase");
    }

    public Set<String> getKeysByPrefix(String str, String str2) {
        this.blm.readLock().lock();
        try {
            return this.blj == null ? new TreeSet<>() : this.blj.zzbx(str, str2);
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public long getLong(String str) {
        return getLong(str, "configns:firebase");
    }

    public long getLong(String str, String str2) {
        long j = 0;
        if (str2 != null) {
            this.blm.readLock().lock();
            try {
                if (this.blj != null && this.blj.zzbv(str, str2)) {
                    try {
                        j = Long.valueOf(new String(this.blj.zzbw(str, str2), zzanz.UTF_8)).longValue();
                    } catch (NumberFormatException e) {
                    }
                }
                if (this.blk != null && this.blk.zzbv(str, str2)) {
                    try {
                        j = Long.valueOf(new String(this.blk.zzbw(str, str2), zzanz.UTF_8)).longValue();
                        this.blm.readLock().unlock();
                    } catch (NumberFormatException e2) {
                    }
                }
                this.blm.readLock().unlock();
            } finally {
                this.blm.readLock().unlock();
            }
        }
        return j;
    }

    public String getString(String str) {
        return getString(str, "configns:firebase");
    }

    public String getString(String str, String str2) {
        String str3;
        if (str2 == null) {
            return "";
        }
        this.blm.readLock().lock();
        try {
            if (this.blj != null && this.blj.zzbv(str, str2)) {
                str3 = new String(this.blj.zzbw(str, str2), zzanz.UTF_8);
            } else if (this.blk == null || !this.blk.zzbv(str, str2)) {
                str3 = "";
                this.blm.readLock().unlock();
            } else {
                str3 = new String(this.blk.zzbw(str, str2), zzanz.UTF_8);
                this.blm.readLock().unlock();
            }
            return str3;
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public FirebaseRemoteConfigValue getValue(String str) {
        return getValue(str, "configns:firebase");
    }

    public FirebaseRemoteConfigValue getValue(String str, String str2) {
        zzanz zzanzVar;
        if (str2 == null) {
            return new zzanz(DEFAULT_VALUE_FOR_BYTE_ARRAY, 0);
        }
        this.blm.readLock().lock();
        try {
            if (this.blj != null && this.blj.zzbv(str, str2)) {
                zzanzVar = new zzanz(this.blj.zzbw(str, str2), 2);
            } else if (this.blk == null || !this.blk.zzbv(str, str2)) {
                zzanzVar = new zzanz(DEFAULT_VALUE_FOR_BYTE_ARRAY, 0);
                this.blm.readLock().unlock();
            } else {
                zzanzVar = new zzanz(this.blk.zzbw(str, str2), 1);
                this.blm.readLock().unlock();
            }
            return zzanzVar;
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public void setConfigSettings(FirebaseRemoteConfigSettings firebaseRemoteConfigSettings) {
        this.blm.writeLock().lock();
        try {
            boolean isDeveloperModeEnabled = this.bll.isDeveloperModeEnabled();
            boolean isDeveloperModeEnabled2 = firebaseRemoteConfigSettings == null ? false : firebaseRemoteConfigSettings.isDeveloperModeEnabled();
            this.bll.zzdd(isDeveloperModeEnabled2);
            if (isDeveloperModeEnabled != isDeveloperModeEnabled2) {
                S();
            }
        } finally {
            this.blm.writeLock().unlock();
        }
    }

    public void setDefaults(int i) {
        setDefaults(i, "configns:firebase");
    }

    public void setDefaults(int i, String str) {
        if (str == null) {
            if (!Log.isLoggable("FirebaseRemoteConfig", 3)) {
                return;
            }
            Log.d("FirebaseRemoteConfig", "namespace cannot be null for setDefaults.");
            return;
        }
        this.blm.readLock().lock();
        try {
            if (this.bll != null && this.bll.Y() != null && this.bll.Y().get(str) != null) {
                zzanv zzanvVar = this.bll.Y().get(str);
                if (i == zzanvVar.T() && this.bll.Z() == zzanvVar.U()) {
                    if (Log.isLoggable("FirebaseRemoteConfig", 3)) {
                        Log.d("FirebaseRemoteConfig", "Skipped setting defaults from resource file as this resource file was already applied.");
                    }
                    return;
                }
            }
            this.blm.readLock().unlock();
            HashMap hashMap = new HashMap();
            try {
                XmlResourceParser xml = this.mContext.getResources().getXml(i);
                String str2 = null;
                String str3 = null;
                String str4 = null;
                for (int eventType = xml.getEventType(); eventType != 1; eventType = xml.next()) {
                    if (eventType == 2) {
                        str3 = xml.getName();
                    } else if (eventType == 3) {
                        if ("entry".equals(xml.getName()) && str2 != null && str4 != null) {
                            hashMap.put(str2, str4);
                            str4 = null;
                            str2 = null;
                        }
                        str3 = null;
                    } else if (eventType == 4) {
                        if ("key".equals(str3)) {
                            str2 = xml.getText();
                        } else if ("value".equals(str3)) {
                            str4 = xml.getText();
                        }
                    }
                }
                this.bll.zza(str, new zzanv(i, this.bll.Z()));
                zzc(hashMap, str, false);
            } catch (Exception e) {
                Log.e("FirebaseRemoteConfig", "Caught exception while parsing XML resource. Skipping setDefaults.", e);
            }
        } finally {
            this.blm.readLock().unlock();
        }
    }

    public void setDefaults(Map<String, Object> map) {
        setDefaults(map, "configns:firebase");
    }

    public void setDefaults(Map<String, Object> map, String str) {
        zzc(map, str, true);
    }

    @VisibleForTesting
    void zza(TaskCompletionSource<Void> taskCompletionSource, zztb.zzb zzbVar) {
        if (zzbVar == null || zzbVar.getStatus() == null) {
            this.bll.zzagf(1);
            taskCompletionSource.setException(new FirebaseRemoteConfigFetchException());
            S();
            return;
        }
        int statusCode = zzbVar.getStatus().getStatusCode();
        this.blm.writeLock().lock();
        try {
            switch (statusCode) {
                case -6508:
                case -6506:
                    this.bll.zzagf(-1);
                    if (this.bli != null && !this.bli.W()) {
                        Map<String, Set<String>> zzazj = zzbVar.zzazj();
                        HashMap hashMap = new HashMap();
                        for (String str : zzazj.keySet()) {
                            HashMap hashMap2 = new HashMap();
                            for (String str2 : zzazj.get(str)) {
                                hashMap2.put(str2, zzbVar.zza(str2, null, str));
                            }
                            hashMap.put(str, hashMap2);
                        }
                        this.bli = new zzanx(hashMap, this.bli.getTimestamp());
                    }
                    taskCompletionSource.setResult(null);
                    S();
                    break;
                case -6505:
                    Map<String, Set<String>> zzazj2 = zzbVar.zzazj();
                    HashMap hashMap3 = new HashMap();
                    for (String str3 : zzazj2.keySet()) {
                        HashMap hashMap4 = new HashMap();
                        for (String str4 : zzazj2.get(str3)) {
                            hashMap4.put(str4, zzbVar.zza(str4, null, str3));
                        }
                        hashMap3.put(str3, hashMap4);
                    }
                    this.bli = new zzanx(hashMap3, System.currentTimeMillis());
                    this.bll.zzagf(-1);
                    taskCompletionSource.setResult(null);
                    S();
                    break;
                case 6500:
                case 6501:
                case 6503:
                case 6504:
                    this.bll.zzagf(1);
                    taskCompletionSource.setException(new FirebaseRemoteConfigFetchException());
                    S();
                    break;
                case 6502:
                case 6507:
                    this.bll.zzagf(2);
                    taskCompletionSource.setException(new FirebaseRemoteConfigFetchThrottledException(zzbVar.getThrottleEndTimeMillis()));
                    S();
                    break;
                default:
                    if (zzbVar.getStatus().isSuccess()) {
                        Log.w("FirebaseRemoteConfig", new StringBuilder(45).append("Unknown (successful) status code: ").append(statusCode).toString());
                    }
                    this.bll.zzagf(1);
                    taskCompletionSource.setException(new FirebaseRemoteConfigFetchException());
                    S();
                    break;
            }
        } finally {
            this.blm.writeLock().unlock();
        }
    }
}
