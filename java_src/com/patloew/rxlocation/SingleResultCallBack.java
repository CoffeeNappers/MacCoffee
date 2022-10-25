package com.patloew.rxlocation;

import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import io.reactivex.SingleEmitter;
import io.reactivex.functions.Function;
/* loaded from: classes2.dex */
class SingleResultCallBack<T extends Result, R> implements ResultCallback<T> {
    private static final Function ID_FUNC;
    private final SingleEmitter<R> emitter;
    private final Function<T, R> mapper;

    static {
        Function function;
        function = SingleResultCallBack$$Lambda$1.instance;
        ID_FUNC = function;
    }

    public static /* synthetic */ Object lambda$static$0(Object input) throws Exception {
        return input;
    }

    private SingleResultCallBack(@NonNull SingleEmitter<R> emitter, @NonNull Function<T, R> mapper) {
        this.emitter = emitter;
        this.mapper = mapper;
    }

    static <T extends Result, R> ResultCallback<T> get(@NonNull SingleEmitter<R> emitter, @NonNull Function<T, R> mapper) {
        return new SingleResultCallBack(emitter, mapper);
    }

    public static <T extends Result> ResultCallback<T> get(@NonNull SingleEmitter<T> emitter) {
        return new SingleResultCallBack(emitter, ID_FUNC);
    }

    @Override // com.google.android.gms.common.api.ResultCallback
    public void onResult(@NonNull T result) {
        if (!result.getStatus().isSuccess()) {
            this.emitter.onError(new StatusException(result));
            return;
        }
        try {
            this.emitter.onSuccess(this.mapper.mo1190apply(result));
        } catch (Exception e) {
            this.emitter.onError(e);
        }
    }
}
