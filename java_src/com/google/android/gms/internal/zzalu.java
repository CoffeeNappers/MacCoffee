package com.google.android.gms.internal;

import android.util.Log;
import com.google.android.gms.internal.zzalx;
import java.util.List;
/* loaded from: classes2.dex */
public class zzalu extends zzalv {
    public zzalu(zzalx.zza zzaVar, List<String> list) {
        super(zzaVar, list);
    }

    @Override // com.google.android.gms.internal.zzalv
    protected String zza(zzalx.zza zzaVar, String str, String str2, long j) {
        return str2;
    }

    @Override // com.google.android.gms.internal.zzalv
    protected void zzbq(String str, String str2) {
        Log.e(str, str2);
    }

    @Override // com.google.android.gms.internal.zzalv
    protected void zzbr(String str, String str2) {
        Log.w(str, str2);
    }

    @Override // com.google.android.gms.internal.zzalv
    protected void zzbs(String str, String str2) {
        Log.i(str, str2);
    }

    @Override // com.google.android.gms.internal.zzalv
    protected void zzbt(String str, String str2) {
        Log.d(str, str2);
    }
}
