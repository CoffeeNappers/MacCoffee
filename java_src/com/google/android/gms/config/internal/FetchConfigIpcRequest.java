package com.google.android.gms.config.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.List;
/* loaded from: classes2.dex */
public class FetchConfigIpcRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<FetchConfigIpcRequest> CREATOR = new zzg();
    private final int GU;
    private final List<AnalyticsUserProperty> GV;
    private final long He;
    private final DataHolder Hf;
    private final String Hg;
    private final String Hh;
    private final String Hi;
    private final List<String> Hj;
    public final int mVersionCode;
    private final String zzcjc;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FetchConfigIpcRequest(int i, String str, long j, DataHolder dataHolder, String str2, String str3, String str4, List<String> list, int i2, List<AnalyticsUserProperty> list2) {
        this.mVersionCode = i;
        this.zzcjc = str;
        this.He = j;
        this.Hf = dataHolder;
        this.Hg = str2;
        this.Hh = str3;
        this.Hi = str4;
        this.Hj = list;
        this.GU = i2;
        this.GV = list2;
    }

    public FetchConfigIpcRequest(String str, long j, DataHolder dataHolder, String str2, String str3, String str4, List<String> list, int i, List<AnalyticsUserProperty> list2) {
        this(2, str, j, dataHolder, str2, str3, str4, list, i, list2);
    }

    public String getPackageName() {
        return this.zzcjc;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzg.zza(this, parcel, i);
    }

    public int zzazh() {
        return this.GU;
    }

    public long zzazk() {
        return this.He;
    }

    public DataHolder zzazl() {
        return this.Hf;
    }

    public String zzazm() {
        return this.Hg;
    }

    public String zzazn() {
        return this.Hh;
    }

    public String zzazo() {
        return this.Hi;
    }

    public List<String> zzazp() {
        return this.Hj;
    }

    public List<AnalyticsUserProperty> zzazq() {
        return this.GV;
    }
}
