package com.google.android.gms.auth;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes.dex */
public class AccountChangeEventsRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AccountChangeEventsRequest> CREATOR = new zzb();
    Account gj;
    int hA;
    @Deprecated
    String hy;
    final int mVersion;

    public AccountChangeEventsRequest() {
        this.mVersion = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AccountChangeEventsRequest(int i, int i2, String str, Account account) {
        this.mVersion = i;
        this.hA = i2;
        this.hy = str;
        if (account != null || TextUtils.isEmpty(str)) {
            this.gj = account;
        } else {
            this.gj = new Account(str, "com.google");
        }
    }

    public Account getAccount() {
        return this.gj;
    }

    @Deprecated
    public String getAccountName() {
        return this.hy;
    }

    public int getEventIndex() {
        return this.hA;
    }

    public AccountChangeEventsRequest setAccount(Account account) {
        this.gj = account;
        return this;
    }

    @Deprecated
    public AccountChangeEventsRequest setAccountName(String str) {
        this.hy = str;
        return this;
    }

    public AccountChangeEventsRequest setEventIndex(int i) {
        this.hA = i;
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }
}
