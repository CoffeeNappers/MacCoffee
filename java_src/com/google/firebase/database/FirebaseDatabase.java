package com.google.firebase.database;

import com.google.android.gms.internal.zzajk;
import com.google.android.gms.internal.zzajq;
import com.google.android.gms.internal.zzajs;
import com.google.android.gms.internal.zzajt;
import com.google.android.gms.internal.zzaju;
import com.google.android.gms.internal.zzanl;
import com.google.android.gms.internal.zzann;
import com.google.android.gms.internal.zzano;
import com.google.firebase.FirebaseApp;
import com.google.firebase.database.Logger;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class FirebaseDatabase {
    private static final Map<String, FirebaseDatabase> aZf = new HashMap();
    private final FirebaseApp aZg;
    private final zzajt aZh;
    private final zzajk aZi;
    private zzajs aZj;

    private FirebaseDatabase(FirebaseApp firebaseApp, zzajt zzajtVar, zzajk zzajkVar) {
        this.aZg = firebaseApp;
        this.aZh = zzajtVar;
        this.aZi = zzajkVar;
    }

    public static FirebaseDatabase getInstance() {
        return getInstance(FirebaseApp.getInstance());
    }

    public static synchronized FirebaseDatabase getInstance(FirebaseApp firebaseApp) {
        FirebaseDatabase firebaseDatabase;
        synchronized (FirebaseDatabase.class) {
            if (!aZf.containsKey(firebaseApp.getName())) {
                String databaseUrl = firebaseApp.getOptions().getDatabaseUrl();
                if (databaseUrl == null) {
                    throw new DatabaseException("Failed to get FirebaseDatabase instance: FirebaseApp object has no DatabaseURL in its FirebaseOptions object.");
                }
                zzanl zztd = zzann.zztd(databaseUrl);
                if (!zztd.aZr.isEmpty()) {
                    String valueOf = String.valueOf(zztd.aZr.toString());
                    throw new DatabaseException(new StringBuilder(String.valueOf(databaseUrl).length() + 114 + String.valueOf(valueOf).length()).append("Configured Database URL '").append(databaseUrl).append("' is invalid. It should point to the root of a Firebase Database but it includes a path: ").append(valueOf).toString());
                }
                zzajk zzajkVar = new zzajk();
                if (!firebaseApp.zzcnu()) {
                    zzajkVar.zzsv(firebaseApp.getName());
                }
                zzajkVar.zzf(firebaseApp);
                aZf.put(firebaseApp.getName(), new FirebaseDatabase(firebaseApp, zztd.aZh, zzajkVar));
            }
            firebaseDatabase = aZf.get(firebaseApp.getName());
        }
        return firebaseDatabase;
    }

    public static String getSdkVersion() {
        return "3.0.0";
    }

    private synchronized void zzcqx() {
        if (this.aZj == null) {
            this.aZj = zzaju.zza(this.aZi, this.aZh, this);
        }
    }

    private void zzsb(String str) {
        if (this.aZj != null) {
            throw new DatabaseException(new StringBuilder(String.valueOf(str).length() + 77).append("Calls to ").append(str).append("() must be made before any other usage of FirebaseDatabase instance.").toString());
        }
    }

    public FirebaseApp getApp() {
        return this.aZg;
    }

    public DatabaseReference getReference() {
        zzcqx();
        return new DatabaseReference(this.aZj, zzajq.zzcvg());
    }

    public DatabaseReference getReference(String str) {
        zzcqx();
        if (str == null) {
            throw new NullPointerException("Can't pass null for argument 'pathString' in FirebaseDatabase.getReference()");
        }
        zzano.zztj(str);
        return new DatabaseReference(this.aZj, new zzajq(str));
    }

    public DatabaseReference getReferenceFromUrl(String str) {
        zzcqx();
        if (str == null) {
            throw new NullPointerException("Can't pass null for argument 'url' in FirebaseDatabase.getReferenceFromUrl()");
        }
        zzanl zztd = zzann.zztd(str);
        if (zztd.aZh.baV.equals(this.aZj.zzcvp().baV)) {
            return new DatabaseReference(this.aZj, zztd.aZr);
        }
        String valueOf = String.valueOf(getReference().toString());
        throw new DatabaseException(new StringBuilder(String.valueOf(str).length() + 93 + String.valueOf(valueOf).length()).append("Invalid URL (").append(str).append(") passed to getReference().  URL was expected to match configured Database URL: ").append(valueOf).toString());
    }

    public void goOffline() {
        zzcqx();
        zzaju.zzk(this.aZj);
    }

    public void goOnline() {
        zzcqx();
        zzaju.zzl(this.aZj);
    }

    public void purgeOutstandingWrites() {
        zzcqx();
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.FirebaseDatabase.1
            @Override // java.lang.Runnable
            public void run() {
                FirebaseDatabase.this.aZj.purgeOutstandingWrites();
            }
        });
    }

    public synchronized void setLogLevel(Logger.Level level) {
        zzsb("setLogLevel");
        this.aZi.setLogLevel(level);
    }

    public synchronized void setPersistenceEnabled(boolean z) {
        zzsb("setPersistenceEnabled");
        this.aZi.setPersistenceEnabled(z);
    }
}
