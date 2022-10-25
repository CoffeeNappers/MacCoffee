package com.google.firebase;

import android.annotation.TargetApi;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.UiThread;
import android.support.v4.content.ContextCompat;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.common.internal.zzz;
import com.google.android.gms.common.util.zzs;
import com.google.android.gms.common.util.zzt;
import com.google.android.gms.internal.zzanq;
import com.google.android.gms.internal.zzanr;
import com.google.android.gms.internal.zzans;
import com.google.android.gms.internal.zzant;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.auth.GetTokenResult;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class FirebaseApp {
    public static final String DEFAULT_APP_NAME = "[DEFAULT]";
    private final FirebaseOptions aVY;
    private final AtomicBoolean aVZ = new AtomicBoolean(false);
    private final AtomicBoolean aWa = new AtomicBoolean();
    private final List<zza> aWb = new CopyOnWriteArrayList();
    private final List<zzb> aWc = new CopyOnWriteArrayList();
    private final List<Object> aWd = new CopyOnWriteArrayList();
    private zzans aWe;
    private final String mName;
    private final Context zzatc;
    private static final List<String> aVT = Arrays.asList("com.google.firebase.auth.FirebaseAuth", "com.google.firebase.iid.FirebaseInstanceId");
    private static final List<String> aVU = Collections.singletonList("com.google.firebase.crash.FirebaseCrash");
    private static final List<String> aVV = Arrays.asList("com.google.android.gms.measurement.AppMeasurement");
    private static final List<String> aVW = Arrays.asList(new String[0]);
    private static final Set<String> aVX = Collections.emptySet();
    private static final Object zzaox = new Object();
    static final Map<String, FirebaseApp> aic = new ArrayMap();

    /* loaded from: classes2.dex */
    public interface zza {
        void zzb(@NonNull zzant zzantVar);
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        void zzcr(boolean z);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @TargetApi(24)
    /* loaded from: classes2.dex */
    public static class zzc extends BroadcastReceiver {
        private static AtomicReference<zzc> aWf = new AtomicReference<>();
        private final Context zzatc;

        public zzc(Context context) {
            this.zzatc = context;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static void zzen(Context context) {
            if (aWf.get() == null) {
                zzc zzcVar = new zzc(context);
                if (!aWf.compareAndSet(null, zzcVar)) {
                    return;
                }
                IntentFilter intentFilter = new IntentFilter("android.intent.action.USER_UNLOCKED");
                intentFilter.addDataScheme("package");
                context.registerReceiver(zzcVar, intentFilter);
            }
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            synchronized (FirebaseApp.zzaox) {
                for (FirebaseApp firebaseApp : FirebaseApp.aic.values()) {
                    firebaseApp.zzcnx();
                }
            }
            unregister();
        }

        public void unregister() {
            this.zzatc.unregisterReceiver(this);
        }
    }

    protected FirebaseApp(Context context, String str, FirebaseOptions firebaseOptions) {
        this.zzatc = (Context) zzaa.zzy(context);
        this.mName = zzaa.zzib(str);
        this.aVY = (FirebaseOptions) zzaa.zzy(firebaseOptions);
    }

    public static List<FirebaseApp> getApps(Context context) {
        ArrayList arrayList;
        zzanr zzeu = zzanr.zzeu(context);
        synchronized (zzaox) {
            arrayList = new ArrayList(aic.values());
            Set<String> Q = zzanr.P().Q();
            Q.removeAll(aic.keySet());
            for (String str : Q) {
                zzeu.zztz(str);
                arrayList.add(initializeApp(context, null, str));
            }
        }
        return arrayList;
    }

    @Nullable
    public static FirebaseApp getInstance() {
        FirebaseApp firebaseApp;
        synchronized (zzaox) {
            firebaseApp = aic.get(DEFAULT_APP_NAME);
            if (firebaseApp == null) {
                String valueOf = String.valueOf(zzt.zzayz());
                throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 116).append("Default FirebaseApp is not initialized in this process ").append(valueOf).append(". Make sure to call FirebaseApp.initializeApp(Context) first.").toString());
            }
        }
        return firebaseApp;
    }

    public static FirebaseApp getInstance(@NonNull String str) {
        FirebaseApp firebaseApp;
        String concat;
        synchronized (zzaox) {
            firebaseApp = aic.get(zzrq(str));
            if (firebaseApp == null) {
                List<String> zzcnw = zzcnw();
                if (zzcnw.isEmpty()) {
                    concat = "";
                } else {
                    String valueOf = String.valueOf(zzx.zzia(", ").zzb(zzcnw));
                    concat = valueOf.length() != 0 ? "Available app names: ".concat(valueOf) : new String("Available app names: ");
                }
                throw new IllegalStateException(String.format("FirebaseApp with name %s doesn't exist. %s", str, concat));
            }
        }
        return firebaseApp;
    }

    @Nullable
    public static FirebaseApp initializeApp(Context context) {
        FirebaseApp initializeApp;
        synchronized (zzaox) {
            if (aic.containsKey(DEFAULT_APP_NAME)) {
                initializeApp = getInstance();
            } else {
                FirebaseOptions fromResource = FirebaseOptions.fromResource(context);
                initializeApp = fromResource == null ? null : initializeApp(context, fromResource);
            }
        }
        return initializeApp;
    }

    public static FirebaseApp initializeApp(Context context, FirebaseOptions firebaseOptions) {
        return initializeApp(context, firebaseOptions, DEFAULT_APP_NAME);
    }

    public static FirebaseApp initializeApp(Context context, FirebaseOptions firebaseOptions, String str) {
        FirebaseApp firebaseApp;
        zzanr zzeu = zzanr.zzeu(context);
        zzem(context);
        String zzrq = zzrq(str);
        if (!(context instanceof Application)) {
            context = context.getApplicationContext();
        }
        synchronized (zzaox) {
            zzaa.zza(!aic.containsKey(zzrq), new StringBuilder(String.valueOf(zzrq).length() + 33).append("FirebaseApp name ").append(zzrq).append(" already exists!").toString());
            zzaa.zzb(context, "Application context cannot be null.");
            firebaseApp = new FirebaseApp(context, zzrq, firebaseOptions);
            aic.put(zzrq, firebaseApp);
        }
        zzeu.zzg(firebaseApp);
        firebaseApp.zza(FirebaseApp.class, firebaseApp, aVT);
        if (firebaseApp.zzcnu()) {
            firebaseApp.zza(FirebaseApp.class, firebaseApp, aVU);
            firebaseApp.zza(Context.class, firebaseApp.getApplicationContext(), aVV);
        }
        return firebaseApp;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private <T> void zza(Class<T> cls, T t, Iterable<String> iterable) {
        boolean isDeviceProtectedStorage = ContextCompat.isDeviceProtectedStorage(this.zzatc);
        if (isDeviceProtectedStorage) {
            zzc.zzen(this.zzatc);
        }
        for (String str : iterable) {
            if (isDeviceProtectedStorage) {
                try {
                } catch (ClassNotFoundException e) {
                    if (aVX.contains(str)) {
                        throw new IllegalStateException(String.valueOf(str).concat(" is missing, but is required. Check if it has been removed by Proguard."));
                    }
                    Log.d("FirebaseApp", String.valueOf(str).concat(" is not linked. Skipping initialization."));
                } catch (IllegalAccessException e2) {
                    String valueOf = String.valueOf(str);
                    Log.wtf("FirebaseApp", valueOf.length() != 0 ? "Failed to initialize ".concat(valueOf) : new String("Failed to initialize "), e2);
                } catch (NoSuchMethodException e3) {
                    throw new IllegalStateException(String.valueOf(str).concat("#getInstance has been removed by Proguard. Add keep rule to prevent it."));
                } catch (InvocationTargetException e4) {
                    Log.wtf("FirebaseApp", "Firebase API initialization failure.", e4);
                }
                if (aVW.contains(str)) {
                }
            }
            Method method = Class.forName(str).getMethod("getInstance", cls);
            int modifiers = method.getModifiers();
            if (Modifier.isPublic(modifiers) && Modifier.isStatic(modifiers)) {
                method.invoke(null, t);
            }
        }
    }

    private void zzcnt() {
        zzaa.zza(!this.aWa.get(), "FirebaseApp was deleted");
    }

    private static List<String> zzcnw() {
        com.google.android.gms.common.util.zza zzaVar = new com.google.android.gms.common.util.zza();
        synchronized (zzaox) {
            for (FirebaseApp firebaseApp : aic.values()) {
                zzaVar.add(firebaseApp.getName());
            }
            zzanr P = zzanr.P();
            if (P != null) {
                zzaVar.addAll(P.Q());
            }
        }
        ArrayList arrayList = new ArrayList(zzaVar);
        Collections.sort(arrayList);
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzcnx() {
        zza(FirebaseApp.class, this, aVT);
        if (zzcnu()) {
            zza(FirebaseApp.class, this, aVU);
            zza(Context.class, this.zzatc, aVV);
        }
    }

    public static void zzcr(boolean z) {
        synchronized (zzaox) {
            Iterator it = new ArrayList(aic.values()).iterator();
            while (it.hasNext()) {
                FirebaseApp firebaseApp = (FirebaseApp) it.next();
                if (firebaseApp.aVZ.get()) {
                    firebaseApp.zzcs(z);
                }
            }
        }
    }

    private void zzcs(boolean z) {
        Log.d("FirebaseApp", "Notifying background state change listeners.");
        for (zzb zzbVar : this.aWc) {
            zzbVar.zzcr(z);
        }
    }

    @TargetApi(14)
    private static void zzem(Context context) {
        if (!zzs.zzayq() || !(context.getApplicationContext() instanceof Application)) {
            return;
        }
        zzanq.zza((Application) context.getApplicationContext());
    }

    private static String zzrq(@NonNull String str) {
        return str.trim();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FirebaseApp)) {
            return false;
        }
        return this.mName.equals(((FirebaseApp) obj).getName());
    }

    @NonNull
    public Context getApplicationContext() {
        zzcnt();
        return this.zzatc;
    }

    @NonNull
    public String getName() {
        zzcnt();
        return this.mName;
    }

    @NonNull
    public FirebaseOptions getOptions() {
        zzcnt();
        return this.aVY;
    }

    public Task<GetTokenResult> getToken(boolean z) {
        zzcnt();
        return this.aWe == null ? Tasks.forException(new FirebaseApiNotAvailableException("firebase-auth is not linked, please fall back to unauthenticated mode.")) : this.aWe.zzct(z);
    }

    public int hashCode() {
        return this.mName.hashCode();
    }

    public void setAutomaticResourceManagementEnabled(boolean z) {
        zzcnt();
        if (this.aVZ.compareAndSet(!z, z)) {
            boolean O = zzanq.N().O();
            if (z && O) {
                zzcs(true);
            } else if (z || !O) {
            } else {
                zzcs(false);
            }
        }
    }

    public String toString() {
        return zzz.zzx(this).zzg("name", this.mName).zzg("options", this.aVY).toString();
    }

    public void zza(@NonNull zzans zzansVar) {
        this.aWe = (zzans) zzaa.zzy(zzansVar);
    }

    @UiThread
    public void zza(@NonNull zzant zzantVar) {
        Log.d("FirebaseApp", "Notifying auth state listeners.");
        int i = 0;
        for (zza zzaVar : this.aWb) {
            zzaVar.zzb(zzantVar);
            i++;
        }
        Log.d("FirebaseApp", String.format("Notified %d auth state listeners.", Integer.valueOf(i)));
    }

    public void zza(@NonNull zza zzaVar) {
        zzcnt();
        zzaa.zzy(zzaVar);
        this.aWb.add(zzaVar);
    }

    public void zza(zzb zzbVar) {
        zzcnt();
        if (this.aVZ.get() && zzanq.N().O()) {
            zzbVar.zzcr(true);
        }
        this.aWc.add(zzbVar);
    }

    public boolean zzcnu() {
        return DEFAULT_APP_NAME.equals(getName());
    }

    public String zzcnv() {
        String valueOf = String.valueOf(com.google.android.gms.common.util.zzc.zzs(getName().getBytes()));
        String valueOf2 = String.valueOf(com.google.android.gms.common.util.zzc.zzs(getOptions().getApplicationId().getBytes()));
        return new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append(Marker.ANY_NON_NULL_MARKER).append(valueOf2).toString();
    }
}
