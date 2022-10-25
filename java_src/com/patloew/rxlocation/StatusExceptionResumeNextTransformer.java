package com.patloew.rxlocation;

import com.google.android.gms.common.api.Result;
import io.reactivex.Flowable;
import io.reactivex.FlowableTransformer;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.ObservableTransformer;
import io.reactivex.Single;
import io.reactivex.SingleSource;
import io.reactivex.SingleTransformer;
import org.reactivestreams.Publisher;
/* loaded from: classes2.dex */
public class StatusExceptionResumeNextTransformer {
    public static <R extends Result> FlowableTransformer<R, R> forFlowable() {
        FlowableTransformer<R, R> flowableTransformer;
        flowableTransformer = StatusExceptionResumeNextTransformer$$Lambda$1.instance;
        return flowableTransformer;
    }

    public static /* synthetic */ Publisher lambda$null$0(Throwable throwable) throws Exception {
        if (throwable instanceof StatusException) {
            StatusException statusException = (StatusException) throwable;
            if (statusException.getStatus().hasResolution()) {
                return Flowable.just(statusException.getResult());
            }
            return Flowable.error(throwable);
        }
        return Flowable.error(throwable);
    }

    public static <R extends Result> ObservableTransformer<R, R> forObservable() {
        ObservableTransformer<R, R> observableTransformer;
        observableTransformer = StatusExceptionResumeNextTransformer$$Lambda$2.instance;
        return observableTransformer;
    }

    public static /* synthetic */ ObservableSource lambda$null$2(Throwable throwable) throws Exception {
        if (throwable instanceof StatusException) {
            StatusException statusException = (StatusException) throwable;
            if (statusException.getStatus().hasResolution()) {
                return Observable.just(statusException.getResult());
            }
            return Observable.error(throwable);
        }
        return Observable.error(throwable);
    }

    public static <R extends Result> SingleTransformer<R, R> forSingle() {
        SingleTransformer<R, R> singleTransformer;
        singleTransformer = StatusExceptionResumeNextTransformer$$Lambda$3.instance;
        return singleTransformer;
    }

    public static /* synthetic */ SingleSource lambda$null$4(Throwable throwable) throws Exception {
        if (throwable instanceof StatusException) {
            StatusException statusException = (StatusException) throwable;
            if (statusException.getStatus().hasResolution()) {
                return Single.just(statusException.getResult());
            }
            return Single.error(throwable);
        }
        return Single.error(throwable);
    }
}
