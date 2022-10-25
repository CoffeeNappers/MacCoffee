.class final Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;
.super Lio/reactivex/internal/subscribers/SinglePostCompleteSubscriber;
.source "FlowableOnErrorReturn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "OnErrorReturnSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/SinglePostCompleteSubscriber",
        "<TT;TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x33ea157c2cf0a1deL


# instance fields
.field final valueSupplier:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Function",
            "<-",
            "Ljava/lang/Throwable;",
            "+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "valueSupplier":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-Ljava/lang/Throwable;+TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscribers/SinglePostCompleteSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 44
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->valueSupplier:Lio/reactivex/functions/Function;

    .line 45
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 69
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 57
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber<TT;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->valueSupplier:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "The valueSupplier returned a null value"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 63
    .local v1, "v":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->complete(Ljava/lang/Object;)V

    .line 64
    .end local v1    # "v":Ljava/lang/Object;, "TT;"
    :goto_0
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 60
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    aput-object v0, v4, v5

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->produced:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->produced:J

    .line 50
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorReturn$OnErrorReturnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 51
    return-void
.end method
