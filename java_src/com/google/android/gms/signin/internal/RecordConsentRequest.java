package com.google.android.gms.signin.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class RecordConsentRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RecordConsentRequest> CREATOR = new zzf();
    private final Scope[] aDu;
    private final Account gj;
    private final String ju;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public RecordConsentRequest(int i, Account account, Scope[] scopeArr, String str) {
        this.mVersionCode = i;
        this.gj = account;
        this.aDu = scopeArr;
        this.ju = str;
    }

    public Account getAccount() {
        return this.gj;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }

    public String zzaix() {
        return this.ju;
    }

    public Scope[] zzcdk() {
        return this.aDu;
    }
}
