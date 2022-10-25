package com.google.firebase.database;

import com.google.android.gms.internal.zzajq;
import com.google.android.gms.internal.zzajs;
import com.google.android.gms.internal.zzakf;
import com.google.android.gms.internal.zzaml;
import com.google.android.gms.internal.zzamm;
import com.google.android.gms.internal.zzamp;
import com.google.android.gms.internal.zzank;
import com.google.android.gms.internal.zzann;
import com.google.android.gms.internal.zzano;
import com.google.android.gms.internal.zzanp;
import com.google.android.gms.tasks.Task;
import com.google.firebase.database.DatabaseReference;
import java.util.Map;
/* loaded from: classes2.dex */
public class OnDisconnect {
    private zzajs aZj;
    private zzajq aZr;

    /* JADX INFO: Access modifiers changed from: package-private */
    public OnDisconnect(zzajs zzajsVar, zzajq zzajqVar) {
        this.aZj = zzajsVar;
        this.aZr = zzajqVar;
    }

    private Task<Void> zza(DatabaseReference.CompletionListener completionListener) {
        final zzank<Task<Void>, DatabaseReference.CompletionListener> zzb = zzann.zzb(completionListener);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.OnDisconnect.3
            @Override // java.lang.Runnable
            public void run() {
                OnDisconnect.this.aZj.zza(OnDisconnect.this.aZr, (DatabaseReference.CompletionListener) zzb.A());
            }
        });
        return zzb.getFirst();
    }

    private Task<Void> zza(final Map<String, Object> map, DatabaseReference.CompletionListener completionListener) {
        final Map<zzajq, zzaml> zzc = zzano.zzc(this.aZr, map);
        final zzank<Task<Void>, DatabaseReference.CompletionListener> zzb = zzann.zzb(completionListener);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.OnDisconnect.2
            @Override // java.lang.Runnable
            public void run() {
                OnDisconnect.this.aZj.zza(OnDisconnect.this.aZr, zzc, (DatabaseReference.CompletionListener) zzb.A(), map);
            }
        });
        return zzb.getFirst();
    }

    private Task<Void> zzb(Object obj, zzaml zzamlVar, DatabaseReference.CompletionListener completionListener) {
        zzano.zzaq(this.aZr);
        zzakf.zza(this.aZr, obj);
        Object zzby = zzanp.zzby(obj);
        zzano.zzbx(zzby);
        final zzaml zza = zzamm.zza(zzby, zzamlVar);
        final zzank<Task<Void>, DatabaseReference.CompletionListener> zzb = zzann.zzb(completionListener);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.OnDisconnect.1
            @Override // java.lang.Runnable
            public void run() {
                OnDisconnect.this.aZj.zzb(OnDisconnect.this.aZr, zza, (DatabaseReference.CompletionListener) zzb.A());
            }
        });
        return zzb.getFirst();
    }

    public Task<Void> cancel() {
        return zza((DatabaseReference.CompletionListener) null);
    }

    public void cancel(DatabaseReference.CompletionListener completionListener) {
        zza(completionListener);
    }

    public Task<Void> removeValue() {
        return setValue(null);
    }

    public void removeValue(DatabaseReference.CompletionListener completionListener) {
        setValue((Object) null, completionListener);
    }

    public Task<Void> setValue(Object obj) {
        return zzb(obj, zzamp.c(), null);
    }

    public Task<Void> setValue(Object obj, double d) {
        return zzb(obj, zzamp.zzbu(Double.valueOf(d)), null);
    }

    public Task<Void> setValue(Object obj, String str) {
        return zzb(obj, zzamp.zzbu(str), null);
    }

    public void setValue(Object obj, double d, DatabaseReference.CompletionListener completionListener) {
        zzb(obj, zzamp.zzbu(Double.valueOf(d)), completionListener);
    }

    public void setValue(Object obj, DatabaseReference.CompletionListener completionListener) {
        zzb(obj, zzamp.c(), completionListener);
    }

    public void setValue(Object obj, String str, DatabaseReference.CompletionListener completionListener) {
        zzb(obj, zzamp.zzbu(str), completionListener);
    }

    public void setValue(Object obj, Map map, DatabaseReference.CompletionListener completionListener) {
        zzb(obj, zzamp.zzbu(map), completionListener);
    }

    public Task<Void> updateChildren(Map<String, Object> map) {
        return zza(map, null);
    }

    public void updateChildren(Map<String, Object> map, DatabaseReference.CompletionListener completionListener) {
        zza(map, completionListener);
    }
}
