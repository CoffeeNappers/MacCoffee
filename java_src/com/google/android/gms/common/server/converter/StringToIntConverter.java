package com.google.android.gms.common.server.converter;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.server.response.FastJsonResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: classes2.dex */
public final class StringToIntConverter extends AbstractSafeParcelable implements FastJsonResponse.zza<String, Integer> {
    public static final Parcelable.Creator<StringToIntConverter> CREATOR = new zzb();
    private final HashMap<String, Integer> Fb;
    private final SparseArray<String> Fc;
    private final ArrayList<Entry> Fd;
    final int mVersionCode;

    /* loaded from: classes2.dex */
    public static final class Entry extends AbstractSafeParcelable {
        public static final Parcelable.Creator<Entry> CREATOR = new zzc();
        final String Fe;
        final int Ff;
        final int versionCode;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Entry(int i, String str, int i2) {
            this.versionCode = i;
            this.Fe = str;
            this.Ff = i2;
        }

        Entry(String str, int i) {
            this.versionCode = 1;
            this.Fe = str;
            this.Ff = i;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            zzc.zza(this, parcel, i);
        }
    }

    public StringToIntConverter() {
        this.mVersionCode = 1;
        this.Fb = new HashMap<>();
        this.Fc = new SparseArray<>();
        this.Fd = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StringToIntConverter(int i, ArrayList<Entry> arrayList) {
        this.mVersionCode = i;
        this.Fb = new HashMap<>();
        this.Fc = new SparseArray<>();
        this.Fd = null;
        zzh(arrayList);
    }

    private void zzh(ArrayList<Entry> arrayList) {
        Iterator<Entry> it = arrayList.iterator();
        while (it.hasNext()) {
            Entry next = it.next();
            zzj(next.Fe, next.Ff);
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ArrayList<Entry> zzawy() {
        ArrayList<Entry> arrayList = new ArrayList<>();
        for (String str : this.Fb.keySet()) {
            arrayList.add(new Entry(str, this.Fb.get(str).intValue()));
        }
        return arrayList;
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse.zza
    /* renamed from: zzd */
    public String convertBack(Integer num) {
        String str = this.Fc.get(num.intValue());
        return (str != null || !this.Fb.containsKey("gms_unknown")) ? str : "gms_unknown";
    }

    public StringToIntConverter zzj(String str, int i) {
        this.Fb.put(str, Integer.valueOf(i));
        this.Fc.put(i, str);
        return this;
    }
}
