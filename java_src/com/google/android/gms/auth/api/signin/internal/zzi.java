package com.google.android.gms.auth.api.signin.internal;

import android.content.Context;
import android.os.Binder;
import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.internal.zzf;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
/* loaded from: classes2.dex */
public class zzi extends zzf.zza {
    private final Context mContext;

    public zzi(Context context) {
        this.mContext = context;
    }

    private void zzajh() {
        if (!GooglePlayServicesUtil.zzf(this.mContext, Binder.getCallingUid())) {
            throw new SecurityException(new StringBuilder(52).append("Calling UID ").append(Binder.getCallingUid()).append(" is not Google Play services.").toString());
        }
    }

    private void zzaji() {
        zzk zzba = zzk.zzba(this.mContext);
        GoogleSignInAccount zzajm = zzba.zzajm();
        GoogleSignInOptions googleSignInOptions = GoogleSignInOptions.DEFAULT_SIGN_IN;
        if (zzajm != null) {
            googleSignInOptions = zzba.zzajn();
        }
        GoogleApiClient build = new GoogleApiClient.Builder(this.mContext).addApi(Auth.GOOGLE_SIGN_IN_API, googleSignInOptions).build();
        try {
            if (build.blockingConnect().isSuccess()) {
                if (zzajm != null) {
                    Auth.GoogleSignInApi.revokeAccess(build);
                } else {
                    build.clearDefaultAccountAndReconnect();
                }
            }
        } finally {
            build.disconnect();
        }
    }

    @Override // com.google.android.gms.auth.api.signin.internal.zzf
    public void zzajg() {
        zzajh();
        zzaji();
    }
}
