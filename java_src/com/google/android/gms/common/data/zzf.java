package com.google.android.gms.common.data;

import java.util.ArrayList;
/* loaded from: classes2.dex */
public abstract class zzf<T> extends AbstractDataBuffer<T> {
    private boolean Cl;
    private ArrayList<Integer> Cm;

    protected zzf(DataHolder dataHolder) {
        super(dataHolder);
        this.Cl = false;
    }

    private void zzaur() {
        synchronized (this) {
            if (!this.Cl) {
                int count = this.zy.getCount();
                this.Cm = new ArrayList<>();
                if (count > 0) {
                    this.Cm.add(0);
                    String zzauq = zzauq();
                    String zzd = this.zy.zzd(zzauq, 0, this.zy.zzga(0));
                    int i = 1;
                    while (i < count) {
                        int zzga = this.zy.zzga(i);
                        String zzd2 = this.zy.zzd(zzauq, i, zzga);
                        if (zzd2 == null) {
                            throw new NullPointerException(new StringBuilder(String.valueOf(zzauq).length() + 78).append("Missing value for markerColumn: ").append(zzauq).append(", at row: ").append(i).append(", for window: ").append(zzga).toString());
                        }
                        if (!zzd2.equals(zzd)) {
                            this.Cm.add(Integer.valueOf(i));
                        } else {
                            zzd2 = zzd;
                        }
                        i++;
                        zzd = zzd2;
                    }
                }
                this.Cl = true;
            }
        }
    }

    @Override // com.google.android.gms.common.data.AbstractDataBuffer, com.google.android.gms.common.data.DataBuffer
    public final T get(int i) {
        zzaur();
        return zzn(zzge(i), zzgf(i));
    }

    @Override // com.google.android.gms.common.data.AbstractDataBuffer, com.google.android.gms.common.data.DataBuffer
    public int getCount() {
        zzaur();
        return this.Cm.size();
    }

    protected abstract String zzauq();

    protected String zzaus() {
        return null;
    }

    int zzge(int i) {
        if (i < 0 || i >= this.Cm.size()) {
            throw new IllegalArgumentException(new StringBuilder(53).append("Position ").append(i).append(" is out of bounds for this buffer").toString());
        }
        return this.Cm.get(i).intValue();
    }

    protected int zzgf(int i) {
        if (i < 0 || i == this.Cm.size()) {
            return 0;
        }
        int count = i == this.Cm.size() + (-1) ? this.zy.getCount() - this.Cm.get(i).intValue() : this.Cm.get(i + 1).intValue() - this.Cm.get(i).intValue();
        if (count != 1) {
            return count;
        }
        int zzge = zzge(i);
        int zzga = this.zy.zzga(zzge);
        String zzaus = zzaus();
        if (zzaus != null && this.zy.zzd(zzaus, zzge, zzga) == null) {
            return 0;
        }
        return count;
    }

    protected abstract T zzn(int i, int i2);
}
