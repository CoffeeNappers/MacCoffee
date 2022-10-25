package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcelable;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
@zzji
/* loaded from: classes.dex */
public class zzkp {
    private final Object zzako;
    private final zzkr zzaqj;
    private boolean zzcoo;
    private final LinkedList<zza> zzcsv;
    private final String zzcsw;
    private final String zzcsx;
    private long zzcsy;
    private long zzcsz;
    private long zzcta;
    private long zzctb;
    private long zzctc;
    private long zzctd;

    /* JADX INFO: Access modifiers changed from: private */
    @zzji
    /* loaded from: classes.dex */
    public static final class zza {
        private long zzcte = -1;
        private long zzctf = -1;

        public Bundle toBundle() {
            Bundle bundle = new Bundle();
            bundle.putLong("topen", this.zzcte);
            bundle.putLong("tclose", this.zzctf);
            return bundle;
        }

        public long zzuj() {
            return this.zzctf;
        }

        public void zzuk() {
            this.zzctf = SystemClock.elapsedRealtime();
        }

        public void zzul() {
            this.zzcte = SystemClock.elapsedRealtime();
        }
    }

    public zzkp(zzkr zzkrVar, String str, String str2) {
        this.zzako = new Object();
        this.zzcsy = -1L;
        this.zzcsz = -1L;
        this.zzcoo = false;
        this.zzcta = -1L;
        this.zzctb = 0L;
        this.zzctc = -1L;
        this.zzctd = -1L;
        this.zzaqj = zzkrVar;
        this.zzcsw = str;
        this.zzcsx = str2;
        this.zzcsv = new LinkedList<>();
    }

    public zzkp(String str, String str2) {
        this(com.google.android.gms.ads.internal.zzu.zzgq(), str, str2);
    }

    public Bundle toBundle() {
        Bundle bundle;
        synchronized (this.zzako) {
            bundle = new Bundle();
            bundle.putString("seq_num", this.zzcsw);
            bundle.putString("slotid", this.zzcsx);
            bundle.putBoolean("ismediation", this.zzcoo);
            bundle.putLong("treq", this.zzctc);
            bundle.putLong("tresponse", this.zzctd);
            bundle.putLong("timp", this.zzcsz);
            bundle.putLong("tload", this.zzcta);
            bundle.putLong("pcc", this.zzctb);
            bundle.putLong("tfetch", this.zzcsy);
            ArrayList<? extends Parcelable> arrayList = new ArrayList<>();
            Iterator<zza> it = this.zzcsv.iterator();
            while (it.hasNext()) {
                arrayList.add(it.next().toBundle());
            }
            bundle.putParcelableArrayList("tclick", arrayList);
        }
        return bundle;
    }

    public void zzad(boolean z) {
        synchronized (this.zzako) {
            if (this.zzctd != -1) {
                this.zzcta = SystemClock.elapsedRealtime();
                if (!z) {
                    this.zzcsz = this.zzcta;
                    this.zzaqj.zza(this);
                }
            }
        }
    }

    public void zzae(boolean z) {
        synchronized (this.zzako) {
            if (this.zzctd != -1) {
                this.zzcoo = z;
                this.zzaqj.zza(this);
            }
        }
    }

    public void zzm(long j) {
        synchronized (this.zzako) {
            this.zzctd = j;
            if (this.zzctd != -1) {
                this.zzaqj.zza(this);
            }
        }
    }

    public void zzn(long j) {
        synchronized (this.zzako) {
            if (this.zzctd != -1) {
                this.zzcsy = j;
                this.zzaqj.zza(this);
            }
        }
    }

    public void zzt(AdRequestParcel adRequestParcel) {
        synchronized (this.zzako) {
            this.zzctc = SystemClock.elapsedRealtime();
            this.zzaqj.zzut().zzb(adRequestParcel, this.zzctc);
        }
    }

    public void zzug() {
        synchronized (this.zzako) {
            if (this.zzctd != -1 && this.zzcsz == -1) {
                this.zzcsz = SystemClock.elapsedRealtime();
                this.zzaqj.zza(this);
            }
            this.zzaqj.zzut().zzug();
        }
    }

    public void zzuh() {
        synchronized (this.zzako) {
            if (this.zzctd != -1) {
                zza zzaVar = new zza();
                zzaVar.zzul();
                this.zzcsv.add(zzaVar);
                this.zzctb++;
                this.zzaqj.zzut().zzuh();
                this.zzaqj.zza(this);
            }
        }
    }

    public void zzui() {
        synchronized (this.zzako) {
            if (this.zzctd != -1 && !this.zzcsv.isEmpty()) {
                zza last = this.zzcsv.getLast();
                if (last.zzuj() == -1) {
                    last.zzuk();
                    this.zzaqj.zza(this);
                }
            }
        }
    }
}
