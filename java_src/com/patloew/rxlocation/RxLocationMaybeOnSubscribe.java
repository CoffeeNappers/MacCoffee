package com.patloew.rxlocation;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.patloew.rxlocation.RxLocationBaseOnSubscribe;
import io.reactivex.MaybeEmitter;
import io.reactivex.MaybeOnSubscribe;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public abstract class RxLocationMaybeOnSubscribe<T> extends RxLocationBaseOnSubscribe<T> implements MaybeOnSubscribe<T> {
    protected abstract void onGoogleApiClientReady(GoogleApiClient googleApiClient, MaybeEmitter<T> maybeEmitter);

    public RxLocationMaybeOnSubscribe(@NonNull RxLocation rxLocation, Long timeout, TimeUnit timeUnit) {
        super(rxLocation, timeout, timeUnit);
    }

    protected RxLocationMaybeOnSubscribe(@NonNull Context ctx, @NonNull Api<? extends Api.ApiOptions.NotRequiredOptions>[] services, Scope[] scopes) {
        super(ctx, services, scopes);
    }

    @Override // io.reactivex.MaybeOnSubscribe
    public final void subscribe(MaybeEmitter<T> emitter) throws Exception {
        GoogleApiClient apiClient = createApiClient(new ApiClientConnectionCallbacks(emitter));
        try {
            apiClient.connect();
        } catch (Throwable ex) {
            emitter.onError(ex);
        }
        emitter.setCancellable(RxLocationMaybeOnSubscribe$$Lambda$1.lambdaFactory$(this, apiClient));
    }

    public static /* synthetic */ void lambda$subscribe$0(RxLocationMaybeOnSubscribe rxLocationMaybeOnSubscribe, GoogleApiClient apiClient) throws Exception {
        if (apiClient.isConnected()) {
            rxLocationMaybeOnSubscribe.onUnsubscribed(apiClient);
        }
        apiClient.disconnect();
    }

    /* loaded from: classes2.dex */
    protected class ApiClientConnectionCallbacks extends RxLocationBaseOnSubscribe.ApiClientConnectionCallbacks {
        private GoogleApiClient apiClient;
        protected final MaybeEmitter<T> emitter;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private ApiClientConnectionCallbacks(MaybeEmitter<T> emitter) {
            super();
            RxLocationMaybeOnSubscribe.this = this$0;
            this.emitter = emitter;
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        public void onConnected(Bundle bundle) {
            try {
                RxLocationMaybeOnSubscribe.this.onGoogleApiClientReady(this.apiClient, this.emitter);
            } catch (Throwable ex) {
                this.emitter.onError(ex);
            }
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        public void onConnectionSuspended(int cause) {
            this.emitter.onError(new GoogleApiConnectionSuspendedException(cause));
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
        public void onConnectionFailed(ConnectionResult connectionResult) {
            this.emitter.onError(new GoogleApiConnectionException("Error connecting to GoogleApiClient.", connectionResult));
        }

        @Override // com.patloew.rxlocation.RxLocationBaseOnSubscribe.ApiClientConnectionCallbacks
        public void setClient(GoogleApiClient client) {
            this.apiClient = client;
        }
    }
}
