.class public final Lio/reactivex/internal/operators/flowable/FlowableTakePublisher;
.super Lio/reactivex/Flowable;
.source "FlowableTakePublisher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Flowable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final limit:J

.field final source:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/reactivestreams/Publisher;J)V
    .locals 0
    .param p2, "limit"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Publisher",
            "<TT;>;J)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakePublisher;, "Lio/reactivex/internal/operators/flowable/FlowableTakePublisher<TT;>;"
    .local p1, "source":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Flowable;-><init>()V

    .line 32
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableTakePublisher;->source:Lorg/reactivestreams/Publisher;

    .line 33
    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakePublisher;->limit:J

    .line 34
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableTakePublisher;, "Lio/reactivex/internal/operators/flowable/FlowableTakePublisher<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableTakePublisher;->source:Lorg/reactivestreams/Publisher;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableTake$TakeSubscriber;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableTakePublisher;->limit:J

    invoke-direct {v1, p1, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableTake$TakeSubscriber;-><init>(Lorg/reactivestreams/Subscriber;J)V

    invoke-interface {v0, v1}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 39
    return-void
.end method
