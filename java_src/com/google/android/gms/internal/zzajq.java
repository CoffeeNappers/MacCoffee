package com.google.android.gms.internal;

import com.google.firebase.database.DatabaseException;
import com.vk.media.camera.CameraUtilsEffects;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
/* loaded from: classes2.dex */
public class zzajq implements Comparable<zzajq>, Iterable<zzalz> {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final zzajq bdG;
    private final zzalz[] bdF;
    private final int end;
    private final int start;

    static {
        $assertionsDisabled = !zzajq.class.desiredAssertionStatus();
        bdG = new zzajq("");
    }

    public zzajq(String str) {
        int i;
        String[] split = str.split(CameraUtilsEffects.FILE_DELIM);
        int i2 = 0;
        for (String str2 : split) {
            if (str2.length() > 0) {
                i2++;
            }
        }
        this.bdF = new zzalz[i2];
        int length = split.length;
        int i3 = 0;
        int i4 = 0;
        while (i3 < length) {
            String str3 = split[i3];
            if (str3.length() > 0) {
                i = i4 + 1;
                this.bdF[i4] = zzalz.zzsx(str3);
            } else {
                i = i4;
            }
            i3++;
            i4 = i;
        }
        this.start = 0;
        this.end = this.bdF.length;
    }

    public zzajq(List<String> list) {
        this.bdF = new zzalz[list.size()];
        int i = 0;
        for (String str : list) {
            this.bdF[i] = zzalz.zzsx(str);
            i++;
        }
        this.start = 0;
        this.end = list.size();
    }

    public zzajq(zzalz... zzalzVarArr) {
        this.bdF = (zzalz[]) Arrays.copyOf(zzalzVarArr, zzalzVarArr.length);
        this.start = 0;
        this.end = zzalzVarArr.length;
        for (zzalz zzalzVar : zzalzVarArr) {
            if (!$assertionsDisabled && zzalzVar == null) {
                throw new AssertionError("Can't construct a path with a null value!");
            }
        }
    }

    private zzajq(zzalz[] zzalzVarArr, int i, int i2) {
        this.bdF = zzalzVarArr;
        this.start = i;
        this.end = i2;
    }

    public static zzajq zza(zzajq zzajqVar, zzajq zzajqVar2) {
        zzalz zzcvj = zzajqVar.zzcvj();
        zzalz zzcvj2 = zzajqVar2.zzcvj();
        if (zzcvj == null) {
            return zzajqVar2;
        }
        if (zzcvj.equals(zzcvj2)) {
            return zza(zzajqVar.zzcvk(), zzajqVar2.zzcvk());
        }
        String valueOf = String.valueOf(zzajqVar2);
        String valueOf2 = String.valueOf(zzajqVar);
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 37 + String.valueOf(valueOf2).length()).append("INTERNAL ERROR: ").append(valueOf).append(" is not contained in ").append(valueOf2).toString());
    }

    public static zzajq zzcvg() {
        return bdG;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzajq)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        zzajq zzajqVar = (zzajq) obj;
        if (size() != zzajqVar.size()) {
            return false;
        }
        int i = this.start;
        for (int i2 = zzajqVar.start; i < this.end && i2 < zzajqVar.end; i2++) {
            if (!this.bdF[i].equals(zzajqVar.bdF[i2])) {
                return false;
            }
            i++;
        }
        return true;
    }

    public int hashCode() {
        int i = 0;
        for (int i2 = this.start; i2 < this.end; i2++) {
            i = (i * 37) + this.bdF[i2].hashCode();
        }
        return i;
    }

    public boolean isEmpty() {
        return this.start >= this.end;
    }

    @Override // java.lang.Iterable
    public Iterator<zzalz> iterator() {
        return new Iterator<zzalz>() { // from class: com.google.android.gms.internal.zzajq.1
            int offset;

            {
                this.offset = zzajq.this.start;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.offset < zzajq.this.end;
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException("Can't remove component from immutable Path!");
            }

            @Override // java.util.Iterator
            /* renamed from: zzcvn */
            public zzalz next() {
                if (!hasNext()) {
                    throw new NoSuchElementException("No more elements.");
                }
                zzalz zzalzVar = zzajq.this.bdF[this.offset];
                this.offset++;
                return zzalzVar;
            }
        };
    }

    public int size() {
        return this.end - this.start;
    }

    public String toString() {
        if (isEmpty()) {
            return CameraUtilsEffects.FILE_DELIM;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = this.start; i < this.end; i++) {
            sb.append(CameraUtilsEffects.FILE_DELIM);
            sb.append(this.bdF[i].asString());
        }
        return sb.toString();
    }

    public zzajq zza(zzalz zzalzVar) {
        int size = size();
        zzalz[] zzalzVarArr = new zzalz[size + 1];
        System.arraycopy(this.bdF, this.start, zzalzVarArr, 0, size);
        zzalzVarArr[size] = zzalzVar;
        return new zzajq(zzalzVarArr, 0, size + 1);
    }

    public String zzcvh() {
        if (isEmpty()) {
            return CameraUtilsEffects.FILE_DELIM;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = this.start; i < this.end; i++) {
            if (i > this.start) {
                sb.append(CameraUtilsEffects.FILE_DELIM);
            }
            sb.append(this.bdF[i].asString());
        }
        return sb.toString();
    }

    public List<String> zzcvi() {
        ArrayList arrayList = new ArrayList(size());
        Iterator<zzalz> it = iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().asString());
        }
        return arrayList;
    }

    public zzalz zzcvj() {
        if (isEmpty()) {
            return null;
        }
        return this.bdF[this.start];
    }

    public zzajq zzcvk() {
        int i = this.start;
        if (!isEmpty()) {
            i++;
        }
        return new zzajq(this.bdF, i, this.end);
    }

    public zzajq zzcvl() {
        if (isEmpty()) {
            return null;
        }
        return new zzajq(this.bdF, this.start, this.end - 1);
    }

    public zzalz zzcvm() {
        if (!isEmpty()) {
            return this.bdF[this.end - 1];
        }
        return null;
    }

    public zzajq zzh(zzajq zzajqVar) {
        int size = size() + zzajqVar.size();
        zzalz[] zzalzVarArr = new zzalz[size];
        System.arraycopy(this.bdF, this.start, zzalzVarArr, 0, size());
        System.arraycopy(zzajqVar.bdF, zzajqVar.start, zzalzVarArr, size(), zzajqVar.size());
        return new zzajq(zzalzVarArr, 0, size);
    }

    public boolean zzi(zzajq zzajqVar) {
        if (size() > zzajqVar.size()) {
            return false;
        }
        int i = this.start;
        int i2 = zzajqVar.start;
        while (i < this.end) {
            if (!this.bdF[i].equals(zzajqVar.bdF[i2])) {
                return false;
            }
            i++;
            i2++;
        }
        return true;
    }

    @Override // java.lang.Comparable
    /* renamed from: zzj */
    public int compareTo(zzajq zzajqVar) {
        int i = this.start;
        int i2 = zzajqVar.start;
        while (i < this.end && i2 < zzajqVar.end) {
            int compareTo = this.bdF[i].compareTo(zzajqVar.bdF[i2]);
            if (compareTo != 0) {
                return compareTo;
            }
            i++;
            i2++;
        }
        if (i == this.end && i2 == zzajqVar.end) {
            return 0;
        }
        return i == this.end ? -1 : 1;
    }
}
