.class public final Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;
.super Lio/reactivex/Flowable;
.source "FlowableFlatMapPublisher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TU;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final delayErrors:Z

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TU;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I

.field final source:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/reactivestreams/Publisher;Lio/reactivex/functions/Function;ZII)V
    .locals 0
    .param p3, "delayErrors"    # Z
    .param p4, "maxConcurrency"    # I
    .param p5, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TU;>;>;ZII)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher<TT;TU;>;"
    .local p1, "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TU;>;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 31
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->source:Lorg/reactivestreams/Publisher;

    .line 32
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->mapper:Lio/reactivex/functions/Function;

    .line 33
    iput-boolean p3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->delayErrors:Z

    .line 34
    iput p4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->maxConcurrency:I

    .line 35
    iput p5, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->bufferSize:I

    .line 36
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TU;>;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;, "Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher<TT;TU;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->source:Lorg/reactivestreams/Publisher;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->mapper:Lio/reactivex/functions/Function;

    invoke-static {v0, p1, v1}, Lio/reactivex/internal/operators/flowable/FlowableScalarXMap;->tryScalarXMapSubscribe(Lorg/reactivestreams/Publisher;Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    :goto_0
    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->source:Lorg/reactivestreams/Publisher;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->mapper:Lio/reactivex/functions/Function;

    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->delayErrors:Z

    iget v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->maxConcurrency:I

    iget v4, p0, Lio/reactivex/internal/operators/flowable/FlowableFlatMapPublisher;->bufferSize:I

    invoke-static {p1, v1, v2, v3, v4}, Lio/reactivex/internal/operators/flowable/FlowableFlatMap;->subscribe(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;ZII)Lio/reactivex/FlowableSubscriber;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0
.end method
