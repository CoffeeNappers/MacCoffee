.class public final Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;
.super Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;
.source "FlowableOnBackpressureBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer$BackpressureBufferSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final delayError:Z

.field final onOverflow:Lio/reactivex/functions/Action;

.field final unbounded:Z


# direct methods
.method public constructor <init>(Lio/reactivex/Flowable;IZZLio/reactivex/functions/Action;)V
    .locals 0
    .param p2, "bufferSize"    # I
    .param p3, "unbounded"    # Z
    .param p4, "delayError"    # Z
    .param p5, "onOverflow"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Flowable",
            "<TT;>;IZZ",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer<TT;>;"
    .local p1, "source":Lio/reactivex/Flowable;, "Lio/reactivex/Flowable<TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/flowable/AbstractFlowableWithUpstream;-><init>(Lio/reactivex/Flowable;)V

    .line 38
    iput p2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->bufferSize:I

    .line 39
    iput-boolean p3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->unbounded:Z

    .line 40
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->delayError:Z

    .line 41
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->onOverflow:Lio/reactivex/functions/Action;

    .line 42
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;, "Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->source:Lio/reactivex/Flowable;

    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer$BackpressureBufferSubscriber;

    iget v2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->bufferSize:I

    iget-boolean v3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->unbounded:Z

    iget-boolean v4, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->delayError:Z

    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer;->onOverflow:Lio/reactivex/functions/Action;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/flowable/FlowableOnBackpressureBuffer$BackpressureBufferSubscriber;-><init>(Lorg/reactivestreams/Subscriber;IZZLio/reactivex/functions/Action;)V

    invoke-virtual {v6, v0}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/FlowableSubscriber;)V

    .line 47
    return-void
.end method
