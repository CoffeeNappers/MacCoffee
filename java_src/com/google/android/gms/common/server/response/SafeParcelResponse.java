package com.google.android.gms.common.server.response;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.server.response.FastJsonResponse;
import com.google.android.gms.common.util.zzp;
import com.google.android.gms.common.util.zzq;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class SafeParcelResponse extends FastSafeParcelableJsonResponse {
    public static final Parcelable.Creator<SafeParcelResponse> CREATOR = new zze();
    private final FieldMappingDictionary Fo;
    private final Parcel Fv;
    private final int Fw = 2;
    private int Fx;
    private int Fy;
    private final String mClassName;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SafeParcelResponse(int i, Parcel parcel, FieldMappingDictionary fieldMappingDictionary) {
        this.mVersionCode = i;
        this.Fv = (Parcel) zzaa.zzy(parcel);
        this.Fo = fieldMappingDictionary;
        if (this.Fo == null) {
            this.mClassName = null;
        } else {
            this.mClassName = this.Fo.zzaxn();
        }
        this.Fx = 2;
    }

    private void zza(StringBuilder sb, int i, Object obj) {
        switch (i) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                sb.append(obj);
                return;
            case 7:
                sb.append("\"").append(zzp.zzii(obj.toString())).append("\"");
                return;
            case 8:
                sb.append("\"").append(com.google.android.gms.common.util.zzc.zzq((byte[]) obj)).append("\"");
                return;
            case 9:
                sb.append("\"").append(com.google.android.gms.common.util.zzc.zzr((byte[]) obj));
                sb.append("\"");
                return;
            case 10:
                zzq.zza(sb, (HashMap) obj);
                return;
            case 11:
                throw new IllegalArgumentException("Method does not accept concrete type.");
            default:
                throw new IllegalArgumentException(new StringBuilder(26).append("Unknown type = ").append(i).toString());
        }
    }

    private void zza(StringBuilder sb, FastJsonResponse.Field<?, ?> field, Parcel parcel, int i) {
        switch (field.zzaxc()) {
            case 0:
                zzb(sb, field, zza(field, Integer.valueOf(com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, i))));
                return;
            case 1:
                zzb(sb, field, zza(field, com.google.android.gms.common.internal.safeparcel.zza.zzk(parcel, i)));
                return;
            case 2:
                zzb(sb, field, zza(field, Long.valueOf(com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, i))));
                return;
            case 3:
                zzb(sb, field, zza(field, Float.valueOf(com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, i))));
                return;
            case 4:
                zzb(sb, field, zza(field, Double.valueOf(com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, i))));
                return;
            case 5:
                zzb(sb, field, zza(field, com.google.android.gms.common.internal.safeparcel.zza.zzp(parcel, i)));
                return;
            case 6:
                zzb(sb, field, zza(field, Boolean.valueOf(com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, i))));
                return;
            case 7:
                zzb(sb, field, zza(field, com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, i)));
                return;
            case 8:
            case 9:
                zzb(sb, field, zza(field, com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, i)));
                return;
            case 10:
                zzb(sb, field, zza(field, zzq(com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, i))));
                return;
            case 11:
                throw new IllegalArgumentException("Method does not accept concrete type.");
            default:
                throw new IllegalArgumentException(new StringBuilder(36).append("Unknown field out type = ").append(field.zzaxc()).toString());
        }
    }

    private void zza(StringBuilder sb, String str, FastJsonResponse.Field<?, ?> field, Parcel parcel, int i) {
        sb.append("\"").append(str).append("\":");
        if (field.zzaxi()) {
            zza(sb, field, parcel, i);
        } else {
            zzb(sb, field, parcel, i);
        }
    }

    private void zza(StringBuilder sb, Map<String, FastJsonResponse.Field<?, ?>> map, Parcel parcel) {
        SparseArray<Map.Entry<String, FastJsonResponse.Field<?, ?>>> zzax = zzax(map);
        sb.append('{');
        int zzcr = com.google.android.gms.common.internal.safeparcel.zza.zzcr(parcel);
        boolean z = false;
        while (parcel.dataPosition() < zzcr) {
            int zzcq = com.google.android.gms.common.internal.safeparcel.zza.zzcq(parcel);
            Map.Entry<String, FastJsonResponse.Field<?, ?>> entry = zzax.get(com.google.android.gms.common.internal.safeparcel.zza.zzgu(zzcq));
            if (entry != null) {
                if (z) {
                    sb.append(",");
                }
                zza(sb, entry.getKey(), entry.getValue(), parcel, zzcq);
                z = true;
            }
        }
        if (parcel.dataPosition() != zzcr) {
            throw new zza.C0048zza(new StringBuilder(37).append("Overread allowed size end=").append(zzcr).toString(), parcel);
        }
        sb.append('}');
    }

    private static SparseArray<Map.Entry<String, FastJsonResponse.Field<?, ?>>> zzax(Map<String, FastJsonResponse.Field<?, ?>> map) {
        SparseArray<Map.Entry<String, FastJsonResponse.Field<?, ?>>> sparseArray = new SparseArray<>();
        for (Map.Entry<String, FastJsonResponse.Field<?, ?>> entry : map.entrySet()) {
            sparseArray.put(entry.getValue().zzaxf(), entry);
        }
        return sparseArray;
    }

    private void zzb(StringBuilder sb, FastJsonResponse.Field<?, ?> field, Parcel parcel, int i) {
        if (field.zzaxd()) {
            sb.append("[");
            switch (field.zzaxc()) {
                case 0:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzw(parcel, i));
                    break;
                case 1:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzy(parcel, i));
                    break;
                case 2:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzx(parcel, i));
                    break;
                case 3:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzz(parcel, i));
                    break;
                case 4:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzaa(parcel, i));
                    break;
                case 5:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzab(parcel, i));
                    break;
                case 6:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzv(parcel, i));
                    break;
                case 7:
                    com.google.android.gms.common.util.zzb.zza(sb, com.google.android.gms.common.internal.safeparcel.zza.zzac(parcel, i));
                    break;
                case 8:
                case 9:
                case 10:
                    throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
                case 11:
                    Parcel[] zzag = com.google.android.gms.common.internal.safeparcel.zza.zzag(parcel, i);
                    int length = zzag.length;
                    for (int i2 = 0; i2 < length; i2++) {
                        if (i2 > 0) {
                            sb.append(",");
                        }
                        zzag[i2].setDataPosition(0);
                        zza(sb, field.zzaxk(), zzag[i2]);
                    }
                    break;
                default:
                    throw new IllegalStateException("Unknown field type out.");
            }
            sb.append("]");
            return;
        }
        switch (field.zzaxc()) {
            case 0:
                sb.append(com.google.android.gms.common.internal.safeparcel.zza.zzg(parcel, i));
                return;
            case 1:
                sb.append(com.google.android.gms.common.internal.safeparcel.zza.zzk(parcel, i));
                return;
            case 2:
                sb.append(com.google.android.gms.common.internal.safeparcel.zza.zzi(parcel, i));
                return;
            case 3:
                sb.append(com.google.android.gms.common.internal.safeparcel.zza.zzl(parcel, i));
                return;
            case 4:
                sb.append(com.google.android.gms.common.internal.safeparcel.zza.zzn(parcel, i));
                return;
            case 5:
                sb.append(com.google.android.gms.common.internal.safeparcel.zza.zzp(parcel, i));
                return;
            case 6:
                sb.append(com.google.android.gms.common.internal.safeparcel.zza.zzc(parcel, i));
                return;
            case 7:
                sb.append("\"").append(zzp.zzii(com.google.android.gms.common.internal.safeparcel.zza.zzq(parcel, i))).append("\"");
                return;
            case 8:
                sb.append("\"").append(com.google.android.gms.common.util.zzc.zzq(com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, i))).append("\"");
                return;
            case 9:
                sb.append("\"").append(com.google.android.gms.common.util.zzc.zzr(com.google.android.gms.common.internal.safeparcel.zza.zzt(parcel, i)));
                sb.append("\"");
                return;
            case 10:
                Bundle zzs = com.google.android.gms.common.internal.safeparcel.zza.zzs(parcel, i);
                Set<String> keySet = zzs.keySet();
                keySet.size();
                sb.append("{");
                boolean z = true;
                for (String str : keySet) {
                    if (!z) {
                        sb.append(",");
                    }
                    sb.append("\"").append(str).append("\"");
                    sb.append(":");
                    sb.append("\"").append(zzp.zzii(zzs.getString(str))).append("\"");
                    z = false;
                }
                sb.append("}");
                return;
            case 11:
                Parcel zzaf = com.google.android.gms.common.internal.safeparcel.zza.zzaf(parcel, i);
                zzaf.setDataPosition(0);
                zza(sb, field.zzaxk(), zzaf);
                return;
            default:
                throw new IllegalStateException("Unknown field type out");
        }
    }

    private void zzb(StringBuilder sb, FastJsonResponse.Field<?, ?> field, Object obj) {
        if (field.zzaxb()) {
            zzb(sb, field, (ArrayList) obj);
        } else {
            zza(sb, field.zzaxa(), obj);
        }
    }

    private void zzb(StringBuilder sb, FastJsonResponse.Field<?, ?> field, ArrayList<?> arrayList) {
        sb.append("[");
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (i != 0) {
                sb.append(",");
            }
            zza(sb, field.zzaxa(), arrayList.get(i));
        }
        sb.append("]");
    }

    public static HashMap<String, String> zzq(Bundle bundle) {
        HashMap<String, String> hashMap = new HashMap<>();
        for (String str : bundle.keySet()) {
            hashMap.put(str, bundle.getString(str));
        }
        return hashMap;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public String toString() {
        zzaa.zzb(this.Fo, "Cannot convert to JSON on client side.");
        Parcel zzaxp = zzaxp();
        zzaxp.setDataPosition(0);
        StringBuilder sb = new StringBuilder(100);
        zza(sb, this.Fo.zzig(this.mClassName), zzaxp);
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zze.zza(this, parcel, i);
    }

    @Override // com.google.android.gms.common.server.response.FastJsonResponse
    public Map<String, FastJsonResponse.Field<?, ?>> zzawz() {
        if (this.Fo == null) {
            return null;
        }
        return this.Fo.zzig(this.mClassName);
    }

    public Parcel zzaxp() {
        switch (this.Fx) {
            case 0:
                this.Fy = com.google.android.gms.common.internal.safeparcel.zzb.zzcs(this.Fv);
                com.google.android.gms.common.internal.safeparcel.zzb.zzaj(this.Fv, this.Fy);
                this.Fx = 2;
                break;
            case 1:
                com.google.android.gms.common.internal.safeparcel.zzb.zzaj(this.Fv, this.Fy);
                this.Fx = 2;
                break;
        }
        return this.Fv;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FieldMappingDictionary zzaxq() {
        switch (this.Fw) {
            case 0:
                return null;
            case 1:
                return this.Fo;
            case 2:
                return this.Fo;
            default:
                throw new IllegalStateException(new StringBuilder(34).append("Invalid creation type: ").append(this.Fw).toString());
        }
    }

    @Override // com.google.android.gms.common.server.response.FastSafeParcelableJsonResponse, com.google.android.gms.common.server.response.FastJsonResponse
    public Object zzic(String str) {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }

    @Override // com.google.android.gms.common.server.response.FastSafeParcelableJsonResponse, com.google.android.gms.common.server.response.FastJsonResponse
    public boolean zzid(String str) {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }
}
