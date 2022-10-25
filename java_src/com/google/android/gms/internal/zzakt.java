package com.google.android.gms.internal;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class zzakt implements zzaku {
    private boolean aZS = false;

    private void zzcri() {
        zzann.zzb(this.aZS, "Transaction expected to already be in progress.");
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzajq zzajqVar, zzajh zzajhVar, long j) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzajq zzajqVar, zzaml zzamlVar, long j) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzall zzallVar, zzaml zzamlVar) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzall zzallVar, Set<zzalz> set) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zza(zzall zzallVar, Set<zzalz> set, Set<zzalz> set2) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzby(long j) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzc(zzajq zzajqVar, zzajh zzajhVar) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public List<zzake> zzcre() {
        return Collections.emptyList();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzcrh() {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzd(zzajq zzajqVar, zzajh zzajhVar) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public zzald zzf(zzall zzallVar) {
        return new zzald(zzamg.zza(zzame.zzczq(), zzallVar.zzcya()), false, false);
    }

    @Override // com.google.android.gms.internal.zzaku
    public <T> T zzf(Callable<T> callable) {
        zzann.zzb(!this.aZS, "runInTransaction called when an existing transaction is already in progress.");
        this.aZS = true;
        try {
            return callable.call();
        } finally {
        }
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzg(zzall zzallVar) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzh(zzall zzallVar) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzi(zzall zzallVar) {
        zzcri();
    }

    @Override // com.google.android.gms.internal.zzaku
    public void zzk(zzajq zzajqVar, zzaml zzamlVar) {
        zzcri();
    }
}
