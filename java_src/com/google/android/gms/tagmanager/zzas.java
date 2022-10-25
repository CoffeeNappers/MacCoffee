package com.google.android.gms.tagmanager;

import android.text.TextUtils;
/* loaded from: classes2.dex */
class zzas {
    private final long aFr;
    private final long aFs;
    private String aFt;
    private final long fk;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzas(long j, long j2, long j3) {
        this.aFr = j;
        this.fk = j2;
        this.aFs = j3;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long zzcfi() {
        return this.aFr;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long zzcfj() {
        return this.aFs;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzcfk() {
        return this.aFt;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzpj(String str) {
        if (str == null || TextUtils.isEmpty(str.trim())) {
            return;
        }
        this.aFt = str;
    }
}
