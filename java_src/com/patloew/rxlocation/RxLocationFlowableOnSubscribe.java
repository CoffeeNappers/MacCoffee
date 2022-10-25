package com.patloew.rxlocation;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.patloew.rxlocation.RxLocationBaseOnSubscribe;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public abstract class RxLocationFlowableOnSubscribe<T> extends RxLocationBaseOnSubscribe<T> implements FlowableOnSubscribe<T> {
    protected abstract void onGoogleApiClientReady(GoogleApiClient googleApiClient, FlowableEmitter<T> flowableEmitter);

    public RxLocationFlowableOnSubscribe(@NonNull RxLocation rxLocation, Long timeout, TimeUnit timeUnit) {
        super(rxLocation, timeout, timeUnit);
    }

    public RxLocationFlowableOnSubscribe(@NonNull Context ctx, @NonNull Api<? extends Api.ApiOptions.NotRequiredOptions>[] services, Scope[] scopes) {
        super(ctx, services, scopes);
    }

    @Override // io.reactivex.FlowableOnSubscribe
    public final void subscribe(FlowableEmitter<T> emitter) throws Exception {
        GoogleApiClient apiClient = createApiClient(new ApiClientConnectionCallbacks(emitter));
        try {
            apiClient.connect();
        } catch (Throwable ex) {
            emitter.onError(ex);
        }
        emitter.setCancellable(RxLocationFlowableOnSubscribe$$Lambda$1.lambdaFactory$(this, apiClient));
    }

    public static /* synthetic */ void lambda$subscribe$0(RxLocationFlowableOnSubscribe rxLocationFlowableOnSubscribe, GoogleApiClient apiClient) throws Exception {
        if (apiClient.isConnected()) {
            rxLocationFlowableOnSubscribe.onUnsubscribed(apiClient);
        }
        apiClient.disconnect();
    }

    /* loaded from: classes2.dex */
    protected class ApiClientConnectionCallbacks extends RxLocationBaseOnSubscribe.ApiClientConnectionCallbacks {
        private GoogleApiClient apiClient;
        protected final FlowableEmitter<T> emitter;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private ApiClientConnectionCallbacks(FlowableEmitter<T> emitter) {
            super();
            RxLocationFlowableOnSubscribe.this = this$0;
            this.emitter = emitter;
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        public void onConnected(Bundle bundle) {
            try {
                RxLocationFlowableOnSubscribe.this.onGoogleApiClientReady(this.apiClient, this.emitter);
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
