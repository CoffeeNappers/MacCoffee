package com.google.android.gms.common.data;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
/* loaded from: classes2.dex */
public abstract class zzc {
    protected int BU;
    private int BV;
    protected final DataHolder zy;

    public zzc(DataHolder dataHolder, int i) {
        this.zy = (DataHolder) zzaa.zzy(dataHolder);
        zzfy(i);
    }

    public boolean equals(Object obj) {
        if (obj instanceof zzc) {
            zzc zzcVar = (zzc) obj;
            return zzz.equal(Integer.valueOf(zzcVar.BU), Integer.valueOf(this.BU)) && zzz.equal(Integer.valueOf(zzcVar.BV), Integer.valueOf(this.BV)) && zzcVar.zy == this.zy;
        }
        return false;
    }

    protected boolean getBoolean(String str) {
        return this.zy.zze(str, this.BU, this.BV);
    }

    protected byte[] getByteArray(String str) {
        return this.zy.zzg(str, this.BU, this.BV);
    }

    protected float getFloat(String str) {
        return this.zy.zzf(str, this.BU, this.BV);
    }

    protected int getInteger(String str) {
        return this.zy.zzc(str, this.BU, this.BV);
    }

    protected long getLong(String str) {
        return this.zy.zzb(str, this.BU, this.BV);
    }

    protected String getString(String str) {
        return this.zy.zzd(str, this.BU, this.BV);
    }

    public int hashCode() {
        return zzz.hashCode(Integer.valueOf(this.BU), Integer.valueOf(this.BV), this.zy);
    }

    public boolean isDataValid() {
        return !this.zy.isClosed();
    }

    protected void zza(String str, CharArrayBuffer charArrayBuffer) {
        this.zy.zza(str, this.BU, this.BV, charArrayBuffer);
    }

    protected int zzaul() {
        return this.BU;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void zzfy(int i) {
        zzaa.zzbs(i >= 0 && i < this.zy.getCount());
        this.BU = i;
        this.BV = this.zy.zzga(this.BU);
    }

    public boolean zzho(String str) {
        return this.zy.zzho(str);
    }

    protected Uri zzhp(String str) {
        return this.zy.zzh(str, this.BU, this.BV);
    }

    protected boolean zzhq(String str) {
        return this.zy.zzi(str, this.BU, this.BV);
    }
}
