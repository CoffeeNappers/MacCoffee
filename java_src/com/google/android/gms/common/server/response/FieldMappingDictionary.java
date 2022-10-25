package com.google.android.gms.common.server.response;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.server.response.FastJsonResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class FieldMappingDictionary extends AbstractSafeParcelable {
    public static final Parcelable.Creator<FieldMappingDictionary> CREATOR = new zzc();
    private final HashMap<String, Map<String, FastJsonResponse.Field<?, ?>>> Fq;
    private final ArrayList<Entry> Fr = null;
    private final String Fs;
    final int mVersionCode;

    /* loaded from: classes2.dex */
    public static class Entry extends AbstractSafeParcelable {
        public static final Parcelable.Creator<Entry> CREATOR = new zzd();
        final ArrayList<FieldMapPair> Ft;
        final String className;
        final int versionCode;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Entry(int i, String str, ArrayList<FieldMapPair> arrayList) {
            this.versionCode = i;
            this.className = str;
            this.Ft = arrayList;
        }

        Entry(String str, Map<String, FastJsonResponse.Field<?, ?>> map) {
            this.versionCode = 1;
            this.className = str;
            this.Ft = zzaw(map);
        }

        private static ArrayList<FieldMapPair> zzaw(Map<String, FastJsonResponse.Field<?, ?>> map) {
            if (map == null) {
                return null;
            }
            ArrayList<FieldMapPair> arrayList = new ArrayList<>();
            for (String str : map.keySet()) {
                arrayList.add(new FieldMapPair(str, map.get(str)));
            }
            return arrayList;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            zzd.zza(this, parcel, i);
        }

        HashMap<String, FastJsonResponse.Field<?, ?>> zzaxo() {
            HashMap<String, FastJsonResponse.Field<?, ?>> hashMap = new HashMap<>();
            int size = this.Ft.size();
            for (int i = 0; i < size; i++) {
                FieldMapPair fieldMapPair = this.Ft.get(i);
                hashMap.put(fieldMapPair.zzcb, fieldMapPair.Fu);
            }
            return hashMap;
        }
    }

    /* loaded from: classes2.dex */
    public static class FieldMapPair extends AbstractSafeParcelable {
        public static final Parcelable.Creator<FieldMapPair> CREATOR = new zzb();
        final FastJsonResponse.Field<?, ?> Fu;
        final int versionCode;
        final String zzcb;

        /* JADX INFO: Access modifiers changed from: package-private */
        public FieldMapPair(int i, String str, FastJsonResponse.Field<?, ?> field) {
            this.versionCode = i;
            this.zzcb = str;
            this.Fu = field;
        }

        FieldMapPair(String str, FastJsonResponse.Field<?, ?> field) {
            this.versionCode = 1;
            this.zzcb = str;
            this.Fu = field;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            zzb.zza(this, parcel, i);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FieldMappingDictionary(int i, ArrayList<Entry> arrayList, String str) {
        this.mVersionCode = i;
        this.Fq = zzi(arrayList);
        this.Fs = (String) zzaa.zzy(str);
        zzaxl();
    }

    private static HashMap<String, Map<String, FastJsonResponse.Field<?, ?>>> zzi(ArrayList<Entry> arrayList) {
        HashMap<String, Map<String, FastJsonResponse.Field<?, ?>>> hashMap = new HashMap<>();
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            Entry entry = arrayList.get(i);
            hashMap.put(entry.className, entry.zzaxo());
        }
        return hashMap;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (String str : this.Fq.keySet()) {
            sb.append(str).append(":\n");
            Map<String, FastJsonResponse.Field<?, ?>> map = this.Fq.get(str);
            for (String str2 : map.keySet()) {
                sb.append("  ").append(str2).append(": ");
                sb.append(map.get(str2));
            }
        }
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }

    public void zzaxl() {
        for (String str : this.Fq.keySet()) {
            Map<String, FastJsonResponse.Field<?, ?>> map = this.Fq.get(str);
            for (String str2 : map.keySet()) {
                map.get(str2).zza(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ArrayList<Entry> zzaxm() {
        ArrayList<Entry> arrayList = new ArrayList<>();
        for (String str : this.Fq.keySet()) {
            arrayList.add(new Entry(str, this.Fq.get(str)));
        }
        return arrayList;
    }

    public String zzaxn() {
        return this.Fs;
    }

    public Map<String, FastJsonResponse.Field<?, ?>> zzig(String str) {
        return this.Fq.get(str);
    }
}
