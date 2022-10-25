package com.google.android.gms.appdatasearch;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.List;
/* loaded from: classes2.dex */
public class GetRecentContextCall {

    /* loaded from: classes2.dex */
    public static class Request extends AbstractSafeParcelable {
        public static final Parcelable.Creator<Request> CREATOR = new zzf();
        public final Account gt;
        public final boolean gu;
        public final boolean gv;
        public final boolean gw;
        public final String gx;
        final int mVersionCode;

        public Request() {
            this(null, false, false, false, null);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public Request(int i, Account account, boolean z, boolean z2, boolean z3, String str) {
            this.mVersionCode = i;
            this.gt = account;
            this.gu = z;
            this.gv = z2;
            this.gw = z3;
            this.gx = str;
        }

        public Request(Account account, boolean z, boolean z2, boolean z3, String str) {
            this(1, account, z, z2, z3, str);
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            zzf.zza(this, parcel, i);
        }
    }

    /* loaded from: classes.dex */
    public static class Response extends AbstractSafeParcelable implements Result {
        public static final Parcelable.Creator<Response> CREATOR = new zzg();
        @Deprecated
        public String[] gA;
        public Status gy;
        public List<UsageInfo> gz;
        final int mVersionCode;

        public Response() {
            this.mVersionCode = 1;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public Response(int i, Status status, List<UsageInfo> list, String[] strArr) {
            this.mVersionCode = i;
            this.gy = status;
            this.gz = list;
            this.gA = strArr;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.gy;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            zzg.zza(this, parcel, i);
        }
    }
}
