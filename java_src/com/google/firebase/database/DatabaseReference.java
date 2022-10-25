package com.google.firebase.database;

import com.google.android.gms.internal.zzajh;
import com.google.android.gms.internal.zzajk;
import com.google.android.gms.internal.zzajq;
import com.google.android.gms.internal.zzajs;
import com.google.android.gms.internal.zzaju;
import com.google.android.gms.internal.zzakf;
import com.google.android.gms.internal.zzalz;
import com.google.android.gms.internal.zzaml;
import com.google.android.gms.internal.zzamm;
import com.google.android.gms.internal.zzamp;
import com.google.android.gms.internal.zzank;
import com.google.android.gms.internal.zzanm;
import com.google.android.gms.internal.zzann;
import com.google.android.gms.internal.zzano;
import com.google.android.gms.internal.zzanp;
import com.google.android.gms.tasks.Task;
import com.google.firebase.database.Transaction;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import org.slf4j.Marker;
/* loaded from: classes2.dex */
public class DatabaseReference extends Query {
    private static zzajk aYW;

    /* loaded from: classes2.dex */
    public interface CompletionListener {
        void onComplete(DatabaseError databaseError, DatabaseReference databaseReference);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DatabaseReference(zzajs zzajsVar, zzajq zzajqVar) {
        super(zzajsVar, zzajqVar);
    }

    public static void goOffline() {
        zza(zzcqw());
    }

    public static void goOnline() {
        zzb(zzcqw());
    }

    private Task<Void> zza(final zzaml zzamlVar, CompletionListener completionListener) {
        zzano.zzaq(zzcrc());
        final zzank<Task<Void>, CompletionListener> zzb = zzann.zzb(completionListener);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.DatabaseReference.2
            @Override // java.lang.Runnable
            public void run() {
                DatabaseReference.this.aZj.zza(DatabaseReference.this.zzcrc().zza(zzalz.zzcyz()), zzamlVar, (CompletionListener) zzb.A());
            }
        });
        return zzb.getFirst();
    }

    private Task<Void> zza(Object obj, zzaml zzamlVar, CompletionListener completionListener) {
        zzano.zzaq(zzcrc());
        zzakf.zza(zzcrc(), obj);
        Object zzby = zzanp.zzby(obj);
        zzano.zzbx(zzby);
        final zzaml zza = zzamm.zza(zzby, zzamlVar);
        final zzank<Task<Void>, CompletionListener> zzb = zzann.zzb(completionListener);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.DatabaseReference.1
            @Override // java.lang.Runnable
            public void run() {
                DatabaseReference.this.aZj.zza(DatabaseReference.this.zzcrc(), zza, (CompletionListener) zzb.A());
            }
        });
        return zzb.getFirst();
    }

    private Task<Void> zza(Map<String, Object> map, CompletionListener completionListener) {
        if (map == null) {
            throw new NullPointerException("Can't pass null for argument 'update' in updateChildren()");
        }
        final Map<String, Object> zzcf = zzanp.zzcf(map);
        final zzajh zzcb = zzajh.zzcb(zzano.zzc(zzcrc(), zzcf));
        final zzank<Task<Void>, CompletionListener> zzb = zzann.zzb(completionListener);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.DatabaseReference.3
            @Override // java.lang.Runnable
            public void run() {
                DatabaseReference.this.aZj.zza(DatabaseReference.this.zzcrc(), zzcb, (CompletionListener) zzb.A(), zzcf);
            }
        });
        return zzb.getFirst();
    }

    static void zza(zzajk zzajkVar) {
        zzaju.zzd(zzajkVar);
    }

    static void zzb(zzajk zzajkVar) {
        zzaju.zze(zzajkVar);
    }

    private static synchronized zzajk zzcqw() {
        zzajk zzajkVar;
        synchronized (DatabaseReference.class) {
            if (aYW == null) {
                aYW = new zzajk();
            }
            zzajkVar = aYW;
        }
        return zzajkVar;
    }

    public DatabaseReference child(String str) {
        if (str == null) {
            throw new NullPointerException("Can't pass null for argument 'pathString' in child()");
        }
        if (zzcrc().isEmpty()) {
            zzano.zztj(str);
        } else {
            zzano.zzti(str);
        }
        return new DatabaseReference(this.aZj, zzcrc().zzh(new zzajq(str)));
    }

    public boolean equals(Object obj) {
        return (obj instanceof DatabaseReference) && toString().equals(obj.toString());
    }

    public FirebaseDatabase getDatabase() {
        return this.aZj.getDatabase();
    }

    public String getKey() {
        if (zzcrc().isEmpty()) {
            return null;
        }
        return zzcrc().zzcvm().asString();
    }

    public DatabaseReference getParent() {
        zzajq zzcvl = zzcrc().zzcvl();
        if (zzcvl != null) {
            return new DatabaseReference(this.aZj, zzcvl);
        }
        return null;
    }

    public DatabaseReference getRoot() {
        return new DatabaseReference(this.aZj, new zzajq(""));
    }

    public int hashCode() {
        return toString().hashCode();
    }

    public OnDisconnect onDisconnect() {
        zzano.zzaq(zzcrc());
        return new OnDisconnect(this.aZj, zzcrc());
    }

    public DatabaseReference push() {
        return new DatabaseReference(this.aZj, zzcrc().zza(zzalz.zzsx(zzanm.zzco(this.aZj.zzcvq()))));
    }

    public Task<Void> removeValue() {
        return setValue(null);
    }

    public void removeValue(CompletionListener completionListener) {
        setValue((Object) null, completionListener);
    }

    public void runTransaction(Transaction.Handler handler) {
        runTransaction(handler, true);
    }

    public void runTransaction(final Transaction.Handler handler, final boolean z) {
        if (handler == null) {
            throw new NullPointerException("Can't pass null for argument 'handler' in runTransaction()");
        }
        zzano.zzaq(zzcrc());
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.DatabaseReference.4
            @Override // java.lang.Runnable
            public void run() {
                DatabaseReference.this.aZj.zza(DatabaseReference.this.zzcrc(), handler, z);
            }
        });
    }

    public Task<Void> setPriority(Object obj) {
        return zza(zzamp.zzbu(obj), (CompletionListener) null);
    }

    public void setPriority(Object obj, CompletionListener completionListener) {
        zza(zzamp.zzbu(obj), completionListener);
    }

    public Task<Void> setValue(Object obj) {
        return zza(obj, zzamp.zzbu(null), null);
    }

    public Task<Void> setValue(Object obj, Object obj2) {
        return zza(obj, zzamp.zzbu(obj2), null);
    }

    public void setValue(Object obj, CompletionListener completionListener) {
        zza(obj, zzamp.zzbu(null), completionListener);
    }

    public void setValue(Object obj, Object obj2, CompletionListener completionListener) {
        zza(obj, zzamp.zzbu(obj2), completionListener);
    }

    public String toString() {
        DatabaseReference parent = getParent();
        if (parent == null) {
            return this.aZj.toString();
        }
        try {
            String valueOf = String.valueOf(parent.toString());
            String valueOf2 = String.valueOf(URLEncoder.encode(getKey(), "UTF-8").replace(Marker.ANY_NON_NULL_MARKER, "%20"));
            return new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append(CameraUtilsEffects.FILE_DELIM).append(valueOf2).toString();
        } catch (UnsupportedEncodingException e) {
            String valueOf3 = String.valueOf(getKey());
            throw new DatabaseException(valueOf3.length() != 0 ? "Failed to URLEncode key: ".concat(valueOf3) : new String("Failed to URLEncode key: "), e);
        }
    }

    public Task<Void> updateChildren(Map<String, Object> map) {
        return zza(map, (CompletionListener) null);
    }

    public void updateChildren(Map<String, Object> map, CompletionListener completionListener) {
        zza(map, completionListener);
    }
}
