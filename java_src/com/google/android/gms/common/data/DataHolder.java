package com.google.android.gms.common.data;

import android.content.ContentValues;
import android.database.CharArrayBuffer;
import android.database.CursorIndexOutOfBoundsException;
import android.database.CursorWindow;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.google.android.gms.common.annotation.KeepName;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
@KeepName
/* loaded from: classes2.dex */
public final class DataHolder extends AbstractSafeParcelable implements Closeable {
    public static final Parcelable.Creator<DataHolder> CREATOR = new zze();
    private static final zza Cf = new zza(new String[0], null) { // from class: com.google.android.gms.common.data.DataHolder.1
        @Override // com.google.android.gms.common.data.DataHolder.zza
        public zza zza(ContentValues contentValues) {
            throw new UnsupportedOperationException("Cannot add data to empty builder");
        }

        @Override // com.google.android.gms.common.data.DataHolder.zza
        public zza zzb(HashMap<String, Object> hashMap) {
            throw new UnsupportedOperationException("Cannot add data to empty builder");
        }
    };
    private final String[] BY;
    Bundle BZ;
    private final CursorWindow[] Ca;
    private final Bundle Cb;
    int[] Cc;
    int Cd;
    private boolean Ce;
    boolean mClosed;
    final int mVersionCode;
    private final int uo;

    /* loaded from: classes2.dex */
    public static class zza {
        private final String[] BY;
        private final ArrayList<HashMap<String, Object>> Cg;
        private final String Ch;
        private final HashMap<Object, Integer> Ci;
        private boolean Cj;
        private String Ck;

        private zza(String[] strArr, String str) {
            this.BY = (String[]) zzaa.zzy(strArr);
            this.Cg = new ArrayList<>();
            this.Ch = str;
            this.Ci = new HashMap<>();
            this.Cj = false;
            this.Ck = null;
        }

        private int zzc(HashMap<String, Object> hashMap) {
            Object obj;
            if (this.Ch != null && (obj = hashMap.get(this.Ch)) != null) {
                Integer num = this.Ci.get(obj);
                if (num != null) {
                    return num.intValue();
                }
                this.Ci.put(obj, Integer.valueOf(this.Cg.size()));
                return -1;
            }
            return -1;
        }

        public zza zza(ContentValues contentValues) {
            com.google.android.gms.common.internal.zzc.zzu(contentValues);
            HashMap<String, Object> hashMap = new HashMap<>(contentValues.size());
            for (Map.Entry<String, Object> entry : contentValues.valueSet()) {
                hashMap.put(entry.getKey(), entry.getValue());
            }
            return zzb(hashMap);
        }

        public zza zzb(HashMap<String, Object> hashMap) {
            com.google.android.gms.common.internal.zzc.zzu(hashMap);
            int zzc = zzc(hashMap);
            if (zzc == -1) {
                this.Cg.add(hashMap);
            } else {
                this.Cg.remove(zzc);
                this.Cg.add(zzc, hashMap);
            }
            this.Cj = false;
            return this;
        }

        public DataHolder zzgc(int i) {
            return new DataHolder(this, i, (Bundle) null);
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb extends RuntimeException {
        public zzb(String str) {
            super(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DataHolder(int i, String[] strArr, CursorWindow[] cursorWindowArr, int i2, Bundle bundle) {
        this.mClosed = false;
        this.Ce = true;
        this.mVersionCode = i;
        this.BY = strArr;
        this.Ca = cursorWindowArr;
        this.uo = i2;
        this.Cb = bundle;
    }

    private DataHolder(zza zzaVar, int i, Bundle bundle) {
        this(zzaVar.BY, zza(zzaVar, -1), i, bundle);
    }

    public DataHolder(String[] strArr, CursorWindow[] cursorWindowArr, int i, Bundle bundle) {
        this.mClosed = false;
        this.Ce = true;
        this.mVersionCode = 1;
        this.BY = (String[]) zzaa.zzy(strArr);
        this.Ca = (CursorWindow[]) zzaa.zzy(cursorWindowArr);
        this.uo = i;
        this.Cb = bundle;
        zzaun();
    }

    public static DataHolder zza(int i, Bundle bundle) {
        return new DataHolder(Cf, i, bundle);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v38, types: [java.util.List] */
    private static CursorWindow[] zza(zza zzaVar, int i) {
        int i2;
        boolean z;
        CursorWindow cursorWindow;
        if (zzaVar.BY.length == 0) {
            return new CursorWindow[0];
        }
        ArrayList subList = (i < 0 || i >= zzaVar.Cg.size()) ? zzaVar.Cg : zzaVar.Cg.subList(0, i);
        int size = subList.size();
        CursorWindow cursorWindow2 = new CursorWindow(false);
        ArrayList arrayList = new ArrayList();
        arrayList.add(cursorWindow2);
        cursorWindow2.setNumColumns(zzaVar.BY.length);
        int i3 = 0;
        boolean z2 = false;
        while (i3 < size) {
            try {
                if (!cursorWindow2.allocRow()) {
                    Log.d("DataHolder", new StringBuilder(72).append("Allocating additional cursor window for large data set (row ").append(i3).append(")").toString());
                    cursorWindow2 = new CursorWindow(false);
                    cursorWindow2.setStartPosition(i3);
                    cursorWindow2.setNumColumns(zzaVar.BY.length);
                    arrayList.add(cursorWindow2);
                    if (!cursorWindow2.allocRow()) {
                        Log.e("DataHolder", "Unable to allocate row to hold data.");
                        arrayList.remove(cursorWindow2);
                        return (CursorWindow[]) arrayList.toArray(new CursorWindow[arrayList.size()]);
                    }
                }
                Map map = (Map) subList.get(i3);
                boolean z3 = true;
                for (int i4 = 0; i4 < zzaVar.BY.length && z3; i4++) {
                    String str = zzaVar.BY[i4];
                    Object obj = map.get(str);
                    if (obj == null) {
                        z3 = cursorWindow2.putNull(i3, i4);
                    } else if (obj instanceof String) {
                        z3 = cursorWindow2.putString((String) obj, i3, i4);
                    } else if (obj instanceof Long) {
                        z3 = cursorWindow2.putLong(((Long) obj).longValue(), i3, i4);
                    } else if (obj instanceof Integer) {
                        z3 = cursorWindow2.putLong(((Integer) obj).intValue(), i3, i4);
                    } else if (obj instanceof Boolean) {
                        z3 = cursorWindow2.putLong(((Boolean) obj).booleanValue() ? 1L : 0L, i3, i4);
                    } else if (obj instanceof byte[]) {
                        z3 = cursorWindow2.putBlob((byte[]) obj, i3, i4);
                    } else if (obj instanceof Double) {
                        z3 = cursorWindow2.putDouble(((Double) obj).doubleValue(), i3, i4);
                    } else if (!(obj instanceof Float)) {
                        String valueOf = String.valueOf(obj);
                        throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 32 + String.valueOf(valueOf).length()).append("Unsupported object for column ").append(str).append(": ").append(valueOf).toString());
                    } else {
                        z3 = cursorWindow2.putDouble(((Float) obj).floatValue(), i3, i4);
                    }
                }
                if (z3) {
                    i2 = i3;
                    z = false;
                    cursorWindow = cursorWindow2;
                } else if (z2) {
                    throw new zzb("Could not add the value to a new CursorWindow. The size of value may be larger than what a CursorWindow can handle.");
                } else {
                    Log.d("DataHolder", new StringBuilder(74).append("Couldn't populate window data for row ").append(i3).append(" - allocating new window.").toString());
                    cursorWindow2.freeLastRow();
                    CursorWindow cursorWindow3 = new CursorWindow(false);
                    cursorWindow3.setStartPosition(i3);
                    cursorWindow3.setNumColumns(zzaVar.BY.length);
                    arrayList.add(cursorWindow3);
                    i2 = i3 - 1;
                    cursorWindow = cursorWindow3;
                    z = true;
                }
                z2 = z;
                cursorWindow2 = cursorWindow;
                i3 = i2 + 1;
            } catch (RuntimeException e) {
                int size2 = arrayList.size();
                for (int i5 = 0; i5 < size2; i5++) {
                    ((CursorWindow) arrayList.get(i5)).close();
                }
                throw e;
            }
        }
        return (CursorWindow[]) arrayList.toArray(new CursorWindow[arrayList.size()]);
    }

    public static zza zzc(String[] strArr) {
        return new zza(strArr, null);
    }

    public static DataHolder zzgb(int i) {
        return zza(i, (Bundle) null);
    }

    private void zzi(String str, int i) {
        if (this.BZ == null || !this.BZ.containsKey(str)) {
            String valueOf = String.valueOf(str);
            throw new IllegalArgumentException(valueOf.length() != 0 ? "No such column: ".concat(valueOf) : new String("No such column: "));
        } else if (isClosed()) {
            throw new IllegalArgumentException("Buffer is closed.");
        } else {
            if (i >= 0 && i < this.Cd) {
                return;
            }
            throw new CursorIndexOutOfBoundsException(i, this.Cd);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        synchronized (this) {
            if (!this.mClosed) {
                this.mClosed = true;
                for (int i = 0; i < this.Ca.length; i++) {
                    this.Ca[i].close();
                }
            }
        }
    }

    protected void finalize() throws Throwable {
        try {
            if (this.Ce && this.Ca.length > 0 && !isClosed()) {
                close();
                String valueOf = String.valueOf(toString());
                Log.e("DataBuffer", new StringBuilder(String.valueOf(valueOf).length() + 178).append("Internal data leak within a DataBuffer object detected!  Be sure to explicitly call release() on all DataBuffer extending objects when you are done with them. (internal object: ").append(valueOf).append(")").toString());
            }
        } finally {
            super.finalize();
        }
    }

    public int getCount() {
        return this.Cd;
    }

    public int getStatusCode() {
        return this.uo;
    }

    public boolean isClosed() {
        boolean z;
        synchronized (this) {
            z = this.mClosed;
        }
        return z;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zze.zza(this, parcel, i);
    }

    public void zza(String str, int i, int i2, CharArrayBuffer charArrayBuffer) {
        zzi(str, i);
        this.Ca[i2].copyStringToBuffer(i, this.BZ.getInt(str), charArrayBuffer);
    }

    public Bundle zzaui() {
        return this.Cb;
    }

    public void zzaun() {
        this.BZ = new Bundle();
        for (int i = 0; i < this.BY.length; i++) {
            this.BZ.putInt(this.BY[i], i);
        }
        this.Cc = new int[this.Ca.length];
        int i2 = 0;
        for (int i3 = 0; i3 < this.Ca.length; i3++) {
            this.Cc[i3] = i2;
            i2 += this.Ca[i3].getNumRows() - (i2 - this.Ca[i3].getStartPosition());
        }
        this.Cd = i2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String[] zzauo() {
        return this.BY;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CursorWindow[] zzaup() {
        return this.Ca;
    }

    public long zzb(String str, int i, int i2) {
        zzi(str, i);
        return this.Ca[i2].getLong(i, this.BZ.getInt(str));
    }

    public int zzc(String str, int i, int i2) {
        zzi(str, i);
        return this.Ca[i2].getInt(i, this.BZ.getInt(str));
    }

    public String zzd(String str, int i, int i2) {
        zzi(str, i);
        return this.Ca[i2].getString(i, this.BZ.getInt(str));
    }

    public boolean zze(String str, int i, int i2) {
        zzi(str, i);
        return Long.valueOf(this.Ca[i2].getLong(i, this.BZ.getInt(str))).longValue() == 1;
    }

    public float zzf(String str, int i, int i2) {
        zzi(str, i);
        return this.Ca[i2].getFloat(i, this.BZ.getInt(str));
    }

    public byte[] zzg(String str, int i, int i2) {
        zzi(str, i);
        return this.Ca[i2].getBlob(i, this.BZ.getInt(str));
    }

    public int zzga(int i) {
        int i2 = 0;
        zzaa.zzbs(i >= 0 && i < this.Cd);
        while (true) {
            if (i2 >= this.Cc.length) {
                break;
            } else if (i < this.Cc[i2]) {
                i2--;
                break;
            } else {
                i2++;
            }
        }
        return i2 == this.Cc.length ? i2 - 1 : i2;
    }

    public Uri zzh(String str, int i, int i2) {
        String zzd = zzd(str, i, i2);
        if (zzd == null) {
            return null;
        }
        return Uri.parse(zzd);
    }

    public boolean zzho(String str) {
        return this.BZ.containsKey(str);
    }

    public boolean zzi(String str, int i, int i2) {
        zzi(str, i);
        return this.Ca[i2].isNull(i, this.BZ.getInt(str));
    }
}
