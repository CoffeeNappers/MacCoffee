package com.google.android.gms.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.internal.zztm;
import com.google.android.gms.internal.zztn;
import com.vk.media.camera.CameraUtilsEffects;
import dalvik.system.PathClassLoader;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
/* loaded from: classes2.dex */
public final class zztl {
    private static zztm Qh;
    private static String Qj;
    private final Context Qr;
    private static final HashMap<String, byte[]> Qi = new HashMap<>();
    private static final zzb.zza Qk = new zzb.zza() { // from class: com.google.android.gms.internal.zztl.1
        @Override // com.google.android.gms.internal.zztl.zzb.zza
        public zztl zza(Context context, String str, int i) throws zza {
            return zztl.zza(context, str, i);
        }

        @Override // com.google.android.gms.internal.zztl.zzb.zza
        public int zzaa(Context context, String str) {
            return zztl.zzaa(context, str);
        }

        @Override // com.google.android.gms.internal.zztl.zzb.zza
        public int zzb(Context context, String str, boolean z) throws zza {
            return zztl.zzb(context, str, z);
        }
    };
    private static final zzb.zza Ql = new zzb.zza() { // from class: com.google.android.gms.internal.zztl.2
        @Override // com.google.android.gms.internal.zztl.zzb.zza
        public zztl zza(Context context, String str, int i) throws zza {
            return zztl.zzb(context, str, i);
        }

        @Override // com.google.android.gms.internal.zztl.zzb.zza
        public int zzaa(Context context, String str) {
            return zztl.zzaa(context, str);
        }

        @Override // com.google.android.gms.internal.zztl.zzb.zza
        public int zzb(Context context, String str, boolean z) throws zza {
            return zztl.zzc(context, str, z);
        }
    };
    public static final zzb Qm = new zzb() { // from class: com.google.android.gms.internal.zztl.3
        @Override // com.google.android.gms.internal.zztl.zzb
        public zzb.C0134zzb zza(Context context, String str, zzb.zza zzaVar) throws zza {
            zzb.C0134zzb c0134zzb = new zzb.C0134zzb();
            c0134zzb.Qu = zzaVar.zzb(context, str, true);
            if (c0134zzb.Qu != 0) {
                c0134zzb.Qv = 1;
            } else {
                c0134zzb.Qt = zzaVar.zzaa(context, str);
                if (c0134zzb.Qt != 0) {
                    c0134zzb.Qv = -1;
                }
            }
            return c0134zzb;
        }
    };
    public static final zzb Qn = new zzb() { // from class: com.google.android.gms.internal.zztl.4
        @Override // com.google.android.gms.internal.zztl.zzb
        public zzb.C0134zzb zza(Context context, String str, zzb.zza zzaVar) throws zza {
            zzb.C0134zzb c0134zzb = new zzb.C0134zzb();
            c0134zzb.Qt = zzaVar.zzaa(context, str);
            if (c0134zzb.Qt != 0) {
                c0134zzb.Qv = -1;
            } else {
                c0134zzb.Qu = zzaVar.zzb(context, str, true);
                if (c0134zzb.Qu != 0) {
                    c0134zzb.Qv = 1;
                }
            }
            return c0134zzb;
        }
    };
    public static final zzb Qo = new zzb() { // from class: com.google.android.gms.internal.zztl.5
        @Override // com.google.android.gms.internal.zztl.zzb
        public zzb.C0134zzb zza(Context context, String str, zzb.zza zzaVar) throws zza {
            zzb.C0134zzb c0134zzb = new zzb.C0134zzb();
            c0134zzb.Qt = zzaVar.zzaa(context, str);
            c0134zzb.Qu = zzaVar.zzb(context, str, true);
            if (c0134zzb.Qt == 0 && c0134zzb.Qu == 0) {
                c0134zzb.Qv = 0;
            } else if (c0134zzb.Qt >= c0134zzb.Qu) {
                c0134zzb.Qv = -1;
            } else {
                c0134zzb.Qv = 1;
            }
            return c0134zzb;
        }
    };
    public static final zzb Qp = new zzb() { // from class: com.google.android.gms.internal.zztl.6
        @Override // com.google.android.gms.internal.zztl.zzb
        public zzb.C0134zzb zza(Context context, String str, zzb.zza zzaVar) throws zza {
            zzb.C0134zzb c0134zzb = new zzb.C0134zzb();
            c0134zzb.Qt = zzaVar.zzaa(context, str);
            c0134zzb.Qu = zzaVar.zzb(context, str, true);
            if (c0134zzb.Qt == 0 && c0134zzb.Qu == 0) {
                c0134zzb.Qv = 0;
            } else if (c0134zzb.Qu >= c0134zzb.Qt) {
                c0134zzb.Qv = 1;
            } else {
                c0134zzb.Qv = -1;
            }
            return c0134zzb;
        }
    };
    public static final zzb Qq = new zzb() { // from class: com.google.android.gms.internal.zztl.7
        @Override // com.google.android.gms.internal.zztl.zzb
        public zzb.C0134zzb zza(Context context, String str, zzb.zza zzaVar) throws zza {
            zzb.C0134zzb c0134zzb = new zzb.C0134zzb();
            c0134zzb.Qt = zzaVar.zzaa(context, str);
            if (c0134zzb.Qt != 0) {
                c0134zzb.Qu = zzaVar.zzb(context, str, false);
            } else {
                c0134zzb.Qu = zzaVar.zzb(context, str, true);
            }
            if (c0134zzb.Qt == 0 && c0134zzb.Qu == 0) {
                c0134zzb.Qv = 0;
            } else if (c0134zzb.Qu >= c0134zzb.Qt) {
                c0134zzb.Qv = 1;
            } else {
                c0134zzb.Qv = -1;
            }
            return c0134zzb;
        }
    };

    /* loaded from: classes2.dex */
    public static class zza extends Exception {
        private zza(String str) {
            super(str);
        }

        private zza(String str, Throwable th) {
            super(str, th);
        }
    }

    /* loaded from: classes2.dex */
    public interface zzb {

        /* loaded from: classes2.dex */
        public interface zza {
            zztl zza(Context context, String str, int i) throws zza;

            int zzaa(Context context, String str);

            int zzb(Context context, String str, boolean z) throws zza;
        }

        /* renamed from: com.google.android.gms.internal.zztl$zzb$zzb  reason: collision with other inner class name */
        /* loaded from: classes2.dex */
        public static class C0134zzb {
            public int Qt = 0;
            public int Qu = 0;
            public int Qv = 0;
        }

        C0134zzb zza(Context context, String str, zza zzaVar) throws zza;
    }

    private zztl(Context context) {
        this.Qr = (Context) com.google.android.gms.common.internal.zzaa.zzy(context);
    }

    private static Context zza(Context context, String str, byte[] bArr, String str2) {
        if (str2 == null || str2.isEmpty()) {
            Log.e("DynamiteModule", "No valid DynamiteLoader APK path");
            return null;
        }
        try {
            return (Context) com.google.android.gms.dynamic.zze.zzae(zztn.zza.zzff((IBinder) new PathClassLoader(str2, context.getClassLoader()) { // from class: com.google.android.gms.internal.zztl.9
                @Override // java.lang.ClassLoader
                protected Class<?> loadClass(String str3, boolean z) throws ClassNotFoundException {
                    if (!str3.startsWith("java.") && !str3.startsWith("android.")) {
                        try {
                            return findClass(str3);
                        } catch (ClassNotFoundException e) {
                        }
                    }
                    return super.loadClass(str3, z);
                }
            }.loadClass("com.google.android.gms.dynamiteloader.DynamiteLoaderV2").getConstructor(new Class[0]).newInstance(new Object[0])).zza(com.google.android.gms.dynamic.zze.zzac(context), str, bArr));
        } catch (RemoteException | ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
            String valueOf = String.valueOf(e.toString());
            Log.e("DynamiteModule", valueOf.length() != 0 ? "Failed to load DynamiteLoader: ".concat(valueOf) : new String("Failed to load DynamiteLoader: "));
            return null;
        }
    }

    public static zztl zza(Context context, zzb zzbVar, String str) throws zza {
        return zza(context, zzbVar, str, Qk);
    }

    public static zztl zza(Context context, zzb zzbVar, String str, zzb.zza zzaVar) throws zza {
        zzb.C0134zzb zza2 = zzbVar.zza(context, str, zzaVar);
        Log.i("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 68 + String.valueOf(str).length()).append("Considering local module ").append(str).append(":").append(zza2.Qt).append(" and remote module ").append(str).append(":").append(zza2.Qu).toString());
        if (zza2.Qv == 0 || ((zza2.Qv == -1 && zza2.Qt == 0) || (zza2.Qv == 1 && zza2.Qu == 0))) {
            throw new zza(new StringBuilder(91).append("No acceptable module found. Local version is ").append(zza2.Qt).append(" and remote version is ").append(zza2.Qu).append(".").toString());
        } else if (zza2.Qv == -1) {
            return zzac(context, str);
        } else {
            if (zza2.Qv != 1) {
                throw new zza(new StringBuilder(47).append("VersionPolicy returned invalid code:").append(zza2.Qv).toString());
            }
            try {
                return zzaVar.zza(context, str, zza2.Qu);
            } catch (zza e) {
                String valueOf = String.valueOf(e.getMessage());
                Log.w("DynamiteModule", valueOf.length() != 0 ? "Failed to load remote module: ".concat(valueOf) : new String("Failed to load remote module: "));
                if (zza2.Qt != 0) {
                    final int i = zza2.Qt;
                    if (zzbVar.zza(context, str, new zzb.zza() { // from class: com.google.android.gms.internal.zztl.8
                        @Override // com.google.android.gms.internal.zztl.zzb.zza
                        public zztl zza(Context context2, String str2, int i2) throws zza {
                            throw new zza("local only VersionPolicy should not load from remote");
                        }

                        @Override // com.google.android.gms.internal.zztl.zzb.zza
                        public int zzaa(Context context2, String str2) {
                            return i;
                        }

                        @Override // com.google.android.gms.internal.zztl.zzb.zza
                        public int zzb(Context context2, String str2, boolean z) {
                            return 0;
                        }
                    }).Qv == -1) {
                        return zzac(context, str);
                    }
                }
                throw new zza("Remote load failed. No local fallback found.", e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static zztl zza(Context context, String str, int i) throws zza {
        Log.i("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 51).append("Selected remote version of ").append(str).append(", version >= ").append(i).toString());
        zztm zzcs = zzcs(context);
        if (zzcs == null) {
            throw new zza("Failed to create IDynamiteLoader.");
        }
        try {
            com.google.android.gms.dynamic.zzd zza2 = zzcs.zza(com.google.android.gms.dynamic.zze.zzac(context), str, i);
            if (com.google.android.gms.dynamic.zze.zzae(zza2) != null) {
                return new zztl((Context) com.google.android.gms.dynamic.zze.zzae(zza2));
            }
            throw new zza("Failed to load remote module.");
        } catch (RemoteException e) {
            throw new zza("Failed to load remote module.", e);
        }
    }

    public static int zzaa(Context context, String str) {
        int i;
        try {
            ClassLoader classLoader = context.getApplicationContext().getClassLoader();
            String valueOf = String.valueOf("com.google.android.gms.dynamite.descriptors.");
            String valueOf2 = String.valueOf("ModuleDescriptor");
            Class<?> loadClass = classLoader.loadClass(new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(str).length() + String.valueOf(valueOf2).length()).append(valueOf).append(str).append(".").append(valueOf2).toString());
            Field declaredField = loadClass.getDeclaredField("MODULE_ID");
            Field declaredField2 = loadClass.getDeclaredField("MODULE_VERSION");
            if (!declaredField.get(null).equals(str)) {
                String valueOf3 = String.valueOf(declaredField.get(null));
                Log.e("DynamiteModule", new StringBuilder(String.valueOf(valueOf3).length() + 51 + String.valueOf(str).length()).append("Module descriptor id '").append(valueOf3).append("' didn't match expected id '").append(str).append("'").toString());
                i = 0;
            } else {
                i = declaredField2.getInt(null);
            }
            return i;
        } catch (ClassNotFoundException e) {
            Log.w("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 45).append("Local module descriptor class for ").append(str).append(" not found.").toString());
            return 0;
        } catch (Exception e2) {
            String valueOf4 = String.valueOf(e2.getMessage());
            Log.e("DynamiteModule", valueOf4.length() != 0 ? "Failed to load module descriptor class: ".concat(valueOf4) : new String("Failed to load module descriptor class: "));
            return 0;
        }
    }

    public static int zzab(Context context, String str) {
        return zzb(context, str, false);
    }

    private static zztl zzac(Context context, String str) {
        String valueOf = String.valueOf(str);
        Log.i("DynamiteModule", valueOf.length() != 0 ? "Selected local version of ".concat(valueOf) : new String("Selected local version of "));
        return new zztl(context.getApplicationContext());
    }

    public static int zzb(Context context, String str, boolean z) {
        zztm zzcs = zzcs(context);
        if (zzcs == null) {
            return 0;
        }
        try {
            return zzcs.zza(com.google.android.gms.dynamic.zze.zzac(context), str, z);
        } catch (RemoteException e) {
            String valueOf = String.valueOf(e.getMessage());
            Log.w("DynamiteModule", valueOf.length() != 0 ? "Failed to retrieve remote module version: ".concat(valueOf) : new String("Failed to retrieve remote module version: "));
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static zztl zzb(Context context, String str, int i) throws zza {
        byte[] bArr;
        String str2;
        Log.i("DynamiteModule", new StringBuilder(String.valueOf(str).length() + 51).append("Selected remote version of ").append(str).append(", version >= ").append(i).toString());
        synchronized (zztl.class) {
            bArr = Qi.get(new StringBuilder(String.valueOf(str).length() + 12).append(str).append(":").append(i).toString());
            str2 = Qj;
        }
        if (bArr == null) {
            throw new zza("Module implementation could not be found.");
        }
        Context zza2 = zza(context.getApplicationContext(), str, bArr, str2);
        if (zza2 != null) {
            return new zztl(zza2);
        }
        throw new zza("Failed to get module context");
    }

    public static int zzc(Context context, String str, boolean z) throws zza {
        ContentResolver contentResolver;
        String str2 = z ? "api_force_staging" : "api";
        String valueOf = String.valueOf("content://com.google.android.gms.chimera/");
        Uri parse = Uri.parse(new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(str2).length() + String.valueOf(str).length()).append(valueOf).append(str2).append(CameraUtilsEffects.FILE_DELIM).append(str).toString());
        if (context == null || (contentResolver = context.getContentResolver()) == null) {
            throw new zza("Failed to get dynamite module ContentResolver.");
        }
        Cursor query = contentResolver.query(parse, null, null, null, null);
        if (query != null) {
            try {
                if (query.moveToFirst()) {
                    int i = query.getInt(0);
                    if (i > 0) {
                        synchronized (zztl.class) {
                            Qi.put(new StringBuilder(String.valueOf(str).length() + 12).append(str).append(":").append(i).toString(), query.getBlob(1));
                            Qj = query.getString(2);
                        }
                    }
                    return i;
                }
            } finally {
                if (query != null) {
                    query.close();
                }
            }
        }
        Log.w("DynamiteModule", "Failed to retrieve remote module version.");
        throw new zza("Failed to connect to dynamite module ContentResolver.");
    }

    private static zztm zzcs(Context context) {
        synchronized (zztl.class) {
            if (Qh != null) {
                return Qh;
            } else if (com.google.android.gms.common.zzc.zzaql().isGooglePlayServicesAvailable(context) != 0) {
                return null;
            } else {
                try {
                    zztm zzfe = zztm.zza.zzfe((IBinder) context.createPackageContext("com.google.android.gms", 3).getClassLoader().loadClass("com.google.android.gms.chimera.container.DynamiteLoaderImpl").newInstance());
                    if (zzfe != null) {
                        Qh = zzfe;
                        return zzfe;
                    }
                } catch (Exception e) {
                    String valueOf = String.valueOf(e.getMessage());
                    Log.e("DynamiteModule", valueOf.length() != 0 ? "Failed to load IDynamiteLoader from GmsCore: ".concat(valueOf) : new String("Failed to load IDynamiteLoader from GmsCore: "));
                }
                return null;
            }
        }
    }

    public Context zzbdt() {
        return this.Qr;
    }

    public IBinder zzjd(String str) throws zza {
        try {
            return (IBinder) this.Qr.getClassLoader().loadClass(str).newInstance();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e) {
            String valueOf = String.valueOf(str);
            throw new zza(valueOf.length() != 0 ? "Failed to instantiate module class: ".concat(valueOf) : new String("Failed to instantiate module class: "), e);
        }
    }
}
