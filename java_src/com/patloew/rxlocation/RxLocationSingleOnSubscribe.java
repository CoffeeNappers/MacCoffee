package com.patloew.rxlocation;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.patloew.rxlocation.RxLocationBaseOnSubscribe;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class RxLocationSingleOnSubscribe<T> extends RxLocationBaseOnSubscribe<T> implements SingleOnSubscribe<T> {
    protected abstract void onGoogleApiClientReady(GoogleApiClient googleApiClient, SingleEmitter<T> singleEmitter);

    /* JADX INFO: Access modifiers changed from: protected */
    public RxLocationSingleOnSubscribe(@NonNull RxLocation rxLocation, Long timeout, TimeUnit timeUnit) {
        super(rxLocation, timeout, timeUnit);
    }

    protected RxLocationSingleOnSubscribe(@NonNull Context ctx, @NonNull Api<? extends Api.ApiOptions.NotRequiredOptions>[] services, Scope[] scopes) {
        super(ctx, services, scopes);
    }

    @Override // io.reactivex.SingleOnSubscribe
    public final void subscribe(SingleEmitter<T> emitter) throws Exception {
        GoogleApiClient apiClient = createApiClient(new ApiClientConnectionCallbacks(emitter));
        try {
            apiClient.connect();
        } catch (Throwable ex) {
            emitter.onError(ex);
        }
        emitter.setCancellable(RxLocationSingleOnSubscribe$$Lambda$1.lambdaFactory$(this, apiClient));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$subscribe$0(RxLocationSingleOnSubscribe rxLocationSingleOnSubscribe, GoogleApiClient apiClient) throws Exception {
        if (apiClient.isConnected()) {
            rxLocationSingleOnSubscribe.onUnsubscribed(apiClient);
        }
        apiClient.disconnect();
    }

    /* loaded from: classes2.dex */
    protected class ApiClientConnectionCallbacks extends RxLocationBaseOnSubscribe.ApiClientConnectionCallbacks {
        private GoogleApiClient apiClient;
        protected final SingleEmitter<T> emitter;

        private ApiClientConnectionCallbacks(SingleEmitter<T> emitter) {
            super();
            this.emitter = emitter;
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        public void onConnected(Bundle bundle) {
            try {
                RxLocationSingleOnSubscribe.this.onGoogleApiClientReady(this.apiClient, this.emitter);
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
