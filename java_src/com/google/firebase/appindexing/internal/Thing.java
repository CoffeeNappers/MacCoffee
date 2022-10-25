package com.google.firebase.appindexing.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import com.google.firebase.appindexing.Indexable;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Set;
/* loaded from: classes2.dex */
public final class Thing extends AbstractSafeParcelable implements ReflectedParcelable, Indexable {
    public static final Parcelable.Creator<Thing> CREATOR = new zzj();
    private final Metadata aWz;
    private final Bundle he;
    public final int mVersionCode;
    private final String zzboa;
    private final String zzcpo;

    /* loaded from: classes2.dex */
    public static class Metadata extends AbstractSafeParcelable {
        public static final Parcelable.Creator<Metadata> CREATOR = new zzh();
        private final boolean aWx;
        private String aWy;
        public final int mVersionCode;
        private int zzavt;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Metadata(int i, boolean z, int i2, String str) {
            this.mVersionCode = i;
            this.aWx = z;
            this.zzavt = i2;
            this.aWy = str;
        }

        public Metadata(boolean z, int i, String str) {
            this.mVersionCode = 1;
            this.aWx = z;
            this.zzavt = i;
            this.aWy = str;
        }

        public boolean equals(Object obj) {
            if (obj instanceof Metadata) {
                Metadata metadata = (Metadata) obj;
                return zzz.equal(Boolean.valueOf(this.aWx), Boolean.valueOf(metadata.aWx)) && zzz.equal(Integer.valueOf(this.zzavt), Integer.valueOf(metadata.zzavt)) && zzz.equal(this.aWy, metadata.aWy);
            }
            return false;
        }

        public int getScore() {
            return this.zzavt;
        }

        public int hashCode() {
            return zzz.hashCode(Boolean.valueOf(this.aWx), Integer.valueOf(this.zzavt), this.aWy);
        }

        public String toString() {
            String str = "";
            if (!zzcoq().isEmpty()) {
                String valueOf = String.valueOf(zzcoq());
                str = valueOf.length() != 0 ? ", accountEmail: ".concat(valueOf) : new String(", accountEmail: ");
            }
            return new StringBuilder(String.valueOf(str).length() + 39).append("worksOffline: ").append(zzcop()).append(", score: ").append(getScore()).append(str).toString();
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            zzh.zza(this, parcel, i);
        }

        public boolean zzcop() {
            return this.aWx;
        }

        public String zzcoq() {
            return this.aWy;
        }
    }

    public Thing(int i, Bundle bundle, Metadata metadata, String str, String str2) {
        this.mVersionCode = i;
        this.he = bundle;
        this.aWz = metadata;
        this.zzboa = str;
        this.zzcpo = str2;
        this.he.setClassLoader(getClass().getClassLoader());
    }

    public Thing(@NonNull Bundle bundle, @NonNull Metadata metadata, String str, @NonNull String str2) {
        this.mVersionCode = 6;
        this.he = bundle;
        this.aWz = metadata;
        this.zzboa = str;
        this.zzcpo = str2;
    }

    public String getId() {
        return this.zzboa;
    }

    public String getType() {
        return this.zzcpo;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public String toString() {
        String sb;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(zzcoo()).append(" { ");
        StringBuilder append = sb2.append("{ id: ");
        if (getId() == null) {
            sb = "<null> } ";
        } else {
            String valueOf = String.valueOf(getId());
            sb = new StringBuilder(String.valueOf(valueOf).length() + 5).append("'").append(valueOf).append("' } ").toString();
        }
        append.append(sb);
        sb2.append("Properties { ");
        Set<String> keySet = this.he.keySet();
        String[] strArr = (String[]) keySet.toArray(new String[keySet.size()]);
        Arrays.sort(strArr);
        for (String str : strArr) {
            sb2.append("{ key: '").append(str).append("' value: ");
            Object obj = this.he.get(str);
            if (obj == null) {
                sb2.append("<null>");
            } else if (obj.getClass().isArray()) {
                sb2.append("[ ");
                for (int i = 0; i < Array.getLength(obj); i++) {
                    sb2.append("'").append(Array.get(obj, i)).append("' ");
                }
                sb2.append("]");
            } else {
                sb2.append(obj.toString());
            }
            sb2.append(" } ");
        }
        sb2.append("} ");
        sb2.append("Metadata { ");
        sb2.append(this.aWz.toString());
        sb2.append(" } ");
        sb2.append("}");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzj.zza(this, parcel, i);
    }

    public Bundle zzahu() {
        return this.he;
    }

    public Metadata zzcon() {
        return this.aWz;
    }

    public String zzcoo() {
        return this.zzcpo.equals("Thing") ? "Indexable" : this.zzcpo;
    }
}
