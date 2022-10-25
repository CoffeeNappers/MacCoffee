package com.google.android.gms.internal;

import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.Iterator;
@zzji
/* loaded from: classes.dex */
public class zzcx {
    private final int zzavi;
    private final int zzavj;
    private final int zzavk;
    private final zzdd zzavl;
    private final zzdi zzavm;
    private int zzavt;
    private final Object zzako = new Object();
    private ArrayList<String> zzavn = new ArrayList<>();
    private ArrayList<String> zzavo = new ArrayList<>();
    private ArrayList<zzdb> zzavp = new ArrayList<>();
    private int zzavq = 0;
    private int zzavr = 0;
    private int zzavs = 0;
    private String zzavu = "";
    private String zzavv = "";
    private String zzavw = "";

    public zzcx(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        this.zzavi = i;
        this.zzavj = i2;
        this.zzavk = i3;
        this.zzavl = new zzdd(i4);
        this.zzavm = new zzdi(i5, i6, i7);
    }

    private String zza(ArrayList<String> arrayList, int i) {
        if (arrayList.isEmpty()) {
            return "";
        }
        StringBuffer stringBuffer = new StringBuffer();
        Iterator<String> it = arrayList.iterator();
        while (it.hasNext()) {
            stringBuffer.append(it.next());
            stringBuffer.append(' ');
            if (stringBuffer.length() > i) {
                break;
            }
        }
        stringBuffer.deleteCharAt(stringBuffer.length() - 1);
        String stringBuffer2 = stringBuffer.toString();
        return stringBuffer2.length() >= i ? stringBuffer2.substring(0, i) : stringBuffer2;
    }

    private void zzc(@Nullable String str, boolean z, float f, float f2, float f3, float f4) {
        if (str == null || str.length() < this.zzavk) {
            return;
        }
        synchronized (this.zzako) {
            this.zzavn.add(str);
            this.zzavq += str.length();
            if (z) {
                this.zzavo.add(str);
                this.zzavp.add(new zzdb(f, f2, f3, f4, this.zzavo.size() - 1));
            }
        }
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzcx)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        zzcx zzcxVar = (zzcx) obj;
        return zzcxVar.zziy() != null && zzcxVar.zziy().equals(zziy());
    }

    public int getScore() {
        return this.zzavt;
    }

    public int hashCode() {
        return zziy().hashCode();
    }

    public String toString() {
        int i = this.zzavr;
        int i2 = this.zzavt;
        int i3 = this.zzavq;
        String valueOf = String.valueOf(zza(this.zzavn, 100));
        String valueOf2 = String.valueOf(zza(this.zzavo, 100));
        String str = this.zzavu;
        String str2 = this.zzavv;
        String str3 = this.zzavw;
        return new StringBuilder(String.valueOf(valueOf).length() + 165 + String.valueOf(valueOf2).length() + String.valueOf(str).length() + String.valueOf(str2).length() + String.valueOf(str3).length()).append("ActivityContent fetchId: ").append(i).append(" score:").append(i2).append(" total_length:").append(i3).append("\n text: ").append(valueOf).append("\n viewableText").append(valueOf2).append("\n signture: ").append(str).append("\n viewableSignture: ").append(str2).append("\n viewableSignatureForVertical: ").append(str3).toString();
    }

    int zza(int i, int i2) {
        return (this.zzavi * i) + (this.zzavj * i2);
    }

    public void zza(String str, boolean z, float f, float f2, float f3, float f4) {
        zzc(str, z, f, f2, f3, f4);
        synchronized (this.zzako) {
            if (this.zzavs < 0) {
                zzkx.zzdg("ActivityContent: negative number of WebViews.");
            }
            zzje();
        }
    }

    public void zzb(String str, boolean z, float f, float f2, float f3, float f4) {
        zzc(str, z, f, f2, f3, f4);
    }

    public boolean zzix() {
        boolean z;
        synchronized (this.zzako) {
            z = this.zzavs == 0;
        }
        return z;
    }

    public String zziy() {
        return this.zzavu;
    }

    public String zziz() {
        return this.zzavv;
    }

    public String zzja() {
        return this.zzavw;
    }

    public void zzjb() {
        synchronized (this.zzako) {
            this.zzavt -= 100;
        }
    }

    public void zzjc() {
        synchronized (this.zzako) {
            this.zzavs--;
        }
    }

    public void zzjd() {
        synchronized (this.zzako) {
            this.zzavs++;
        }
    }

    public void zzje() {
        synchronized (this.zzako) {
            int zza = zza(this.zzavq, this.zzavr);
            if (zza > this.zzavt) {
                this.zzavt = zza;
                if (zzdr.zzbfa.get().booleanValue() && !com.google.android.gms.ads.internal.zzu.zzgq().zzuq()) {
                    this.zzavu = this.zzavl.zza(this.zzavn);
                    this.zzavv = this.zzavl.zza(this.zzavo);
                }
                if (zzdr.zzbfc.get().booleanValue() && !com.google.android.gms.ads.internal.zzu.zzgq().zzur()) {
                    this.zzavw = this.zzavm.zza(this.zzavo, this.zzavp);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzjf() {
        return this.zzavq;
    }

    public void zzn(int i) {
        this.zzavr = i;
    }
}
