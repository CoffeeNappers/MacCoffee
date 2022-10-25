package com.google.firebase.appindexing.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.firebase.appindexing.Action;
/* loaded from: classes.dex */
public class ActionImpl extends AbstractSafeParcelable implements Action {
    public static final Parcelable.Creator<ActionImpl> CREATOR = new zza();
    private final String aWl;
    private final String aWm;
    private final String aWn;
    private final String aWo;
    private final MetadataImpl aWp;
    private final String aWq;
    public final int mVersionCode;

    /* loaded from: classes.dex */
    public static class MetadataImpl extends AbstractSafeParcelable {
        public static final Parcelable.Creator<MetadataImpl> CREATOR = new zzi();
        private final String aWA;
        private final byte[] aWB;
        private final boolean aWs;
        private final boolean aWt;
        private int gX;
        private final String hy;
        public final int mVersionCode;

        /* JADX INFO: Access modifiers changed from: package-private */
        public MetadataImpl(int i, int i2, boolean z, String str, String str2, byte[] bArr, boolean z2) {
            this.gX = 0;
            this.mVersionCode = i;
            this.gX = i2;
            this.aWs = z;
            this.aWA = str;
            this.hy = str2;
            this.aWB = bArr;
            this.aWt = z2;
        }

        public MetadataImpl(boolean z, String str, String str2, byte[] bArr, boolean z2) {
            this.gX = 0;
            this.mVersionCode = 1;
            this.aWs = z;
            this.aWA = str;
            this.hy = str2;
            this.aWB = bArr;
            this.aWt = z2;
        }

        public String getAccountName() {
            return this.hy;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("MetadataImpl { ");
            sb.append("{ eventStatus: '").append(this.gX).append("' } ");
            sb.append("{ uploadable: '").append(this.aWs).append("' } ");
            if (this.aWA != null) {
                sb.append("{ completionToken: '").append(this.aWA).append("' } ");
            }
            if (this.hy != null) {
                sb.append("{ accountName: '").append(this.hy).append("' } ");
            }
            if (this.aWB != null) {
                sb.append("{ ssbContext: [ ");
                for (byte b : this.aWB) {
                    sb.append("0x").append(Integer.toHexString(b)).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                }
                sb.append("] } ");
            }
            sb.append("{ contextOnly: '").append(this.aWt).append("' } ");
            sb.append("}");
            return sb.toString();
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            zzi.zza(this, parcel, i);
        }

        public void zzaey(int i) {
            this.gX = i;
        }

        public int zzcoh() {
            return this.gX;
        }

        public boolean zzcoi() {
            return this.aWs;
        }

        public String zzcoj() {
            return this.aWA;
        }

        public byte[] zzcok() {
            return this.aWB;
        }

        public boolean zzcol() {
            return this.aWt;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ActionImpl(int i, String str, String str2, String str3, String str4, MetadataImpl metadataImpl, String str5) {
        this.mVersionCode = i;
        this.aWl = str;
        this.aWm = str2;
        this.aWn = str3;
        this.aWo = str4;
        this.aWp = metadataImpl;
        this.aWq = str5;
    }

    public ActionImpl(@NonNull String str, @NonNull String str2, @NonNull String str3, String str4, @NonNull MetadataImpl metadataImpl, String str5) {
        this.mVersionCode = 1;
        this.aWl = str;
        this.aWm = str2;
        this.aWn = str3;
        this.aWo = str4;
        this.aWp = metadataImpl;
        this.aWq = str5;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ActionImpl { ");
        sb.append("{ actionType: '").append(this.aWl).append("' } ");
        sb.append("{ objectName: '").append(this.aWm).append("' } ");
        sb.append("{ objectUrl: '").append(this.aWn).append("' } ");
        if (this.aWo != null) {
            sb.append("{ objectSameAs: '").append(this.aWo).append("' } ");
        }
        if (this.aWp != null) {
            sb.append("{ metadata: '").append(this.aWp.toString()).append("' } ");
        }
        if (this.aWq != null) {
            sb.append("{ actionStatus: '").append(this.aWq).append("' } ");
        }
        sb.append("}");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }

    public String zzcob() {
        return this.aWl;
    }

    public String zzcoc() {
        return this.aWm;
    }

    public String zzcod() {
        return this.aWn;
    }

    public String zzcoe() {
        return this.aWo;
    }

    public MetadataImpl zzcof() {
        return this.aWp;
    }

    public String zzcog() {
        return this.aWq;
    }
}
