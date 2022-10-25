.class public Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer;
.super Ljava/lang/Object;
.source "StatusExceptionResumeNextTransformer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static forFlowable()Lio/reactivex/FlowableTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Lcom/google/android/gms/common/api/Result;",
            ">()",
            "Lio/reactivex/FlowableTransformer",
            "<TR;TR;>;"
        }
    .end annotation

    .prologue
    .line 28
    invoke-static {}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$1;->lambdaFactory$()Lio/reactivex/FlowableTransformer;

    move-result-object v0

    return-object v0
.end method

.method public static forObservable()Lio/reactivex/ObservableTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Lcom/google/android/gms/common/api/Result;",
            ">()",
            "Lio/reactivex/ObservableTransformer",
            "<TR;TR;>;"
        }
    .end annotation

    .prologue
    .line 45
    invoke-static {}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$2;->lambdaFactory$()Lio/reactivex/ObservableTransformer;

    move-result-object v0

    return-object v0
.end method

.method public static forSingle()Lio/reactivex/SingleTransformer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R::",
            "Lcom/google/android/gms/common/api/Result;",
            ">()",
            "Lio/reactivex/SingleTransformer",
            "<TR;TR;>;"
        }
    .end annotation

    .prologue
    .line 62
    invoke-static {}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$3;->lambdaFactory$()Lio/reactivex/SingleTransformer;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$forFlowable$1(Lio/reactivex/Flowable;)Lorg/reactivestreams/Publisher;
    .locals 1
    .param p0, "upstream"    # Lio/reactivex/Flowable;

    .prologue
    .line 28
    invoke-static {}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$6;->lambdaFactory$()Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Flowable;->onErrorResumeNext(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$forObservable$3(Lio/reactivex/Observable;)Lio/reactivex/ObservableSource;
    .locals 1
    .param p0, "upstream"    # Lio/reactivex/Observable;

    .prologue
    .line 45
    invoke-static {}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$5;->lambdaFactory$()Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Observable;->onErrorResumeNext(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$forSingle$5(Lio/reactivex/Single;)Lio/reactivex/SingleSource;
    .locals 1
    .param p0, "upstream"    # Lio/reactivex/Single;

    .prologue
    .line 62
    invoke-static {}, Lcom/patloew/rxlocation/StatusExceptionResumeNextTransformer$$Lambda$4;->lambdaFactory$()Lio/reactivex/functions/Function;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/Single;->onErrorResumeNext(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$null$0(Ljava/lang/Throwable;)Lorg/reactivestreams/Publisher;
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    instance-of v1, p0, Lcom/patloew/rxlocation/StatusException;

    if-eqz v1, :cond_1

    move-object v0, p0

    .line 30
    check-cast v0, Lcom/patloew/rxlocation/StatusException;

    .line 32
    .local v0, "statusException":Lcom/patloew/rxlocation/StatusException;
    invoke-virtual {v0}, Lcom/patloew/rxlocation/StatusException;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/Status;->hasResolution()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 33
    invoke-virtual {v0}, Lcom/patloew/rxlocation/StatusException;->getResult()Lcom/google/android/gms/common/api/Result;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Flowable;->just(Ljava/lang/Object;)Lio/reactivex/Flowable;

    move-result-object v1

    .line 39
    .end local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :goto_0
    return-object v1

    .line 35
    .restart local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :cond_0
    invoke-static {p0}, Lio/reactivex/Flowable;->error(Ljava/lang/Throwable;)Lio/reactivex/Flowable;

    move-result-object v1

    goto :goto_0

    .line 39
    .end local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :cond_1
    invoke-static {p0}, Lio/reactivex/Flowable;->error(Ljava/lang/Throwable;)Lio/reactivex/Flowable;

    move-result-object v1

    goto :goto_0
.end method

.method static synthetic lambda$null$2(Ljava/lang/Throwable;)Lio/reactivex/ObservableSource;
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    instance-of v1, p0, Lcom/patloew/rxlocation/StatusException;

    if-eqz v1, :cond_1

    move-object v0, p0

    .line 47
    check-cast v0, Lcom/patloew/rxlocation/StatusException;

    .line 49
    .local v0, "statusException":Lcom/patloew/rxlocation/StatusException;
    invoke-virtual {v0}, Lcom/patloew/rxlocation/StatusException;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/Status;->hasResolution()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    invoke-virtual {v0}, Lcom/patloew/rxlocation/StatusException;->getResult()Lcom/google/android/gms/common/api/Result;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v1

    .line 56
    .end local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :goto_0
    return-object v1

    .line 52
    .restart local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :cond_0
    invoke-static {p0}, Lio/reactivex/Observable;->error(Ljava/lang/Throwable;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0

    .line 56
    .end local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :cond_1
    invoke-static {p0}, Lio/reactivex/Observable;->error(Ljava/lang/Throwable;)Lio/reactivex/Observable;

    move-result-object v1

    goto :goto_0
.end method

.method static synthetic lambda$null$4(Ljava/lang/Throwable;)Lio/reactivex/SingleSource;
    .locals 2
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    instance-of v1, p0, Lcom/patloew/rxlocation/StatusException;

    if-eqz v1, :cond_1

    move-object v0, p0

    .line 64
    check-cast v0, Lcom/patloew/rxlocation/StatusException;

    .line 66
    .local v0, "statusException":Lcom/patloew/rxlocation/StatusException;
    invoke-virtual {v0}, Lcom/patloew/rxlocation/StatusException;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/Status;->hasResolution()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 67
    invoke-virtual {v0}, Lcom/patloew/rxlocation/StatusException;->getResult()Lcom/google/android/gms/common/api/Result;

    move-result-object v1

    invoke-static {v1}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object v1

    .line 73
    .end local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :goto_0
    return-object v1

    .line 69
    .restart local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :cond_0
    invoke-static {p0}, Lio/reactivex/Single;->error(Ljava/lang/Throwable;)Lio/reactivex/Single;

    move-result-object v1

    goto :goto_0

    .line 73
    .end local v0    # "statusException":Lcom/patloew/rxlocation/StatusException;
    :cond_1
    invoke-static {p0}, Lio/reactivex/Single;->error(Ljava/lang/Throwable;)Lio/reactivex/Single;

    move-result-object v1

    goto :goto_0
.end method
