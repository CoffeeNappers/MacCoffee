package com.google.firebase.database;

import com.google.android.gms.internal.zzajq;
import com.google.android.gms.internal.zzajs;
import com.google.android.gms.internal.zzamg;
import com.google.android.gms.internal.zzaml;
/* loaded from: classes2.dex */
public class zza {
    public static DataSnapshot zza(DatabaseReference databaseReference, zzamg zzamgVar) {
        return new DataSnapshot(databaseReference, zzamgVar);
    }

    public static DatabaseReference zza(zzajs zzajsVar, zzajq zzajqVar) {
        return new DatabaseReference(zzajsVar, zzajqVar);
    }

    public static MutableData zza(zzaml zzamlVar) {
        return new MutableData(zzamlVar);
    }
}
