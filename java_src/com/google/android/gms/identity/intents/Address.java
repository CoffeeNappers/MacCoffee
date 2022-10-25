package com.google.android.gms.identity.intents;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzvx;
/* loaded from: classes2.dex */
public final class Address {
    static final Api.zzf<zzvx> hg = new Api.zzf<>();
    private static final Api.zza<zzvx, AddressOptions> hh = new Api.zza<zzvx, AddressOptions>() { // from class: com.google.android.gms.identity.intents.Address.1
        @Override // com.google.android.gms.common.api.Api.zza
        public zzvx zza(Context context, Looper looper, zzf zzfVar, AddressOptions addressOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            zzaa.zzb(context instanceof Activity, "An Activity must be used for Address APIs");
            if (addressOptions == null) {
                addressOptions = new AddressOptions();
            }
            return new zzvx((Activity) context, looper, zzfVar, addressOptions.theme, connectionCallbacks, onConnectionFailedListener);
        }
    };
    public static final Api<AddressOptions> API = new Api<>("Address.API", hh, hg);

    /* loaded from: classes2.dex */
    public static final class AddressOptions implements Api.ApiOptions.HasOptions {
        public final int theme;

        public AddressOptions() {
            this.theme = 0;
        }

        public AddressOptions(int i) {
            this.theme = i;
        }
    }

    /* loaded from: classes2.dex */
    private static abstract class zza extends zzqo.zza<Status, zzvx> {
        public zza(GoogleApiClient googleApiClient) {
            super(Address.API, googleApiClient);
        }

        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzb */
        public Status zzc(Status status) {
            return status;
        }
    }

    public static void requestUserAddress(GoogleApiClient googleApiClient, final UserAddressRequest userAddressRequest, final int i) {
        googleApiClient.zza((GoogleApiClient) new zza(googleApiClient) { // from class: com.google.android.gms.identity.intents.Address.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzvx zzvxVar) throws RemoteException {
                zzvxVar.zza(userAddressRequest, i);
                zzc((AnonymousClass2) Status.xZ);
            }
        });
    }
}
