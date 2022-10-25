package com.google.android.gms.internal;

import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzlh {
    private final String[] zzcwh;
    private final double[] zzcwi;
    private final double[] zzcwj;
    private final int[] zzcwk;
    private int zzcwl;

    /* loaded from: classes2.dex */
    public static class zza {
        public final int count;
        public final String name;
        public final double zzcwm;
        public final double zzcwn;
        public final double zzcwo;

        public zza(String str, double d, double d2, double d3, int i) {
            this.name = str;
            this.zzcwn = d;
            this.zzcwm = d2;
            this.zzcwo = d3;
            this.count = i;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            return com.google.android.gms.common.internal.zzz.equal(this.name, zzaVar.name) && this.zzcwm == zzaVar.zzcwm && this.zzcwn == zzaVar.zzcwn && this.count == zzaVar.count && Double.compare(this.zzcwo, zzaVar.zzcwo) == 0;
        }

        public int hashCode() {
            return com.google.android.gms.common.internal.zzz.hashCode(this.name, Double.valueOf(this.zzcwm), Double.valueOf(this.zzcwn), Double.valueOf(this.zzcwo), Integer.valueOf(this.count));
        }

        public String toString() {
            return com.google.android.gms.common.internal.zzz.zzx(this).zzg("name", this.name).zzg("minBound", Double.valueOf(this.zzcwn)).zzg("maxBound", Double.valueOf(this.zzcwm)).zzg("percent", Double.valueOf(this.zzcwo)).zzg(ServerKeys.COUNT, Integer.valueOf(this.count)).toString();
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb {
        private final List<String> zzcwp = new ArrayList();
        private final List<Double> zzcwq = new ArrayList();
        private final List<Double> zzcwr = new ArrayList();

        public zzb zza(String str, double d, double d2) {
            int i;
            int i2 = 0;
            while (true) {
                i = i2;
                if (i >= this.zzcwp.size()) {
                    break;
                }
                double doubleValue = this.zzcwr.get(i).doubleValue();
                double doubleValue2 = this.zzcwq.get(i).doubleValue();
                if (d < doubleValue || (doubleValue == d && d2 < doubleValue2)) {
                    break;
                }
                i2 = i + 1;
            }
            this.zzcwp.add(i, str);
            this.zzcwr.add(i, Double.valueOf(d));
            this.zzcwq.add(i, Double.valueOf(d2));
            return this;
        }

        public zzlh zzwi() {
            return new zzlh(this);
        }
    }

    private zzlh(zzb zzbVar) {
        int size = zzbVar.zzcwq.size();
        this.zzcwh = (String[]) zzbVar.zzcwp.toArray(new String[size]);
        this.zzcwi = zzn(zzbVar.zzcwq);
        this.zzcwj = zzn(zzbVar.zzcwr);
        this.zzcwk = new int[size];
        this.zzcwl = 0;
    }

    private double[] zzn(List<Double> list) {
        double[] dArr = new double[list.size()];
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < dArr.length) {
                dArr[i2] = list.get(i2).doubleValue();
                i = i2 + 1;
            } else {
                return dArr;
            }
        }
    }

    public List<zza> getBuckets() {
        ArrayList arrayList = new ArrayList(this.zzcwh.length);
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < this.zzcwh.length) {
                arrayList.add(new zza(this.zzcwh[i2], this.zzcwj[i2], this.zzcwi[i2], this.zzcwk[i2] / this.zzcwl, this.zzcwk[i2]));
                i = i2 + 1;
            } else {
                return arrayList;
            }
        }
    }

    public void zza(double d) {
        this.zzcwl++;
        for (int i = 0; i < this.zzcwj.length; i++) {
            if (this.zzcwj[i] <= d && d < this.zzcwi[i]) {
                int[] iArr = this.zzcwk;
                iArr[i] = iArr[i] + 1;
            }
            if (d < this.zzcwj[i]) {
                return;
            }
        }
    }
}
