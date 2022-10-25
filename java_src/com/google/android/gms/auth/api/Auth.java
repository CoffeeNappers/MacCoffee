package com.google.android.gms.auth.api;

import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.auth.api.credentials.CredentialsApi;
import com.google.android.gms.auth.api.credentials.PasswordSpecification;
import com.google.android.gms.auth.api.credentials.internal.zze;
import com.google.android.gms.auth.api.credentials.internal.zzg;
import com.google.android.gms.auth.api.proxy.ProxyApi;
import com.google.android.gms.auth.api.signin.GoogleSignInApi;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.internal.zzc;
import com.google.android.gms.auth.api.signin.internal.zzd;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzns;
import com.google.android.gms.internal.zznt;
import com.google.android.gms.internal.zznu;
import com.google.android.gms.internal.zzoc;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public final class Auth {
    public static final Api.zzf<zzg> hX = new Api.zzf<>();
    public static final Api.zzf<zznu> hY = new Api.zzf<>();
    public static final Api.zzf<zzd> hZ = new Api.zzf<>();
    private static final Api.zza<zzg, AuthCredentialsOptions> ia = new Api.zza<zzg, AuthCredentialsOptions>() { // from class: com.google.android.gms.auth.api.Auth.1
        @Override // com.google.android.gms.common.api.Api.zza
        public zzg zza(Context context, Looper looper, zzf zzfVar, AuthCredentialsOptions authCredentialsOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzg(context, looper, zzfVar, authCredentialsOptions, connectionCallbacks, onConnectionFailedListener);
        }
    };
    private static final Api.zza<zznu, Api.ApiOptions.NoOptions> ib = new Api.zza<zznu, Api.ApiOptions.NoOptions>() { // from class: com.google.android.gms.auth.api.Auth.2
        @Override // com.google.android.gms.common.api.Api.zza
        /* renamed from: zzd */
        public zznu zza(Context context, Looper looper, zzf zzfVar, Api.ApiOptions.NoOptions noOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zznu(context, looper, zzfVar, connectionCallbacks, onConnectionFailedListener);
        }
    };
    private static final Api.zza<zzd, GoogleSignInOptions> ic = new Api.zza<zzd, GoogleSignInOptions>() { // from class: com.google.android.gms.auth.api.Auth.3
        @Override // com.google.android.gms.common.api.Api.zza
        public zzd zza(Context context, Looper looper, zzf zzfVar, @Nullable GoogleSignInOptions googleSignInOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new zzd(context, looper, zzfVar, googleSignInOptions, connectionCallbacks, onConnectionFailedListener);
        }

        @Override // com.google.android.gms.common.api.Api.zzd
        /* renamed from: zza */
        public List<Scope> zzp(@Nullable GoogleSignInOptions googleSignInOptions) {
            return googleSignInOptions == null ? Collections.emptyList() : googleSignInOptions.zzait();
        }
    };
    public static final Api<zzb> PROXY_API = zza.API;
    public static final Api<AuthCredentialsOptions> CREDENTIALS_API = new Api<>("Auth.CREDENTIALS_API", ia, hX);
    public static final Api<GoogleSignInOptions> GOOGLE_SIGN_IN_API = new Api<>("Auth.GOOGLE_SIGN_IN_API", ic, hZ);
    public static final Api<Api.ApiOptions.NoOptions> ie = new Api<>("Auth.ACCOUNT_STATUS_API", ib, hY);
    public static final ProxyApi ProxyApi = new zzoc();
    public static final CredentialsApi CredentialsApi = new zze();

    /* renamed from: if  reason: not valid java name */
    public static final zzns f1if = new zznt();
    public static final GoogleSignInApi GoogleSignInApi = new zzc();

    /* loaded from: classes2.dex */
    public static final class AuthCredentialsOptions implements Api.ApiOptions.Optional {
        private final String ig;
        private final PasswordSpecification ih;

        /* loaded from: classes2.dex */
        public static class Builder {
            @NonNull
            private PasswordSpecification ih = PasswordSpecification.iG;
        }

        public Bundle zzahv() {
            Bundle bundle = new Bundle();
            bundle.putString("consumer_package", this.ig);
            bundle.putParcelable("password_specification", this.ih);
            return bundle;
        }

        public PasswordSpecification zzaid() {
            return this.ih;
        }
    }

    private Auth() {
    }
}
