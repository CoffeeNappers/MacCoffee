package com.patloew.rxlocation;

import android.content.Context;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
/* loaded from: classes.dex */
public class GoogleApiClientFlowable extends RxLocationFlowableOnSubscribe<GoogleApiClient> {
    GoogleApiClientFlowable(Context ctx, Api<? extends Api.ApiOptions.NotRequiredOptions>[] apis, Scope[] scopes) {
        super(ctx, apis, scopes);
    }

    @SafeVarargs
    public static Flowable<GoogleApiClient> create(@NonNull Context context, @NonNull Api<? extends Api.ApiOptions.NotRequiredOptions>... apis) {
        return Flowable.create(new GoogleApiClientFlowable(context, apis, null), BackpressureStrategy.LATEST);
    }

    public static Flowable<GoogleApiClient> create(@NonNull Context context, @NonNull Api<? extends Api.ApiOptions.NotRequiredOptions>[] apis, Scope[] scopes) {
        return Flowable.create(new GoogleApiClientFlowable(context, apis, scopes), BackpressureStrategy.LATEST);
    }

    @Override // com.patloew.rxlocation.RxLocationFlowableOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, FlowableEmitter<GoogleApiClient> emitter) {
        emitter.onNext(apiClient);
    }
}
