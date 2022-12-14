.class public final Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableWindowBoundarySupplier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier$WindowBoundaryInnerSubscriber;,
        Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier$WindowBoundaryMainSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream",
        "<TT;",
        "Lio/reactivex/Flowable",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final other:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<TB;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;Ljava/util/concurrent/Callable;I)V
    .locals 0
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;",
            "Ljava/util/concurrent/Callable",
            "<+",
            "Lorg/reactivestreams/Publisher",
            "<TB;>;>;I)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;, "Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier<TT;TB;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    .local p2, "other":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<+Lorg/reactivestreams/Publisher<TB;>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 42
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;->other:Ljava/util/concurrent/Callable;

    .line 43
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;->bufferSize:I

    .line 44
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-",
            "Lio/reactivex/Flowable",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;, "Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier<TT;TB;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-Lio/reactivex/Flowable<TT;>;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;->source:Lio/reactivex/Flowable;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier$WindowBoundaryMainSubscriber;

    new-instance v2, Lio/reactivex/subscribers/SerializedSubscriber;

    invoke-direct {v2, p1}, Lio/reactivex/subscribers/SerializedSubscriber;-><init>(Lorg/reactivestreams/Subscriber;)V

    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;->other:Ljava/util/concurrent/Callable;

    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier;->bufferSize:I

    invoke-direct {v1, v2, v3, v4}, Lio/reactivex/internal/operators/flowable/FlowableWindowBoundarySupplier$WindowBoundaryMainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Ljava/util/concurrent/Callable;I)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 50
    return-void
.end method
