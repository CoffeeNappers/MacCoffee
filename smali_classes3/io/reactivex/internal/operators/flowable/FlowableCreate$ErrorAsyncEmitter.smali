.class final Lio/reactivex/internal/operators/flowable/FlowableCreate$ErrorAsyncEmitter;
.super Lio/reactivex/internal/operators/flowable/FlowableCreate$NoOverflowBaseAsyncEmitter;
.source "FlowableCreate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ErrorAsyncEmitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableCreate$NoOverflowBaseAsyncEmitter",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x4b43427a9c2e580L


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 406
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$ErrorAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$ErrorAsyncEmitter<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableCreate$NoOverflowBaseAsyncEmitter;-><init>(Lorg/reactivestreams/Subscriber;)V

    .line 407
    return-void
.end method


# virtual methods
.method onOverflow()V
    .locals 2

    .prologue
    .line 411
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableCreate$ErrorAsyncEmitter;, "Lio/reactivex/internal/operators/flowable/FlowableCreate$ErrorAsyncEmitter<TT;>;"
    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v1, "create: could not emit value due to lack of requests"

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableCreate$ErrorAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    .line 412
    return-void
.end method
