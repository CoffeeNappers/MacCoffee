package com.patloew.rxlocation;

import android.content.Context;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.location.LocationServices;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class RxLocationBaseOnSubscribe<T> {
    protected final Context ctx;
    private final Scope[] scopes;
    private final Api<? extends Api.ApiOptions.NotRequiredOptions>[] services;
    final Long timeoutTime;
    final TimeUnit timeoutUnit;

    /* JADX INFO: Access modifiers changed from: protected */
    public RxLocationBaseOnSubscribe(@NonNull RxLocation rxLocation, Long timeout, TimeUnit timeUnit) {
        this.ctx = rxLocation.ctx;
        this.services = new Api[]{LocationServices.API, com.google.android.gms.location.ActivityRecognition.API};
        this.scopes = null;
        if (timeout != null && timeUnit != null) {
            this.timeoutTime = timeout;
            this.timeoutUnit = timeUnit;
            return;
        }
        this.timeoutTime = rxLocation.timeoutTime;
        this.timeoutUnit = rxLocation.timeoutUnit;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public RxLocationBaseOnSubscribe(@NonNull Context ctx, @NonNull Api<? extends Api.ApiOptions.NotRequiredOptions>[] services, Scope[] scopes) {
        this.ctx = ctx;
        this.services = services;
        this.scopes = scopes;
        this.timeoutTime = null;
        this.timeoutUnit = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Multi-variable type inference failed */
    public final <T extends Result> void setupLocationPendingResult(PendingResult<T> pendingResult, ResultCallback<T> resultCallback) {
        if (this.timeoutTime != null && this.timeoutUnit != null) {
            pendingResult.setResultCallback(resultCallback, this.timeoutTime.longValue(), this.timeoutUnit);
        } else {
            pendingResult.setResultCallback(resultCallback);
        }
    }

    protected GoogleApiClient.Builder getApiClientBuilder() {
        return new GoogleApiClient.Builder(this.ctx);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public GoogleApiClient createApiClient(RxLocationBaseOnSubscribe<T>.ApiClientConnectionCallbacks apiClientConnectionCallbacks) {
        Api<? extends Api.ApiOptions.NotRequiredOptions>[] apiArr;
        Scope[] scopeArr;
        GoogleApiClient.Builder apiClientBuilder = getApiClientBuilder();
        for (Api<? extends Api.ApiOptions.NotRequiredOptions> service : this.services) {
            apiClientBuilder.addApi(service);
        }
        if (this.scopes != null) {
            for (Scope scope : this.scopes) {
                apiClientBuilder.addScope(scope);
            }
        }
        apiClientBuilder.addConnectionCallbacks(apiClientConnectionCallbacks);
        apiClientBuilder.addOnConnectionFailedListener(apiClientConnectionCallbacks);
        GoogleApiClient apiClient = apiClientBuilder.build();
        apiClientConnectionCallbacks.setClient(apiClient);
        return apiClient;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onUnsubscribed(GoogleApiClient apiClient) {
    }

    /* loaded from: classes2.dex */
    protected abstract class ApiClientConnectionCallbacks implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
        protected GoogleApiClient apiClient;

        /* JADX INFO: Access modifiers changed from: protected */
        public ApiClientConnectionCallbacks() {
        }

        public void setClient(GoogleApiClient client) {
            this.apiClient = client;
        }
    }
}
