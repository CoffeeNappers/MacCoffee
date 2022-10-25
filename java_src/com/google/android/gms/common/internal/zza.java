package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Binder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.internal.zzp;
/* loaded from: classes2.dex */
public class zza extends zzp.zza {
    int De;

    public static Account zza(zzp zzpVar) {
        Account account = null;
        if (zzpVar != null) {
            long clearCallingIdentity = Binder.clearCallingIdentity();
            try {
                account = zzpVar.getAccount();
            } catch (RemoteException e) {
                Log.w("AccountAccessor", "Remote account accessor probably died");
            } finally {
                Binder.restoreCallingIdentity(clearCallingIdentity);
            }
        }
        return account;
    }

    public boolean equals(Object obj) {
        Account account = null;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zza)) {
            return false;
        }
        zza zzaVar = (zza) obj;
        return account.equals(null);
    }

    @Override // com.google.android.gms.common.internal.zzp
    public Account getAccount() {
        int callingUid = Binder.getCallingUid();
        if (callingUid != this.De) {
            if (!com.google.android.gms.common.zze.zzf(null, callingUid)) {
                throw new SecurityException("Caller is not GooglePlayServices");
            }
            this.De = callingUid;
        }
        return null;
    }
}
